FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install nginx openssl curl -y 

RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/ssl/private/hfilali.key -out /etc/ssl/certs/hfilali.crt -days 365 -nodes \
-subj \
"/C=MA/L=Benguerir/O=1337 School/CN=hfilali.42.fr/emailAddress=hfilali@student.1337.ma"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
