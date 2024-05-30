import json
from azure.identity import DefaultAzureCredential
from azure.mgmt.compute import ComputeManagementClient

# Replace with your subscription ID
subscription_id = "7140b33e-25da-432c-ae52-346d9eb47b3d"

# Create the Compute Management Client
credential = DefaultAzureCredential()
compute_client = ComputeManagementClient(credential, subscription_id)

# Get all VMs and convert to JSON
vm_data = json.dumps([
    {
        "name": vm.name,
        "resource_group": vm.vm_id,
        "location": vm.location,
        "vm_size": vm.hardware_profile.vm_size,
        "os": vm.storage_profile.os_disk.os_type
    }
    for vm in compute_client.virtual_machines.list_all()
], indent=4)


#Individual value retrieval
individual = json.loads(vm_data)[0]

print(individual["name"])
print(individual["location"])