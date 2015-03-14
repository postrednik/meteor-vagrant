require 'json'
require 'yaml'

VAGRANTFILE_API_VERSION = "2"

configFile = File.expand_path("vagrant/config.yaml")

require_relative 'vagrant/meteor.rb'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    Meteor.configure(config, YAML::load(File.read(configFile)))

end
