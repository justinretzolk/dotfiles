# reads the Terraform Cloud authentication token from the appropriate file and exports it to a useful
# environment variable (useful for making API calls)
function tfctoken() {
  export TOKEN=$(jq -r '.credentials["app.terraform.io"].token' ~/.terraform.d/credentials.tfrc.json)
}
