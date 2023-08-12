resource "aws_dynamodb_table" "this" {
  hash_key       = "todoId"
  name           = var.service_name
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "todoId"
    type = "S"
  }

  tags = local.common_tags
}

resource "aws_dynamodb_table_item" "todo" {
  table_name = aws_dynamodb_table.this.name
  hash_key   = aws_dynamodb_table.this.hash_key

  item = <<ITEM
{
  "todoId": {"S": "1"},
  "task": {"S": "Learning Terraform"},
  "done": {"S": "0"}
}
ITEM

}
