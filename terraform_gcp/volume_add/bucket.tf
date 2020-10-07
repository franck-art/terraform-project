resource "google_storage_bucket" "bucket_store" {
  name          = "${var.name_bucket}"
  location      = "US"
  force_destroy = true

/*  lifecycle_rule {
    condition {
      age = "3"
    }
    action {
      type = "Delete"
    }
  }*/

}
