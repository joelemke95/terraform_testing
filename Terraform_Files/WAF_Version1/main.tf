resource "aws_wafv2_web_acl" "example1" {
    name = "example"
    description = "Example of managed rule"
    scope = "Regionald"

    default_action {
      allow {}
    }

    rule {
    name = "rule1"
    priority = 1

    action {
      block {}
    }
    statement {
      geo_match_statement {
        country_codes = ["US", "CA"]
      }
    }
    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name = "Example1-rule-metrics"
      sampled_requests_enabled = false  
    }
   }
    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name = "my metrics"
      sampled_requests_enabled = false
    }
}
