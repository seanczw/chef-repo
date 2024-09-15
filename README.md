# Overview

This Chef repo contains a webserver cookbook that will install and run an Apache webserver on a Debian/RHEL OS.

## Steps taken to build (on Apple Silicon Mac)

Using the Homebrew package manager on your local machine
- `brew install --cask chef-workstation` - Installs Chef Workstation. No Chef Infra/Hosted server or Chef Client node is required for these tests.
- `brew install docker` - Installs Docker.

In your selected file location
- `chef generate repo chef-repo` - Creates a boilerplate Chef repository called 'chef-repo'.
- `chef generate cookbook chef-repo/webserver` - Creates a boilerplate Cookbook called 'webserver' in 'chef-repo'.

In cookbooks/webserver/
- `kitchen init` - Sreates an initial Test Kitchen environment
- `chef gem install kitchen-dokken` - Installs the kitchen-dokken Test Kitchen driver.
kitchen-dokken is a Test Kitchen plugin for Docker that uses specially created Linux distribution Docker images and Chef Infra Docker images. More information available at https://kitchen.ci/docs/drivers/dokken/

## Write configurations and tests

- cookbooks/webserver/recipes/default.rb
  
This file is the main recipe for the webserver cookbook. It contains the Chef code (resources and actions) that define how to configure the server, such as installing packages, creating files, and managing services.

- cookbooks/webserver/kitchen.yml
  
The .kitchen.yml file is the configuration file for KitchenCI, the testing tool used to test Chef cookbooks. This file defines the environment in which your cookbook will be tested, including the platform, the provisioner, the driver, and the suites to run.

- cookbooks/webserver/test/inetgration/default/default_test.rb
  
This file contains InSpec tests that verify the configuration applied by the webserver cookbook. InSpec is a testing framework that allows you to write tests to ensure your infrastructure is configured correctly.

## To test

Run `kitchen list` to verify that there is an instance each of Ubuntu 20.04 and CentOS Stream 9.

Run `kitchen test` to test the apache2/httpd service and webpage contents.
