output "s3_replication_config_id" {
  value = aws_s3_bucket_replication_configuration.replication.id
}

output "dynamodb_replica_region" {
  value = aws_dynamodb_table_replica.dr_replica.region_name
}
