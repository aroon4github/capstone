FROM nginx

COPY wrapper.sh /

COPY html /usr/share/nginx/html

CMD [sudo chmod 777 wrapper.sh]

CMD ["./wrapper.sh"]
