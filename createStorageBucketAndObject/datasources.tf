data "oci_objectstorage_namespace" "os_namespace" {
  compartment_id = var.tenancy_ocid
}

data "http" "downloaded_document" {
  url = var.source_url
}

output "downloaded_file" {
  value = data.http.downloaded_document.response_body
}