 Terraform resources for an OCI Stack used to create a new bucket on Object Storage, then add a file object to that bucket (based on a URL to a text based document). 


# Create and Apply Stack through OCI CLI

cd /tmp
git clone https://github.com/lucasjellema/oci-terraform-composites
cd ./oci-terraform-composites/stackForBucketAndObjectThroughCLI
zip -r bucket-and-object-stack.zip .
mv bucket-and-object-stack.zip ../..
rm -Rf oci-terraform-composites
cd ../..


export config_source_zip=./bucket-and-object-stack.zip   
export compartment_id=ocid1.compartment.oc1..aaaaaaaa5q2srleka3ll2xgpcdj3uns3nshzc3lbn2wgx2kcuah5blh47icq
export tenancy_ocid=ocid1.tenancy.oc1..aaaaaaaag7c7slwmlvsodyym662ixlsonnihko2igwpjwwe2egmlf3gg6okq
export stack_display_name=object-storage-bucket-stack
export region="us-ashburn-1"
export variables=('{"compartment_ocid": "'${compartment_id}'", "tenancy_ocid": "'${tenancy_ocid}'" , "region": "'${region}'" }')
echo $variables

STACK_ID=$(oci resource-manager stack create --compartment-id $compartment_id --display-name=$stack_display_name --description "Created through OCI CLI"  --config-source $config_source_zip --variables "${variables}"   | jq -r  '.data.id')
echo $STACK_ID
oci resource-manager job create-apply-job --execution-plan-strategy AUTO_APPROVED --stack-id $STACK_ID --display-name "Running Apply Job from OCI CLI"


and a second stack:

export config_source_zip=./bucket-and-object-stack.zip   
export compartment_id=ocid1.compartment.oc1..aaaaaaaa5q2srleka3ll2xgpcdj3uns3nshzc3lbn2wgx2kcuah5blh47icq
export tenancy_ocid=ocid1.tenancy.oc1..aaaaaaaag7c7slwmlvsodyym662ixlsonnihko2igwpjwwe2egmlf3gg6okq
export stack_display_name=stack-for-country-data
export region="us-ashburn-1"
export bucket_name="atlas_bucket"
export object_name="countries-collection.csv"
export source_url="https://raw.githubusercontent.com/mledoze/countries/master/dist/countries.csv"
export variables=('{"compartment_ocid": "'${compartment_id}'", "tenancy_ocid": "'${tenancy_ocid}'" , "region": "'${region}'", "bucket_name":"'${bucket_name}'", "object_name":"'${object_name}'", "source_url":"'${source_url}'" }')
echo $variables

STACK_ID=$(oci resource-manager stack create --compartment-id $compartment_id --display-name=$stack_display_name --description "Created through OCI CLI"  --config-source $config_source_zip --variables "${variables}"   | jq -r  '.data.id')
echo $STACK_ID
oci resource-manager job create-apply-job --execution-plan-strategy AUTO_APPROVED --stack-id $STACK_ID --display-name "Running Apply Job from OCI CLI"

