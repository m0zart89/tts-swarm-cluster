resource "local_file" "master" {
  filename = "./../ansible/inventory"
  file_permission = "0644"
  content  = <<EOT
[managers]
%{ for ip in google_compute_instance.managers.*.network_interface.0.access_config.0.nat_ip ~}
${ip}
%{ endfor ~}
[workers]
%{ for ip in google_compute_instance.workers.*.network_interface.0.access_config.0.nat_ip ~}
${ip}
%{ endfor ~}
EOT
}