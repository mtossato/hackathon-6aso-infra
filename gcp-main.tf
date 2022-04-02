resource "google_cloud_run_service" "default" {
  name     = "cloud-grupo-7"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_artifact_registry_repository" "my-repo" {
  provider = google-beta

  location = "us-central1"
  repository_id = "hackathon6asogrupo07"
  description = "Imagens Docker"
  format = "DOCKER"
}