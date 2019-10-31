resource "aws_ecs_service" "flask_app" {
  name                               = "flask_app"
  cluster                            = "${aws_ecs_cluster.example_cluster.id}"
  task_definition                    = "${aws_ecs_task_definition.example_flask_app.arn}"
  desired_count                      = 1
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  launch_type                        = "FARGATE"

  network_configuration {
    assign_public_ip = true

    security_groups = [
      "${var.security-group}"
    ]

    subnets = [
      "${var.subnet-1-id}",
      "${var.subnet-2-id}",
    ]
  }
}

resource "aws_ecs_service" "redis" {
  name                               = "redis"
  cluster                            = "${aws_ecs_cluster.example_cluster.id}"
  task_definition                    = "${aws_ecs_task_definition.example_redis.arn}"
  desired_count                      = 2
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  launch_type                        = "FARGATE"

  network_configuration {
    assign_public_ip = true

    security_groups = [
      "${var.security-group}"
    ]

    subnets = [
      "${var.subnet-1-id}",
      "${var.subnet-2-id}",
    ]
  }

  service_registries {
    registry_arn = "${aws_service_discovery_service.redis.arn}"
  }
}

output "flask-svc-service-ip" {
  value = "${aws_ecs_service.flask_app}"
}