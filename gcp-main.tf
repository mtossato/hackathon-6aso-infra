resource "google_app_engine_application" "app_hackathon" {
  project     = "hackathon-6aso-grupo-07"
  location_id = "us-central"
}

resource "google_artifact_registry_repository" "my-repo" {
  provider = google-beta

  location = "us-central1"
  repository_id = "hackathon6asogrupo07"
  description = "Imagens Docker"
  format = "DOCKER"
}