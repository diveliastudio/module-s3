# AWS S3 bucket Terraform module

## Usage

```hcl
provider "aws" {
  region = "us-east-2"
  profile = "project"
}

...

module "s3_bucket" {
  source  = "github.com/diveliastudio/module-s3"
  project_name = "project"
  project_environment = "develop"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_name | Project's name | `string` | `""` | yes |
| project_environment | Project environment | `string` | `""` | yes |
| site_domain | Url of the site to be added to the S3 CORS. | `string` | `"*"` | no |


## Resources that return

| Extension | Folder | Description |
|------|-------------|:--------:|
| access_key.txt | ./api_key | Text file with the key to access the bucket through IAM |
| secret_key.txt | ./api_key | Text file with the secret key to the bucket using IAM |
