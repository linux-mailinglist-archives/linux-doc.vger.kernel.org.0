Return-Path: <linux-doc+bounces-32632-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8F79EFFF3
	for <lists+linux-doc@lfdr.de>; Fri, 13 Dec 2024 00:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F7D1286E4D
	for <lists+linux-doc@lfdr.de>; Thu, 12 Dec 2024 23:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595FD1D88C7;
	Thu, 12 Dec 2024 23:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPX3Eep4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4187B1AC891;
	Thu, 12 Dec 2024 23:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734045432; cv=none; b=pOF5rdwjCv+A513TrW2A/AZOLGJEazQQ3Md9DR4oJuMBLtQwiRry5Axtai6ZNpGf0z8fqhLAYBHZSvZerwMidaMptOh7Mey8GEEUy2+XnpWYuKbpVsyPKUgE7mLvQKTon7ngDIQegBzDkqqTVs5mBE/kWtbt0vcqBabJLd14TXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734045432; c=relaxed/simple;
	bh=tU8vOys8ngG0z0vBKFATJF9hIFcOuKxZ2rFDMBDCt3k=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=WDxNNFChH2bxtxqAxDTAWlY8RMZny43wZhaZd2ye+NzFFb02u6HWnMXxVEKIMbISPyRXqbkFR1aMo6QfGZLeei8hI04HN0uHWNmYhlMaZN9uysqm+uwrvQbw3OhOMrgbcR34rI0zDdJ+rA+6JrxNRrfZbqal+V0yPgrdRhZnhTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPX3Eep4; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-725ef0397aeso1017531b3a.2;
        Thu, 12 Dec 2024 15:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734045429; x=1734650229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xMSm6iyBUJ6AcBnmjIMyQ5K2ND0odl2dNcpPZ4MrCWY=;
        b=VPX3Eep43VpKhBTbwx7zR6xN4a1CXqosaNdc3KDOMX/SpsEnPFPuBtimd0XEPjW6ks
         cqE1fZAUgEo58OfhTPpVqkNKJWYkciBPwNEOqAOmdzDlbRK8LuwiOakNJ7A6x/hYCEBh
         3E4vKMCxK0iLydWo8OhkJ3jXN1Z3or+5oqHyaNCnCTMdKogkXR/H5B1i0g/tWWJfv2wX
         eZSe1MLxARCt3/bkELNJwiyOY9N1zj93eb/vpBD0qd4JvV8Z89eKD4NWA4evi+BkdQmt
         0/baJ63GujOw0AvG28Vw71so6JqtDq9xTNtnZ6LYIx3sYcZdfzWHc6SH7nvJPvdxIO3Q
         haCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734045429; x=1734650229;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMSm6iyBUJ6AcBnmjIMyQ5K2ND0odl2dNcpPZ4MrCWY=;
        b=ALM4ra7tqmgkcnhp5Kgt+2YTjj9b3ZRzzqOR94YbbcLK7P66ImYDsH7aR4QbDoKX29
         LHqHCZljYjojJ+UzSTkyCxGze4e/ouXBgiHwKeisXZFXJsB8ka2kwGf6pOwJE+c+9KP2
         Kl/5AYAoR1BIS7y2xtjFkod2iX5aJUEQmzFr2O2zjf6QTWgHeU/yvag5kl9tbZxLz5Vm
         3tpPkKH83Z43PiEtW78Tm27aYWqgtqgzkqClpUx4nyePPfO4dqJhIX0cO9lxVcRJJU0h
         BUpGZ3xfUn7XwLMa8dO1zfHdhm2tvK0QYpzRRx9OIot4Ifb39S81Z0qI53p821mD9Z8O
         zhvw==
X-Forwarded-Encrypted: i=1; AJvYcCUNf2fXG7iLbpALGSfjGZHl5Mt9FtjWRAumgr/2schw8weym1C/Q6QfImlTn4luOjqbzcr7BjRPMQqk3ItL@vger.kernel.org, AJvYcCV4VgaNlmwOJDhLQAdms1Lk78UFSOoQGCmFuI7Ohzy9O4FwK2TQheGk6uYbh6Ojcj6KVG9/66+DrQMBW+OH@vger.kernel.org, AJvYcCWuUQQJHV72f3o4DCxFY4VFbcfE7Tj3ckzw0sm4NFMXLyOtM1kybPOKvJE/ZqBtMrvX7fA19W/6myI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBSv2YJDKQi+qqseuXfVEFIcCmMVogc5FVdYeWv2bf1n2SbziM
	DxXB7RLPq8ng187xJlqAfrJGARxowJI9yWrvgBNJmvH4RvkQ6bd4
X-Gm-Gg: ASbGncvQIoj/bW68vHS6RaOGITbgO36Eesx6uldQT7/bpSF1DhS8lWorNWUfHBmMW4m
	k2HfNPO5XPBdbwhPmBv0W03O3wlLSBzvlnBr0Jkwju0AN/HUlNuElG8CgyC7Vjs8EkZQ5CLKVfW
	cXIzaP3mHbZZ6vmA1V+dAjMu8PknNDyoz/ZJZQVJWYaVVHM2koBMLV11WPr2q57jN4KZetFk4km
	uvfJ9nxwd4x94cw1gDKC4y7v3UdFvSjWE9qrbxaSx8nyaOfPsUDrt07/94qkXvY7oOcUPQyXJ5x
	NQefFO+bR0fzqP2kbWtM/2OHHyDryV5z9go=
X-Google-Smtp-Source: AGHT+IHl36txlZ2DnpOoPCFqz1xByxU8P5ZwYrAsUCUfvYkbxvxlZrZnkdBNbC0y2dru4nsT8/IocQ==
X-Received: by 2002:a05:6a21:394a:b0:1d9:c615:d1e6 with SMTP id adf61e73a8af0-1e1dfa95707mr645901637.0.1734045429176;
        Thu, 12 Dec 2024 15:17:09 -0800 (PST)
Received: from localhost.localdomain (c-67-160-120-253.hsd1.wa.comcast.net. [67.160.120.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725ef8ecdcfsm7533259b3a.159.2024.12.12.15.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 15:17:08 -0800 (PST)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/1] Documentation: hyperv: Add overview of guest VM hibernation
Date: Thu, 12 Dec 2024 15:17:00 -0800
Message-Id: <20241212231700.6977-1-mhklinux@outlook.com>
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

Add documentation on how hibernation works in a guest VM on Hyper-V.
Describe how VMBus devices and the VMBus itself are hibernated and
resumed, along with various limitations.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 Documentation/virt/hyperv/hibernation.rst | 312 ++++++++++++++++++++++
 Documentation/virt/hyperv/index.rst       |   1 +
 2 files changed, 313 insertions(+)
 create mode 100644 Documentation/virt/hyperv/hibernation.rst

diff --git a/Documentation/virt/hyperv/hibernation.rst b/Documentation/virt/hyperv/hibernation.rst
new file mode 100644
index 000000000000..9e177c1f5bae
--- /dev/null
+++ b/Documentation/virt/hyperv/hibernation.rst
@@ -0,0 +1,312 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Hibernating Guest VMs
+=====================
+
+Background
+----------
+Linux supports the ability to hibernate itself in order to save power.
+Hibernation is sometimes called suspend-to-disk, as it writes a memory
+image to disk and puts the hardware into the lowest possible power
+state. Upon resume from hibernation, the hardware is restarted and the
+memory image is restored from disk so that it can resume execution
+where it left off. See the "Hibernation" section of
+Documentation/admin-guide/pm/sleep-states.rst.
+
+Hibernation is usually done on devices with a single user, such as a
+personal laptop. For example, the laptop goes into hibernation when
+the cover is closed, and resumes when the cover is opened again.
+Hibernation and resume happen on the same hardware, and Linux kernel
+code orchestrating the hibernation steps assumes that the hardware
+configuration is not changed while in the hibernated state.
+
+Hibernation can be initiated within Linux by writing "disk" to
+/sys/power/state or by invoking the reboot system call with the
+appropriate arguments. This functionality may be wrapped by user space
+commands such "systemctl hibernate" that are run directly from a
+command line or in response to events such as the laptop lid closing.
+
+Considerations for Guest VM Hibernation
+---------------------------------------
+Linux guests on Hyper-V can also be hibernated, in which case the
+hardware is the virtual hardware provided by Hyper-V to the guest VM.
+Only the targeted guest VM is hibernated, while other guest VMs and
+the underlying Hyper-V host continue to run normally. While the
+underlying Windows Hyper-V and physical hardware on which it is
+running might also be hibernated using hibernation functionality in
+the Windows host, host hibernation and its impact on guest VMs is not
+in scope for this documentation.
+
+Resuming a hibernated guest VM can be more challenging than with
+physical hardware because VMs make it very easy to change the hardware
+configuration between the hibernation and resume. Even when the resume
+is done on the same VM that hibernated, the memory size might be
+changed, or virtual NICs or SCSI controllers might be added or
+removed. Virtual PCI devices assigned to the VM might be added or
+removed. Most such changes cause the resume steps to fail, though
+adding a new virtual NIC, SCSI controller, or vPCI device should work.
+
+Additional complexity can ensue because the disks of the hibernated VM
+can be moved to another newly created VM that otherwise has the same
+virtual hardware configuration. While it is desirable for resume from
+hibernation to succeed after such a move, there are challenges. See
+details on this scenario and its limitations in the "Resuming on a
+Different VM" section below.
+
+Enabling Guest VM Hibernation
+-----------------------------
+Hibernation of a Hyper-V guest VM is disabled by default because
+hibernation is incompatible with memory hot-add, as provided by the
+Hyper-V balloon driver. If hot-add is used and the VM hibernates, it
+hibernates with more memory than it started with. But when the VM
+resumes from hibernation, Hyper-V gives the VM only the originally
+assigned memory, and the memory size mismatch causes resume to fail.
+
+To enable a Hyper-V VM for hibernation, the Hyper-V administrator must
+enable the ACPI virtual S4 sleep state in the ACPI configuration that
+Hyper-V provides to the guest VM. Such enablement is accomplished by
+modifying a WMI property of the VM, the steps for which are outside
+the scope of this documentation but are available on the web.
+Enablement is treated as the indicator that the administrator
+prioritizes Linux hibernation in the VM over hot-add, so the Hyper-V
+balloon driver in Linux disables hot-add. Enablement is indicated if
+the contents of /sys/power/disk contains "platform" as an option. The
+enablement is also visible in /sys/bus/vmbus/hibernation. See function
+hv_is_hibernation_supported().
+
+Linux supports ACPI sleep states on x86, but not on arm64. So Linux
+guest VM hibernation is not available on Hyper-V for arm64.
+
+Initiating Guest VM Hibernation
+-------------------------------
+Guest VMs can self-initiate hibernation using the standard Linux
+methods of writing "disk" to /sys/power/state or the reboot system
+call. As an additional layer, Linux guests on Hyper-V support the
+"Shutdown" integration service, via which a Hyper-V administrator can
+tell a Linux VM to hibernate using a command outside the VM. The
+command generates a request to the Hyper-V shutdown driver in Linux,
+which sends the uevent "EVENT=hibernate". See kernel functions
+shutdown_onchannelcallback() and send_hibernate_uevent(). A udev rule
+must be provided in the VM that handles this event and initiates
+hibernation.
+
+Handling VMBus Devices During Hibernation & Resume
+--------------------------------------------------
+The VMBus bus driver, and the individual VMBus device drivers,
+implement suspend and resume functions that are called as part of the
+Linux orchestration of hibernation and of resuming from hibernation.
+The overall approach is to leave in place the data structures for the
+primary VMBus channels and their associated Linux devices, such as
+SCSI controllers and others, so that they are captured in the
+hibernation image. This approach allows any state associated with the
+device to be persisted across the hibernation/resume. When the VM
+resumes, the devices are re-offered by Hyper-V and are connected to
+the data structures that already exist in the resumed hibernation
+image.
+
+VMBus devices are identified by class and instance GUID. (See section
+"VMBus device creation/deletion" in
+Documentation/virt/hyperv/vmbus.rst.) Upon resume from hibernation,
+the resume functions expect that the devices offered by Hyper-V have
+the same class/instance GUIDs as the devices present at the time of
+hibernation. Having the same class/instance GUIDs allows the offered
+devices to be matched to the primary VMBus channel data structures in
+the memory of the now resumed hibernation image. If any devices are
+offered that don't match primary VMBus channel data structures that
+already exist, they are processed normally as newly added devices. If
+primary VMBus channels that exist in the resumed hibernation image are
+not matched with a device offered in the resumed VM, the resume
+sequence waits for 10 seconds, then proceeds. But the unmatched device
+is likely to cause errors in the resumed VM.
+
+When resuming existing primary VMBus channels, the newly offered
+relids might be different because relids can change on each VM boot,
+even if the VM configuration hasn't changed. The VMBus bus driver
+resume function matches the class/instance GUIDs, and updates the
+relids in case they have changed.
+
+VMBus sub-channels are not persisted in the hibernation image. Each
+VMBus device driver's suspend function must close any sub-channels
+prior to hibernation. Closing a sub-channel causes Hyper-V to send a
+RESCIND_CHANNELOFFER message, which Linux processes by freeing the
+channel data structures so that all vestiges of the sub-channel are
+removed. By contrast, primary channels are marked closed and their
+ring buffers are freed, but Hyper-V does not send a rescind message,
+so the channel data structure continues to exist. Upon resume, the
+device driver's resume function re-allocates the ring buffer and
+re-opens the existing channel. It then communicates with Hyper-V to
+re-open sub-channels from scratch.
+
+The Linux ends of Hyper-V sockets are forced closed at the time of
+hibernation. The guest can't force closing the host end of the socket,
+but any host-side actions on the host end will produce an error.
+VMBus devices use the same suspend function for the "freeze" and the
+"poweroff" phases, and the same resume function for the "thaw" and
+"restore" phases. See the "Entering Hibernation" section of
+Documentation/driver-api/pm/devices.rst for the sequencing of the
+phases.
+
+Detailed Hibernation Sequence
+-----------------------------
+1. The Linux power management (PM) subsystem prepares for
+   hibernation by freezing user space processes and allocating
+   memory to hold the hibernation image.
+2. As part of the "freeze" phase, Linux PM calls the "suspend"
+   function for each VMBus device in turn. As described above, this
+   function removes sub-channels, and leaves the primary channel in
+   a closed state.
+3. Linux PM calls the "suspend" function for the VMBus bus, which
+   closes any Hyper-V socket channels and unloads the top-level
+   VMBus connection with the Hyper-V host.
+4. Linux PM disables non-boot CPUs, creates the hibernation image in
+   the previously allocated memory, then re-enables non-boot CPUs.
+   The hibernation image contains the memory data structures for the
+   closed primary channels, but no sub-channels.
+5. As part of the "thaw" phase, Linux PM calls the "resume" function
+   for the VMBus bus, which re-establishes the top-level VMBus
+   connection and requests that Hyper-V re-offer the VMBus devices.
+   As offers are received for the primary channels, the relids are
+   updated as previously described.
+6. Linux PM calls the "resume" function for each VMBus device. Each
+   device re-opens its primary channel, and communicates with Hyper-V
+   to re-establish sub-channels if appropriate. The sub-channels
+   are re-created as new channels since they were previously removed
+   entirely in Step 2.
+7. With VMBus devices now working again, Linux PM writes the
+   hibernation image from memory to disk.
+8. Linux PM repeats Steps 2 and 3 above as part of the "poweroff"
+   phase. VMBus channels are closed and the top-level VMBus
+   connection is unloaded.
+9. Linux PM disables non-boot CPUs, and then enters ACPI sleep state
+   S4. Hibernation is now complete.
+
+Detailed Resume Sequence
+------------------------
+1. The guest VM boots into a fresh Linux OS instance. During boot,
+   the top-level VMBus connection is established, and synthetic
+   devices are enabled. This happens via the normal paths that don't
+   involve hibernation.
+2. Linux PM hibernation code reads swap space is to find and read
+   the hibernation image into memory. If there is no hibernation
+   image, then this boot becomes a normal boot.
+3. If this is a resume from hibernation, the "freeze" phase is used
+   to shutdown VMBus devices and unload the top-level VMBus
+   connection in the running fresh OS instance, just like Steps 2
+   and 3 in the hibernation sequence.
+4. Linux PM disables non-boot CPUs, and transfers control to the
+   read-in hibernation image. In the now-running hibernation image,
+   non-boot CPUs are restarted.
+5. As part of the "resume" phase, Linux PM repeats Steps 5 and 6
+   from the hibernation sequence. The top-level VMBus connection is
+   re-established, and offers are received and matched to primary
+   channels in the image. Relids are updated. VMBus device resume
+   functions re-open primary channels and re-create sub-channels.
+6. Linux PM exits the hibernation resume sequence and the VM is now
+   running normally from the hibernation image.
+
+Key-Value Pair (KVP) Pseudo-Device Anomalies
+--------------------------------------------
+The VMBus KVP device behaves differently from other pseudo-devices
+offered by Hyper-V.  When the KVP primary channel is closed, Hyper-V
+sends a rescind message, which causes all vestiges of the device to be
+removed. But Hyper-V then re-offers the device, causing it to be newly
+re-created. The removal and re-creation occurs during the "freeze"
+phase of hibernation, so the hibernation image contains the re-created
+KVP device. Similar behavior occurs during the "freeze" phase of the
+resume sequence while still in the fresh OS instance. But in both
+cases, the top-level VMBus connection is subsequently unloaded, which
+causes the device to be discarded on the Hyper-V side. So no harm is
+done and everything still works.
+
+Virtual PCI devices
+-------------------
+Virtual PCI devices are physical PCI devices that are mapped directly
+into the VM's physical address space so the VM can interact directly
+the hardware. vPCI devices include those accessed via what Hyper-V
+calls "Discrete Device Assignment" (DDA), as well as SR-IOV NIC
+Virtual Functions (VF) devices. See Documentation/virt/hyperv/vpci.rst.
+
+Hyper-V DDA devices are offered to guest VMs after the top-level VMBus
+connection is established, just like VMBus synthetic devices. They are
+statically assigned to the VM, and their instance GUIDs don't change
+unless the Hyper-V administrator makes changes to the configuration.
+DDA devices are represented in Linux as virtual PCI devices that have
+a VMBus identity as well as a PCI identity. Consequently, Linux guest
+hibernation first handles DDA devices as VMBus devices in order to
+manage the VMBus channel. But then they are also handled as PCI
+devices using the hibernation functions implemented by their native
+PCI driver.
+
+SR-IOV NIC VFs similarly have a VMBus identity as well as a PCI
+identity, and overall are processed similarly to DDA devices. A
+difference is that VFs are not offered to the VM during initial boot
+of the VM. Instead, the VMBus synthetic NIC driver first starts
+operating and communicates to Hyper-V that it is prepared to accept a
+VF, and then the VF offer is made. However, if the VMBus connection is
+unloaded and then re-established without the VM being rebooted (as
+happens in Steps 3 and 5 in the Detailed Hibernation Sequence above,
+and similarly in the Detailed Resume Sequence), VFs are already part
+of the VM and are offered to the re-established VMBus connection
+without intervention by the synthetic NIC driver.
+
+
+Resuming on a Different VM
+--------------------------
+This scenario occurs in the Azure public cloud in that a hibernated
+customer VM only exists as saved configuration and disks -- the VM no
+longer exists on any Hyper-V host. When the customer VM is resumed, a
+new Hyper-V VM with identical configuration is created, likely on a
+different Hyper-V host. That new Hyper-V VM becomes the resumed
+customer VM, and the steps the Linux kernel takes to resume from the
+hibernation image must work in that new VM.
+
+While the disks and their contents are preserved from the original VM,
+the Hyper-V-provided VMBus instance GUIDs of the disk controllers and
+other synthetic devices would typically be different. The difference
+would cause the resume from hibernation to fail, so several things are
+done to solve this problem:
+
+* For VMBus synthetic devices that support only a single instance,
+  Hyper-V always assigns the same instance GUIDs. For example, the
+  Hyper-V mouse, the shutdown pseudo-device, the time sync pseudo
+  device, etc., always have the same instance GUID, both for local
+  Hyper-V installs as well as in the Azure cloud.
+
+* VMBus synthetic SCSI controllers may have multiple instances in a
+  VM, and in the general case instance GUIDs vary from VM to VM.
+  However, Azure VMs always have exactly two synthetic SCSI
+  controllers, and Azure code overrides the normal Hyper-V behavior
+  so these controllers are always assigned the same two instance
+  GUIDs. Consequently, when a customer VM is resumed on a newly
+  created VM, the instance GUIDs match. But this guarantee does not
+  hold for local Hyper-V installs.
+
+* Similarly, VMBus synthetic NICs may have multiple instances in a
+  VM, and the instance GUIDs vary from VM to VM. Again, Azure code
+  overrides the normal Hyper-V behavior so that the instance GUID
+  of a synthetic NIC in a customer VM does not change, even if the
+  customer VM is deallocated or hibernated, and then re-constituted
+  on a newly created VM. As with SCSI controllers, this behavior
+  does not hold for local Hyper-V installs.
+
+* vPCI devices do not have the same instance GUIDs when resuming
+  from hibernation on a newly created VM. Consequently, Azure does
+  not support hibernation for VMs that have DDA devices such as
+  NVMe controllers or GPUs. For SR-IOV NIC VFs, Azure removes the
+  VF from the VM before it hibernates so that the hibernation image
+  does not contain a VF device. When the VM is resumed it
+  instantiates a new VF, rather than trying to match against a VF
+  that is present in the hibernation image. Because Azure must
+  remove any VFs before initiating hibernation, Azure VM
+  hibernation must be initiated externally from the Azure Portal or
+  Azure CLI, which in turn uses the Shutdown integration service to
+  tell Linux to do the hibernation. If hibernation is self-initiated
+  within the Azure VM, VFs remain in the hibernation image, and are
+  not resumed properly.
+
+In summary, Azure takes special actions to remove VFs and to ensure
+that VMBus device instance GUIDs match on a new/different VM, allowing
+hibernation to work for most general-purpose Azure VMs sizes. While
+similar special actions could be taken when resuming on a different VM
+on a local Hyper-V install, orchestrating such actions is not provided
+out-of-the-box by local Hyper-V and so requires custom scripting.
diff --git a/Documentation/virt/hyperv/index.rst b/Documentation/virt/hyperv/index.rst
index 79bc4080329e..c84c40fd61c9 100644
--- a/Documentation/virt/hyperv/index.rst
+++ b/Documentation/virt/hyperv/index.rst
@@ -11,4 +11,5 @@ Hyper-V Enlightenments
    vmbus
    clocks
    vpci
+   hibernation
    coco
-- 
2.25.1


