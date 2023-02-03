/**
 * Copyright © 2014-2022 HashiCorp, Inc.
 *
 * This Source Code is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this project, you can obtain one at http://mozilla.org/MPL/2.0/.
 *
 */

# Define provider specs
provider "aws" {
  access_key = "AKIAY22KEF4IFCIUNTFR"
  secret_key = "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"
  region     = "us-east-1"
}

module "vpc" {
  source = "./aws-vpc/"

  azs                  = var.azs
  common_tags          = var.tags
  resource_name_prefix = var.resource_name_prefix
}

module "secrets" {
  source = "./secrets/"

  shared_san = "*.fewknow.io"
  resource_name_prefix = var.resource_name_prefix
}

