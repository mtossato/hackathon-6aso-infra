resource "google_app_engine_application" "app" {
  project     = "hackathon-6aso-grupo-07"
  location_id = "us-west"
}

resource "google_artifact_registry_repository" "my-repo" {
  provider = google-beta

  location = "us-west1"
  repository_id = "hackathon6asogrupo07"
  description = "Imagens Docker"
  format = "DOCKER"
}