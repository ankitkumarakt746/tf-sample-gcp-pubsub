## Requirements:

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2.5 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.53, < 5.0 |
| <a name="requirement_tfswitch"></a> [tfswitch](https://tfswitch.warrensbox.com/Install/) | ~> 0.12 |
| others | git, GCP account, gcloud, terraform, tfswitch |


Note: You should be having a GCS bucket backend for Terraform state files. It should look something like this:
```
tf_states
├── pubsub/
    ├── default.tfstate
    ├── staging.tfstate
    ├── production.tfstate
```


## Initial setup:
Clone the repository using:
```
git clone repo
cd repo-name
```

Make sure gcloud is configured if not use 
```gcloud auth```


## Populate Values
\#main.tf  
├── bucket  
├── prefix

\#variable.tf
Ensure env_settings has all the projects mentioned correctly  (project names can be checked in GCP webUI or via `gcloud config get-value project`)
Edit or add values in locals.pubsub.staging.topics or locals.pubsub.production.topics and save all changes.

## Run terraform
```
tfswitch
terraform init
terraform workspace list
terraform workspace select <workspace>
terraform fmt       #optional
terraform validate  #optional
```
(Also, you should create a branch, raise PR and get it revied and then merge as best practice but since it's an example so we'll skip.)

Finally, check all the changes with plan and then run apply:
```
terraform plan
terraform apply
```
