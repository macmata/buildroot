#!/bin/sh
# post-image.sh for SoCkit
# 2014, "Roman Diouskine" <roman.diouskine@savoirfairelinux.com>
# 2014, "Sebastien Bourdelin" <sebastien.bourdelin@savoirfairelinux.com>
# 2017. "Alexandre Leblanc" <alexandre.leblanc@savoirfairelinux.com>

set -e

# create a DTB file copy with the name expected by the u-boot config
cp -af $BINARIES_DIR/socfpga_cyclone5_sockit.dtb  $BINARIES_DIR/socfpga.dtb

BOARD_DIR=$(dirname $0)

mkpimage $BINARIES_DIR/u-boot-spl.bin -o $BINARIES_DIR/u-boot-spl.bin.crc

# Create SPL + bootloader image
fallocate -l 1M $BINARIES_DIR/uboot-part.img
dd if=$BINARIES_DIR/u-boot-spl.bin of=$BINARIES_DIR/uboot-part.img bs=64k seek=0
dd if=$BINARIES_DIR/u-boot-spl.bin.crc of=$BINARIES_DIR/uboot-part.img bs=64k seek=1
dd if=$BINARIES_DIR/u-boot.img of=$BINARIES_DIR/uboot-part.img bs=64k seek=4
