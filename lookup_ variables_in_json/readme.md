Terraform variables are static: they are assigned using their default value (which cannot use function calls or references to other variables) or by overrides at startup time (from command line parameter or environment variable)

To use dynamic values - derived at run time using function calls and variable references - Terraform provides locals. These can be referred to using local.<name of local> in the same way as variables are used: var.<name of variable>. Locals are available only in the module in which they are defined.

The file variables.tf defines a variable environment, defined as "dev" and possibly overridden at run time. It also defines a few locals that are assigned files at run time:

The filename is constructed using the environment variable The resulting file is a json file that contains environment specific values. The content of that file is loaded into local json_string and converted to map environmentsettings. Finally, the values we care about - api_a_endpoint, api_b_endpoint and scaleFactor - are defined using the values looked up in the map.

File resources.tf defines four output-resources that print the respective values of the variable and the three locals.

Run this Terraform configuration using:

terraform init
terraform apply
terraform apply -var environment=prod


