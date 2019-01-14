# bitbucket-docker
Container image for building any version of Bitbucket server.

[![Docker Repository on Quay](https://quay.io/repository/cloudflavor/bitbucket/status "Docker Repository on Quay")](https://quay.io/repository/cloudflavor/bitbucket)
Non-official container image for running any version of Bitbucket inside a container.  
This is intended to work on Kubernetes.  

#### Building

NOTE: Older versions might not work with the current setup.  

For older versions see a
[list of available Bitbucket versions](https://www.atlassian.com/software/bitbucket/download-archives).

```
docker build --build-arg BITBUCKET_VERSION=5.16.0 -t bitbucket:latest .  
```

#### Running
```bash
docker run -ti -p 7990:7990 -p 7999:7999 quay.io/cloudflavor/bitbucket:latest
```

Bitbucket will be available on `127.0.0.1:7990`.  
Bitbucket home is set to `/bitbucket-home` and the data is persisted in a docker
volume.  

#### License

You can purchase a license for 10$ for a year for up to 10 users from Atlassian.
Alternatively you can also obtain an
[evaluation license for 30 days](https://my.atlassian.com/license/evaluation).  