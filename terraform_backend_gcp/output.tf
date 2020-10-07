output "network_int" {
 value = google_compute_instance.default.network_interface.0.network_ip
 description = "internal ip address"
 sensitive = false
}

output "id_instance" {
 value = google_compute_instance.default.instance_id
 description = "internal ip address"
 sensitive = false
}

output "id_ressource" {
 value = google_compute_instance.default.id
 description = "internal ip address"
 sensitive = true
}
