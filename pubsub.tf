locals {
  env    = local.env_settings[terraform.workspace]
  pubsub = local.pubsubs[terraform.workspace]
}

module "pubsub" {
  for_each            = { for topic in local.pubsub.topics : topic.name => topic }
  source              = "terraform-google-modules/pubsub/google"
  version             = "4.0.1"
  topic               = each.value.name
  project_id          = local.env.project_id
  pull_subscriptions  = each.value.pull_subscriptions
  grant_token_creator = false
  topic_labels        = merge(try(each.value.topic_labels, {}), { name = each.value.name, stack = "pubsub" })
}