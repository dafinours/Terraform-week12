resource "aws_iam_group" "group1" {
  name = "Devops"
}
resource "aws_instance" "name" {
  ami           = data.aws_ami.ami1.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ec2_key.key_name

  # Specify the subnet ID and security group ID
  subnet_id     = "subnet-0ad8308b6b6d3c0f2"
  vpc_security_group_ids = ["sg-0be8b9770334d2131"]

  depends_on = [aws_key_pair.ec2_key, aws_iam_group.group1]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("week12b.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "mkdir nation",
      "pwd",
      "nproc"
    ]
  }

  provisioner "file" {
    source      = "week12b.pem"
    destination = "/tmp/week12b.pem"
  }
}


