# the bucket to be managed by Terraform
resource "oci_objectstorage_bucket" "the_bucket" {
    compartment_id = var.compartment_id
    name           = var.bucket_name
    namespace      = data.oci_objectstorage_namespace.os_namespace.namespace
}

# use the module module-object to create the indicated object in the specified bucket 
module "object-in-bucket" {    
    source        = "./module-object"
    object_name = var.object_name
    the_bucket_name = oci_objectstorage_bucket.the_bucket.name # the reference to the bucket object ensures that Terraform is aware of the dependency between this module and the bucket  
    content = data.http.downloaded_document.response_body
    namespace = data.oci_objectstorage_namespace.os_namespace.namespace
    content_type = var.content_type
}

# report on the managed bucket resource by printing its OCID
output "show-new-bucket" {
  value = oci_objectstorage_bucket.the_bucket
}

# report on the managed object resource 
output "show-the-new-objects-name" {
  value = module.object-in-bucket.new-object.object
}