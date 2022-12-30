data "oci_objectstorage_namespace" "os_namespace" {
  compartment_id = var.tenancy_ocid
}
