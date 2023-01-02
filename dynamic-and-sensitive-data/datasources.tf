data "http" "downloaded_document" {
  url = local.source_url
}

output "downloaded_file" {
  value = data.http.downloaded_document.response_body
}