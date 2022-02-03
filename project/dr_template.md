# Infrastructure

## AWS Zones
**Primary** - us-east-2

**Standby** - us-west-1

## Servers and Clusters

### Table 1.1 Summary
| Asset      | Purpose           | Size                                                                   | Qty                                                             | DR                                                                                                           |
|------------|-------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Asset name | Brief description | AWS size eg. t3.micro (if applicable, not all assets will have a size) | Number of nodes/replicas or just how many of a particular asset | Identify if this asset is deployed to DR, replicated, created in multiple locations or just stored elsewhere |
| Ubuntu Web | Running the Flask Application | t3.micro | 3 | Created in all AZ's supported in the region and deployed to DR site |
| EKS Control Plane | Coordinate K8s node activities | N\A | N\A | Managed by AWS and created in multiple AZs and deployed to DR site|
| EKS Nodes | Run containerized applications including Prometheus and Grafana stack | t3.medium | 2 | Created in multiple AZ's and deployed to DR site |
| VPC | Network for applications to run | /16 | 1 | Private and Public subnets in multiple AZs and created in DR |
| Web Application ALB | Entry point for multiple instances of the Flask applicaiton | N\A | 1 | Connected to target group members in multiple AZ's and created in DR |
| Grafana ALB | Entry point for Grafana application running in EKS pods | N\A | 1 | Connected to target group members in multiple AZ's and created in DR |
| Aurora MySQL| data repository for application | t3.small | 2 | Created in multiple AZ's and replicated from primary region to standby region |




### Descriptions
More detailed descriptions of each asset identified above.

## DR Plan
### Pre-Steps:
List steps you would perform to setup the infrastructure in the other region. It doesn't have to be super detailed, but high-level should suffice.

#### Utilities: Prometheus and Grafana

In the zone2 Terraform deployment, deploy the EKS cluster. Once the EKS cluster up is running, deploy Prometheus and Grafana.

#### Application
In the zone2 Terraform deployment, deploy the ALB and EC2 instances.

#### Database
In the zone1 Terraform deployment, deploy the primary RDS cluster of two nodes (1 Writer and 1 Reader) followed by the deployment of the secondary RDS cluster, which is configured to be the standby for the primary cluster ARN. 

## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region

1. Confirm that Route 53 failover routing for the application endpoint completed successfully, and the application is now accessible from the standby region instances
2. Confirm the RDS cluster failed over.
3. Confirm the failed over application instance is able to read/write from/to the failed over RDS cluster.