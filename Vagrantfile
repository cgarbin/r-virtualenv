Vagrant.configure("2") do |config|
  
  config.vm.box = "bento/ubuntu-18.04"

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

  config.vm.provider "virtualbox" do |vb|
      vb.name = "r-virtualenv"
  end
end