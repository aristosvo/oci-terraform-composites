These Terraform resources are used to create a new bucket on Object Storage, then add a file object to that bucket. 

These plans can be executed most easily in the OCI Cloudshell (where Terraformm, the OCI Provide and the ~/.oci/config file are all available)

The assumptions/prerequisites:
* the target compartment's OCID is specified in variables.tf
* the user applying the Terraform plan has the required permissions to create a bucket in the compartment

To run/apply the plan: see [Article on Medium - Getting started quickly with querying OCI from Terraform in Cloud Shell](https://medium.com/oracledevs/getting-started-quickly-with-querying-oci-from-terraform-in-cloud-shell-40f0e8bb44cc)

terraform init

terraform plan

terraform apply

terraform apply -var bucket_name='extra_special_bucket' -var object_name='sample_text.txt' -var source_url='https://filesamples.com/samples/document/txt/sample3.txt' -var content_type='text/plain'