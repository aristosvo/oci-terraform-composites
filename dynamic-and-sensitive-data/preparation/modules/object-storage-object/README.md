This module manages a single object in a bucket on Oracle Cloud Infrastructure Object Storage service.

The content of the object can be passed as a string (variable content), can be read from a file (whose fully qualified name is passed to the module as source_file) and can be downloaded from a URL (passed to the  module as source_url).

Note that source_file takes precedence over source_url, and source_url takes precedence over content. 

The OCI namespace, the bucket name and the name of the object to be created should be passed as variables as well.

If the bucket does not yet exist, the creation of the object will fail.