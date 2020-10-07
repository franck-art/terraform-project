output "id_comp" {
value = "${google_compute_instance.default.id}"
}

output "instance_id_comp" {
value = "${google_compute_instance.default.instance_id}"
}

output "url_bucket" {
value = "${google_storage_bucket.bucket_store.url}"
}
