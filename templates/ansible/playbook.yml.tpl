---
- hosts: gateways
  become: yes
  gather_facts: no
  
  vars:
    ansible_python_interpreter: "/usr/bin/env python3"

  tasks:
  - import_role:
      name: ${gateway_role}
    
  - import_role:
      name: ${iptables_role}

  - import_role:
      name: ${stubby_role}

  - import_role:
      name: ${dnsmasq_role}

  - import_role:
      name: ${wired_role}

