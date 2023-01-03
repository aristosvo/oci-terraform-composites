variable "tenancy_ocid" { default = "ocid1.tenancy.oc1..aaaaaaaag7c7slwmlvsodyym662ixlsonnihko2igwpjwwe2egmlf3gg6okq" }

variable "compartment_ocid" { default = "ocid1.compartment.oc1..aaaaaaaa5q2srleka3ll2xgpcdj3uns3nshzc3lbn2wgx2kcuah5blh47icq" }
variable "bucket_name" { default = "configuration-bucket" }
variable "secret_ocid" { default = "ocid1.vaultsecret.oc1.iad.amaaaaaa6sde7caamjpmqdteq6kilw3h52beoe7g5s7f7hdbks7iacmzlnha" }

variable "environment" {
  default = "prod"
}


locals {
  filename1 = "dev-env-variables.json"
  filename2 = "prod-env-variables.json"

  sensitive_json_string = base64decode(data.oci_secrets_secretbundle.sensitive_config_secretbundle.secret_bundle_content.0.content)
  sensitive_settings    = jsondecode(local.sensitive_json_string)

  # dev or prod TODO: replace first "dev with variable"
  environment_json_string = var.environment == "dev" ? data.oci_objectstorage_object.read_the_object1.content : data.oci_objectstorage_object.read_the_object2.content
  environment_settings    = jsondecode(local.environment_json_string)

  settings = merge(local.sensitive_settings, local.environment_settings)

  api_a_endpoint  = lookup(local.settings, "apiAEndpoint")
  apiASecureToken = lookup(local.settings, "apiASecureToken")

}
