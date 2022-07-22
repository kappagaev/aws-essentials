data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  name_regex  = "ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"
}

resource "aws_instance" "web" {
  ami             = "ami-0a1ee2fb28fe05df3"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.public.id]
  subnet_id       = aws_subnet.public_subnet_1.id
  tags = {
    Name = "HelloWorld"
  }
  associate_public_ip_address = true
  user_data                   = <<EOF
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
echo "<h1>Hello World</h1>" > /var/www/html/index.html
EOF
}
resource "aws_eip" "one" {
  vpc        = true
  instance   = aws_instance.web.id
  depends_on = [aws_internet_gateway.gw, aws_instance.web]
}

resource "aws_instance" "web2" {
  ami             = "ami-0a1ee2fb28fe05df3"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.public.id]
  subnet_id       = aws_subnet.public_subnet_2.id
  tags = {
    Name = "HelloWorld2"
  }
  associate_public_ip_address = true
  user_data                   = <<EOF
#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
echo "<h1>Hello World2</h1>" > /var/www/html/index.html
EOF
}
