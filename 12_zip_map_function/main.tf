
# zipmap(["pineapple","oranges","strawberry"], ["yellow","orange","red"])
# https://developer.hashicorp.com/terraform/language/functions/zipmap
resource "aws_iam_user" "lb" {
  name = "demo-user.${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}


output "zipmap" {
  value = zipmap(aws_iam_user.lb[*].name, aws_iam_user.lb[*].arn)
}