/* ------ variables  declarations --------------*/

variable "path" {
  type    = string
  default = "/home/franck/Bureau/terraform-project/tmpl_terraform"
}

/* ------ provider  declaration --------------*/

provider "google" {
  credentials = "${file("${var.path}/account.json")}" // put the path to your service account file
  project     = "phonic-command-291302"
  region      = "europe-west2-a"
}
