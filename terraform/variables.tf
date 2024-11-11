# Variáveis de Autenticação
variable "client_id" {
  description = "Azure Client ID"
  default     = ""
}

variable "client_secret" {
  description = "Azure Client Secret"
  default     = ""
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  default     = ""
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  default     = ""
}

# Variáveis de Configuração de Recursos
variable "resource_group" {
  description = "Nome do Resource Group a ser criado no Azure"
  type        = string
  default     = "humanitec-poc-rg"
}

variable "location" {
  description = "Localização onde os recursos serão criados no Azure"
  type        = string
  default     = "northeurope"
}

variable "acr_name" {
  description = "Nome do Azure Container Registry"
  type        = string
  default     = "humanitecacr"
}

variable "aks_cluster_name" {
  description = "Nome do Cluster AKS"
  type        = string
  default     = "humanitec-aks"
}
