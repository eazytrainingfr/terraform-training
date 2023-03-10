module "network" {
  source = "../modules/network"


}
module "instance" {
  source    = "../modules/instance"
  subnet_id = module.network.output_subnet_id
  instance_template = lookup(var.instance_template_map, terraform.workspace)
  # instance_template = (terraform.workspace == prod) ? g1-small : f1-micro
}

module "firewall" {
  source = "../modules/firewall"
  vpc_id = module.network.output_vpc_id
}