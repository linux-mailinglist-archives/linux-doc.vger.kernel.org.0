Return-Path: <linux-doc+bounces-61027-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27534B82186
	for <lists+linux-doc@lfdr.de>; Thu, 18 Sep 2025 00:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F430188E2C0
	for <lists+linux-doc@lfdr.de>; Wed, 17 Sep 2025 22:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146F230CDA6;
	Wed, 17 Sep 2025 22:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b35XFQNy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB72B2E7650
	for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 22:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758146684; cv=none; b=uJtDArpPLBOSsiCX8V8diLpccu7r1KV0//VCQrLmH/iE3QHu0D3XQoMZLxVeKEMyw1kP41dk4I8NR7hz/zszBhBH9oYUnmw3+bRwILDecIJ3OEPVYUJt8DDHSdbzwaVPhxwcKgFTyd0GrMBiAhL4z+f7thpsPh82ZfWzbsClPEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758146684; c=relaxed/simple;
	bh=gDUPk/m4rq1u3EYCb3lp0LjeYM8xElxylPHjyHrmMJo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HOrvEc/IvOcyWYUyZh0GzSu4A7bLyYr6jVpGH+U1emGQmGrgfYvqcyzx46oIU/oTiQMhoD0/w1pPW6fXP7t+Hj7ZNkYgQm/X+VCalG/ecgVZu60s4GBSDzHMOlDBeWi8zYKvVYqt2C1pMzQRZqHn8CRiFQbLJxY6fYkcNZaACeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b35XFQNy; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-26685d63201so2967205ad.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Sep 2025 15:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146680; x=1758751480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rKTYL9qZHCY6SX54g1CxCOHWNQkO0Dz6dIIx5JhUyuo=;
        b=b35XFQNykfWQXCWjO5ftL4U5VJbu6bRpLiZ4Erw6q6njo8pyZLjuiBMTuNB2Up9r07
         LDCFJSv0fx2tbb3XQOgID/WRrbcWauPMQl9alhJzvMK138k8ieuihDt/qpCtmbhKCNs4
         GwOH/KNghHF0gPZ1hSW813W0+agO5h3a234Ieu/rYhsLZKth36/5Tog9gn91Lppjzywf
         rq4C2nzFFxR6NFd44BjSRoKj/5MyaNGMmkQgXr0+MLrckAPtHW/tsX3us48LIdaKb+ys
         KVuifK4tw0B2ndVVZJDEn9O8acByqWhiw+p0Y2TsNSpe/raj0z6k1orRQVz3atyusP2u
         wyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146680; x=1758751480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKTYL9qZHCY6SX54g1CxCOHWNQkO0Dz6dIIx5JhUyuo=;
        b=jdZZ9nFcybwM/2uytZokh0SccPNqctoiG3yqAMASCvrWr6GQayVtzd+gFiNwPr65Or
         y7Wnos4pFDpY86Na21GJsw0cyS9tvwTW8Ejc6V29W+9V8+tusml79u5qfjmu4aMoD4Sm
         5OU/fCbvVJmaoJYjblGHK25uLX5x77BKmjL1VdbEfakdeuZJPg0ccZ+DhuOAeMtKib0a
         YMlP6U/p1ufY1fpZirWuNTfwfO6bp3JtSJ/EYeMfqGV/3xpeRQ89mBC81cTvht+t/Eq5
         H6W+Mie2zrfzKswStbpokP/fgPGaQjIxPQ1XnsUNEhgtPUsM+HvA6biargqbBKJlverH
         Xikg==
X-Gm-Message-State: AOJu0Yw5uuxiERsSeLGe9cCrQPDY2EK4KJIoIPuV7bITcxhOjV1sk0PI
	1pC3rYTJ6B/MO5CI3UoJL6rL++DaM/GnOtEmDqYx7V00RlCJh9nuPPs=
X-Gm-Gg: ASbGnctLS9Pkn5vqIhqDrQMbBM8HtzK4EABJ7I0lf4zfP2wK1fyueA1mYLV/MCUUapM
	z0FHg1L3FOzZG2lKwBSzhqlI0AW2nXILNfSkeYBQguDZGF/j2mZjx5PYcoQcj+iH0AOI5ZWCUPT
	kpdOevK1urxvyWrTI3hGgc4pZDzaa2FEBh+UE4OOSVOgz8CUiygZiLWkNp97RsD9L2pZPZzCFbQ
	8WW1xP2poJyQ1IUSGhNvBFiWy62vX5MFXEP/yvTfsBaTaw+/DP0CGtr/atBH7qmpPGUx6ywtMI2
	hFdn9YjdbrUbSBiu3R3lfI69BQibG/q3n/00R4MZxRgDj/2skroDm5UxX2ZNnKX/4/VyPqGg1Ct
	QoXsZGuMG4yljB/QO8zu6LhuZZE/DahYKhKZFzzjRupSQNSw5y0/w2/aDdT8hENGjjihED+Eo48
	6NVZQ=
X-Google-Smtp-Source: AGHT+IGDFPDGX4rb+kiQg3X4yL7z83rrDxrOSR5UfT6oA70G3VDh5bLbnnVZBylxLLb/1kX5EJEZLg==
X-Received: by 2002:a17:903:283:b0:267:f121:6a88 with SMTP id d9443c01a7336-268138fe811mr54249485ad.42.1758146679810;
        Wed, 17 Sep 2025 15:04:39 -0700 (PDT)
Received: from Ubuntuv2.domain.name ([122.172.86.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016bf96sm5505275ad.38.2025.09.17.15.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 15:04:39 -0700 (PDT)
From: Marneni PoornaChandu <poornachandumarneni@gmail.com>
X-Google-Original-From: Marneni PoornaChandu <Poornachandumarneni@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com,
	corey@minyard.net,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	linux-i3c@lists.infradead.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Marneni PoornaChandu <Poornachandumarneni@gmail.com>
Subject: [PATCH] docs: driver-api: fix spelling of "buses".
Date: Thu, 18 Sep 2025 06:04:30 +0800
Message-Id: <20250917220430.5815-1-Poornachandumarneni@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace incorrect plural form "busses" with "buses" in
multiple documentation files under "Documentation/driver-api".

Signed-off-by: Marneni PoornaChandu <Poornachandumarneni@gmail.com>
---
 Documentation/driver-api/device-io.rst             | 4 ++--
 Documentation/driver-api/driver-model/overview.rst | 2 +-
 Documentation/driver-api/driver-model/platform.rst | 2 +-
 Documentation/driver-api/eisa.rst                  | 6 +++---
 Documentation/driver-api/i3c/protocol.rst          | 4 ++--
 Documentation/driver-api/ipmi.rst                  | 4 ++--
 Documentation/driver-api/media/tx-rx.rst           | 4 ++--
 Documentation/driver-api/nvdimm/nvdimm.rst         | 2 +-
 Documentation/driver-api/pm/devices.rst            | 4 ++--
 Documentation/driver-api/scsi.rst                  | 4 ++--
 Documentation/driver-api/spi.rst                   | 2 +-
 Documentation/driver-api/usb/hotplug.rst           | 2 +-
 Documentation/driver-api/usb/usb.rst               | 4 ++--
 13 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/Documentation/driver-api/device-io.rst b/Documentation/driver-api/device-io.rst
index 5c7e8194bef9..d1aaa961cac4 100644
--- a/Documentation/driver-api/device-io.rst
+++ b/Documentation/driver-api/device-io.rst
@@ -16,7 +16,7 @@ Bus-Independent Device Accesses
 Introduction
 ============
 
-Linux provides an API which abstracts performing IO across all busses
+Linux provides an API which abstracts performing IO across all buses
 and devices, allowing device drivers to be written independently of bus
 type.
 
@@ -71,7 +71,7 @@ can be compiler optimised, you can use __readb() and friends to
 indicate the relaxed ordering. Use this with care.
 
 While the basic functions are defined to be synchronous with respect to
-each other and ordered with respect to each other the busses the devices
+each other and ordered with respect to each other the buses the devices
 sit on may themselves have asynchronicity. In particular many authors
 are burned by the fact that PCI bus writes are posted asynchronously. A
 driver author must issue a read from the same device to ensure that
diff --git a/Documentation/driver-api/driver-model/overview.rst b/Documentation/driver-api/driver-model/overview.rst
index e98d0ab4a9b6..b3f447bf9f07 100644
--- a/Documentation/driver-api/driver-model/overview.rst
+++ b/Documentation/driver-api/driver-model/overview.rst
@@ -22,7 +22,7 @@ uniformity across the different bus types.
 
 The current driver model provides a common, uniform data model for describing
 a bus and the devices that can appear under the bus. The unified bus
-model includes a set of common attributes which all busses carry, and a set
+model includes a set of common attributes which all buses carry, and a set
 of common callbacks, such as device discovery during bus probing, bus
 shutdown, bus power management, etc.
 
diff --git a/Documentation/driver-api/driver-model/platform.rst b/Documentation/driver-api/driver-model/platform.rst
index 7beb8a9648c5..cf5ff48d3115 100644
--- a/Documentation/driver-api/driver-model/platform.rst
+++ b/Documentation/driver-api/driver-model/platform.rst
@@ -4,7 +4,7 @@ Platform Devices and Drivers
 
 See <linux/platform_device.h> for the driver model interface to the
 platform bus:  platform_device, and platform_driver.  This pseudo-bus
-is used to connect devices on busses with minimal infrastructure,
+is used to connect devices on buses with minimal infrastructure,
 like those used to integrate peripherals on many system-on-chip
 processors, or some "legacy" PC interconnects; as opposed to large
 formally specified ones like PCI or USB.
diff --git a/Documentation/driver-api/eisa.rst b/Documentation/driver-api/eisa.rst
index b33ebe1ec9ed..3563e5f7e98d 100644
--- a/Documentation/driver-api/eisa.rst
+++ b/Documentation/driver-api/eisa.rst
@@ -8,9 +8,9 @@ This document groups random notes about porting EISA drivers to the
 new EISA/sysfs API.
 
 Starting from version 2.5.59, the EISA bus is almost given the same
-status as other much more mainstream busses such as PCI or USB. This
+status as other much more mainstream buses such as PCI or USB. This
 has been possible through sysfs, which defines a nice enough set of
-abstractions to manage busses, devices and drivers.
+abstractions to manage buses, devices and drivers.
 
 Although the new API is quite simple to use, converting existing
 drivers to the new infrastructure is not an easy task (mostly because
@@ -205,7 +205,7 @@ Random notes
 Converting an EISA driver to the new API mostly involves *deleting*
 code (since probing is now in the core EISA code). Unfortunately, most
 drivers share their probing routine between ISA, and EISA. Special
-care must be taken when ripping out the EISA code, so other busses
+care must be taken when ripping out the EISA code, so other buses
 won't suffer from these surgical strikes...
 
 You *must not* expect any EISA device to be detected when returning
diff --git a/Documentation/driver-api/i3c/protocol.rst b/Documentation/driver-api/i3c/protocol.rst
index 23a0b93c62b1..fe338f8085db 100644
--- a/Documentation/driver-api/i3c/protocol.rst
+++ b/Documentation/driver-api/i3c/protocol.rst
@@ -165,8 +165,8 @@ The first thing attached to an HDR command is the HDR mode. There are currently
 for more details):
 
 * HDR-DDR: Double Data Rate mode
-* HDR-TSP: Ternary Symbol Pure. Only usable on busses with no I2C devices
-* HDR-TSL: Ternary Symbol Legacy. Usable on busses with I2C devices
+* HDR-TSP: Ternary Symbol Pure. Only usable on buses with no I2C devices
+* HDR-TSL: Ternary Symbol Legacy. Usable on buses with I2C devices
 
 When sending an HDR command, the whole bus has to enter HDR mode, which is done
 using a broadcast CCC command.
diff --git a/Documentation/driver-api/ipmi.rst b/Documentation/driver-api/ipmi.rst
index 2cc6c898ab90..f52ab2df2569 100644
--- a/Documentation/driver-api/ipmi.rst
+++ b/Documentation/driver-api/ipmi.rst
@@ -617,12 +617,12 @@ Note that the address you give here is the I2C address, not the IPMI
 address.  So if you want your MC address to be 0x60, you put 0x30
 here.  See the I2C driver info for more details.
 
-Command bridging to other IPMB busses through this interface does not
+Command bridging to other IPMB buses through this interface does not
 work.  The receive message queue is not implemented, by design.  There
 is only one receive message queue on a BMC, and that is meant for the
 host drivers, not something on the IPMB bus.
 
-A BMC may have multiple IPMB busses, which bus your device sits on
+A BMC may have multiple IPMB buses, which bus your device sits on
 depends on how the system is wired.  You can fetch the channels with
 "ipmitool channel info <n>" where <n> is the channel, with the
 channels being 0-7 and try the IPMB channels.
diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
index 0b8c9cde8ee4..22e1b13ecde9 100644
--- a/Documentation/driver-api/media/tx-rx.rst
+++ b/Documentation/driver-api/media/tx-rx.rst
@@ -12,7 +12,7 @@ CSI-2 receiver in an SoC.
 Bus types
 ---------
 
-The following busses are the most common. This section discusses these two only.
+The following buses are the most common. This section discusses these two only.
 
 MIPI CSI-2
 ^^^^^^^^^^
@@ -36,7 +36,7 @@ Transmitter drivers
 
 Transmitter drivers generally need to provide the receiver drivers with the
 configuration of the transmitter. What is required depends on the type of the
-bus. These are common for both busses.
+bus. These are common for both buses.
 
 Media bus pixel code
 ^^^^^^^^^^^^^^^^^^^^
diff --git a/Documentation/driver-api/nvdimm/nvdimm.rst b/Documentation/driver-api/nvdimm/nvdimm.rst
index c205efa4d45b..959ba1cc0263 100644
--- a/Documentation/driver-api/nvdimm/nvdimm.rst
+++ b/Documentation/driver-api/nvdimm/nvdimm.rst
@@ -230,7 +230,7 @@ LIBNVDIMM/LIBNDCTL: Bus
 A bus has a 1:1 relationship with an NFIT.  The current expectation for
 ACPI based systems is that there is only ever one platform-global NFIT.
 That said, it is trivial to register multiple NFITs, the specification
-does not preclude it.  The infrastructure supports multiple busses and
+does not preclude it.  The infrastructure supports multiple buses and
 we use this capability to test multiple NFIT configurations in the unit
 test.
 
diff --git a/Documentation/driver-api/pm/devices.rst b/Documentation/driver-api/pm/devices.rst
index 8d86d5da4023..36d5c9c9fd11 100644
--- a/Documentation/driver-api/pm/devices.rst
+++ b/Documentation/driver-api/pm/devices.rst
@@ -255,7 +255,7 @@ get registered:  a child can never be registered, probed or resumed before
 its parent; and can't be removed or suspended after that parent.
 
 The policy is that the device hierarchy should match hardware bus topology.
-[Or at least the control bus, for devices which use multiple busses.]
+[Or at least the control bus, for devices which use multiple buses.]
 In particular, this means that a device registration may fail if the parent of
 the device is suspending (i.e. has been chosen by the PM core as the next
 device to suspend) or has already suspended, as well as after all of the other
@@ -493,7 +493,7 @@ states, like S3).
 
 Drivers must also be prepared to notice that the device has been removed
 while the system was powered down, whenever that's physically possible.
-PCMCIA, MMC, USB, Firewire, SCSI, and even IDE are common examples of busses
+PCMCIA, MMC, USB, Firewire, SCSI, and even IDE are common examples of buses
 where common Linux platforms will see such removal.  Details of how drivers
 will notice and handle such removals are currently bus-specific, and often
 involve a separate thread.
diff --git a/Documentation/driver-api/scsi.rst b/Documentation/driver-api/scsi.rst
index bf2be96cc2d6..8bbdfb018c53 100644
--- a/Documentation/driver-api/scsi.rst
+++ b/Documentation/driver-api/scsi.rst
@@ -18,7 +18,7 @@ optical drives, test equipment, and medical devices) to a host computer.
 
 Although the old parallel (fast/wide/ultra) SCSI bus has largely fallen
 out of use, the SCSI command set is more widely used than ever to
-communicate with devices over a number of different busses.
+communicate with devices over a number of different buses.
 
 The `SCSI protocol <https://www.t10.org/scsi-3.htm>`__ is a big-endian
 peer-to-peer packet based protocol. SCSI commands are 6, 10, 12, or 16
@@ -286,7 +286,7 @@ Parallel SCSI (SPI) transport class
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 The file drivers/scsi/scsi_transport_spi.c defines transport
-attributes for traditional (fast/wide/ultra) SCSI busses.
+attributes for traditional (fast/wide/ultra) SCSI buses.
 
 .. kernel-doc:: drivers/scsi/scsi_transport_spi.c
    :export:
diff --git a/Documentation/driver-api/spi.rst b/Documentation/driver-api/spi.rst
index f28887045049..74eca6735042 100644
--- a/Documentation/driver-api/spi.rst
+++ b/Documentation/driver-api/spi.rst
@@ -13,7 +13,7 @@ additional chipselect line is usually active-low (nCS); four signals are
 normally used for each peripheral, plus sometimes an interrupt.
 
 The SPI bus facilities listed here provide a generalized interface to
-declare SPI busses and devices, manage them according to the standard
+declare SPI buses and devices, manage them according to the standard
 Linux driver model, and perform input/output operations. At this time,
 only "master" side interfaces are supported, where Linux talks to SPI
 peripherals and does not implement such a peripheral itself. (Interfaces
diff --git a/Documentation/driver-api/usb/hotplug.rst b/Documentation/driver-api/usb/hotplug.rst
index c1e13107c50e..12260f704a01 100644
--- a/Documentation/driver-api/usb/hotplug.rst
+++ b/Documentation/driver-api/usb/hotplug.rst
@@ -5,7 +5,7 @@ Linux Hotplugging
 =================
 
 
-In hotpluggable busses like USB (and Cardbus PCI), end-users plug devices
+In hotpluggable buses like USB (and Cardbus PCI), end-users plug devices
 into the bus with power on.  In most cases, users expect the devices to become
 immediately usable.  That means the system must do many things, including:
 
diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
index 976fb4221062..7f2f41e80c1c 100644
--- a/Documentation/driver-api/usb/usb.rst
+++ b/Documentation/driver-api/usb/usb.rst
@@ -13,7 +13,7 @@ structure, with the host as the root (the system's master), hubs as
 interior nodes, and peripherals as leaves (and slaves). Modern PCs
 support several such trees of USB devices, usually
 a few USB 3.0 (5 GBit/s) or USB 3.1 (10 GBit/s) and some legacy
-USB 2.0 (480 MBit/s) busses just in case.
+USB 2.0 (480 MBit/s) buses just in case.
 
 That master/slave asymmetry was designed-in for a number of reasons, one
 being ease of use. It is not physically possible to mistake upstream and
@@ -42,7 +42,7 @@ two. One is intended for *general-purpose* drivers (exposed through
 driver frameworks), and the other is for drivers that are *part of the
 core*. Such core drivers include the *hub* driver (which manages trees
 of USB devices) and several different kinds of *host controller
-drivers*, which control individual busses.
+drivers*, which control individual buses.
 
 The device model seen by USB drivers is relatively complex.
 
-- 
2.34.1


