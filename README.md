# RaspberryPi as Network Gateway

This configures a RaspberryPi as a network gateway:

- wifi interface -> external network
- wired interface -> secure, internal network

I use this to create a test/lab network inside my home/work network where I can experiment
without risk of disruption to the wider network.

The server runs dnsmasq and stubby for DNS resolution. It blocks all traffic from the wifi
network except related/established connections and ssh (just for convenience).

The wifi network isn't configured at all. Set that up with `raspi-config` once the configuration
is complete from the console or wired network.

## Install OS

Install Raspberry Pi OS following the instructions here:

    https://www.raspberrypi.com/software/

I use the 'lite' version - the gateway doesn't need a user interface. 

Using the Imager tool, you can enable ssh and set the public key for access; it cuts out a few steps 
compared to doing it manually.

## Connecting

Connect your Pi to your network and boot it. Once you have the IP address it is assigned from
your dhcp server, add an entry like this to you ~/.ssh/config:

    Host labnet-gw
      Hostname <ip-address>
      User pi
      IdentityFile ~/.ssh/<private-key-file>

You can then login using: `ssh labnet-gw` (or whatever you decide to call it).

NOTE: the name you give the host here has to match the name you give the host in the terraform
configuration below.

## Configuration

### Initial Manual Setup

Log into the Pi using ssh and run these commands:

    sudo apt update
    sudo apt dist-upgrade
    reboot

### Build Configs with Terraform

Copy the file `terraform.tfvars.examples` to `terraform.tfvars` and customise the variables.

Apply the settings:

    terraform init
    terraform apply

### Apply Configs with Ansible

Terraform create the ansible configs and run script. Apply the settings with:

    ./local/ansible/run-ansible.sh


## Using

Connect your Pi to a standalone switch and boot it. It will connect to your wifi network and start
a DHCP server listening on the wired iterface.

## Join a WiFi Network

Connect to the wired network and login to the server. Run `sudo raspi-config` to join a wifi network.

Once that completes, the network should be ready to use.



