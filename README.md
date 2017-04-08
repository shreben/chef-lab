# Chef Module 7

Deployment check after 'vagrant destroy && vagrant up'
```sh
[student@epbyminw2467 chef]$ curl -iL http://192.168.168.168:8080/testweb
HTTP/1.1 302 Moved Temporarily
Server: Apache-Coyote/1.1
Location: http://192.168.168.168:8080/testweb/
Transfer-Encoding: chunked
Date: Sat, 08 Apr 2017 19:31:10 GMT

HTTP/1.1 200 OK
Server: Apache-Coyote/1.1
X-Powered-By: JSP/2.2
Set-Cookie: JSESSIONID=cDETU2eRiE3zRvu2BlqYVhAD.undefined; Path=/testweb
Content-Type: text/html;charset=ISO-8859-1
Content-Length: 85
Date: Sat, 08 Apr 2017 19:31:10 GMT

<html>
<body>
<h2>Welcome to Test Web Application !!!!!!!!!!!  </h2>
</body>
</html>
```
