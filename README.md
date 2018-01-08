# Janus-Web-Dev

This project is intended to provide an easy-to-use environment for headless WordPress (API and Admin only) and React-based front-end development (based on Next.js).

It is very similar to the [Postlight WordPress + React Starter Kit](https://github.com/postlight/headless-wp-starter), and uses much of the same WordPress setup. The primary difference is that it's based on using two Vagrant instances instead of a local MySQL install + Docker. Secondarily, it uses ansible in order to configure the instances.

## Requirements

* Vagrant
* VirtualBox
* An SSH key in `~/.ssh/id_rsa.pub`
* Ansible

## Setup

Scripts for controlling the VMs are included in `/scripts`. All that's required to setup both instances is running the `start` and then `setup` scripts.

**Note**: The first-run of `start` may take some time depending on your internet connection, as it has to download a 130MB VM. `start` also requires your admin password, as it will add an `/etc/hosts` entries for the VMs.


```
$ ./scripts/start
$ ./scripts/setup
```

You can visit your WordPress instance at http://backend-wp.test/wp-admin (login: `janus`, password `2face`), and your Next.js site at http://frontend-next.test/

You can turn off the VMs at any time by using the stop script:

```
$ ./scripts/stop
```

## Notes

* The backend VM created for the WordPress site is not intended for deployment. It is not secured and and lacks other tools you may wish to use in production. For a better WordPress install, see [Bedrock](https://github.com/roots/bedrock).


## Links:

For more information about setting up WordPress using ansible, see https://lamosty.com/2015/04/06/ansible-and-wordpress-roles-and-playbooks/

## Acknowledgements
The inspiration for this (and much of the WP configuration) comes from Postlight's Headless WP Starter project: https://github.com/postlight/headless-wp-starter
The Ansible playbooks are taken from https://github.com/tucsonlabs/ansible-playbook-wordpress-nginx
Thanks!
