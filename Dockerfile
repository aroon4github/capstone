FROM nginx

COPY wrapper.sh /

COPY html /usr/share/nginx/html

RUN sudo chmod a+x wrapper.sh

CMD ["./wrapper.sh"]
