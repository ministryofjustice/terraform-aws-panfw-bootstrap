resource "aws_s3_bucket" "bucket" {
  bucket_prefix = lower(var.bucket_prefix)
  tags          = var.tags
  acl           = "private"
}

resource "aws_s3_bucket_object" "bootstrap_dirs" {
  for_each = toset(var.bootstrap_directories)

  bucket  = aws_s3_bucket.bucket.id
  key     = each.value
  content = "/dev/null"
}

resource "aws_s3_bucket_object" "init_cfg" {
  bucket = aws_s3_bucket.bucket.id
  key    = "config/init-cfg.txt"
  content = templatefile("${path.module}/bootstrap_templates/init-cfg.txt.tpl",
    {
      "hostname"         = var.hostname,
      "panorama-server"  = var.panorama-server,
      "panorama-server2" = var.panorama-server2,
      "tplname"          = var.tplname,
      "dgname"           = var.dgname,
      "dns-primary"      = var.dns-primary,
      "dns-secondary"    = var.dns-secondary,
      "vm-auth-key"      = var.vm-auth-key,
      "op-command-modes" = var.op-command-modes,
      "dhcp-accept-server-hostname" = var.dhcp-accept-server-hostname
    }
  )
}

resource "aws_s3_bucket_object" "bootstrap_xml" {
  bucket = aws_s3_bucket.bucket.id
  key    = "config/bootstrap.xml"
  content = templatefile("${path.module}/bootstrap_templates/bootstrap.xml.tpl",
    {
      bootstrap_user  = var.bootstrap_user
      bootstrap_phash = var.bootstrap_phash
    }
  )
}

resource "aws_s3_bucket_object" "authcode" {
  bucket  = aws_s3_bucket.bucket.id
  key     = "license/authcodes"
  content = var.authcode
}

resource "aws_s3_bucket_object" "bootstrap_files" {
  for_each = fileset("${path.root}/${var.local_directory}", "**")

  bucket = aws_s3_bucket.bucket.id
  key    = each.value
  source = "${path.root}/files/${each.value}"
}

