locals {
  env_settings = {
    default = {
      project_id = "staging"
      region     = "us-west1"
    }
    staging = {
      project_id = "staging"
      region     = "us-west1"
    }
    production = {
      project_id = "production"
      region     = "us-west1"
    }
  }
}

locals {
  pubsubs = {
    default = {
      topics = []
    }
    staging = {
      topics = [{
        name = "example-pubsub"
        pull_subscriptions = [{
          name = "example-staging-sub"
          //optional
          max_delivery_attempts        = 5
          enable_message_ordering      = true
          enable_exactly_once_delivery = true
          //etcetra
        }]
        topic_labels = {
          department  = "engineering"
          team        = "backend"
          environment = "staging"
          application = "frontend-landing"
        }
      }]
    }
    production = {
      topics = [
        {
          name = "example-pubsub"
          pull_subscriptions = [{
            name = "example-production-sub"
          }]
          topic_labels = {
            department  = "engineering"
            team        = "backend"
            environment = "production"
            application = "frontend-landing"
          }
        }
      ]
    }
  }
}