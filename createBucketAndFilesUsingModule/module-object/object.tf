variable "the_bucket_name" {
}
variable "object_name" {
}
variable "content" {
}
variable "namespace" {
}
variable "content_type" {
}

# the object to be managed in a bucket
resource "oci_objectstorage_object" "the_object_in_bucket" {
     bucket = var.the_bucket_name
     object = var.object_name
     namespace = var.namespace
     content = var.content
     content_type = var.content_type
 }

output "new-object" {
  value = oci_objectstorage_object.the_object_in_bucket
}

data "oci_objectstorage_object" "read_the_object" {
  bucket = oci_objectstorage_object.the_object_in_bucket.bucket
  namespace = oci_objectstorage_object.the_object_in_bucket.namespace
  object = oci_objectstorage_object.the_object_in_bucket.object
}

# report on the managed object resource 
output "show-the-object-content-length" {
  value = data.oci_objectstorage_object.read_the_object.content_length
}
