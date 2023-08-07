data "aws_ami" "ubuntu" {
  owners = ["amazon"]

  most_recent = true

  name_regex = "ubuntu"

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "this" {
  for_each = {
    web = {
      name = "web server"
      type = "t3.medium"
    }
    ci_cd = {
      name = "ci/cd server"
      type = "t3.micro"
    }
  }

  ami = data.aws_ami.ubuntu.id

  instance_type = lookup(each.value, "type", null)

  tags = {
    Project = "terraform course"
    Name    = "${each.key}: ${lookup(each.value, "name", null)}"
    Lesson  = "04-foreach-for-splat"
  }
}
