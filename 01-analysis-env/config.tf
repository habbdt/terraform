# bad practice
terraform {
    backend "local" {
        path = "/var/tmp/terraform.state"
    }
}