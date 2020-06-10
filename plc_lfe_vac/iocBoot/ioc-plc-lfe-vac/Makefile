IOC_TOP = /reg/g/pcds/epics/ioc/common/ads-ioc/R0.2.4
IOC_INSTANCE_PATH := $(shell pwd)

# Set PRODUCTION_IOC to 1 to move from a testing to a production IOC:
PRODUCTION_IOC := 1

PROJECT_NAME := plc_lfe_vac
PROJECT_PATH := ../../plc_lfe_vac/plc_lfe_vac.tsproj
PLC := plc_lfe_vac

PYTMC_OPTS := 
PREFIX := PREFIX

include $(IOC_TOP)/iocBoot/templates/Makefile.base
