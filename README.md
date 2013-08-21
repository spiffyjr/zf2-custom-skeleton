# ZF2 Custom Skeleton

## Introduction
This is a split (not technically a fork) of the [ZendSkeletonApplication](https://github.com/zendframework/zendskeletonapplication)
which some custom modules and setup done out of the box to make things a bit easier to get going.

## What's changed?
* Removed translations.
* Added [AssetManager](https://github.com/RWOverdijk/AssetManager) for handling of assets.
* Added [ZfcTwig](https://github.com/zf-commons/zfctwig) and moved most `phtml` templates to `twig` templates.
* Added [SpiffyConfig](https://github.com/spiffyjr/spiffy-config) for annotated routes, template map loading, etc.
* Added [SpiffyNavigation](https://github.com/spiffyjr/spiffy-navigation).
* Added [ZendDeveloperTools](https://github.com/zendframework/zenddevelopertools).

## Installation

The recommended way to get a working copy of this project is to clone the repository
and use `composer` to install dependencies using the `create-project` command:

    curl -s https://getcomposer.org/installer | php --
    php composer.phar create-project -sdev --repository-url="http://packages.zendframework.com" zendframework/skeleton-application path/to/install

## Vagrant

This repository includes a Vagrantfile that you can use for development.

# Virtual Host

Afterwards, set up a virtual host to point to the public/ directory of the project and you should be ready to go!
