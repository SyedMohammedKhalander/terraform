# variable "iam_names" {
#   type = list
#   default = ["user-01","user-02","user-03"]
# }

# resource "aws_iam_user" "iam" {
#   name = var.iam_names[count.index]
#   count = 3
#   path = "/system/"
# }

# first apply the above and then update it to the below code and then apply again u find the error

# variable "iam_names" {
#   type = list
#   default = ["user00","user-01","user-02","user-03"]
# }

# resource "aws_iam_user" "iam" {
#   name = var.iam_names[count.index]
#   count = 4
#   path = "/system/"
# }

#  for this solution is use for each on set