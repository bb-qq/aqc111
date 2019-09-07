#
#
#

TARGETS := aqc111.ko usbnet.ko mii.ko

obj-m	 := aqc111.o usbnet.o mii.o

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
