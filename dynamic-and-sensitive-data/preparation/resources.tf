# the bucket to be managed by Terraform
resource "oci_objectstorage_bucket" "the_bucket" {
    compartment_id = var.compartment_id
    name           = var.bucket_name
    namespace      = data.oci_objectstorage_namespace.os_namespace.namespace
}

data "oci_objectstorage_namespace" "os_namespace" {
  compartment_id = var.tenancy_ocid
}


# use the module module-object to create the indicated object in the specified bucket 
module "object1-in-bucket" {    
    source        = "./module-object"
    object_name = filename1
    the_bucket_name = oci_objectstorage_bucket.the_bucket.name # the reference to the bucket object ensures that Terraform is aware of the dependency between this module and the bucket  
    content = settings1
    namespace = data.oci_objectstorage_namespace.os_namespace.namespace
    content_type = "application/json"
}

# use the module module-object to create the indicated object in the specified bucket 
module "object2-in-bucket" {    
    source        = "./module-object"
    object_name = filename2
    the_bucket_name = oci_objectstorage_bucket.the_bucket.name # the reference to the bucket object ensures that Terraform is aware of the dependency between this module and the bucket  
    content = settings2
    namespace = data.oci_objectstorage_namespace.os_namespace.namespace
    content_type = "application/json"
}

