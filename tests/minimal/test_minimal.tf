terraform {
  required_version = ">= 1.3.0"
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
}

module "main" {
  source = "../.."

  name   = "TEST_MINIMAL"
  tenant = "TEN1"

}

data "aci_rest_managed" "fvIPSLAMonitoringPol" {
  dn = "uni/tn-TEN1/ipslaMonitoringPol-TEST_MINIMAL"

  depends_on = [module.main]
}

resource "test_assertions" "fvIPSLAMonitoringPol" {
  component = "fvIPSLAMonitoringPol"

  equal "name" {
    description = "name"
    got         = data.aci_rest_managed.fvIPSLAMonitoringPol.content.name
    want        = "TEST_MINIMAL"
  }

  equal "descr" {
    description = "descr"
    got         = data.aci_rest_managed.fvIPSLAMonitoringPol.content.descr
    want        = ""
  }

  equal "slaDetectMultiplier" {
    description = "slaDetectMultiplier"
    got         = data.aci_rest_managed.fvIPSLAMonitoringPol.content.slaDetectMultiplier
    want        = "3"
  }

  equal "slaFrequency" {
    description = "slaFrequency"
    got         = data.aci_rest_managed.fvIPSLAMonitoringPol.content.slaFrequency
    want        = "60"
  }

  equal "slaType" {
    description = "descr"
    got         = data.aci_rest_managed.fvIPSLAMonitoringPol.content.slaType
    want        = "icmp"
  }

  equal "slaPort" {
    description = "slaPort"
    got         = data.aci_rest_managed.fvIPSLAMonitoringPol.content.slaPort
    want        = "0"
  }
}
