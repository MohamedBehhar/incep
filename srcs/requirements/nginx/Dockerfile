FROM debian:buster

RUN su && apt update -y && apt upgrade -y &&  apt install nginx -y

EXPOSE 443

# installing openssl 
RUN apt install openssl -y && openssl req -x509 -nodes -days 365 -subj "/C=MA/ST=Beni Mellal-Khenifra/L=Khouribga/O=1337 - 42 Network/CN=mbehhar.42.fr" -addext "subjectAltName=DNS:mbehhar.42.fr" -newkey rsa:2048 -keyout /etc/ssl/private/selfsigned-nginx.key -out /etc/ssl/certs/selfsigned-nginx.crt && openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

# copying ssl the files 
COPY self-signed.conf /etc/nginx/snippets
COPY ssl-params.conf /etc/nginx/snippets

# removing default file and replacing it 
RUN rm /etc/nginx/sites-available/default
RUN rm /etc/nginx/sites-enabled/default
COPY default /etc/nginx/sites-available

# installing and setting up ufw
RUN apt install ufw -y && ufw allow 'Nginx Full'

# checking if nginx works properly 
RUN nginx -t

# creating the symbolic link between sites-available and sites-enabled
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/


CMD ["nginx", "-g", "daemon off;"]
