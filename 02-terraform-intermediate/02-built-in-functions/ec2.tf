resource "aws_instance" "server" {
  # like if else
  count = local.instance_number <= 0 ? 0 : local.instance_number

  ami           = var.instance_ami
  instance_type = lookup(var.instance_type, var.env)

  tags = merge(
    local.common_tags,
    {
      Project = "terraform course"
      Env     = format("%s", var.env)
      Name    = format("instance %d", count.index + 1)
    }
  )
}
