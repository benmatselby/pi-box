# Pi Box

A repo to provision some Raspberry Pi's using Ansible.

## Dependencies

On your host machine (Where you want to run the ansible scripts), you will need the following:

- [Ansible](https://github.com/ansible/ansible)
- [Shellcheck](https://www.shellcheck.net) - Note, this is installed in GitHub Actions by default.

## Installation

You need to define a `hosts` file that defines your servers. It looks like the following ([Docs](https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html).)

```text
[webservers]
foo.example.com
bar.example.com
```

Run `make` to see what options are available to you. To install the common tooling on the raspberry pis, you can run:

```shell
make provision
```

To install the githooks to manage this repo, you can:

```shell
make install
```
