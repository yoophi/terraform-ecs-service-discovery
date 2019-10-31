resource "aws_service_discovery_private_dns_namespace" "example_internal" {
  name        = "example.internal"
  description = "example"
  vpc         = "${var.vpc-id}"
}
