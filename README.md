# Outscale

## Building Blocks

### Authentication
- To use these Building Blocks, you will need the following
  - Outscale Access Key
  - Outscale Secret Key
  - Region

### Virtual Network with Subnet
- This Building Block creates a new Virtual Network and Subnet
- Outputs
  - VNET ID
  - Subnet ID

### Virtual Machine in a Subnet
- This Building Block creates a new VM inside of a Subnet
- Inputs
  - VNET ID (Required)
  - Subnet ID (Required)
  - Image ID (Required)
  - VM Type (Required)
