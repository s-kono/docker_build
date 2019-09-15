```sh
$ ./_build.sh

  or

$ sudo docker pull skono/headless-chrome
```

```sh
$ ./_run.sh

  or

$ sudo docker run -it --rm skono/headless-chrome
```

```sh
root@headless-chrome:/# /login-access -n 'AccountName' -p 'Passw0rd' \
 -a "$( uname -a )" -x proxy.example.com:8080 \
 -l https://sample.example.jp/login -u https://sample.example.jp/view
```
