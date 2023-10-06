# Terraform Beginner Bootcamp 2023 Week 1

## Root Module Structure
```
PROJECT_ROOT
|
|-- main.tf            # everything else
|-- variables.tf       # stores the structure of the input variables
|-- providers.tf       # defined required providers and their configuration
|-- outputs.tf         # stores our outputs
|-- terraform.tfvars   # the data of variables we want to load into our terraform project
|__ README.md          # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables
### Terraform Cloud Variables

In terraform, we can have two kind of variables:
- Environment Variables - those that you would set in your bash terminal eg. AWS Credentials
- Terraform Variables   - those that you would normally set in your tfvars file

We can set Terraform cloud variables to be sensitive so they are not shown visibly in the UI.

### Loading Terraform Input Variables
[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)
### var flag
We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_id = "my-user_id`

### var-file flag

- TODO: document this flag.

### terraform.tfvars

This is the default file to load in terraform variables.

### auto.tfvars

- TODO: document this flag for the terraform cloud

### order of terraform variables

- TODO: document which terraform variables takes precendence. 

## Dealing with Configuration Drift

## What happens if we lose our state file?

If you lose your state file, you will have to tear down all your cloud infrastructure manually. 

You can use terraform import but it wont' work for all cloud resources.You will need to check the terraform providers documentation for which resources support import.

### Fix Missing Resources with Terraform Import
`terraform import aws_s3_bucket.example bucket-name`


[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)
[Terraform S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)
### Fix Manual Configuration
If someone goes and delete or modifies cloud resource manually through ClickOps.
Terraform plan will attempt to put our intrastrature back into the expected state fixing configuration Drift.

