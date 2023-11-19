
resource "aws-instance" "demo"{
    ami = data.aws_ami.ami1.imageid
    key_name = data.aws_instance.demo.key_name
    instance_type = "t3.small"

}
