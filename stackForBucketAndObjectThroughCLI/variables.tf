variable "tenancy_ocid" {}

variable "compartment_ocid" {}

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