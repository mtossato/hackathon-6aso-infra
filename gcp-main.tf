resource "google_cloud_run_service" "default" {
  name     = "cloudGrupo7"
  location = "us-central1"


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