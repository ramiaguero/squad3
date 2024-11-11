output "url_host" {
  value = "https://${aws_route53_record.www_record.fqdn}/"
}

output "cdn_distribution_id" {
  value = "${aws_cloudfront_distribution.cdn.id}"
}

output "s3_bucket" {
  value = "${aws_s3_bucket.website_bucket.id}"
}
