CURRENT	= $(shell uname -r)
TARGET	= aqc111
OBJS	= aqc111.o
MDIR	= drivers/net/usb

ifndef KDIR
	BUILD_DIR:=/lib/modules/$(shell uname -r)/build
else
	BUILD_DIR:=$(KDIR)
endif

SUBLEVEL= $(shell uname -r | cut -d '.' -f 3 | cut -d '.' -f 1 | cut -d '-' -f 1 | cut -d '_' -f 1)
USBNET	= $(shell find $(BUILD_DIR)/include/linux/usb/* -name usbnet.h)

ifneq (,$(filter $(SUBLEVEL),14 15 16 17 18 19 20 21))
MDIR = drivers/usb/net
endif

EXTRA_CFLAGS = -DEXPORT_SYMTAB
PWD = $(shell pwd)
DEST = /lib/modules/$(CURRENT)/kernel/$(MDIR)

obj-m      :=  $(TARGET).o  

default:
	make -C $(BUILD_DIR) SUBDIRS=$(PWD) modules

$(TARGET).o: $(OBJS)
	$(LD) $(LD_RFLAG) -r -o $@ $(OBJS)

install:
	cp -v $(TARGET).ko $(DEST) && /sbin/depmod -a

clean:
	$(MAKE) -C $(BUILD_DIR) SUBDIRS=$(PWD) clean

.PHONY: modules clean

-include $(BUILD_DIR)/Rules.make
