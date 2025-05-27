server {
    listen 80;
    server_name {{ domain }};
    return 301 https://{{ domain }}$request_uri;
}

server {
	listen 443 ssl;
	server_name {{ domain }};

	ssl_certificate           /etc/nginx/ssl/cert.crt;
	ssl_certificate_key       /etc/nginx/ssl/cert.key;

	ssl_protocols  TLSv1.2 TLSv1.3;

	access_log            /var/log/nginx/jenkins.access.log;
	error_log            /var/log/nginx/jenkins.error.log;

	location / {
        proxy_set_header        Host $host;
        proxy_set_header        X-Real-IP $remote_addr;
        proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header        X-Forwarded-Proto $scheme;
        rewrite                 ^/$ /$1 break;
        proxy_pass              http://127.0.0.1:8080;
        proxy_read_timeout      90;
    }
}