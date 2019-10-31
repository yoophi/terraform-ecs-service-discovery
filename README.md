# Terraform + ECS with Service Discovery

Terrafrom 을 이용하여 AWS ECS Cluster 를 생성하고, 두 개의 서비스를 AWS Cloud Map 기반의 Service Registry 를 이용해 통신하는 예제입니다.


<https://christina04.hatenablog.com/entry/ecs-service-discovery>


## 실행 방법 

```
$ terraform init
$ terraform plan
$ terraform apply \
    -var vpc-id=vpc-id \
    -var subnet-1-id=subnet-1-id \
    -var subnet-2-id=subnet-2-id \
    -var security-group-id=security-group-id
```

## 구성 삭제

```
$ terraform destroy
```
