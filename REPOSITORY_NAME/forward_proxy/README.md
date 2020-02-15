
```
docker run -d --net=host              -h forward_proxy --name forward_proxy -it --rm -e TZ=Asia/Tokyo skono/forward_proxy

docker run -d --net=bridge -p 8080:88 -h forward_proxy --name forward_proxy -it --rm -e TZ=Asia/Tokyo skono/forward_proxy
```

```
docker logs -f forward_proxy
```

