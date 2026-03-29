module "rg" {
    source = "../../Module/resource_group"
    resource_group_name = var.resource_group_name
    location = var.location
}

module "vnet" {
    source = "../../Module/vnet"
    vnet_name = var.vnet_name
    resource_group_name = var.resource_group_name
    location = var.location
    address_space = var.address_space
    subnet_name = var.subnet_name
    subnet_address_prefixes = var.subnet_address_prefixes
}

module "pip" {
    source = "../../Module/pip"
    pip_name = var.pip_name
    resource_group_name = var.resource_group_name
    location = var.location
}

module "nic" {
    source = "../../Module/nic"
    nic_name = var.nic_name
    resource_group_name = var.resource_group_name
    location = var.location
    subnet_id = module.vnet.subnet_id
    pip_id = module.pip.id
}

