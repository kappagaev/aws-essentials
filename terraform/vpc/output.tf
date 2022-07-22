output "web_public_ip" {
  value = aws_instance.web.public_ip
}

output "web2_public_ip" {
  value = aws_instance.web2.public_ip
}
