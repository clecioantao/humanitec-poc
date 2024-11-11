variable "subscription_id" {
  description = "Azure Subscription ID"
}

variable "client_id" {
  description = "Azure Client ID"
}

variable "client_secret" {
  description = "Azure Client Secret"
  sensitive  = true
}

variable "tenant_id" {
  description = "Azure Tenant ID"
}

variable "location" {
  description = "Azure Region"
  default     = "eastus"
}

variable "resource_group" {
  description = "Resource Group Name"
  default     = "humanitec-poc-rg"
}

variable "acr_name" {
  description = "Azure Container Registry Name"
  default     = "humanitecacr"
}

variable "aks_cluster_name" {
  description = "AKS Cluster Name"
  default     = "humanitec-aks"
}
