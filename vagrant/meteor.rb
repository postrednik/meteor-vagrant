class Meteor
  def Meteor.configure(config, settings)

    config.vbguest.auto_update = true
    config.vbguest.auto_reboot = true

    config.vm.box = "cargomedia/debian-7-amd64-plain"
    config.vm.network :private_network, ip: settings["ip"] ||= "192.168.10.10"
    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", settings["memory"] ||= "1024"]
      vb.customize ["modifyvm", :id, "--cpus", settings["cpus"] ||= "1"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--ostype", "Debian_64"]
    end
    if settings.has_key?("ports")
      settings["ports"].each do |port|
        config.vm.network "forwarded_port", guest: port["guest"], host: port["host"], protocol: port["protocol"] ||= "tcp"
      end
    end
    config.vm.provision "shell" do |s|
      s.inline = "echo $1 | grep -xq \"$1\" /home/vagrant/.ssh/authorized_keys || echo $1 | tee -a /home/vagrant/.ssh/authorized_keys"
      s.args = [File.read(File.expand_path(settings["pubkey"]))]
    end
    settings["keys"].each do |key|
      config.vm.provision "shell" do |s|
        s.privileged = false
        s.inline = "echo \"$1\" > /home/vagrant/.ssh/$2 && chmod 600 /home/vagrant/.ssh/$2"
        s.args = [File.read(File.expand_path(key)), key.split('/').last]
      end
    end
    if settings.has_key?("environments")
      settings["environments"].each do |var|
        config.vm.provision "shell" do |s|
            s.inline = "echo \"\nexport $1=$2\" >> /home/vagrant/.profile"
            s.args = [var["key"], var["value"]]
        end
      end
    end
    config.vm.provision "shell" do |s|
      s.privileged = false
      s.inline = "bash \"$1\"/vagrant/provision.sh"
      s.args = "/vagrant"
    end
    config.vm.provision "shell", run: "always" do |s|
      s.privileged = false
      s.inline = "bash \"$1\"/vagrant/init-meteor.sh"
      s.args = "/vagrant"
    end
  end
end
