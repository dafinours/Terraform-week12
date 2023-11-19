module "ec2" {
source = "../Modules/Ec2"  
ami = "05c13eab67c5d8861"
instance_type = "t3.small"
name = "dev_module"
}
output "public_ip" {
 value = module.server1.public_ip 
}
