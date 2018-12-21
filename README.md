# HTTP/2 for `localhost`

 Support http/2 with nginx image on local development.
 
 <img src="https://s1.ax1x.com/2018/12/21/FsW0zQ.png" width="90%" heigth="90%">

## How-to

1. Clone this repository and `cd` into it

```sh
git clone https://github.com/superiorlu/local-http2.git
cd local-http2
```
2. Run the script to create certificate:

```sh
sh cert.sh
```
that need root permission.

3. Trust certificates
- **macOS**:
```sh
sudo security add-trusted-cert -d -r trustAsRoot -k /Library/Keychains/System.keychain certs/server.crt
```
- **Ubuntu**:
```sh
sudo cp certs/server.crt /usr/local/share/ca-certificates/server.crt
sudo update-ca-certificates
```

4. Build Image
```sh
docker build -t mynginx .
```

5. Run nginx server
```sh
docker run --rm --name mynginx -p 80:80 -p 443:443 -v $(pwd)/html:/usr/share/nginx/html -d mynginx
```

## Resouce

- [local-cert-generator](https://github.com/dakshshah96/local-cert-generator)
- [how to create csr using Openssl without prompt](https://www.shellhacks.com/create-csr-openssl-without-prompt-non-interactive/)

## License

MIT License. See [LICENSE](https://github.com/superiorlu/local-http2/blob/master/LICENSE.md) for details.