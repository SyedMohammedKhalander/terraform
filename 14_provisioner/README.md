## When the Creation time provisioner fails, The Resources get Tainted Terraform

When the creation time provisioner fails, the resources are tagged as tainted in the `tfstate` file. This indicates that the resource needs to be recreated during the next Terraform plan.

To demonstrate this, you can follow the steps below:

1. Comment out the egress rule in the security group configuration.
2. Run `terraform apply` to apply the changes.
3. Wait for the provisioning process to start.
4. Press `Ctrl+C` to interrupt the `terraform apply` command.
5. Open the `tfstate` file and observe that the status of the affected resource is marked as "tainted."

By marking a resource as tainted, Terraform ensures that the next plan will recreate the resource, allowing you to address any provisioning issues before applying the changes again.

Please note that the `tfstate` file is a vital part of Terraform's state management, and it should be handled carefully to maintain the integrity of your infrastructure deployment.