module "network" {
  source = "../modules/network"
  rg-name = module.rg.rg-vm-name
  rg-location = module.rg.rg-vm-location
}

module "vm" {
  source    = "../modules/vm"
  subnet_id = module.network.output_subnet_id
  instance_template = "Standard_D1_v2"
  g-name = module.rg.rg-vm-name
  rg-location = module.rg.rg-vm-location
}

module "nsg" {
  source = "../modules/nsg"
  rg-name = module.rg.rg-vm-name
  rg-location = module.rg.rg-vm-location
}

module "storage" {
  source = "../modules/storage"
  rg-name = module.rg.rg-vm-name
  rg-location = module.rg.rg-vm-location
}

module "rg" {
  source = "../modules/rg"
}

module "ip" {
  source = "../modules/ip"
  rg-name = module.rg.rg-vm-name
  rg-location = module.rg.rg-vm-location
}