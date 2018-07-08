# docker-reposync
Docker image to execute reposync and createrepo to create yum repository.

# Usage

## Download CentOS 7 and EPEL repository

```
# docker run --rm -d -it -v /path-to-your-repo-dir:/repo --name reposync tmatsuo/reposync
```

## Specify repositry and download

```
# docker run --rm -d -it -v /path-to-your-repo-dir:/repo --name reposync tmatsuo/reposync init
```

It create "conf" and "repo" direcotry into /path-to-your-repo-dir and copy default yum.conf and yum.repos.d.
You can customize /path-to-your-repo-dir/conf/yum.repos.d/XXXX.repo.

And let's download and create repository.

```
# docker run --rm -d -it -v /path-to-your-repo-dir:/repo --name reposync tmatsuo/reposync
```

# ENV

* PROXY
  * It specify http proxy server. 
  * If /path-to-your-repo-dir/conf dir exists, this env is ignored so you have to edit yum.conf manually.
