resource "null_resource" "ec2-script" {
count = "${var.environment== "prod" ? 3 : 1 }"

provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "${file("LEARNAWS.pem")}"
    host     = "${element(aws_instance.public-servers.*.public_ip, count.index)}"
    }
}
provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
      ]
    connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "${file("LEARNAWS.pem")}"
    host     = "${element(aws_instance.public-servers.*.public_ip, count.index)}"
    }
    }

provisioner "local-exec" {
    command = <<EOH
      echo "${element(aws_instance.public-servers.*.public_ip, count.index)}" >> public_details && echo "${element(aws_instance.public-servers.*.private_ip, count.index)}" >> private_details,
    EOH
    }
}
