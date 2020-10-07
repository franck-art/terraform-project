provider "google" {
  credentials = file("YOUR_PATH_TO_JSON_FILE/xxx.json")
  project     = "phonic-command-291302"
  region      = "us-central1"
}


terraform {
  backend "gcs" {
    credentials = "YOUR_PATH_TO_JSON_FILE/xxx.json"
    bucket  = "franck-sceau"
    prefix  = "terraform/terraform_state"
  }
}
