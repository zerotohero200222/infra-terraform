project_id            = "eastern-augury-477909-q6"
region                = "us-central1"
service_account_email = "162720148859-compute@developer.gserviceaccount.com"

# Pub/Sub Configuration
exchanges_topic_name        = "uat-exchanges-topic"
tracking_topic_name         = "uat-tracking-topic"
exchanges_subscription_name = "uat-exchanges-subscription"
tracking_subscription_name  = "uat-tracking-subscription"

# Cloud Run Services Configuration
services = {
  wallet-service = {
    image                 = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    min_instances         = 1
    max_instances         = 5
    allow_unauthenticated = true
    env = {
      PUBSUB_TOPIC = "uat-exchanges-topic"
    }
  }

  portfolio-service = {
    image         = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    min_instances = 1
    max_instances = 5
    env = {
      PUBSUB_TOPIC = "uat-exchanges-topic"
    }
  }

  status-service = {
    image         = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    min_instances = 1
    max_instances = 3
    env = {
      PUBSUB_TOPIC = "uat-exchanges-topic"
    }
  }

  aggregator-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    env = {
      PUBSUB_SUBSCRIPTION = "uat-exchanges-subscription"
      PUBSUB_TOPIC        = "uat-tracking-topic"
    }
  }

  frontend-app = {
    image                 = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    allow_unauthenticated = true
  }

  defi-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    env = {
      PUBSUB_TOPIC = "uat-exchanges-topic"
    }
  }

  coinbase-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    env = {
      PUBSUB_TOPIC = "uat-exchanges-topic"
    }
  }

  kucoin-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    env = {
      PUBSUB_TOPIC = "uat-exchanges-topic"
    }
  }

  tracking-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    env = {
      PUBSUB_SUBSCRIPTION = "uat-tracking-subscription"
    }
  }
}
