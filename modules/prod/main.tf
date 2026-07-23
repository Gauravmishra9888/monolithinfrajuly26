module "rg" {
  source   = "../child/1rg"
  child_rg = var.parent_rg

}

module "nsg" {
  source    = "../child/2nsg"
  child_nsg = var.parent_nsg

}

module "vnet" {
  depends_on = [module.rg]
  source     = "../child/3vnet"
  child_vnet = var.parent_vnet
}

module "subnet" {
  depends_on   = [module.vnet]
  source       = "../child/4subnet"
  child_subnet = var.parent_subnet

}

module "pip" {
  depends_on = [module.rg]
  source     = "../child/6pip"
  child_pip  = var.parent_pip

}

module "nic" {
  depends_on = [module.subnet, module.pip]
  source     = "../child/nic"
  child_nic  = var.parent_nic

}

module "vm" {
  depends_on = [ module.rg,module.nic ]
  source   = "../child/vm"
  child_vm = var.parent_vm


}
