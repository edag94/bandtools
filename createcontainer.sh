# i guess this has to be in the same sub as the storage account or else wont be able to access storage 
# ` (backtick is used in powershell)
az container create `
--resource-group rg-wagyu-testnet-common-westus2 `
--cpu 2 `
--dns-name-label aci-sentry-1 `
--image rickityd/bnode:first `
--ip-address Public `
--location westus2 `
--memory 2 `
--name aci-sentry-1-westus2 `
--vnet /subscriptions/ca72fd04-5454-42a0-aa80-1e087cdfb1cd/resourceGroups/rg-wagyu-testnet-westus2/providers/Microsoft.Network/virtualNetworks/rg-wagyu-testnet-westus2-vnet `
--subnet /subscriptions/ca72fd04-5454-42a0-aa80-1e087cdfb1cd/resourceGroups/rg-wagyu-testnet-westus2/providers/Microsoft.Network/virtualNetworks/rg-wagyu-testnet-westus2-vnet/subnets/default `
--os-type linux `
--ports [80] `
--protocol TCP `
--restart-policy OnFailure `
--azure-file-volume-account-key <redacted> `
--azure-file-volume-account-name blockchainstate `
--azure-file-volume-mount-path /root/.bandd `
--azure-file-volume-share-name blockchainstate-shares