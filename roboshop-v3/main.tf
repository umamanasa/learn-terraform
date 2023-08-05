module "components" {

  for_each = var.components

  source            = "./module"
  zone_id           = var.zone_id
  security_groups   = var.security_groups
  name              = each.key["name"]
  instance_type     = each.key["instance_type"]

}
