Vagrant.configure("2") do |config|
  
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.provision :shell, path: "bootstrap.sh"

  config.vm.provider "virtualbox" do |vb|
      vb.name = "r-virtualenv"
  end
end