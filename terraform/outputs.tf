output "Swarm_managers_IPs" {
  value = google_compute_instance.managers.*.network_interface.0.access_config.0.nat_ip
}

output "Swarm_workers_IPs" {
  value = google_compute_instance.workers.*.network_interface.0.access_config.0.nat_ip
}
