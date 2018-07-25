resource "aws_security_group" "base_linux" {
  name        = "base_linux_${random_id.instance_id.hex}"
  description = "base security rules for all linux nodes"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name          = "${var.tag_customer}-${var.tag_project}-${random_id.instance_id.hex}-${var.tag_application}-security_group"
    X-Dept        = "${var.tag_dept}"
    X-Customer    = "${var.tag_customer}"
    X-Project     = "${var.tag_project}"
    X-Application = "${var.tag_application}"
    X-Contact     = "${var.tag_contact}"
    X-TTL         = "${var.tag_ttl}"
  }
}

resource "aws_security_group" "habitat_supervisor" {
  name        = "habitat_supervisor_${random_id.instance_id.hex}"
  description = "Security rules for the Habitat supervisor"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name          = "${var.tag_customer}-${var.tag_project}-${random_id.instance_id.hex}-${var.tag_application}-security_group"
    X-Dept        = "${var.tag_dept}"
    X-Customer    = "${var.tag_customer}"
    X-Project     = "${var.tag_project}"
    X-Application = "${var.tag_application}"
    X-Contact     = "${var.tag_contact}"
    X-TTL         = "${var.tag_ttl}"
  }
}

resource "aws_security_group" "aem" {
  name        = "aem_${random_id.instance_id.hex}"
  description = "Security rules for the Habitat supervisor"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name          = "${var.tag_customer}-${var.tag_project}-${random_id.instance_id.hex}-${var.tag_application}-security_group"
    X-Dept        = "${var.tag_dept}"
    X-Customer    = "${var.tag_customer}"
    X-Project     = "${var.tag_project}"
    X-Application = "${var.tag_application}"
    X-Contact     = "${var.tag_contact}"
    X-TTL         = "${var.tag_ttl}"
  }
}

//////////////////////////
// AEM Rules
resource "aws_security_group_rule" "ingress_allow_4502_tcp_all" {
  type              = "ingress"
  from_port         = 4502
  to_port           = 4502
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.base_linux.id}"
}

resource "aws_security_group_rule" "ingress_allow_4503_tcp_all" {
  type              = "ingress"
  from_port         = 4503
  to_port           = 4503
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.base_linux.id}"
}

//////////////////////////
// Base Linux Rules
resource "aws_security_group_rule" "ingress_allow_22_tcp_all" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.base_linux.id}"
}

/////////////////////////
// Habitat Supervisor Rules
# Allow Habitat Supervisor http communication tcp
resource "aws_security_group_rule" "ingress_allow_9631_tcp" {
  type                     = "ingress"
  from_port                = 9631
  to_port                  = 9631
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.habitat_supervisor.id}"
  source_security_group_id = "${aws_security_group.habitat_supervisor.id}"
}

# Allow Habitat Supervisor http communication udp
resource "aws_security_group_rule" "ingress_allow_9631_udp" {
  type                     = "ingress"
  from_port                = 9631
  to_port                  = 9631
  protocol                 = "udp"
  security_group_id        = "${aws_security_group.habitat_supervisor.id}"
  source_security_group_id = "${aws_security_group.habitat_supervisor.id}"
}

# Allow Habitat Supervisor ZeroMQ communication tcp
resource "aws_security_group_rule" "ingress_9638_tcp" {
  type                     = "ingress"
  from_port                = 9638
  to_port                  = 9638
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.habitat_supervisor.id}"
  source_security_group_id = "${aws_security_group.habitat_supervisor.id}"
}

# Allow Habitat Supervisor ZeroMQ communication udp
resource "aws_security_group_rule" "ingress_allow_9638_udp" {
  type                     = "ingress"
  from_port                = 9638
  to_port                  = 9638
  protocol                 = "udp"
  security_group_id        = "${aws_security_group.habitat_supervisor.id}"
  source_security_group_id = "${aws_security_group.habitat_supervisor.id}"
}

# Egress: ALL
resource "aws_security_group_rule" "linux_egress_allow_0-65535_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.base_linux.id}"
}
