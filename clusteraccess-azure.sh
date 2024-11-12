#!/bin/bash

# Validar se todas as variáveis necessárias estão definidas
if [ -z "$AKS_CLUSTER_NAME" ] || [ -z "$AKS_RESOURCE_GROUP_NAME" ] || [ -z "$MANAGED_IDENTITY_NAME" ] || [ -z "$MANAGED_IDENTITY_RESOURCE_GROUP" ]; then
  echo "Erro: Certifique-se de que todas as variáveis estão definidas."
  echo "AKS_CLUSTER_NAME, AKS_RESOURCE_GROUP_NAME, MANAGED_IDENTITY_NAME, e MANAGED_IDENTITY_RESOURCE_GROUP são necessários."
  exit 1
fi

# Obtém o ID do Cluster AKS
export AKS_CLUSTER_ID=$(az aks show -n "$AKS_CLUSTER_NAME" -g "$AKS_RESOURCE_GROUP_NAME" --query id -o tsv)
if [ -z "$AKS_CLUSTER_ID" ]; then
  echo "Erro: Não foi possível obter o AKS_CLUSTER_ID."
  exit 1
fi
echo "AKS_CLUSTER_ID: $AKS_CLUSTER_ID"

# Obtém o principalId da Managed Identity
export MANAGED_IDENTITY_PRINCIPAL_ID=$(az identity show -n "$MANAGED_IDENTITY_NAME" -g "$MANAGED_IDENTITY_RESOURCE_GROUP" --query principalId -o tsv)
if [ -z "$MANAGED_IDENTITY_PRINCIPAL_ID" ]; then
  echo "Erro: Não foi possível obter o MANAGED_IDENTITY_PRINCIPAL_ID."
  exit 1
fi
echo "MANAGED_IDENTITY_PRINCIPAL_ID: $MANAGED_IDENTITY_PRINCIPAL_ID"

# Atribuir a role "Azure Kubernetes Service Cluster User Role"
az role assignment create \
  --role "Azure Kubernetes Service Cluster User Role" \
  --scope "$AKS_CLUSTER_ID" \
  --assignee "$MANAGED_IDENTITY_PRINCIPAL_ID"

# Atribuir a role "Azure Kubernetes Service RBAC Cluster Admin"
az role assignment create \
  --role "Azure Kubernetes Service RBAC Cluster Admin" \
  --scope "$AKS_CLUSTER_ID" \
  --assignee "$MANAGED_IDENTITY_PRINCIPAL_ID"
