#
# $Header$
#
# $Date$
# $Revision$
# $Author$
#
# Copyright (C) 2009 Alex Buell <alex.buell@munted.org.uk>
# All Rights Reserved.
#

MODULE_NAME = exfat

obj-m := $(MODULE_NAME).o
$(MODULE_NAME)-objs := bitmap.o cache.o cluster.o dir.o fatent.o inode.o super.o upcase.o utils.o

EXTRA_FLAGS += -I$(PWD)

KDIR	:= /lib/modules/$(shell uname -r)/build
PWD	:= $(shell pwd)

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

help:
	$(MAKE) -C $(KDIR) M=$(PWD) help

install:
	$(MAKE) -C $(KDIR) M=$(PWD) modules_install

