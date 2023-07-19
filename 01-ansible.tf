## render the run script

resource "local_file" "run_playbook" {
  content = templatefile("templates/ansible/run-ansible.sh.tpl", {
      inventory_file = "inventory.ini"
    })
  filename = "local/ansible/run-ansible.sh"
  file_permission = "0755"
}


## render the playbook

resource "local_file" "playbook" {
  content = templatefile("templates/ansible/playbook.yml.tpl", {
      gateway_role = local.gateway_role,
      iptables_role = local.iptables_role,
      stubby_role = local.stubby_role,
      dnsmasq_role = local.dnsmasq_role,
      wifi_role = local.wifi_role,
      wired_role = local.wired_role,
    })
  filename = "local/ansible/playbook.yml"
}


## render host variables

resource "local_file" "hostvars" {

  content = templatefile("templates/ansible/hostvars.yml.tpl", {
    hostname = var.hostname,
    domainname = var.domainname,
    wifi_iface = var.wifi_iface,
    wired_iface = var.wired_iface,
    wired_address = local.wired_address,
    dhcp_start = local.dhcp_start,
    dhcp_end = local.dhcp_end,
    stubby_upstream_servers = var.stubby_upstream_servers
  })

  filename        = "local/ansible/host_vars/${var.hostname}.yml"
  file_permission = "0640"
}


## render the inventory file

resource "local_file" "inventory" {
  content = templatefile("templates/ansible/inventory.ini.tpl", {
    gateway_name = var.hostname,
    })
  filename = "local/ansible/inventory.ini"
  file_permission = "0640"
}

