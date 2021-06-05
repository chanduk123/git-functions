resource "aws_route_table" "public-routetable" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags = {
        Name = "public-routetb"
    }
}

resource "aws_route_table" "private-routetable" {
    vpc_id = "${aws_vpc.default.id}"

    tags = {
        Name = "privare-routetb"
    }
}

resource "aws_route_table_association" "public-rt" {
    count = "${length(var.publiccidr)}"
    subnet_id = "${element(aws_subnet.public-subnet.*.id, count.index)}"
    route_table_id = "${aws_route_table.public-routetable.id}"
}

resource "aws_route_table_association" "pirvate-rt" {
    count = "${length(var.privatecidr)}"
    subnet_id = "${element(aws_subnet.private-subnet.*.id, count.index)}"
    route_table_id = "${aws_route_table.private-routetable.id}"
}
# resource "aws_route_table_association" "public-rt-assos2" {
#     #count = 3
#     subnet_id = "${aws_subnet.public-subnet[1].id}"
#     route_table_id = "${aws_route_table.public-routetable.id}"
# }
# resource "aws_route_table_association" "public-rt-assos3" {
#     #count = 3
#     subnet_id = "${aws_subnet.public-subnet[2].id}"
#     route_table_id = "${aws_route_table.public-routetable.id}"
# }