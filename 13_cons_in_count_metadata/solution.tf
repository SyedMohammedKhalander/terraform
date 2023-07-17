# So For Each is The Solution

resource "aws_iam_user" "iam" {
  for_each = toset( ["user-01","user-02", "user-03"] )
  name     = each.key
}

resource "aws_instance" "myec2" {
  ami = "ami-0cea098ed2ac54925"
  for_each  = {
      key1 = "t2.micro"
      key2 = "t2.medium"
   }
    #  each.key = key1
    #  each.value = key2
  instance_type    = each.value
  key_name         = each.key
  tags =  {
   Name = each.value
    }
}