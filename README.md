A reproducible R environment

How to create an R environment in a consistent way, to create reproducible experiments.

To create a consistent environment we pick specific versions of the operating system and the tools we use. Picking the latest available version, common in many install procedures, would change the behavior of the environment from time to time.

This environments uses:

- [Vagrant](https://www.vagrantup.com/) to create a Linux virtual machines
- [VirtualBox](https://www.virtualbox.org/) as the host for the virtual machine
- [Ansible](https://www.ansible.com/) to configure the virtual machine
- [R Studio Server](https://www.rstudio.com/products/rstudio/#Server) to access the R environment from your computer

Note: tested on a MacBook. Not tested on Windows or other environments.

# Installing Vagrant and VirtualBox

Vagrant and VirtualBox together allow us to create the virtual Linux machine we use as base for the environment.

- Vagrant defines a template (in the [Vagrantfile](https://www.vagrantup.com/docs/vagrantfile/)) that we can use to install a specific version of Linux in a virtual machine
- VirtualBox hosts that Linux machine

Install Vagrant following the instructions [here](https://www.vagrantup.com/docs/installation/) and install VirtualBox following the instructions [here](https://www.virtualbox.org/wiki/Downloads).

# Getting the virtual machine started

- Clone this repository if you haven't done so yet: `git clone https://https://github.com/cgarbin/r-virtualenv`
- `cd` to the repository's directory
- Start the virtual machine with Vagrant: `vagrant up`

This will start a virtual machine defined in `Vagrantfile`. The first time you run this command it will take a while. It has to download the image for that machine and configure it. It will start up much faster after the initial download. Vagrant caches the image locally.

The virtual machine we are creating is based on the [Ubuntu Bento box](https://app.vagrantup.com/bento/). It's one of the [officially supported Vagrant images](https://www.vagrantup.com/docs/boxes.html#official-boxes).

Verify that the machine is up and running:

- Log into the virtual machine: `vagrant ssh`
- Check if Ansible is installed: `ansible --version`
- Exit the virtual machine (will stay running)): `exit`

# Running R Studio Server

# Accessing files on your computer

# Some technical notes

## Why Ubuntu

- Popular in the Linux community
- Tensorflow [GPU official Python builds](https://www.tensorflow.org/install/pip) are avaialble only for Windows and Ubuntu
- Tensorflow [build-from-code instructions](https://www.tensorflow.org/install/source) are available only for MacOS and Ubuntu

## A quick Vagrant tour

> > Explain some basic Vagrant commands

- `vagrant up`
- `vagrant suspend`
- `vagrant halt`
- `vagrant destroy`
- `vagrant box list`
- `vagrant box remove <box>`

> > Explain the default synced folder `/vagrant`

## What is in the `Vagrantfile`

> > Explain what is inside the Vagrantfile

# TODO

- Compare performance of R code in the Linux virtual machine vs. natively
- Try the conda Tensorflow version - see [this article](https://towardsdatascience.com/stop-installing-tensorflow-using-pip-for-performance-sake-5854f9d9eb0c) that claims the version installed by conda is faster
- Try compiling Tensorflow from code, to use optimizations tailored to the local environment?
- Try [Intel's Optimizations for Tensorflow](https://software.intel.com/en-us/blogs/latest-intel-optimizations-for-tensorflow-now-available)
