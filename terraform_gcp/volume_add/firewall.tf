
resource "google_compute_firewall" "firewall" {

  count = 2
  name    = "${var.name_firewall["${count.index}"]}"
  network = google_compute_network.network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["${var.rule_fir["${count.index}"]}"]
  }

  target_tags = ["${var.name_firewall["${count.index}"]}"]
}
