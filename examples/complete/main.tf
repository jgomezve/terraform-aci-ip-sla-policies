module "aci_ip_sla_policy" {
  source  = "netascode/ip_sla_policy/aci"
  version = ">= 0.0.1"

  name        = "ABC"
  description = "My Description"
  tenant      = "TEN1"
  multiplier  = 10
  frequency   = 120
  sla_type    = "tcp"
  port        = 65001
}
