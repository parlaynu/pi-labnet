---
hostname: ${hostname}
domainname: ${domainname}

wifi_iface: ${wifi_iface}

wired_iface: ${wired_iface}
wired_address: ${wired_address}

dhcp_start: ${dhcp_start}
dhcp_end: ${dhcp_end}

stubby_upstream_servers:
%{ for upstream in stubby_upstream_servers ~}
- ip_address: ${upstream.ip_address}
  tls_auth_name: ${upstream.tls_auth_name}
%{ endfor ~}
