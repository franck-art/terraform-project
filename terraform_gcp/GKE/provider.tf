
provider "google" {
  credentials = "${file("${var.path}/account.json")}"
  project     = "phonic-command-291302"
  region      = "europe-west2-a"
}

provider "google-beta" {
  credentials = "${file("${var.path}/account.json")}"
  project     = "phonic-command-291302"
  region      = "europe-west2-a"
}
