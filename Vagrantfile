Vagrant.configure("2") do |config|

  # Use Bento box because it's one of the officially supported Vagrant boxes
  config.vm.box = "bento/ubuntu-18.04"
  # Install a specific version to make the environment reproducible
  # Need to refresh this from time to time
  config.vm.box_version = "201808.24.0"

  # RStudio Server will be available at this address and its default port 8787
  config.vm.network "private_network", ip: "192.168.55.101"
  config.vm.network "forwarded_port", guest: 8787, host: 8787

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
    # Note that this option will install the latest Ansible available for the
    # virtual machine. It should be OK because we won't use anything fancy in
    # Ansible. If the playbooks become more complicated we may need to lock
    # down a specific Ansible version. In that case we need to switch this to
    # "pip" and specify the version we want.
    # See https://www.vagrantup.com/docs/provisioning/ansible_common.html#version
    ansible.install_mode = "default"
    # Prevents warning from vagrant
    ansible.compatibility_mode = "2.0"
  end

  # Name that will appear in VirtualBox
  config.vm.provider "virtualbox" do |vb|
      vb.name = "rstudio-server"
  end
end