## Manual Setup
To ensure maximum benefit to understanding service discovery, in this project we will be using nginx load balancing and consul discovery setup manally  
If you are on ubuntu you can use [multipass](https://multipass.run/) to create virtual machines (instance of ubuntu) real fast on your local machine and   
use them to setup and configure nginx and consul respectively.

This Setup will include a total of 4 Ubuntu servers:
- Consul server
- Load balancer server
- 2 Backend servers for Load Balancer

## Automation
For Automation I chose to use terraform for provisioning all of the 4 servers. I then proceeded to install and configure nginx and consul in their respective  
servers manually to get a real hands on experience.
If you wish to fully automate everything you could use terraform + ansible. The later to help in you in managing the configuration of the respective systems  
(nginx, consul) in their respective servers.

## Automation Prerequisites
- A valid AWS account
- A workstation with Ubuntu Operating System (if you will use multipass) or Any linux with Vagrant (serves the same purpose as multipass), or AWS instance  
configured with AWS CLI, Ansible and Terraform with full access to provision ec2 instances.

### Provisioning using Terraform
Use the values below for your `terraform.tfvars`. You can feel free to change whenever necessary.  
**NOTE** You will need to replace `techiescamp` to the your own pem key, one that you generated using the aws command below or the one you already have in your aws account.
`aws ec2 create-key-pair --key-name techiescamp --query 'KeyMaterial' --output text > ./techiescamp.pem`

```
instance_type       = "t2.micro"
region              = "us-east-1"
key_name            = "techiescamp"
ingress_cidr_blocks = "172.31.0.0/16"
```

### Initialize terraform
`terraform init`

### Dry run 
You can dry run to see what resources terraform will create for you once you commit, terraform will locate your terraform.tfvars automatically when you run the   command below:

`terraform plan`


### Provisioning
Apply the configuration, if you are sure you are ok with the output.

`terraform apply -auto-approve`

### Manual Configuration
- Get the respective public ips of each of the aws instances you provisioned in the previous step from terraform output.  
- SSH to each individual server and setup each respective resource. 

### TODO: 
I will document my steps in my [blog](https://basebandit.github.io). Just my take away and notes from my own understanding.

### Reference
This project was taken from this [blog](https://devopscube.com/service-discovery-example/), which I highly recommend if you are beginning in DevOps.