variable "tenancy_ocid" {
    default = "ocid1.tenancy.oc1..aaaaaaaag7c7slwmlvsodyym662ixlsonnihko2igwpjwwe2egmlf3gg6okq"
}

variable "compartment_id" {
    default = "ocid1.compartment.oc1..aaaaaaaa5q2srleka3ll2xgpcdj3uns3nshzc3lbn2wgx2kcuah5blh47icq"
}

variable "bucket_name" {
  default = "books-bucket"
}


variable "documents" {
  description = "Map of documents to download and create as objects."
  type        = map(any)
  default = {
    books = {
      source_url = "https://raw.githubusercontent.com/paulbaumgarten/data-sets/master/books.csv",
      object_name= "books-collection.csv",
      content_type="text/csv",
      content=""
    
    },
    fruit = {      
      content= "apples,oranges,bananas,pears"
      object_name= "fruitbasket.txt",
      content_type="text/plain",
      source_url=""

    }
  }
}
