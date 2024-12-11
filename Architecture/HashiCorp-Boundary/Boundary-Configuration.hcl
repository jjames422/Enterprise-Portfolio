# Controller configuration
controller {
  name = "boundary-controller"
  database {
    url = "postgres://boundary:password@localhost:5432/boundary"
  }
  listener {
    purpose = "api"
    address = "0.0.0.0:9200"
  }
}

# Worker configuration
worker {
  name = "boundary-worker"
  controller {
    address = "https://controller.boundary.local:9200"
  }
  listener {
    purpose = "proxy"
    address = "0.0.0.0:9202"
  }
}

# Target resource
target {
  name        = "example-database"
  description = "Postgres Database"
  session_max_seconds = 3600
  worker_filter = ["boundary-worker"]
}
