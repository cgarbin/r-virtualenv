An Ubuntu-based virtual environment for Keras/Tensorflow with R Studio Server

This environments uses:

- [Vagrant](https://www.vagrantup.com/) to create a Linux virtual machines
- [VirtualBox](https://www.virtualbox.org/) as the host for the virtual machine
- [Ansible](https://www.ansible.com/) to configure the virtual machine
- [R Studio Server](https://www.rstudio.com/products/rstudio/#Server) to access the R environment from your computer (through a web server)

Note: tested on a MacBook. Not tested on Windows or other environments.

# TL;DR

The quick version to get started. Details in later sessions.

- Install Vagrant: [instructions](https://www.vagrantup.com/docs/installation/)
- Install VirtualBox: [instructions](https://www.virtualbox.org/wiki/Downloads)
- Clone this repository: `git clone https://https://github.com/cgarbin/r-virtualenv`
- Switch to the cloned repository: `cd r-virtualenv`
- Start the virtual machine (first time will take a few minutes): `vagrant up`
- Open R Studio on a browser: `http://192.168.55.101:8787/`
- Log in with user `vagrant` and password `vagrant`
- Install keras in the R Studio console (bottom left): `install.packages("keras")`
- Load the keras libray in the console: `library(keras)`
- Install Tensorflow in the console: `install_keras()`
- If your computer has GPU(s) used this instead: `install_keras(tensorflow = "gpu")`

Your files are avaiable through the `/vagrant` directory in the virtual machine. It maps to the directory where you cloned this repository on your computer.

# The longer version

## Installing Vagrant and VirtualBox

Vagrant and VirtualBox together allow us to create the virtual Linux machine we use as base for the environment.

- Vagrant defines a template (in the [Vagrantfile](https://www.vagrantup.com/docs/vagrantfile/)) that we can use to install a specific version of Linux in a virtual machine
- VirtualBox hosts that Linux machine

Install Vagrant following the instructions [here](https://www.vagrantup.com/docs/installation/) and install VirtualBox following the instructions [here](https://www.virtualbox.org/wiki/Downloads).

## Getting the virtual machine started

- Clone this repository: `git clone https://https://github.com/cgarbin/r-virtualenv`
- `cd r-virtualenv` to the repository's directory
- Start the virtual machine with Vagrant: `vagrant up`

This will start a virtual machine defined in `Vagrantfile`. The first time you run this command it will take a while. It has to download the image for that machine and configure it. It will start up much faster after the initial download. Vagrant caches the image locally.

The virtual machine we are creating is based on the [Ubuntu Bento box](https://app.vagrantup.com/bento/). It's one of the [officially supported Vagrant images](https://www.vagrantup.com/docs/boxes.html#official-boxes).

Verify that the machine is up and running:

- Log into the virtual machine: `vagrant ssh`
- Check if Ansible is installed: `ansible --version`
- Exit the virtual machine (will stay running)): `exit`

## Running R Studio Server

R Studio Server has a web-based development environment.

Open a browser to `http://192.168.55.101:8787/`. This address is defined in the Vagrant file. Port 8787 is the standard R Studio port number.)

R Studio will display a login screen. Enter user name `vagrant` and password `vagrant`.

# Installing Keras and Tensorflow

We will install Keras and Tensorflow using the R Studio console (the window at the bottom left on the browser).

At the prompt on the console window (the line starting with `>`), run these commands:

- `install.packages("keras")`
- `library(keras)`
- If your computer doesn't have GPU(s): `install_keras()`
- If your computer has GPU(s): `install_keras(tensorflow = "gpu")`

## Accessing files on your computer

Files on your computer are available in the directory `/vagrant` on the virtual machine.

This directory maps to the directory where you cloned this repository to.

## Some technical notes

### Why Ubuntu

- Popular in the Linux community
- Tensorflow [GPU official Python builds](https://www.tensorflow.org/install/pip) are avaialble only for Windows and Ubuntu
- Tensorflow [build-from-code instructions](https://www.tensorflow.org/install/source) are available only for MacOS and Ubuntu

### A quick Vagrant tour

- `vagrant up` starts the machine
- `vagrant suspend` freezes the machine in the current state; use `vagrant restore` to restart it
- `vagrant halt` stops the machine and shuts it down; use `vagrant up` to start it again
- `vagrant destroy` erases the machine and all of its contents
- `vagrant box list` lists boxes (machine "templates") cached locally
- `vagrant box remove <box>` removes the box from the local cache

# TODO

- Compare performance of R code in the Linux virtual machine vs. natively
