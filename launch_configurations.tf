resource "aws_launch_configuration" "webapp-lc" {
  name = "demo-webapp-lc"
  image_id = "${lookup(var.amis, var.region)}"
  instance_type = "${var.instance_type}"
  security_groups = [
    "${aws_security_group.webapp-http-inbound-sg.id}",
    "${aws_security_group.webapp-ssh-inbound-sg.id}",
    "${aws_security_group.webapp-outbound-sg.id}"
  ]
  user_data = "${file("userdata.sh")}"
  key_name = "${var.key_name}"
  associate_public_ip_address = true
}
