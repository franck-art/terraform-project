variable name_firewall {
type = list(string)
default =  ["test-http","test-https"]
}

variable "name_bucket" {
type = string
default = "bucket"
}

variable rule_fir {
type = list(string)
default =  ["80","443"]

}


variable "path" {
type = string
default = "/home/franck/Bureau/TP/test-gcp"
}


variable "name_ressource" {
type = string
default = "test"
}

variable "type_mach" {
type = string
default = "n1-standard-1"
}

variable "zone_ress" {
type = string
default = "europe-west2-a"
}

variable "image_ress" {
type = string
default = "ubuntu-os-cloud/ubuntu-1604-lts"
}

variable "serv_acc" {
type = list(string)
default = ["userinfo-email", "compute-ro", "storage-ro"]
}
