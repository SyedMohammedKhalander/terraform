# resource "aws_instance" "terraform_instance" {
#   ami           = "ami-057752b3f1d6c4d6c"
#   instance_type = "t2.micro"
#   depends_on = [null_resource.health_check]
#   tags = {
#     Name = "HelloWorld"
#   }
# }

# resource "null_resource" "health_check" {

#  provisioner "local-exec" {

#     command = "curl https://google.com"
#   }
# }


///////////////////////////////////CAN ALSO WRITE AS BELOW PROVISONER IN INSTANCE RESOURCE BLOCK INSTEAD OF CREATING RESOURCE BLOCK ////////////////////////


# resource "aws_instance" "terraform_instance" {
#   ami           = "ami-057752b3f1d6c4d6c"
#   instance_type = "t2.micro"
#   provisioner "local-exec" {

#     command = "curl https://google.com"
#   }
#   tags = {
#     Name = "HelloWorld"
#   }
# }