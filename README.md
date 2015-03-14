# vagrant platform for meteor

(c) 2015 Rostislav Postrednik http://postrednik.cz <rostislav@postrednik.cz>

Slide-in multi-platform sandbox for development of [meteor](https://www.meteor.com/) applications in virtual environment. Tested on Windows([Git BASH](https://msysgit.github.io/))/Linux and should work on OS/X.

## Setup

1) install dependencies

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - general-purpose full virtualizer for x86 hardware
- [vagrant](https://www.vagrantup.com/downloads.html) - lightweight, reproducible, and portable development environments
- [vbguest](https://github.com/dotless-de/vagrant-vbguest) - A Vagrant plugin to keep your VirtualBox Guest Additions up to date
        vagrant plugin install vagrant-vbguest

2) install this sandbox to your meteor project root, start the environment and develop!

    cd myproject/
    curl -f https://raw.githubusercontent.com/postrednik/meteor-vagrant/master/install.sh | sh
    vagrant up
> Vagrantfile will be (re)created in the project root

> package files will be installed to vagrant/ directory

> .gitignore will be created/extended to ignore vagrant stuff

## Configuration / Usage

Configuration can be changed in vagrant/config.yaml file.

First run will initialize the vagrant box with system updates and core installs. Guest is build on top of [cargomedia/debian-7-amd64-plain](https://github.com/cargomedia/vagrant-boxes) vagrant box. This is the time for coffee break.

Packages installed to virtual quest:
- mongodb
- nvm 0.24.0
- nodejs 0.12.0
- meteor

You can use all vagrant commands as you used too.

#### Daily work commands:
**start the environment**

    vagrant up
> your project output is at http://localhost:3000/

> stdout of running meteor instance in guest is redirected to .vagrant/meteor.log (use *tail -f .vagrant/meteor.log* in host machine)

**stop the environment**

    vagrant halt
**connect over SSH**

    vagrant ssh
**destroy the virtual machine**

    vagrant destroy --force

## Known issues:
- meteor instance files are destroyed on every environment start, same as you use *meteor reset* command, meteor settings are kept

## Licence

[MIT](./LICENSE).
