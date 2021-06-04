resource "aws_dynamodb_table" "terraform_state_dynamodb_table" {
  name = "terraform-state"
  hash_key = "LockID"
  read_capacity = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }
}
