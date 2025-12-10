project_id            = "eastern-augury-477909-q6"
region                = "us-central1"
service_account_email = "162720148859-compute@developer.gserviceaccount.com"

# Pub/Sub Configuration
exchanges_topic_name        = "exchanges-topic"
tracking_topic_name         = "tracking-topic"
exchanges_subscription_name = "exchanges-subscription"
tracking_subscription_name  = "tracking-subscription"

# Cloud Run Services Configuration
services = {
  wallet-service = {
    image                 = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    min_instances         = 0
    max_instances         = 3
    allow_unauthenticated = true
    env = {
      PUBSUB_TOPIC = "exchanges-topic"
    }
  }

  portfolio-service = {
    image         = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    min_instances = 0
    max_instances = 3
    env = {
      PUBSUB_TOPIC = "exchanges-topic"
    }
  }

  status-service = {
    image         = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    min_instances = 0
    max_instances = 2
    env = {
      PUBSUB_TOPIC = "exchanges-topic"
    }
  }

  aggregator-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    env = {
      PUBSUB_SUBSCRIPTION = "exchanges-subscription"
      PUBSUB_TOPIC        = "tracking-topic"
    }
  }

  frontend-app = {
    image                 = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    allow_unauthenticated = true
  }

  defi-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    env = {
      PUBSUB_TOPIC = "exchanges-topic"
    }
  }

  coinbase-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    env = {
      PUBSUB_TOPIC = "exchanges-topic"
    }
  }

  kucoin-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    env = {
      PUBSUB_TOPIC = "exchanges-topic"
    }
  }

  tracking-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    env = {
      PUBSUB_SUBSCRIPTION = "tracking-subscription"
    }
  }
}
