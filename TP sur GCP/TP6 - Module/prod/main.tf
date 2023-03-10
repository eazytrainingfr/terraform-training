module "network" {
  source = "../modules/network"


}
module "instance" {
  source    = "../modules/instance"
  subnet_id = module.network.output_subnet_id
}

module "firewall" {
  source = "../modules/firewall"
  vpc_id = module.network.output_vpc_id
}