variable "environment" {
    default = "dev"
}

locals {
 filename = "${var.environment}-env-variables.json"
 json_string = file(local.filename)
 environmentsettings = jsondecode(local.json_string)
 
 api_a_endpoint = lookup(local.environmentsettings, "apiAEndpoint")
 api_b_endpoint = lookup(local.environmentsettings, "apiBEndpoint")
 scaleFactor = lookup(local.environmentsettings, "scaleFactor")
}
