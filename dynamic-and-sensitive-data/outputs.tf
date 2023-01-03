output "secret_revealed" {
  value = base64decode(data.oci_secrets_secretbundle.sensitive_config_secretbundle.secret_bundle_content.0.content)
}

output "dev_settings" {
  value = data.oci_objectstorage_object.read_the_object1.content
}

output "prod_settings" {
  value = data.oci_objectstorage_object.read_the_object2.content
}

output "API-A-Endpoint" {
  value = local.api_a_endpoint
}

output "API-A-SecureToken" {
  value = local.apiASecureToken
}


