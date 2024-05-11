Return-Path: <linux-doc+bounces-16245-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CDC8C31AA
	for <lists+linux-doc@lfdr.de>; Sat, 11 May 2024 15:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C635D1F217B1
	for <lists+linux-doc@lfdr.de>; Sat, 11 May 2024 13:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D9652F7A;
	Sat, 11 May 2024 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOrQxW+1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07656FC6;
	Sat, 11 May 2024 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715434719; cv=none; b=MjD+AV1aKkfLZMLoTJeZaVPPf6HGP0J6kz1ZF9XWgHMd7UOieXLrGXtXgWtf9cFeGI/MksnG6VquauN0fU9NIT5mgshmLt/k6Zfu62Cj1E/BwilT0KFDKnkJfrmjBKW7kwRl+OX3WXNKa9s5lnygJGwVf+BKCqpuSzkY8iTNvlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715434719; c=relaxed/simple;
	bh=NpV/lgM1J5rq+r5HNnPZJt1mf1to5A7pgYsFiUbYl6A=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=A3BDIDJ+ALYBClpwZ8HkZQrLAPjcdSpnVlfHLYFYHGaYBJtZ9C7C1vfSfkh+RtjWLxz0lEsvA2sVQX781We5siI74ACdFAUwEFh2QFcxjmX89y525bVtHRIZSCo7r4w3IHHI0gMmDRQdeD435yNRjYTxnHAthIq9H984DuOyIKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOrQxW+1; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f4302187c0so2780972b3a.1;
        Sat, 11 May 2024 06:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715434717; x=1716039517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dDNO5Dg02G/ckxK1gSHZTrRA6UW0KF+vfzG6mL7+jb0=;
        b=AOrQxW+1hKzm4f9ktxmnqBsZmoRis1nR/YcXbei7rQpGegdsnbF3qf3g8dmYiQkYKF
         CvemXQ85HPVuGOuwDpv9pEUsAu67QrKeu7/JZsSWF2Trgw5cR02nlh95ykLnO3ZEcUpL
         V6zBWxfxbgKJJOqKb/mEoblrgSQiATOBG6E5wiEZAV3jTl0uytVq4ALf8dl1qrAY1iuk
         luWapbr0ZU4x8p9X4Nj3H7MxpFAHS7vZ7iID9HgieJo6mrYFQJqL1niUr8bmazbFaAxn
         ADhDqtR6PkY+Y8Hl+QyIkVMo0DVRZmxZAPnCuIhQATEYOk6gNFQQKXhqIf7S0H34LOqP
         v5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715434717; x=1716039517;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDNO5Dg02G/ckxK1gSHZTrRA6UW0KF+vfzG6mL7+jb0=;
        b=mKUOgVqMlXcslb/Ol6BJH3i09vaCtIkDhceI3jowIU9HdahArsWnQiVeAZG7eBKen2
         bhU3zP23nNP+DYxx/JRCDOoQIeMFGZswCZCdfyBILxHF/cPSnIuxfeCxElFbu8WOh/+I
         f4dHLBTsY6tVOuFqKoEgri3YAPtpHHPlGHHOLUBeZ0m2h3tI8HPykEwcTxud87mmFugP
         m9ZjmopNocvYz1n1sq6fuxxDE3ZOOyXI+uSLFN6MYhtZX8Jb9IoD16CRO8XZTOFUt8jj
         ldKmECdq3H5C3WnVuVQMIvQaZQHW3Y4jfGdFKjfwd2OWNjDN5F/UTL2fvCRjO5V4kujm
         ethg==
X-Forwarded-Encrypted: i=1; AJvYcCU3ke9uYSLeyWMAROQrA3002rJITIFXbvqTFpbJBguwrGkc4VqFQfZ/mWjhRtZaFthxStlM1gA5QDUP7iKBloxOHZoFii0oYvbpd9I4XKnK4HWA46TC431f7ybxwz2WBymPILQnuvmP3KCDW6vEcPuiolirh31V2+gCJfhryBYCqR/ZSYNd
X-Gm-Message-State: AOJu0YyHVSGeijO5mXHpejY5HPtw0EoxyHI65TFpKSXk0qPQ3aFtkzQ/
	3fLWgCMkZPzzZYl4/u6+5N+9VDIfgX4u776p1ZobWguivOwpn9aq
X-Google-Smtp-Source: AGHT+IG6Lbss+PSqAgQTJmrCTq/WY4qcdZpZ3iSjRExi2Lybj9EDAdoAgR2DQmgPdOXybGxkHjM4Gw==
X-Received: by 2002:a05:6a20:3212:b0:1af:86e4:bc99 with SMTP id adf61e73a8af0-1afde0b727bmr6445530637.10.1715434716743;
        Sat, 11 May 2024 06:38:36 -0700 (PDT)
Received: from localhost.localdomain ([67.161.114.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4f399b656sm767146b3a.139.2024.05.11.06.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 06:38:36 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	kys@microsoft.com,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 1/2] Documentation: hyperv: Update spelling and fix typo
Date: Sat, 11 May 2024 06:38:17 -0700
Message-Id: <20240511133818.19649-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Kelley <mhklinux@outlook.com>

Update spelling from "VMbus" to "VMBus" to match Hyper-V product
documentation. Also correct typo: "SNP-SEV" should be "SEV-SNP".

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
Changes in v2: None

 Documentation/virt/hyperv/overview.rst | 22 +++----
 Documentation/virt/hyperv/vmbus.rst    | 82 +++++++++++++-------------
 2 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/Documentation/virt/hyperv/overview.rst b/Documentation/virt/hyperv/overview.rst
index cd493332c88a..77408a89d1a4 100644
--- a/Documentation/virt/hyperv/overview.rst
+++ b/Documentation/virt/hyperv/overview.rst
@@ -40,7 +40,7 @@ Linux guests communicate with Hyper-V in four different ways:
   arm64, these synthetic registers must be accessed using explicit
   hypercalls.
 
-* VMbus: VMbus is a higher-level software construct that is built on
+* VMBus: VMBus is a higher-level software construct that is built on
   the other 3 mechanisms.  It is a message passing interface between
   the Hyper-V host and the Linux guest.  It uses memory that is shared
   between Hyper-V and the guest, along with various signaling
@@ -54,8 +54,8 @@ x86/x64 architecture only.
 
 .. _Hyper-V Top Level Functional Spec (TLFS): https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/tlfs/tlfs
 
-VMbus is not documented.  This documentation provides a high-level
-overview of VMbus and how it works, but the details can be discerned
+VMBus is not documented.  This documentation provides a high-level
+overview of VMBus and how it works, but the details can be discerned
 only from the code.
 
 Sharing Memory
@@ -74,7 +74,7 @@ follows:
   physical address space.  How Hyper-V is told about the GPA or list
   of GPAs varies.  In some cases, a single GPA is written to a
   synthetic register.  In other cases, a GPA or list of GPAs is sent
-  in a VMbus message.
+  in a VMBus message.
 
 * Hyper-V translates the GPAs into "real" physical memory addresses,
   and creates a virtual mapping that it can use to access the memory.
@@ -133,9 +133,9 @@ only the CPUs actually present in the VM, so Linux does not report
 any hot-add CPUs.
 
 A Linux guest CPU may be taken offline using the normal Linux
-mechanisms, provided no VMbus channel interrupts are assigned to
-the CPU.  See the section on VMbus Interrupts for more details
-on how VMbus channel interrupts can be re-assigned to permit
+mechanisms, provided no VMBus channel interrupts are assigned to
+the CPU.  See the section on VMBus Interrupts for more details
+on how VMBus channel interrupts can be re-assigned to permit
 taking a CPU offline.
 
 32-bit and 64-bit
@@ -169,14 +169,14 @@ and functionality. Hyper-V indicates feature/function availability
 via flags in synthetic MSRs that Hyper-V provides to the guest,
 and the guest code tests these flags.
 
-VMbus has its own protocol version that is negotiated during the
-initial VMbus connection from the guest to Hyper-V. This version
+VMBus has its own protocol version that is negotiated during the
+initial VMBus connection from the guest to Hyper-V. This version
 number is also output to dmesg during boot.  This version number
 is checked in a few places in the code to determine if specific
 functionality is present.
 
-Furthermore, each synthetic device on VMbus also has a protocol
-version that is separate from the VMbus protocol version. Device
+Furthermore, each synthetic device on VMBus also has a protocol
+version that is separate from the VMBus protocol version. Device
 drivers for these synthetic devices typically negotiate the device
 protocol version, and may test that protocol version to determine
 if specific device functionality is present.
diff --git a/Documentation/virt/hyperv/vmbus.rst b/Documentation/virt/hyperv/vmbus.rst
index d2012d9022c5..f0d83ebda626 100644
--- a/Documentation/virt/hyperv/vmbus.rst
+++ b/Documentation/virt/hyperv/vmbus.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-VMbus
+VMBus
 =====
-VMbus is a software construct provided by Hyper-V to guest VMs.  It
+VMBus is a software construct provided by Hyper-V to guest VMs.  It
 consists of a control path and common facilities used by synthetic
 devices that Hyper-V presents to guest VMs.   The control path is
 used to offer synthetic devices to the guest VM and, in some cases,
@@ -12,9 +12,9 @@ and the synthetic device implementation that is part of Hyper-V, and
 signaling primitives to allow Hyper-V and the guest to interrupt
 each other.
 
-VMbus is modeled in Linux as a bus, with the expected /sys/bus/vmbus
-entry in a running Linux guest.  The VMbus driver (drivers/hv/vmbus_drv.c)
-establishes the VMbus control path with the Hyper-V host, then
+VMBus is modeled in Linux as a bus, with the expected /sys/bus/vmbus
+entry in a running Linux guest.  The VMBus driver (drivers/hv/vmbus_drv.c)
+establishes the VMBus control path with the Hyper-V host, then
 registers itself as a Linux bus driver.  It implements the standard
 bus functions for adding and removing devices to/from the bus.
 
@@ -49,9 +49,9 @@ synthetic NIC is referred to as "netvsc" and the Linux driver for
 the synthetic SCSI controller is "storvsc".  These drivers contain
 functions with names like "storvsc_connect_to_vsp".
 
-VMbus channels
+VMBus channels
 --------------
-An instance of a synthetic device uses VMbus channels to communicate
+An instance of a synthetic device uses VMBus channels to communicate
 between the VSP and the VSC.  Channels are bi-directional and used
 for passing messages.   Most synthetic devices use a single channel,
 but the synthetic SCSI controller and synthetic NIC may use multiple
@@ -73,7 +73,7 @@ write indices and some control flags, followed by the memory for the
 actual ring.  The size of the ring is determined by the VSC in the
 guest and is specific to each synthetic device.   The list of GPAs
 making up the ring is communicated to the Hyper-V host over the
-VMbus control path as a GPA Descriptor List (GPADL).  See function
+VMBus control path as a GPA Descriptor List (GPADL).  See function
 vmbus_establish_gpadl().
 
 Each ring buffer is mapped into contiguous Linux kernel virtual
@@ -102,9 +102,9 @@ resources.  For Windows Server 2019 and later, this limit is
 approximately 1280 Mbytes.  For versions prior to Windows Server
 2019, the limit is approximately 384 Mbytes.
 
-VMbus messages
+VMBus messages
 --------------
-All VMbus messages have a standard header that includes the message
+All VMBus messages have a standard header that includes the message
 length, the offset of the message payload, some flags, and a
 transactionID.  The portion of the message after the header is
 unique to each VSP/VSC pair.
@@ -137,7 +137,7 @@ control message contains a list of GPAs that describe the data
 buffer.  For example, the storvsc driver uses this approach to
 specify the data buffers to/from which disk I/O is done.
 
-Three functions exist to send VMbus messages:
+Three functions exist to send VMBus messages:
 
 1. vmbus_sendpacket():  Control-only messages and messages with
    embedded data -- no GPAs
@@ -154,20 +154,20 @@ Historically, Linux guests have trusted Hyper-V to send well-formed
 and valid messages, and Linux drivers for synthetic devices did not
 fully validate messages.  With the introduction of processor
 technologies that fully encrypt guest memory and that allow the
-guest to not trust the hypervisor (AMD SNP-SEV, Intel TDX), trusting
+guest to not trust the hypervisor (AMD SEV-SNP, Intel TDX), trusting
 the Hyper-V host is no longer a valid assumption.  The drivers for
-VMbus synthetic devices are being updated to fully validate any
+VMBus synthetic devices are being updated to fully validate any
 values read from memory that is shared with Hyper-V, which includes
-messages from VMbus devices.  To facilitate such validation,
+messages from VMBus devices.  To facilitate such validation,
 messages read by the guest from the "in" ring buffer are copied to a
 temporary buffer that is not shared with Hyper-V.  Validation is
 performed in this temporary buffer without the risk of Hyper-V
 maliciously modifying the message after it is validated but before
 it is used.
 
-VMbus interrupts
+VMBus interrupts
 ----------------
-VMbus provides a mechanism for the guest to interrupt the host when
+VMBus provides a mechanism for the guest to interrupt the host when
 the guest has queued new messages in a ring buffer.  The host
 expects that the guest will send an interrupt only when an "out"
 ring buffer transitions from empty to non-empty.  If the guest sends
@@ -177,62 +177,62 @@ interrupts, the host may throttle that guest by suspending its
 execution for a few seconds to prevent a denial-of-service attack.
 
 Similarly, the host will interrupt the guest when it sends a new
-message on the VMbus control path, or when a VMbus channel "in" ring
+message on the VMBus control path, or when a VMBus channel "in" ring
 buffer transitions from empty to non-empty.  Each CPU in the guest
-may receive VMbus interrupts, so they are best modeled as per-CPU
+may receive VMBus interrupts, so they are best modeled as per-CPU
 interrupts in Linux.  This model works well on arm64 where a single
-per-CPU IRQ is allocated for VMbus.  Since x86/x64 lacks support for
+per-CPU IRQ is allocated for VMBus.  Since x86/x64 lacks support for
 per-CPU IRQs, an x86 interrupt vector is statically allocated (see
 HYPERVISOR_CALLBACK_VECTOR) across all CPUs and explicitly coded to
-call the VMbus interrupt service routine.  These interrupts are
+call the VMBus interrupt service routine.  These interrupts are
 visible in /proc/interrupts on the "HYP" line.
 
-The guest CPU that a VMbus channel will interrupt is selected by the
+The guest CPU that a VMBus channel will interrupt is selected by the
 guest when the channel is created, and the host is informed of that
-selection.  VMbus devices are broadly grouped into two categories:
+selection.  VMBus devices are broadly grouped into two categories:
 
-1. "Slow" devices that need only one VMbus channel.  The devices
+1. "Slow" devices that need only one VMBus channel.  The devices
    (such as keyboard, mouse, heartbeat, and timesync) generate
-   relatively few interrupts.  Their VMbus channels are all
+   relatively few interrupts.  Their VMBus channels are all
    assigned to interrupt the VMBUS_CONNECT_CPU, which is always
    CPU 0.
 
-2. "High speed" devices that may use multiple VMbus channels for
+2. "High speed" devices that may use multiple VMBus channels for
    higher parallelism and performance.  These devices include the
-   synthetic SCSI controller and synthetic NIC.  Their VMbus
+   synthetic SCSI controller and synthetic NIC.  Their VMBus
    channels interrupts are assigned to CPUs that are spread out
    among the available CPUs in the VM so that interrupts on
    multiple channels can be processed in parallel.
 
-The assignment of VMbus channel interrupts to CPUs is done in the
+The assignment of VMBus channel interrupts to CPUs is done in the
 function init_vp_index().  This assignment is done outside of the
 normal Linux interrupt affinity mechanism, so the interrupts are
 neither "unmanaged" nor "managed" interrupts.
 
-The CPU that a VMbus channel will interrupt can be seen in
+The CPU that a VMBus channel will interrupt can be seen in
 /sys/bus/vmbus/devices/<deviceGUID>/ channels/<channelRelID>/cpu.
 When running on later versions of Hyper-V, the CPU can be changed
 by writing a new value to this sysfs entry.  Because the interrupt
 assignment is done outside of the normal Linux affinity mechanism,
 there are no entries in /proc/irq corresponding to individual
-VMbus channel interrupts.
+VMBus channel interrupts.
 
 An online CPU in a Linux guest may not be taken offline if it has
-VMbus channel interrupts assigned to it.  Any such channel
+VMBus channel interrupts assigned to it.  Any such channel
 interrupts must first be manually reassigned to another CPU as
 described above.  When no channel interrupts are assigned to the
 CPU, it can be taken offline.
 
-When a guest CPU receives a VMbus interrupt from the host, the
+When a guest CPU receives a VMBus interrupt from the host, the
 function vmbus_isr() handles the interrupt.  It first checks for
 channel interrupts by calling vmbus_chan_sched(), which looks at a
 bitmap setup by the host to determine which channels have pending
 interrupts on this CPU.  If multiple channels have pending
 interrupts for this CPU, they are processed sequentially.  When all
 channel interrupts have been processed, vmbus_isr() checks for and
-processes any message received on the VMbus control path.
+processes any message received on the VMBus control path.
 
-The VMbus channel interrupt handling code is designed to work
+The VMBus channel interrupt handling code is designed to work
 correctly even if an interrupt is received on a CPU other than the
 CPU assigned to the channel.  Specifically, the code does not use
 CPU-based exclusion for correctness.  In normal operation, Hyper-V
@@ -242,23 +242,23 @@ when Hyper-V will make the transition.  The code must work correctly
 even if there is a time lag before Hyper-V starts interrupting the
 new CPU.  See comments in target_cpu_store().
 
-VMbus device creation/deletion
+VMBus device creation/deletion
 ------------------------------
 Hyper-V and the Linux guest have a separate message-passing path
 that is used for synthetic device creation and deletion. This
-path does not use a VMbus channel.  See vmbus_post_msg() and
+path does not use a VMBus channel.  See vmbus_post_msg() and
 vmbus_on_msg_dpc().
 
 The first step is for the guest to connect to the generic
-Hyper-V VMbus mechanism.  As part of establishing this connection,
-the guest and Hyper-V agree on a VMbus protocol version they will
+Hyper-V VMBus mechanism.  As part of establishing this connection,
+the guest and Hyper-V agree on a VMBus protocol version they will
 use.  This negotiation allows newer Linux kernels to run on older
 Hyper-V versions, and vice versa.
 
 The guest then tells Hyper-V to "send offers".  Hyper-V sends an
 offer message to the guest for each synthetic device that the VM
-is configured to have. Each VMbus device type has a fixed GUID
-known as the "class ID", and each VMbus device instance is also
+is configured to have. Each VMBus device type has a fixed GUID
+known as the "class ID", and each VMBus device instance is also
 identified by a GUID. The offer message from Hyper-V contains
 both GUIDs to uniquely (within the VM) identify the device.
 There is one offer message for each device instance, so a VM with
@@ -275,7 +275,7 @@ type based on the class ID, and invokes the correct driver to set up
 the device.  Driver/device matching is performed using the standard
 Linux mechanism.
 
-The device driver probe function opens the primary VMbus channel to
+The device driver probe function opens the primary VMBus channel to
 the corresponding VSP. It allocates guest memory for the channel
 ring buffers and shares the ring buffer with the Hyper-V host by
 giving the host a list of GPAs for the ring buffer memory.  See
@@ -285,7 +285,7 @@ Once the ring buffer is set up, the device driver and VSP exchange
 setup messages via the primary channel.  These messages may include
 negotiating the device protocol version to be used between the Linux
 VSC and the VSP on the Hyper-V host.  The setup messages may also
-include creating additional VMbus channels, which are somewhat
+include creating additional VMBus channels, which are somewhat
 mis-named as "sub-channels" since they are functionally
 equivalent to the primary channel once they are created.
 
-- 
2.25.1


