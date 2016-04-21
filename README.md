atom Cookbook
=============
This cookbook will install [AtoM](https://www.accesstomemory.org/). It does NOT configure dependencies! You'll need to install the dependencies yourself.
See [the documentation](https://www.accesstomemory.org/en/docs/2.2/) for more details.

Requirements
------------

#### cookbook dependencies
- `nginx ~> 2.7.6`
- `java ~> 1.39.0`
- `elasticsearch ~> 0.3.13`

Attributes
----------
#### atom::default
* `node['atom']['git_repo']` - Git repository where the cookbook will download AtoM from, default `git://github.com/artefactual/atom.git`
* `node['atom']['git_revision']` - Branch of AtoM that will be checked out, default `stable/2.2.x`
* `node['atom']['google_analytics_api_key']` - Google analytics key, default `nil`

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

License and Authors
-------------------
* Patrick Fung (<patrick@makestuffdostuff.com>)
* MJ Suhonos (<mjsuhonos@ryerson.ca>)