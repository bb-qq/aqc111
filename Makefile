#
#
#

TARGETS := aqc111.ko usbnet.ko mii.ko

obj-m	 := aqc111.o usbnet.o mii.o

VERSION := $(shell grep Linux/ /usr/local/i686-pc-linux-gnu/i686-pc-linux-gnu/sys-root/usr/include/linux/syno_autoconf.h | cut -d " " -f 4 | cut -d "." -f 1-3)

%.c: 
	cp $(dir $(@))/linux-$(VERSION)/$(notdir $(@)) $(@)

.PHONY: modules
$(TARGETS):
	$(MAKE) -C $(KSRC) M=$(PWD) modules

.PHONY: clean
clean:
	rm -rf *.o $(TARGET)

.PHONY: install
install: $(TARGETS)
	mkdir -p $(DESTDIR)/aqc111/
	install $(TARGETS) $(DESTDIR)/aqc111/

