locals {
  gateway_role = "gateway"
  iptables_role = "iptables"
  stubby_role = "stubby"
  dnsmasq_role = "dnsmasq"
  wifi_role = "wifi"
  wired_role = "wired"
}

resource "template_dir" "gateway" {
  source_dir      = "templates/ansible-roles/${local.gateway_role}"
  destination_dir = "local/ansible/roles/${local.gateway_role}"

  vars = {}
}


resource "template_dir" "iptables" {
  source_dir      = "templates/ansible-roles/${local.iptables_role}"
  destination_dir = "local/ansible/roles/${local.iptables_role}"

  vars = {}
}


resource "template_dir" "stubby" {
  source_dir      = "templates/ansible-roles/${local.stubby_role}"
  destination_dir = "local/ansible/roles/${local.stubby_role}"

  vars = {}
}


resource "template_dir" "dnsmasq" {
  source_dir      = "templates/ansible-roles/${local.dnsmasq_role}"
  destination_dir = "local/ansible/roles/${local.dnsmasq_role}"

  vars = {}
}


resource "template_dir" "wired" {
  source_dir      = "templates/ansible-roles/${local.wired_role}"
  destination_dir = "local/ansible/roles/${local.wired_role}"

  vars = {}
}

