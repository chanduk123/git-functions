resource "aws_subnet" "public-subnet" {
    # count = 3
    count = "${length(var.publiccidr)}"
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${element(var.publiccidr,count.index)}"
    availability_zone = "${element(var.azs, count.index)}"
    tags = {
        Name = "public-subnet-${count.index+1}"
    }
}

resource "aws_subnet" "private-subnet" {
    # count = 3
    count = "${length(var.privatecidr)}"
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${element(var.privatecidr,count.index)}"
    availability_zone = "${element(var.azs, count.index)}"

    tags = {
       Name = "private-subnet-${count.index+1}"
    }
}

