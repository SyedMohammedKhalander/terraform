resource "aws_eip" "lb" {
  
}

output "eip_addr" {
  value = aws_eip.lb.public_ip
}