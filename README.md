# Quick-Nix
Simple shell script which allows a user to easily and conveniently install packages on NixOS.


## Pre-configuration.

To use the script, we will first need to replace line 102 with `environment.systemPackages = import /etc/nixos/packages.nix pkgs;` in `configuration.nix`. This will allow packages to be installed directly to a seperate file which is then referenced by your primary configuration file. This has been done to prevent any unforseen harm from being happening to your main configuration file by the script provided. Though, a simple alternation may be made to instead reference `configuration.nix` pointing to the corresponding line where packages are added.

To get started:

```
sudo nano /etc/nixos/configuration.nix
```

Replace the 102nd line with ` environment.systemPackages = import /etc/nixos/packages.nix pkgs` and save.


```
sudo touch /etc/nixos/packages.nix
sudo nano /etc/nixos/packages.nix
```

Once done then add the following to `packages.nix`.

```
pkgs: with pkgs; [
  #the name of your package of choice.
]
```

## Configuration.

The script in its current iteration is as follows. Whether you may use a different or wish to live on the wild side and apply the script to your main `configuration.nix`, now would be the opportunity for you to make a couple of changes to better suit your needs. By default, the script is set to work for bash, though if you happen to use zsh, fish or another then you may want to follow along. use `which` and the name of the shell you are using to get the $PATH where it resides. Use your preferred editor to edit the command and change the top entry from `#! /run/current-system/sw/bin/bash` to the path you retrieved. To change the script to reference your `configuration.nix` replace "*`packages.nix`*" with "*`configuration.nix`*" and "*`2i`*" with "*`105i`*" on line two of the script.

Once dpne, download the script and place it somewhere it is unlikely to be deleted. Run `chmod u+x install.sh` then add an alias with `alias alias="$SHELL $HOME/place/where/you/put/it"` and finally add the $PATH `export PATH=$HOME/place/where/you/put/it` to your .bashrc or similiar file.

## Usage.

Assuming you've got everything working up until this point, simply run `install` with your desired package to append it to your `configuration.nix` or `packages.nix` and start `sudo nixos-rebuild switch` to update to the next generation including the installed package.

###### Drawbacks.

The script while functioning as intended is still incredibly barebones lacking a few of the creature comforts I feel would've finished it off.

* The script requires manual intervention to get going.
* The script *could* support multiple package names when added as most package managers do but the `sed` command will need to be adjusted to create a new line for each subsequent entry which was beyond what I could've done.
* Would've been nice if the script could've automatically added its path to a configuration file commonly shared between Linux Distributions so that it'll always work regardless to which directory you are currently in.

## Conclusion.

NixOS while facinating seemed like a hassle to get packages installed in a somewhat conventional manner. I'm hoping the following script will help alleviate that by making addition of new packages more convenient. Credit goes to [Newt](<https://stereophonic.space/users/newt>) who gave me the [idea](https://stereophonic.space/notice/ARRcB2PWAJ1Ut0AQaG) and [helped](https://stereophonic.space/notice/ARVg1QtC5iN8b8WrJo) me create it.

Don't let your memes be dreams.
