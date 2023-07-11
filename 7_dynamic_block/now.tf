variable "sg_ingress_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8080, 5000]
}

variable "sg_egress_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [3306, 8091, 6379]
}

resource "aws_security_group" "dynamicsg" {
  name        = "dynamic-sg"
  description = "Ingress and Egress for java and Flask Apps"
  tags = {
    "Name" = "Dynamic-SG"
  }

  dynamic "ingress" {
    for_each = var.sg_ingress_ports
    iterator = ingress_port
    content {
      from_port   = ingress_port.value
      to_port     = ingress_port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.sg_egress_ports
    iterator = egress_port
    content {
      from_port   = egress_port.value
      to_port     = egress_port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}