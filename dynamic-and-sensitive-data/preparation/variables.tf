variable "tenancy_ocid" { default = "ocid1.tenancy.oc1..aaaaaaaag7c7slwmlvsodyym662ixlsonnihko2igwpjwwe2egmlf3gg6okq" }

variable "compartment_ocid" { default = "ocid1.compartment.oc1..aaaaaaaa5q2srleka3ll2xgpcdj3uns3nshzc3lbn2wgx2kcuah5blh47icq" }

variable "bucket_name" { default = "configuration-bucket" }

variable "vault_ocid" { default = "ocid1.vault.oc1.iad.bbpptuh6aacuu.abuwcljrqfxsuoo2mnv7utqblpu5mau7l3cwqe3o3v442x4ub6jjejwrtqaq" }

variable "secret_name" { default = "sensitive_configuration" }
variable "master_key_ocid" { default = "ocid1.key.oc1.iad.bbpptuh6aacuu.abuwcljrilpfiydpdaa4qzijbr47w7uex7oxg3hdi6aebful5kdkdl3xlgfa" }


locals {
  filename1         = "dev-env-variables.json"
  filename2         = "prod-env-variables.json"
  sensitivefilename = "sensitive-variables.json"
  settings1         = file("files/${local.filename1}")
  settings2         = file("files/${local.filename2}")
  sensitivesettings = file("files/${local.sensitivefilename}")
}
