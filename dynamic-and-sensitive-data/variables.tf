variable "environment" {
    default = "dev"
}

variable "configuration_origin" {
    default = "local" # determine where to get the configuration setings from: local (file) or remote (URL)
}

locals {
 filename = "${var.environment}-env-variables.json"
 source_url = "https://raw.githubusercontent.com/lucasjellema/oci-terraform-composites/main/lookup_%20variables_in_json/${var.environment}-env-variables.json"
 json_string = var.configuration_origin == "local" ? file(local.filename) : data.http.downloaded_document.response_body
 environmentsettings = jsondecode(local.json_string)
 
 api_a_endpoint = lookup(local.environmentsettings, "apiAEndpoint")
 api_b_endpoint = lookup(local.environmentsettings, "apiBEndpoint")
 scaleFactor = lookup(local.environmentsettings, "scaleFactor")
}
