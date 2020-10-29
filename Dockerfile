FROM nginx

COPY wrapper.sh /

COPY html /usr/share/nginx/html

CMD [chmod 777 wrapper.sh]

CMD ["./wrapper.sh"]
