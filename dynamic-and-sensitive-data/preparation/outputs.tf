output "secret_revealed" {
    value = base64decode(data.oci_secrets_secretbundle.sensitive_config_secretbundle.secret_bundle_content.0.content)
}