CONTIKI_PROJECT = sender coordinator
all: $(CONTIKI_PROJECT)

PLATFORMS_EXCLUDE = sky nrf52dk native simplelink

CONTIKI=../../..

TARGET = iotlab
BOARD = m3
ARCH_PATH=../../../../arch

include $(CONTIKI)/Makefile.dir-variables
MODULES += $(CONTIKI_NG_SERVICES_DIR)/shell

include $(CONTIKI)/Makefile.include
