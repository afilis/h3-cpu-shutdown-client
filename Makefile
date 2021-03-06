PROGRAM=h3-shutdown-client
SERVICE=h3-shutdown.service

all : arisc.c main.c
	gcc -Wall -o $(PROGRAM) arisc.c main.c

clean :
	rm -rf $(PROGRAM)

install :
	install -m 755 $(PROGRAM) /boot/$(PROGRAM)
	install -m 644 $(SERVICE) /lib/systemd/system/$(SERVICE)
	systemctl enable $(SERVICE)
	systemctl start $(SERVICE)
