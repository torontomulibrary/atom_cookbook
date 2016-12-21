# atom Cookbook
This cookbook will install [AtoM](https://www.accesstomemory.org/). It does NOT configure dependencies! You'll need to install the dependencies yourself.
See [the documentation](https://www.accesstomemory.org/en/docs/2.3/) for more details.

This cookbook was tested on CentOS 7.x, but should work on any platform with a LEMP environment installed.

## Requirements
### Platforms
- CentOS 7.x

### Chef
- Chef 12.1+

### Cookbooks
- chef_nginx
- java
- elasticsearch (~> 0.3.14)

## Attributes
* `node['atom']['git_repo']` - Git repository where the cookbook will download AtoM from, default `git://github.com/artefactual/atom.git`
* `node['atom']['git_revision']` - Branch of AtoM that will be checked out, default `stable/2.3.x`
* `node['atom']['google_analytics_api_key']` - Google analytics key, default `nil`

## Resource/Provider
None.

## Recipes
### default
Include the default recipe in a run list. 

## Usage
Just include `atom` recipe in your run list.

#### Role example:
```json
{
  "name": "atom",
  "description": "Installs AtoM",
  "chef_type": "role",
  "json_class": "Chef::Role",
  "run_list": [
    "recipe[atom]"
  ]
}
```

## License and Authors
* Patrick Fung (<patrick@makestuffdostuff.com>)
* MJ Suhonos (<mjsuhonos@ryerson.ca>)