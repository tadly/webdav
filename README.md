# webdav
A alpine linux based webdav server.  
  
It uses [hacdias/webdav](https://github.com/hacdias/webdav) as server which
itself is written in go and is quite slim.  

## Usage
```sh
docker create \
  --name=webdav \
  -v *host path config*:/config \
  -v *host path to data*:/data \
  -p 8801:8801 \
  tadly/webdav
```
