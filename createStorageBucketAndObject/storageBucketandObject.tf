# the bucket to be managed by Terraform
resource "oci_objectstorage_bucket" "the_bucket" {
  compartment_id = var.compartment_id
  name           = var.bucket_name
  namespace      = data.oci_objectstorage_namespace.os_namespace.namespace
}

# the object to be managed in the bucket
resource "oci_objectstorage_object" "the_object_in_bucket" {
  bucket       = oci_objectstorage_bucket.the_bucket.name
  object       = var.object_name
  namespace    = data.oci_objectstorage_namespace.os_namespace.namespace
  content      = data.http.downloaded_document.response_body
  content_type = var.content_type
}

# report on the managed bucket resource by printing its OCID
output "show-new-bucket" {
  value = oci_objectstorage_bucket.the_bucket
}

# report on the managed object resource by printing the full object
output "show-new-object-name" {
  value = oci_objectstorage_object.the_object_in_bucket.object
}

data "oci_objectstorage_object" "read_the_object" {
  bucket    = oci_objectstorage_object.the_object_in_bucket.bucket
  namespace = oci_objectstorage_object.the_object_in_bucket.namespace
  object    = oci_objectstorage_object.the_object_in_bucket.object
}

# report on the managed object resource by printing the full object
output "show-the-object-content-length" {
  value = data.oci_objectstorage_object.read_the_object.content_length
}
