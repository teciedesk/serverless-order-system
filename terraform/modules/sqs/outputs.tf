output "queue_url" {
  description = "URL of the main SQS queue"
  value       = aws_sqs_queue.order_queue.id
}

output "queue_arn" {
  description = "ARN of the main SQS queue"
  value       = aws_sqs_queue.order_queue.arn
}
