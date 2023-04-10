output "consul_server_ip" {
  value = "${aws_instance.consul_server.public_ip}"
}

output "load_balancer_ip" {
  value = "${aws_instance.load_balancer.public_ip}"
}

output "backends_ips" {
  value = [
    for instance in aws_instance.backends:
    instance.public_ip
  ]
}