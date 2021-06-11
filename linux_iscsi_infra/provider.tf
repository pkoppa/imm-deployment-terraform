terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">1.0.4"
    }
  }
}


provider "intersight" {
  apikey    = ""
  secretkey = "SecretKey.txt"
  endpoint  = "www.intersight.com"
}
