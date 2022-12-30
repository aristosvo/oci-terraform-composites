variable "tenancy_ocid" {
    default = "ocid1.tenancy.oc1..aaaaaaaag7c7slwmlvsodyym662ixlsonnihko2igwpjwwe2egmlf3gg6okq"
}

variable "compartment_id" {
    default = "ocid1.compartment.oc1..aaaaaaaa5q2srleka3ll2xgpcdj3uns3nshzc3lbn2wgx2kcuah5blh47icq"
}

variable "bucket_name" {
  default = "books-bucket"
}

variable "source_url" {
    default = "https://raw.githubusercontent.com/paulbaumgarten/data-sets/master/books.csv"
}

variable "object_name" {
  default = "books-collection.csv"
}

variable "content_type" {
  default = "text/csv"
}
