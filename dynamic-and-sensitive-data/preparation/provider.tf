terraform {
  required_version = ">= 0.14"
}

provider "oci" {
   auth = "InstancePrincipal"  # CloudShell runs in a VM that falls under Instance Principal authorization; no further configuration of tenancy or identity is required
}