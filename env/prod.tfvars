project_id            = "eastern-augury-477909-q6"
region                = "us-central1"
service_account_email = "162720148859-compute@developer.gserviceaccount.com"

# Pub/Sub Configuration
exchanges_topic_name        = "prod-exchanges-topic"
tracking_topic_name         = "prod-tracking-topic"
exchanges_subscription_name = "prod-exchanges-subscription"
tracking_subscription_name  = "prod-tracking-subscription"

# Cloud Run Services Configuration
services = {
  wallet-service = {
    image                 = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    min_instances         = 2
    max_instances         = 10
    allow_unauthenticated = true
    env = {
      PUBSUB_TOPIC = "prod-exchanges-topic"
    }
  }

  portfolio-service = {
    image         = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    min_instances = 2
    max_instances = 10
    env = {
      PUBSUB_TOPIC = "prod-exchanges-topic"
    }
  }

  status-service = {
    image         = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    min_instances = 1
    max_instances = 6
    env = {
      PUBSUB_TOPIC = "prod-exchanges-topic"
    }
  }

  aggregator-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    env = {
      PUBSUB_SUBSCRIPTION = "prod-exchanges-subscription"
      PUBSUB_TOPIC        = "prod-tracking-topic"
    }
  }

  frontend-app = {
    image                 = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    allow_unauthenticated = true
  }

  defi-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    env = {
      PUBSUB_TOPIC = "prod-exchanges-topic"
    }
  }

  coinbase-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    env = {
      PUBSUB_TOPIC = "prod-exchanges-topic"
    }
  }

  kucoin-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    env = {
      PUBSUB_TOPIC = "prod-exchanges-topic"
    }
  }

  tracking-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    env = {
      PUBSUB_SUBSCRIPTION = "prod-tracking-subscription"
    }
  }
}
