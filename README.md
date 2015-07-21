atom Cookbook
=============
This cookbook will install [AtoM](https://www.accesstomemory.org/).

Requirements
------------
This cookbook has only been tested on Centos 6.6 and Centos 7.1

#### cookbook dependencies
- `mysql ~> 6.0.31`
- `database ~> 4.0.6`
- `mysql2_chef_gem ~> 1.0.1`
- `java ~> 1.31.0`
- `elasticsearch ~> 0.3.13`
- `apache2 ~> 3.0.1`
- `php ~> 1.5.0`

Attributes
----------
#### atom::default
* `node['atom']['mysql_version']` - Version of MySQL to install, default `5.5`
* `node['atom']['mysql_password']` - MySQL root password, default `password`
* `node['atom']['database_name']` - Database name that AtoM will use, default `atom`
* `node['atom']['database_user']` - Database user that AtoM will use, default `atom`
* `node['atom']['database_user_password']` - Database user password that AtoM will use, default `atom`
* `node['atom']['install_dir']` - Directory where AtoM will be installed on the system, default `/var/www/html/atom`
* `node['atom']['git_repo']` - Git repository where the cookbook will download AtoM from, default `git://github.com/artefactual/atom.git`
* `node['atom']['git_revision']` - Branch of AtoM that will be checked out, default `stable/2.2.x`

Usage
-----
#### atom::default

Just include `atom` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[atom]"
  ]
}
```

If you did not change the configuration, this is how you should fill in the fields on the web installer
* Database name: atom
* Database username: atom
* Database password: atom
* Database host: localhost
* Database port: 3306
* Search host: localhost
* Search port: 9200
* Search index: atom

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Patrick Fung (<patrick@makestuffdostuff.com>)
