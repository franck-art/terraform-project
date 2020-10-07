resource "google_compute_instance" "default" {

name = var.name_ressource
machine_type = var.type_mach
zone = var.zone_ress

boot_disk {
  initialize_params {
    image = var.image_ress
  }
}

tags= ["test-http","test-https"] // firewall ---> target_tags

network_interface {
   network = google_compute_network.network.name

 }

 service_account {
   scopes = var.serv_acc[*]
 }

}

/*
resource "google_compute_disk" "gcp_disk" {
  name  = "test-disk"
  type  = "pd-ssd"
  zone  = "${var.zone_ress}"
  image = "${var.image_ress}"
  labels = {
    environment = "dev"
  }
  physical_block_size_bytes = 4096
}

resource "google_compute_attached_disk" "disk_attach" {
  disk     = google_compute_disk.gcp_disk.id
  instance = google_compute_instance.default.id
}

*/
