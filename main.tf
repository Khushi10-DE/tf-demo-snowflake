terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "test-project-snowflakedemo"
    workspaces {
      name = "snowflake-demo"
    }
  }
}

provider "snowflake" {
  account  = "AIBZVYU-UDB39802"
  username = "KHUSHBUGOHIL"
  role     = "SYSADMIN"
  password = var.snowflake_password
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database created via Terraform"
}