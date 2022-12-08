variable "ENV" {}
variable "PRIVATE_SUBNET_IDS" {}
variable "PUBLIC_SUBNET_IDS" {}
variable "DESIRED_SIZE" {}
variable "MAX_SIZE" {}
variable "MIN_SIZE" {}
variable "CREATE_ALB_INGRESS" {
  default = false
}
variable "CREATE_EXTERNAL_SECRETS" {
  default = false
}


variable "INSTALL_KUBE_METRICS" {
  default = false
}

variable "CREATE_SCP" {
  default = false
}

variable "CREATE_NGINX_INGRESS" {
  default = false
}
