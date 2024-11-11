provider "aws" {
  region = "us-east-2"
}

module "web_static_cloudfront_s3" {
  source = "./web-static-cloudfront-s3"  

  cdn_acm_certificate_arn      = "arn:aws:acm:us-east-1:253490770873:certificate/2dba401e-3f08-4f28-9154-fbae6b575393"
  cdn_cname                    = "www.vestigiashoes.lat" 
  cdn_root_zone                = "vestigiashoes.lat"
  cdn_additional_vhosts        = []  
  cdn_default_ttl              = 86400
  cdn_max_ttl                  = 31536000
  cdn_min_ttl                  = 0
  cdn_viewer_protocol_policy   = "redirect-to-https"
  cdn_minimum_protocol_version = "TLSv1.2_2018"
  cdn_ssl_support_method       = "sni-only"

  
  tags = {
    "Environment" = "production"
    "Project"     = "website"
  }
}
