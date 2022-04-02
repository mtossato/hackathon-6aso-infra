#cat main.tf
variable "project" {}
variable "region" {}
provider "google" {
  project = "${var.project}"
  region = "${var.region}"
}

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


resource “google_sql_database_instance” “master” {
  name = "g7-6asoo"
  database_version = "MYSQL_5_7"
  region = "${var.region}"
  settings {
    tier = "db-n1-standard-2"
  }
}

resource "google_sql_database" “database” {
  name = "playlist"
  instance = "${google_sql_database_instance.master.name}"
  charset = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "users" {
  name = "root"
  instance = "${google_sql_database_instance.master.name}"
  host = "34.82.176.115"
  password = "Fiap@2022"
}