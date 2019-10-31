resource "aws_ecs_task_definition" "example_flask_app" {
  family                   = "example_flask_app"
  container_definitions    = "${file("./task-definitions/flask-app.json")}"
  cpu                      = 256
  memory                   = 512
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = "arn:aws:iam::109677204672:role/ecsTaskExecutionRole"
  network_mode             = "awsvpc"
}

resource "aws_ecs_task_definition" "example_redis" {
  family                   = "example_redis"
  container_definitions    = "${file("./task-definitions/redis.json")}"
  cpu                      = 256
  memory                   = 512
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = "arn:aws:iam::109677204672:role/ecsTaskExecutionRole"
  network_mode             = "awsvpc"
}
