output "bootstrap_s3_buckets" {
  value = {
    for k, bucket in aws_s3_bucket.bucket:
    k => {
    name = bucket.id
    arn = bucket.arn
    }
  }
}


output "s3_buckets_arn" {
  value = {
    for k, bucket in aws_s3_bucket.bucket:
    k => bucket.arn
  }
}