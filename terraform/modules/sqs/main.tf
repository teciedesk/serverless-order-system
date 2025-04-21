resource "aws_sqs_queue" "order_queue" {
  name                      = var.queue_name
  visibility_timeout_seconds = var.visibility_timeout
  message_retention_seconds = 345600  # 4 days
  receive_wait_time_seconds = 10

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "dlq" {
  name = "${var.queue_name}-dlq"
}
