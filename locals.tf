locals {
    country = "india"
    state = "andhra"
    district = "westgodavari"
    ingress = [22, 443, 3389, 80, 3306, 1433 ]
    egress = [22, 443 ]
     
}

resource "aws_security_group" "allow_all2" {
  name        = "allow_all2"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.default.id}"

dynamic "ingress" {
 for_each = local.ingress
 content {
 
    from_port   = ingress.value
    to_port     = ingress.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }

 }
 dynamic "egress" {
    for_each = local.egress
    content {
    from_port       = egress.value
    to_port         = egress.value
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    }
    
 }

}





resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${aws_vpc.default.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
 }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  

  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {

        place = local.country
        area = local.state
    }
}