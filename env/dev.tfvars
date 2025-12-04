project_id = "dev-project-id"
region     = "us-central1"

services = {
  wallet-service = {
    image = "us-central1-docker.pkg.dev/dev-project-id/blockstats/wallet-service:latest"
    min_instances = 0
    max_instances = 3
    allow_unauthenticated = false
  }

  portfolio-service = {
    image = "us-central1-docker.pkg.dev/dev-project-id/blockstats/portfolio-service:latest"
    min_instances = 0
    max_instances = 3
  }

  status-service = {
    image = "us-central1-docker.pkg.dev/dev-project-id/blockstats/status-service:latest"
    min_instances = 0
    max_instances = 2
  }

  aggregator-service = {
    image = "us-central1-docker.pkg.dev/dev-project-id/blockstats/aggregator-service:latest"
  }

  frontend-app = {
    image = "us-central1-docker.pkg.dev/dev-project-id/blockstats/frontend-app:latest"
    allow_unauthenticated = true
  }

  defi-service = {
    image = "us-central1-docker.pkg.dev/dev-project-id/blockstats/defi-service:latest"
  }

  coinbase-service = {
    image = "us-central1-docker.pkg.dev/dev-project-id/blockstats/coinbase-service:latest"
  }

  kucoin-service = {
    image = "us-central1-docker.pkg.dev/dev-project-id/blockstats/kucoin-service:latest"
  }

  tracking-service = {
    image = "us-central1-docker.pkg.dev/dev-project-id/blockstats/tracking-service:latest"
  }
}
