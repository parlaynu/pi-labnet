variable "hostname" {
  default = "piratical"
}

variable "domainname" {
  default = "lab.example.xyx"
}

variable "ssh_username" {
  default = "pi"
}

variable "ssh_key_file" {
  default = "~/.ssh/rpi"
}

variable "cidr_block" {
  default = "192.168.99.0/24"
}

locals {
  wired_prefix = split("/", var.cidr_block)[1]
  wired_address = join("/", [cidrhost(var.cidr_block, 1), local.wired_prefix])
  dhcp_start = cidrhost(var.cidr_block, 100)
  dhcp_end = cidrhost(var.cidr_block, 199)
}

variable "wired_iface" {
  default = "eth0"
}

variable "wifi_iface" {
  default = "wlan0"
}

variable "stubby_upstream_servers" {
  type = list(object({
    ip_address = string
    tls_auth_name = string
  }))
  default = [
    {
      ip_address = "1.1.1.1"
      tls_auth_name =  "cloudflare-dns.com"
    },
    {
      ip_address = "1.0.0.1"
      tls_auth_name =  "cloudflare-dns.com"
    }
  ]
}

