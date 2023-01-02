variable "tenancy_ocid" {
    default = "ocid1.tenancy.oc1..aaaaaaaag7c7slwmlvsodyym662ixlsonnihko2igwpjwwe2egmlf3gg6okq"
}

variable "compartment_id" {
    default = "ocid1.compartment.oc1..aaaaaaaa5q2srleka3ll2xgpcdj3uns3nshzc3lbn2wgx2kcuah5blh47icq"
}

variable "bucket_name" {
  default = "configuration-bucket"
}

locals {
 filename1 = "dev-env-variables.json"
 filename2 = "prod-env-variables.json"
 settings1 =  file(local.filename1) 
 settings2 =  file(local.filename2) 
}
