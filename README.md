# docker-reposync
Docker image execute a reposync and createrepo for every .repo file dropped in the config directory, to create a local yum repository.


# Usage

## Init your config directory and default Centos and Epel Repo files

The first run will create "init your yum config files by copying over the base repo files from the current CEntos 8.0 image"

This will create "conf" and "repo" directory into /path-to-your-config-dir and copy default yum.conf and yum.repos.d.
You can now add more .repo files in /path-to-your-config-dir/conf/yum.repos.d/XXXX.repo or modify the default centos and epel ones.



## Download CentOS 8 and EPEL repository

```
# docker run --rm -d -it -v /path-to-your-config-dir:/repo -v /path-to-your-repo-dir:/repo/repo--name docker-reposync piwi3910/docker-reposync
```

# ENV

* PROXY
  * It specify http proxy server.
  * If /path-to-your-repo-dir/conf dir exists, this env is ignored so you have to edit yum.conf manually.
