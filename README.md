# tts-swarm-cluster

### Docker Swarm with Terraform & Ansible

1. git clone https://github.com/m0zart89/tts-swarm-cluster.git
2. cd tts-swarm-cluster/terraform
3. cp terraform.tfvars.example terraform.tfvars (also set your unique project id)
4. terraform init
5. terraform apply --auto-approve=true
6. cd ../ansible
7. ansible-playbook -i inventory main.yml
8. ssh -i ~/.ssh/google_compute_engine -l ubuntu <manager_ip>
9. sudo docker service create --replicas 3 --name tts-backend -p 5002:5002 synesthesiam/mozillatts
10. sudo docker service create --name=visualizer --publish=8080:8080/tcp --constraint=node.role==manager --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock dockersamples/visualizer

From another host:
1. sudo docker run -e AUTH_USER=admin -e AUTH_PASS=4ge7575 -e BACKEND=http://<any_worker_ip>:5002/api/tts -d -it -p 80:80 mozart89/tts-frontend

To destroy cluster:
1. cd ../terraform
2. terraform destroy --auto-approve=true
