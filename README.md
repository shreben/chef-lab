# Module9

### Nginx provision
chef-dev environment:
```sh
{
  "name": "chef-dev",
  "description": "Module 8 dev environment.",
  "cookbook_versions": {

  },
  "json_class": "Chef::Environment",
  "chef_type": "environment",
  "default_attributes": {
    "application_repo": "http://www.cumulogic.com/download/Apps/hudson.zip",
    "web_server_type": "nginx",
    "java": {
      "jdk_version": "7"
    }
  },
  "override_attributes": {

  }
}
```
knife bootstrap nginx -N nginx -r 'role[nginx_web_server]' -E chef-dev | tee nginx_bootstrap
```sh
[student@epbyminw2467 module9]$ curl nginx
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h1>Chef Lab Module 9</h1>
<h2>Powered by Nginx</h2>
</body>
</html>
```

### Apache provision
vagrant destroy nginx & vagrant up nginx
```sh
[student@epbyminw2467 module9]$ vagrant destroy nginx
    nginx: Are you sure you want to destroy the 'nginx' VM? [y/N] y
==> nginx: Forcing shutdown of VM...
==> nginx: Destroying VM and associated drives...
[student@epbyminw2467 module9]$ vagrant up nginx
Bringing machine 'nginx' up with 'virtualbox' provider...
==> nginx: Cloning VM...
==> nginx: Matching MAC address for NAT networking...
==> nginx: Setting the name of the VM: nginx
==> nginx: Fixed port collision for 22 => 2222. Now on port 2202.
==> nginx: Clearing any previously set network interfaces...
==> nginx: Preparing network interfaces based on configuration...
    nginx: Adapter 1: nat
    nginx: Adapter 2: hostonly
==> nginx: Forwarding ports...
    nginx: 22 (guest) => 2202 (host) (adapter 1)
==> nginx: Running 'pre-boot' VM customizations...
...
```
changed web_server_type variable:
```sh
{
  "name": "chef-dev",
  "description": "Module 8 dev environment.",
  "cookbook_versions": {

  },
  "json_class": "Chef::Environment",
  "chef_type": "environment",
  "default_attributes": {
    "application_repo": "http://www.cumulogic.com/download/Apps/hudson.zip",
    "web_server_type": "apache",
    "java": {
      "jdk_version": "7"
    }
  },
  "override_attributes": {

  }
}
```
knife bootstrap nginx -N nginx -r 'role[apache_web_server]' -E chef-dev | tee apache_bootstrap
```sh
[student@epbyminw2467 module9]$ curl nginx
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h1>Chef Lab Module 9</h1>
<h2>Powered by Apache</h2>
</body>
</html>
```

