### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  ip_addr = google_compute_instance.vm_instance[*].network_interface.0.network_ip
 }
 )
 filename = "inventory"
}


resource "google_compute_instance" "vm_instance" {
  count = length("${var.name_instance}")
  name         = "${var.name_instance[count.index]}"
  machine_type = "${var.type_machine}"
  zone         = "${var.zone}"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
