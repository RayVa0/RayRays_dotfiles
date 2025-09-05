#!/usr/bin/env bash


for dev in GPP2 GPP8 GP12 GP13 XHC0 BXBR; do echo $dev > /proc/acpi/wakeup; done
