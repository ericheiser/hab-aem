provider "aws" {
  region                  = "${var.aws_region}"
  profile                 = "${var.aws_profile}"
  shared_credentials_file = "~/.aws/credentials"
}

resource "random_id" "instance_id" {
  byte_length = 4
}

////////////////////////////////
// Author Instance
//
resource "aws_instance" "author" {
  count = 1

  connection {
    user        = "${var.aws_centos_image_user}"
    private_key = "${file("${var.aws_key_pair_file}")}"
  }

  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${aws_security_group.base_linux.id}", "${aws_security_group.habitat_supervisor.id}", "${aws_security_group.aem.id}"]

  root_block_device {
    delete_on_termination = true
    volume_size           = 100
    volume_type           = "gp2"
  }

  tags {
    Name          = "${format("${var.tag_customer}-${var.tag_application}-author-%02d-${random_id.instance_id.hex}", count.index + 1)}"
    X-Dept        = "${var.tag_dept}"
    X-Customer    = "${var.tag_customer}"
    X-Project     = "${var.tag_project}"
    X-Application = "${var.tag_application}"
    X-Contact     = "${var.tag_contact}"
    X-TTL         = "${var.tag_ttl}"
  }

  provisioner "habitat" {
    use_sudo     = true
    service_type = "systemd"
    url          = "${var.depot_url}"
    channel      = "${var.channel}"
    peer         = "${self.private_ip}"

    service {
      url  = "${var.depot_url}"
      name = "${var.origin}/aem-author"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sudo -E hab svc load ${var.origin}/comp-pkg --bind author:aem-author.default --channel ${var.channel} -u ${var.depot_url} -s at-once"
    ]
  }
}

////////////////////////////////
// Publish Instance
//
resource "aws_instance" "publisher" {
  count = 1

  connection {
    user        = "${var.aws_centos_image_user}"
    private_key = "${file("${var.aws_key_pair_file}")}"
  }

  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"
  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${aws_security_group.base_linux.id}", "${aws_security_group.habitat_supervisor.id}", "${aws_security_group.aem.id}"]

  root_block_device {
    delete_on_termination = true
    volume_size           = 100
    volume_type           = "gp2"
  }

  tags {
    Name          = "${format("${var.tag_customer}-${var.tag_application}-publisher-%02d-${random_id.instance_id.hex}", count.index + 1)}"
    X-Dept        = "${var.tag_dept}"
    X-Customer    = "${var.tag_customer}"
    X-Project     = "${var.tag_project}"
    X-Application = "${var.tag_application}"
    X-Contact     = "${var.tag_contact}"
    X-TTL         = "${var.tag_ttl}"
  }

  provisioner "habitat" {
    use_sudo     = true
    service_type = "systemd"
    url          = "${var.depot_url}"
    channel      = "${var.channel}"
    peer         = "${aws_instance.author.0.private_ip}"

    service {
      url   = "${var.depot_url}"
      name  = "${var.origin}/aem-publisher"
      binds = ["author:aem-author.default"]
    }
  }
}
