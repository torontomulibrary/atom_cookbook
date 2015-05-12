atom Cookbook
=============
This cookbook will install [AtoM](https://www.accesstomemory.org/).

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

#### cookbook dependencies
- `mysql ~> 6.0`
- `database ~> 4.0.6`
- `mysql2_chef_gem ~> 1.0.1`
- `java ~> 1.31.0`
- `elasticsearch ~> 0.3.13`
- `apache2 ~> 3.0.1`
- `php ~> 1.5.0`
- `nodejs ~> 2.4.0`

Attributes
----------
#### atom::default
* `node['atom']['mysql_version']` - Version of MySQL to install, default `5.5`
* `node['atom']['mysql_password']` - MySQL root password, default `password`
* `node['atom']['database_name']` - Database name that AtoM will use, default `atom`
* `node['atom']['database_user']` - Database user that AtoM will use, default `atom`
* `node['atom']['database_user_password']` - Database user password that AtoM will use, default `atom`
* `node['atom']['install_dir']` - Directory where AtoM will be installed on the system, default `/var/www/html/atom`

Usage
-----
#### atom::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `atom` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[atom]"
  ]
}
```

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
Authors: TODO: List authors
