terraform {
  required_providers {
    tencentcloud = { source = "tencentcloudstack/tencentcloud" }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~>3.1"
    }
  }
  required_version = ">= 0.13"
}

# Configure the TencentCloud Provider
provider "tencentcloud" {
  region     = var.region

}
provider "gitlab" { token = var.gitlab_token }
