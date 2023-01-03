# the bucket to be managed by Terraform
resource "oci_objectstorage_bucket" "the_bucket" {
    compartment_id = var.compartment_ocid
    name           = var.bucket_name
    namespace      = data.oci_objectstorage_namespace.os_namespace.namespace
}

data "oci_objectstorage_namespace" "os_namespace" {
  compartment_id = var.tenancy_ocid
}

# use the module module-object to create the indicated object in the specified bucket 
module "object1-in-bucket" {    
    source        = "./modules/object-storage-object"
    object_name = local.filename1
    the_bucket_name = oci_objectstorage_bucket.the_bucket.name # the reference to the bucket object ensures that Terraform is aware of the dependency between this module and the bucket  
    content = local.settings1
    namespace = data.oci_objectstorage_namespace.os_namespace.namespace
    content_type = "application/json"
    source_url=""
    source_file=""
}

# use the module module-object to create the indicated object in the specified bucket 
module "object2-in-bucket" {    
    source        = "./modules/object-storage-object"
    object_name = local.filename2
    the_bucket_name = oci_objectstorage_bucket.the_bucket.name # the reference to the bucket object ensures that Terraform is aware of the dependency between this module and the bucket  
    content = local.settings2
    namespace = data.oci_objectstorage_namespace.os_namespace.namespace
    content_type = "application/json"
    source_url=""
    source_file=""
}

resource "oci_vault_secret" "sensitive_config_secret" {
    #Required
    compartment_id = var.compartment_ocid
    key_id = var.master_key_ocid
    secret_content {
        content_type = "BASE64"
        content = base64encode(local.sensitivesettings)
        name = var.secret_name
    }
    secret_name =  var.secret_name
    vault_id = var.vault_ocid
}

data "oci_secrets_secretbundle" "sensitive_config_secretbundle" {
	#Required
	secret_id = oci_vault_secret.sensitive_config_secret.id
}

