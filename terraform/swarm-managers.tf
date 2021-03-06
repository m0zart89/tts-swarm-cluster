resource "google_compute_instance" "managers" {
  count        = var.swarm_managers
  name         = "manager${count.index + 1}"
  machine_type = var.swarm_managers_instance_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image_name
      size  = 10
    }
  }

  network_interface {
    network       = google_compute_network.swarm.name
    access_config {}
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_pub_key_file)}"
  }

}
