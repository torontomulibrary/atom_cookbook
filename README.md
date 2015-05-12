atom Cookbook
=============
This cookbook will install [AtoM](https://www.accesstomemory.org/).

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### packages
- `toaster` - atom needs toaster to brown your bagel.

Attributes
----------
#### atom::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['atom']['mysql_version']</tt></td>
    <td>String</td>
    <td>Version of MySQL to install</td>
    <td><tt>5.5</tt></td>
  </tr>
  <tr>
    <td><tt>['atom']['mysql_password']</tt></td>
    <td>String</td>
    <td>MySQL root password</td>
    <td><tt>password</tt></td>
  </tr>
  <tr>
    <td><tt>['atom']['database_name']</tt></td>
    <td>String</td>
    <td>Database name that AtoM will use</td>
    <td><tt>atom</tt></td>
  </tr>
  <tr>
    <td><tt>['atom']['database_user']</tt></td>
    <td>String</td>
    <td>Database user that AtoM will use</td>
    <td><tt>atom</tt></td>
  </tr>
  <tr>
    <td><tt>['atom']['database_user']</tt></td>
    <td>String</td>
    <td>Database user password that AtoM will use</td>
    <td><tt>atom</tt></td>
  </tr>
  <tr>
    <td><tt>['atom']['database_user']</tt></td>
    <td>String</td>
    <td>Directory where AtoM will be installed on the system</td>
    <td><tt>/var/www/html/atom</tt></td>
  </tr>
</table>

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
