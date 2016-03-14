FROM busybox

EXPOSE 8080

ADD helloworld-server /bin/helloworld-server

ENTRYPOINT /bin/helloworld-server
