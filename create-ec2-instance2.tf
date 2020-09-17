
-rw-r--r-- 1 shantling 197121  17 Sep 17 15:55 README.md

shantling@DESKTOP-S1THTPO MINGW64 /f/Devops-Weekend- (feature_jira)
$ git add create-ec2-instance1.tf
fatal: pathspec 'create-ec2-instance1.tf' did not match any files

shantling@DESKTOP-S1THTPO MINGW64 /f/Devops-Weekend- (feature_jira)
$
iprovider "aws" {
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
