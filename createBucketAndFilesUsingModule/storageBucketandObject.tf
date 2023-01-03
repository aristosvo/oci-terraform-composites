# the bucket to be managed by Terraform
resource "oci_objectstorage_bucket" "the_bucket" {
  compartment_id = var.compartment_id
  name           = var.bucket_name
  namespace      = data.oci_objectstorage_namespace.os_namespace.namespace
}

# use the module module-object to create the indicated object in the specified bucket 
module "object-in-bucket" {
  for_each        = var.documents
  source          = "./module-object"
  object_name     = each.value.object_name
  the_bucket_name = oci_objectstorage_bucket.the_bucket.name # the reference to the bucket object ensures that Terraform is aware of the dependency between this module and the bucket  
  source_url      = each.value.source_url
  content         = each.value.content
  namespace       = data.oci_objectstorage_namespace.os_namespace.namespace
  content_type    = each.value.content_type
  source_file     = ""
}

module "objects-in-bucket-from-files" {
  for_each        = fileset(var.source_directory, "**")
  source          = "./module-object"
  object_name     = each.key                                 # remove everything before and including the last / character
  the_bucket_name = oci_objectstorage_bucket.the_bucket.name # the reference to the bucket object ensures that Terraform is aware of the dependency between this module and the bucket  
  source_url      = ""
  content         = ""
  source_file     = "${var.source_directory}/${each.key}"
  namespace       = data.oci_objectstorage_namespace.os_namespace.namespace
  content_type    = ""
}

# report on the managed bucket resource by printing its OCID
output "show-new-bucket" {
  value = oci_objectstorage_bucket.the_bucket
}
