data "oci_secrets_secretbundle" "sensitive_config_secretbundle" {
  secret_id = var.secret_ocid
}

data "oci_objectstorage_namespace" "os_namespace" {
  compartment_id = var.tenancy_ocid
}

data "oci_objectstorage_object" "read_the_object1" {
  bucket    = var.bucket_name
  namespace = data.oci_objectstorage_namespace.os_namespace.namespace
  object    = local.filename1
}

data "oci_objectstorage_object" "read_the_object2" {
  bucket    = var.bucket_name
  namespace = data.oci_objectstorage_namespace.os_namespace.namespace
  object    = local.filename2
}

