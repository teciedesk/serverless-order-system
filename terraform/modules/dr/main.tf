resource "aws_s3_bucket_replication_configuration" "replication" {
  bucket = var.source_bucket

  role   = var.replication_role_arn

  rules {
    id     = "replication"
    status = "Enabled"

    
    destination {
      bucket        = var.destination_bucket_arn
      storage_class = "STANDARD"
    }
  }
}

resource "aws_dynamodb_table_replica" "dr_replica" {
  global_table_arn = var.global_table_arn
  provider = aws.dr
}

