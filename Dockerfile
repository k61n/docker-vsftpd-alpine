FROM alpine:latest

ARG USERNAME
ARG PASSWORD

RUN apk add --no-cache vsftpd && \
	adduser -g "" -D ${USERNAME} && \
	echo "${USERNAME}:${PASSWORD}" | chpasswd && \
	mkdir /home/user/share && \
	touch /home/user/share/example.txt

COPY files/ /

CMD vsftpd /etc/vsftpd/vsftpd.conf
#CMD tail -f /dev/null

EXPOSE 21 30000-30010
