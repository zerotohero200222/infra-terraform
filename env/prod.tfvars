project_id = "eastern-augury-477909-q6"
region     = "us-central1"

services = {
  wallet-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    min_instances = 2
    max_instances = 10
    allow_unauthenticated = true
  }

  portfolio-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    min_instances = 2
    max_instances = 10
  }

  status-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    min_instances = 1
    max_instances = 6
  }

  aggregator-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
  }

  frontend-app = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
    allow_unauthenticated = true
  }

  defi-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
  }

  coinbase-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
  }

  kucoin-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
  }

  tracking-service = {
    image = "us-docker.pkg.dev/cloudrun/container/hello:latest"
  }
}
