Terraform variables are static: they are assigned using their default value (which cannot use function calls or references to other variables) or by overrides at startup time (from command line parameter or environment variable)

To use dynamic values - derived at run time using function calls and variable references - Terraform provides locals. These can be referred to using local.<name of local> in the same way as variables are used: var.<name of variable>. Locals are available only in the module in which they are defined.

The file variables.tf defines a variable environment, defined as "dev" and possibly overridden at run time. It also defines a few locals that are assigned files at run time:

The filename is constructed using the environment variable The resulting file is a json file that contains environment specific values. The content of that file is loaded into local json_string and converted to map environmentsettings. Finally, the values we care about - api_a_endpoint, api_b_endpoint and scaleFactor - are defined using the values looked up in the map.

File resources.tf defines four output-resources that print the respective values of the variable and the three locals.

Run this Terraform configuration using:

```
terraform init
terraform apply
terraform apply -var environment=prod
```

The file from which the map is created does  not have to be a local file, it can also be a document available at some accessible URL. For example: https://raw.githubusercontent.com/lucasjellema/oci-terraform-composites/main/lookup_%20variables_in_json/prod-env-variables.json

By adding the local 

```
source_url = "https://raw.githubusercontent.com/lucasjellema/oci-terraform-composites/main/lookup_%20variables_in_json/${var.environment}-env-variables.json"
```
to the variables.tf file and changing the definition of the json_string

```
 # json_string = file(local.filename)
 json_string = data.http.downloaded_document.response_body
 
 And leveraging the data source
 data "http" "downloaded_document" {
  url = local.source_url
}
```

We can have the Terraform configuration dynamically influenced by a document somewhere on GitHub. Update the JSON document and reapply the Terraform configuration to have configuration values take effect.

A little more elegantly:
```
locals {
 filename = "${var.environment}-env-variables.json"
 source_url = "https://raw.githubusercontent.com/lucasjellema/oci-terraform-composites/main/lookup_%20variables_in_json/${var.environment}-env-variables.json"
 json_string = var.configuration_origin == "local" ? file(local.filename) : data.http.downloaded_document.response_body
 environmentsettings = jsondecode(local.json_string)
```

Now to apply the plan:

```
terraform apply -var environment=prod -var configuration_origin=local
```

or

```
terraform apply -var environment=dev -var configuration_origin=remote
```
