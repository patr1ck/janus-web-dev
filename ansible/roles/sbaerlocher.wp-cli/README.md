# Ansible Role: WP-CLI
[![Build Status](https://travis-ci.org/sbaerlocher/ansible.wp-cli.svg?branch=master)](https://travis-ci.org/sbaerlocher/ansible.wp-cli)

## Description

Ansible role for installing WP-CLI, a command line interface for WordPress.

## Installation

```
$ ansible-galaxy install sbaerlocher.wp-cli
```

## Requirements

None

## Role Variables

| Variable             | Default     | Comments (type)                                   |
| :---                 | :---        | :---                                              |
| ```wp_cli_phar_url``` | ```https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar``` | Location of the WP-CLI phar to download |
| ```wp_cli_bin_path``` | ```/usr/bin/{{ wp_cli_bin_command }}``` | Location to store WP-CLI on remote machine |
| ```wp_cli_bin_command``` | wp | WP-CLI Coomand on remote machine | 
| ```wp_cli_package```  |  | List of WP-CLI Packege for Installing |

## Dependencies

None

## Example Playbook

```yml
- hosts: all
  roles:
     - sbaerlocher.wp-cli
```

## Changelog

### 1.2

* add WP-CLI packege installer

### 1.1

* add travis
* fix travis problems

### 1.0

* Initial release


## Author

* [Simon Bärlocher](https://sbaerlocher.ch)
 
## License

This project is under the MIT License. See the [LICENSE](https://sbaerlo.ch/licence) file for the full license text.

## Copyright

(c) 2016, Simon Bärlocher