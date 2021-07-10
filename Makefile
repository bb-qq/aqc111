#
#
#

TARGETS := aqc111.ko usbnet.ko mii.ko

obj-m	 := aqc111.o usbnet.o mii.o
ccflags-y += -Wno-unused-const-variable

VERSION := $(shell grep Linux/ /usr/local/sysroot/usr/include/linux/syno_autoconf.h | cut -d " " -f 4 | cut -d "." -f 1-2)

%.c: 
	cp $(dir $(@))/linux-$(VERSION)/$(notdir $(@)) $(@)

.PHONY: modules
$(TARGETS):
	$(MAKE) -C $(KSRC) M=$(PWD) modules

spk_su: spk_su.c
	$(CC) -std=c99 -o $(@) $(<)

.PHONY: clean
clean:
	rm -rf *.o $(TARGET) spk_su

.PHONY: install
install: $(TARGETS) spk_su
	mkdir -p $(DESTDIR)/aqc111/
	install $(^) $(DESTDIR)/aqc111/

