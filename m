Return-Path: <linux-doc+bounces-41399-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C202A69E5D
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 03:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 500F88A67C7
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 02:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BEF1EB19B;
	Thu, 20 Mar 2025 02:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="HAQfnq0O"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302725D477
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 02:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742438419; cv=none; b=Q0P/IYw9G0d0GJLqcAcVFCho1BjQDi9wPqkWgDYd19opKnjRZiI40judVOGum+CIQPoJ9NMGiES8PvlHzO3bEESmr7YuPl/rqA1OOkLo2Q1wI2CCwpUias7s7FZ/nIvfvIuHnqqSM+sGGUGDv/KWsE2OMEJHGmcxtDeZgi7urK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742438419; c=relaxed/simple;
	bh=iS8K2ad2L9fb7Amq/QOAuUaMBSjz/+OSRSXUw7oHdt0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=tKGzaUTmLIARvGD6RRSRJI+KgJ6HPQFStNClzNvpSa45StDSu2P5qXD8FXnIyt7RPO3KBTJZpPxuADVhgoKoOtFzs6EufLR0B+jNRpV/owDGJfe+XxDyEEWE7Ema7bZ3vACXvb6mIvsTob0lRWtsWMiKfatn/L/XzwzOzT6SA1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=HAQfnq0O; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c559b3eb0bso15380185a.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 19:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1742438415; x=1743043215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Oh+wZ0iaEUOZozW+9qtsMspd/PywyTewkvRRfAF3O8=;
        b=HAQfnq0ObAGxPxQ3R1G8EpwecFyN/Xh/9ufh3lD4vyRshO0LpNUHmO1DAHPEQlCKk0
         Tg2DqolOXc7OtazFrc7kO7OPAWF1YWk7iw9y2g7WAAUYcREBR2J8h+GZc4TQNLI7hBIj
         jybTdUpm0c+4kLH5hRfOx1Y747Rfv9E8wNEdBKmUztBaW9oi3mVfF4lvFeypEskG00Kq
         zKD+EJXlA1/uRMmL1NaoyyXhfWmdFUXZKXLzj5ZmAQXUfNyJJYIfD5L/EESSkowidiud
         a3nEC8fToWY8p7FP6TZDh9w40S/3ejyvBxshoWHwCdIoxZvTfKQ99hiiT8Q1IdAwQkXQ
         L0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742438415; x=1743043215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Oh+wZ0iaEUOZozW+9qtsMspd/PywyTewkvRRfAF3O8=;
        b=ND1yq/zlnEzFOMuN65wz0L6TIyFGb40r2+n+CueQj9Rejh/rBO+wNEmDO1QriMfFDp
         myi9jOR0JVNaQ9MTxNfSnfGnA0mwHUaCVkCm/w8t6nJqNOCSdnGpHD36nmDwDXZkEUL3
         tMIVXMa3Qd9Pi9QGjJTxBVtiNQqjh7ni30jlJTFseK5o5IxVkeGgFboBqqWMopCgNkcz
         Rxv2SSopyVzWlJ/qwn0b9oLuhbM1XWwmU32nr3OqZlap+OSg2VeUFEqdxXTABC0YwGUf
         5gVKEZ0en0k9raT0fzoCkY9P/xjqTBpqIhSzdtVv8G9+wAHcLqkpRF24pB9eYAcKXdZE
         fBUg==
X-Forwarded-Encrypted: i=1; AJvYcCWNrJaJ6+Qgl62HgTIcJtKEATnf43FQDLTgWebzKbJmwFQZXMAm1s5a+71A+vX357h21wDzmh1vYGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLcmZlCa7DsWm8RW2epdxMuKmjPDGlZXuX77mnjQSmbI41pYaI
	oLf9Yhs5w4Qp15QUz7zcq8PIJr5ETHCjajEgm4/MLMvwvPe78eUXCCtyBRiAKaMSQ/ylzZttZt5
	+SDc=
X-Gm-Gg: ASbGncvXtNt3nK3iG3F6B470zYZ2YpCR4qYKU4lE13Uvb3HUZwzPvqc8BNTCP+r81mm
	coUHymFU3BBdZXwIAR4wh+ph5nkeavGdNynyChBTZ6b80i8yas4yeWPe6g4u+LS2KLbDHJ93UOq
	f0BfrSFowsT1wq6jVFBiS6h9WyItTKFxYr+WafTZH+bDe4YcFnYmDs+EB9is6MaxvtFvXXn/cdW
	AAEXKpcNhxrqpbuWvtwqfmL//zm0vB+F9HP/R2fR7ZMuxy/OpeymI4VsBnVuc0ywQbkeB/j+OCS
	caoE9BsIJmXejQpWVTeuPg5zfwtJ4v/rYH1CMAo4sfcJJilGB0KhfUvdpau+1pd0RsMADOMOQ4v
	MQl0503xd7/f1cZxYVvZQCKHEg8Y6k2dc
X-Google-Smtp-Source: AGHT+IGIHM7x9JmjXVe5QvHNWUIW0u0BUMH/A7Ywm/vljWGz/qU956ZjDvvuxrGdrZxMRIAN12ftNA==
X-Received: by 2002:a05:620a:4611:b0:7c5:42c8:ac89 with SMTP id af79cd13be357-7c5b0c95cdamr219473385a.33.1742438414916;
        Wed, 19 Mar 2025 19:40:14 -0700 (PDT)
Received: from soleen.c.googlers.com.com (249.60.48.34.bc.googleusercontent.com. [34.48.60.249])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c4dd9fsm947815985a.4.2025.03.19.19.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:40:14 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: changyuanl@google.com,
	graf@amazon.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	jgowans@amazon.com,
	jgg@nvidia.com
Subject: [RFC v1 0/3] Live Update Orchestrator
Date: Thu, 20 Mar 2025 02:40:08 +0000
Message-ID: <20250320024011.2995837-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pasha Tatashin <tatashin@google.com>

This series applies on top of the kho v5 patch series:
https://lore.kernel.org/all/20250320015551.2157511-1-changyuanl@google.com

The git branch for this series:
https://github.com/googleprodkernel/linux-liveupdate/commits/luo/rfc-v1

What is Live Update?
Live Update is a specialized reboot process where selected devices are
kept operational across a kernel transition. For these devices, DMA and
interrupt activity may continue uninterrupted during the kernel reboot.

Please find attached a series of three patches introducing the Live
Update Orchestrator (LUO), a new kernel subsystem designed to
facilitate live kernel updates with minimal downtime. The primary
use case is in cloud environments, allowing hypervisor updates without
fully disrupting running virtual machines by keeping selected devices
alive across the reboot boundary. This series also inroduces a device
layer infrastructure (dev_liveupdate) to be used with LUO.

The core of LUO is a state machine that tracks the progress of a live
update, along with a callback API that allows other kernel subsystems
to participate in the process. Example subsystems that can hook into LUO
include: kvm, iommu, interrupts, the Device Layer (through the
dev_liveupdate infrastructure introduced in patch 2), and mm.

LUO uses KHO to transfer memory state from Old Kernel to the New Kernel.

LUO can be controlled through sysfs interface. It provides the following
files under: `/sys/kernel/liveupdate/{state, prepare, finish}`

The `state` file can contain the following values:

normal
The system is operating normally, and no live update is in progress.
This is the initial state.

prepared
The system has begun preparing for a live update. This state is reached
after subsystems have successfully responded to the `LIVEUPDATE_PREPARE`
callback. It indicates that initial preparation is done, but it does not
necessarily mean all state has been serialized; subsystems can save more
state during the subsequent `LIVEUPDATE_REBOOT` callback.

updated
The new kernel has successfully taken over, and any suspended operations
are resumed. However, the system has not yet fully transitioned back to
a normal operational state; this happens after the `LIVEUPDATE_FINISH`
callback is invoked.

Writing '1' to the `prepare` file triggers a transition from normal
to prepared (if possible), which involves invoking the
`LIVEUPDATE_PREPARE` notifiers. Similarly, writing to the `finish` file
attempts a transition to the normal state from updated via the
`LIVEUPDATE_FINISH` notifiers.

The state machine ensures that operations are performed in the correct
sequence and provides a mechanism to track and recover from potential
failures, and select devices and subsystems that should participate in
live update sequence.

==============
dev_liveupdate
==============

To allow device drivers and bus drivers to participate, the second patch
introduces the `dev_liveupdate` infrastructure. This provides a
`liveupdate()` callback in `struct device_driver` and `struct bus_type`,
which receives the LUO state machine events.

The `dev_liveupdate` component also adds a "liveupdate" sysfs directory
under each device (e.g., `/sys/devices/.../device/liveupdate/`). This
directory contains the following attributes:

`requested`
A read-write attribute allowing userspace to control whether a device
should participate in the live update sequence. Writing `1` requests the
device and its ancestors (that support live update) be preserved.
Writing `0` requests the device be excluded. This attribute can only be
modified when LUO is in the `normal` state.

`preserved`
A read-only attribute indicating whether the device's state was
preserved during the `prepare` and `reboot` stages.

`reclaimed`
A read-only attribute indicating whether the device was successfully
re-attached and resumed operation in the new kernel after an update.
For example, a VM to which this device was passthrough has been resumed.

By default, devices do not participate in the live update. Userspace can
explicitly request participation by writing '1' to the `requested` file.

TODO:
- Expand, improve, clean-up documentation
- Embed a flow chart via Graphviz
- Add selftests for LUO and dev_liveupdate
- Add debug interface to allow LUO to perform LIVEUPDATE_REBOOT via sysfs
  to help developers of subsystems and device drivers.
- dev_liveupdate should add KHO node names to dev / drivers/ bus, and also
  dev->lu should contain a link to a KHO node for this device that is allocated
  and freed through dev_liveupdate
- dev_liveupdate should also partcipate during boot to track the reclaimed
  devices

Pasha Tatashin (3):
  luo: Live Update Orchestrator
  luo: dev_liveupdate: Add device live update infrastructure
  luo: x86: Enable live update support

 .../ABI/testing/sysfs-kernel-liveupdate       |  51 ++
 Documentation/admin-guide/index.rst           |   1 +
 Documentation/admin-guide/liveupdate.rst      |  23 +
 Documentation/driver-api/index.rst            |   1 +
 Documentation/driver-api/liveupdate.rst       |  23 +
 MAINTAINERS                                   |  13 +
 arch/x86/Kconfig                              |   1 +
 drivers/base/Makefile                         |   1 +
 drivers/base/core.c                           |  25 +-
 drivers/base/dev_liveupdate.c                 | 816 ++++++++++++++++++
 include/linux/dev_liveupdate.h                | 109 +++
 include/linux/device.h                        |   6 +
 include/linux/device/bus.h                    |   4 +
 include/linux/device/driver.h                 |   4 +
 include/linux/liveupdate.h                    | 238 +++++
 init/Kconfig                                  |   2 +
 kernel/Kconfig.liveupdate                     |  19 +
 kernel/Makefile                               |   1 +
 kernel/liveupdate.c                           | 749 ++++++++++++++++
 kernel/reboot.c                               |   4 +
 20 files changed, 2083 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-liveupdate
 create mode 100644 Documentation/admin-guide/liveupdate.rst
 create mode 100644 Documentation/driver-api/liveupdate.rst
 create mode 100644 drivers/base/dev_liveupdate.c
 create mode 100644 include/linux/dev_liveupdate.h
 create mode 100644 include/linux/liveupdate.h
 create mode 100644 kernel/Kconfig.liveupdate
 create mode 100644 kernel/liveupdate.c

-- 
2.49.0.395.g12beb8f557-goog


