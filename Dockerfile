FROM nginx

COPY wrapper.sh /

COPY html /usr/share/nginx/html

CMD [chmod +x wrapper.sh]

CMD ["./wrapper.sh"]
