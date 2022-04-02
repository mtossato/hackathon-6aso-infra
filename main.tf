#cat main.tf
variable "project" {}
variable "region" {}
provider "google" {
project = "${var.project}"
region = "${var.region}"
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