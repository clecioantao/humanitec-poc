# Ajuste para o novo contexto
export SUBSCRIPTION_ID=$(az account show --query id -o tsv)

cat << EOF > resdef-azure.yaml
# Connect to an AKS cluster using temporary credentials defined via a Cloud Account
apiVersion: entity.humanitec.io/v1b1
kind: Definition
metadata:
  id: api-flask-cluster
entity:
  name: api-flask-cluster
  type: k8s-cluster
  driver_account: azure-testes
  driver_type: humanitec/k8s-cluster-aks
  driver_inputs:
    values:
      name: ${AKS_CLUSTER_NAME}
      resource_group: ${AKS_RESOURCE_GROUP_NAME}
      subscription_id: ${SUBSCRIPTION_ID}
      server_app_id: 6dae42f8-4368-4678-94ff-3960e28e3630
  criteria:
  - app_id: api-flask
EOF

echo "AKS Resource Definition prepared at resdef-azure.yaml"
