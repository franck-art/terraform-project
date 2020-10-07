provider "google" {
  credentials = file("/home/franck/Bureau/TP/test-backend/account.json")
  project     = "phonic-command-291302"
  region      = "us-central1"
}


terraform {
  backend "gcs" {
    credentials = "/home/franck/Bureau/TP/test-backend/account.json"
    bucket  = "franck-sceau"
    prefix  = "terraform/terraform_state"
  }
}
