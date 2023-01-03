output "new-object" {
  value = oci_objectstorage_object.the_object_in_bucket
}

output "show-the-object-content-length" {
  value = data.oci_objectstorage_object.read_the_object.content_length
}


