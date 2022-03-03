data "aws_iam_policy_document" "datadog_aws_integration_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::464622532012:root"]
    }
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"

      values = [
        "${var.datadog_aws_integration_external_id}"
      ]
    }
  }
}

data "aws_iam_policy_document" "datadog_aws_integration" {
  statement {
    actions = ["cloudwatch:Get*", "cloudwatch:List*", "ec2:Describe*", "support:*", "tag:GetResources", "tag:GetTagKeys", "tag:GetTagValues"]

    resources = ["*"]
  }
}
