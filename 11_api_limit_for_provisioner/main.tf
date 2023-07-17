/*
we know that if we do a "terraform plan", there would be a refresh (API call to AWS) that would happen for the current
state for all of the resources that are part of the infra.tf, and that will lead to a lot of
time (there is also a api limit for a provisioner to hit AWS)
So instead of that, what you can do is, you can divide all of these files into separate projects all
together. So you can have 1 Folder for EC2, 1 folder for RDS, 1 Folder maybe for security group
and 1 folder for VPC
So this is just an example.
So in such case, what would happen is, when you do a "terraform plan", only the resource related to
the EC2 needs to be refreshed.
The other resource like RDS, security group, VPC infrastructure would not need to be refreshed and
that can save you a good amount of time.
So one of the key things that you need to remember here, is that it is important to switch to a smaller
configuration (folder) where each can be independently applied.
This is one of the keys here.
*/

/*
what happens if someone has already done that? So let's assume that there is organization, they have a infra.tf where they're already specified VPC, Security
Group, RDS EC2 and a lot of other things within the same project (folder) itself.
*/

/*
Ans:
1.  So what you can do is, in order for Terraform to be prevented from querying the current state for all
    the resources during the operation like terraform plan, you can stop the
    refresh with the help of "-refresh=false" flag.
    So this is something that you can do and it can make sure that things becomes much more faster here.
    So the amount of API calls will also reduce.
2.  you can directly specify the target.
    So the "target=resource" flag can be used to target a specific resource.
    For example, let's say that you have modified something in the EC2, now in the "terraform plan", if
    you do, associated with the terraform plan, terraform refresh will run, which will go ahead and fetch the
    current state of all of the infrastructure.
    So instead of doing that, what you can do is, you can specify the "target=aws_instance.name"
*/

# resource "aws_instance" "name" {
  
# }




