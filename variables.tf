variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "amis" {
    description = "AMIs by region"
    default = {
    us-east-1 = "ami-0747bdcabd34c712a" # ubuntu 18.04 LTS
		us-east-2 = "ami-00399ec92321828f5" # ubuntu 20.04 LTS
		
    }
}
#var.amis["us-east-1"] to access a element in maps
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "IGW_name" {}
variable "key_name" {}
variable "azs" {}
variable "environment" {}
variable "instance_type" {
  type = map
  default = {
    dev = "t2.nano"
    test = "t2.micro"
    prod = "t2.medium"
    }
}
variable "publiccidr" {}
variable "privatecidr" {}
variable imagename {}