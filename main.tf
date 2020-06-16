resource "aws_s3_bucket" "bucket" {
  bucket_prefix = var.bucket_prefix
  acl           = "private"
}

resource "aws_s3_bucket_object" "bootstrap_dirs" {
  for_each = toset(var.bootstrap_directories)

  bucket  = aws_s3_bucket.bucket.id
  key     = each.value
  content = "/dev/null"
}

resource "aws_s3_bucket_object" "bootstrap_files" {
  # for_each = fileset("${path.root}/${var.local_directory}", "**")
  # transform the fileset to remove .gitkeep files before uploading files to s3
  for_each = toset([for file in fileset("${path.root}/${var.local_directory}", "{config,content,license,plugin,software}/**") : replace(file, ".gitkeep", "")])
  bucket   = aws_s3_bucket.bucket.id
  key      = each.value
  source   = "${path.root}/${var.local_directory}/${each.value}"
  etag     = filemd5("${path.root}/${var.local_directory}/${each.value}")
}
