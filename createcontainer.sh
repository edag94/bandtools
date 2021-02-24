# i guess this has to be in the same sub as the storage account or else wont be able to access storage 
# ` (backtick is used in powershell)
# https://docs.microsoft.com/en-us/azure/container-instances/container-instances-application-gateway
# i guess need to add application gateway to connect to container in vnet
# so each container group needs its own vnet with peering 
# will need to use load balance for public ip
az container create `
--resource-group rg-wagyu-testnet-common-westus2 `
--cpu 2 `
--image rickityd/bnode:first `
--ip-address private `
--location westus2 `
--memory 2 `
--name aci-sentry-1-westus2 `
--vnet vnet-wagyu-testnet `
--subnet default `
--os-type linux `
--restart-policy OnFailure `
--azure-file-volume-account-key <redacted> `
--azure-file-volume-account-name blockchainstate `
--azure-file-volume-mount-path /root/.bandd `
--azure-file-volume-share-name blockchainstate-shares