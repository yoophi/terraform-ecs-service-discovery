resource "aws_service_discovery_service" "redis" {
  name = "redis-svc"

  dns_config {
    namespace_id = "${aws_service_discovery_private_dns_namespace.example_internal.id}"

    dns_records {
      ttl  = 60
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }
}

output "name" {
  value = "${aws_service_discovery_service.redis}"
}
