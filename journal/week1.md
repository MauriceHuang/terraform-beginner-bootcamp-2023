# Terraform Beginner Bootcamp 2023 Week 1

## Fixing tags

[How to Delete local and remote tag on Git](https://devconnected.com/how-to-delete-local-and-remote-tags-on-git/)

Local delete tag

```sh 
git tag -d <tag_name>
```

Remote delete tag

```sh
git tag -d origin <tag_name>
```
checkout the commit that you want to retag. Grab the SHA from the github history

```sh
git checkout <SHA>
git tag M.M.P
git push --tags
git checkout main
```
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

## Fix using Terraform Refresh

```sh
terraform apply -refresh-only --auto-apply
```

## Terraform Modules

### Terraform Module Structure

It is recommended to place modules in a `modules` directory when locally developing modules but you can name it whatever you want.

### Passing Input Variables

We can pass input variables to our module.
The module has to declare the terraform variables in its own variables.tf

```tf
module "terrahouse_aws" {
    source = "./modules/terrahouse_aws"
    user_uuid = var.user_uuid
    bucket_name= var.bucket_name
}
```

### Modules Sources
Using the source we can import the module from various places eg:
- locally
- Github
- Terraform Registry

```
d
```

[Module Sources](https://developer.hashicorp.com/terraform/language/modules/sources)

```tf
module "terrahouse_aws"{
    source = "./modules/terrahouse_aws"
    user_uuid= var.user_uuid
    bucket_name = var.bucket_name
}
```

## Consideration when using ChatGPT for Terraform

LLMs may not have been trained with the latest documentation and may likely produce deprecated instruction.

## Working with Files in Terraform

### filemd5

encryption of the file. 
https://developer.hashicorp.com/terraform/language/functions/filemd5

### fileexist Function

```tf
  validation {
    condition     = fileexists(var.error_html_filepath)
    error_message = "Invalid path specified for error_html_path variable."
  }
```

Built in function that checks for the existence of a file.
https://developer.hashicorp.com/terraform/language/functions/fileexists

### Path Variable
In terraform, there is a special path variable called `path` that allows us to reference local paths:
- path.module  (path for the current module)
- path.root (get the path for the root of the project)
[Special Path Variable](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object)

```tf
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.toot}/public/index.html"
}
```