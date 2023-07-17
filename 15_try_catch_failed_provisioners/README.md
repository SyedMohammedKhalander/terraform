# README

## `on-failure` in Terraform Provisioner

The `on-failure` attribute in Terraform provisioner configuration allows you to define the desired behavior when a provisioner fails during resource creation or updates. This attribute helps you handle failures gracefully and define appropriate actions to take.

The `on-failure` attribute supports the following values:

- `continue`: If a provisioner fails, Terraform continues with the resource creation or update process without interrupting the workflow. This means that even if a provisioner fails, Terraform will proceed with applying the remaining changes. It's important to note that Terraform will not retry the failed provisioner unless it encounters an explicit dependency or ordering constraint.
- `fail`: If a provisioner fails, Terraform stops the resource creation or update process and marks the resource as failed. This prevents any further actions on the affected resource and considers the overall operation as a failure. Terraform will return an error and roll back any changes made during the provisioning process.

By using the `on-failure` attribute, you can control how Terraform responds to provisioner failures and define the appropriate course of action based on your infrastructure deployment requirements.

It's essential to carefully consider the behavior of provisioners and select the appropriate `on-failure` value to ensure the stability and reliability of your infrastructure provisioning process.