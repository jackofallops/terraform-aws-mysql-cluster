provider "aws" {
  region = "${var.region}"
}

data "aws_availability_zones" "available" {}

data "aws_ami" "mysql_cluster_ami" {
  owners      = ["${var.ami_owners}"]
  most_recent = "${var.ami_most_recent}"

  filter {
    name   = "name"
    values = ["${list(var.ami_filter_name_prefix)}"]
  }
}

resource "aws_instance" "mysql_enterprise_cluster" {
  count             = "${var.cluster_size}"
  ami               = "${data.aws_ami.mysql_cluster_ami.id}"
  instance_type     = "${var.cluster_instance_type}"
  availability_zone = "${data.aws_availability_zones.available.Name[count.index]}"

  root_block_device {
    delete_on_termination = "true"
    volume_type           = "gp2"
    volume_size           = "40"
  }

  ebs_block_device {
    device_name           = "mysql-data"
    volume_type           = "io1"
    volume_size           = "${var.data_volume_size}"
    iops                  = "${var.data_volume_iops}"
    delete_on_termination = "${var.data_volume_delete}"
    encrypted             = "${var.data_volume_encrypted}"
  }

  tags {
    Name       = ""
    ServerRole = "${}"
  }
}
