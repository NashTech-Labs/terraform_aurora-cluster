### IAM role:


```
cat <<EOF > trust.json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "monitoring.rds.amazonaws.com",
          "rds.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

aws iam create-role --role-name aurora-prod-r --path / --assume-role-policy-document file://trust.json
```

### Custom KMS key
- admin to PowerAdmins
- user to aurora-prod-r

### Attach policies
- give access to kms key

### create Security group 


### Terraform operations:
terraform init -backend-config="aurora.config" 
terraform plan -var-file="aurora.tfvars" 
terraform apply -var-file="aurora.tfvars"  
terraformdestroy -var-file="aurora.tfvars" 


Bug / Features:

- `BUG: Can not select which instance is writer:`
https://github.com/terraform-aws-modules/terraform-aws-rds-aurora/issues/246

- `BUG: can not specify iam role arns directly. Have to apply manually`
https://stackoverflow.com/questions/62798979/aurora-postgresql-permissions-to-access-s3
