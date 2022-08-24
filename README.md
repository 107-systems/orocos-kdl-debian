<a href="https://107-systems.org/"><img align="right" src="https://raw.githubusercontent.com/107-systems/.github/main/logo/107-systems.png" width="15%"></a>
:floppy_disk: `orocos-kdl-debian`
=================================
[![Build Status](https://github.com/107-systems/orocos-kdl-debian/actions/workflows/debpkg.yml/badge.svg)](https://github.com/107-systems/orocos-kdl-debian/actions/workflows/debpkg.yml)

Use GitHub Actions to build Debian package of the [orocos_kinematics_dynamics](https://github.com/orocos/orocos_kinematics_dynamics) library for both `aarch64-linux-gnu` and `arm-linux-gnueabihf`. Running the [debpkg action](.github/workflows/debpkg.yml) creates a set of `*.deb` packages as artifacts which can be downloaded and used for installing orocos-kdl on the target system.

<p align="center">
  <a href="https://github.com/107-systems/l3xz"><img src="https://raw.githubusercontent.com/107-systems/.github/main/logo/l3xz-logo-memento-mori-github.png" width="40%"></a>
</p>

#### How-To-Install
On the device, run the following command:
```bash
# Install orocos-kdl. This is expected to fail, if there are missing dependencies.
sudo dpkg --install liborocos-kdl-dev-v1.5.1-2022-06-19-armhf.deb
# Install the missing dependencies and complete the orocos-kdl configuration.
sudo apt-get install --fix-broken --yes
```

#### How-To-Uninstall
On the device, run the following command:
```bash
sudo dpkg --purge liborocos-kdl-dev
```
