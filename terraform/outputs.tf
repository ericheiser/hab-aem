output "author_ip" {
  value = "${aws_instance.author.0.public_ip}"
}

output "publisher_ip" {
  value = "${aws_instance.publisher.0.public_ip}"
}

output "author_instance" {
  value = "http://${aws_instance.author.0.public_ip}:4503"
}

output "publisher_instance" {
  value = "http://${aws_instance.publisher.0.public_ip}:4502"
}
