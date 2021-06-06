# # data "aws_ami" "my_ami" {
# #      most_recent      = true
# #      #name_regex       = "^mavrick"
# #      owners           = ["721834156908"]
# # }


# resource "aws_instance" "public-servers" {
#     count = "${var.environment== "prod" ? 3 : 1 }"
#     ami = "${lookup(var.amis, var.aws_region)}"
#     instance_type = "t2.nano"
#     key_name = "LEARNAWS"
#     subnet_id = "${element(aws_subnet.public-subnet.*.id, count.index)}"
#     vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
#     associate_public_ip_address = true	
#     tags = {
#         Name = "public-Server-${count.index+1}"
#         Env = var.environment
#         Owner = "chandu"
# 	CostCenter = "ABCD"
#     }

# }

