# used for fetch service account emails
terraform {
  backend "gcs" {
    bucket = "tf_states" # name of the bucket
    prefix = "pubsub/"   # path to folder (containing state files) inside the bucket
  }
}