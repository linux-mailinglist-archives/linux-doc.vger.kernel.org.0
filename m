Return-Path: <linux-doc+bounces-92232-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2JojMNyMLGr3SQQAu9opvQ
	(envelope-from <linux-doc+bounces-92232-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 00:49:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4481F67CE5C
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 00:49:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=bMUhblLH;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92232-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92232-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D41AC352C0BE
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 22:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396943D810B;
	Fri, 12 Jun 2026 22:40:02 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3493CFF6A;
	Fri, 12 Jun 2026 22:40:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304002; cv=none; b=K2IkFmNvoswF8OgJWI1INd4c3lQ+vKZQWwtNmKvAsgJS2ziJEl9GVyasp8MtDAspvEF1Hz7Fca6ObmpYCgVr8IAscbO/7QK17+4lyzS5uzMBWCVoyEdVv8nNdiz4l087lCR0cONZ1U/MM8JK7N33mE0oGv+8cjuXciLZVF/oTwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304002; c=relaxed/simple;
	bh=9VbIKzjq1ZVFU4ssBMLXHnU61OK41Cjft/BUYsvCpn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kMFumyIKnIjrESkZPq7K5XzgAp7jLw4UhQ0MgbDamqtuJpVBT5jNrezzoKaCrdLYewpITLlDw3pIo7eU3N6yDG2x0OfZZUP33f8FbXcrsjKc5pEoXsh7w3WVs7EYw7254w8KP9JE2wT44WtcyoIxqccHNLzG5hcDTN/dEePhP1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bMUhblLH; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41A783543;
	Fri, 12 Jun 2026 15:39:55 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3FB13FB7F;
	Fri, 12 Jun 2026 15:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781304000; bh=9VbIKzjq1ZVFU4ssBMLXHnU61OK41Cjft/BUYsvCpn0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bMUhblLHGWnXGyUUWmriFzchq0ra2BAVIec9NzgGo4VbmlU8VYcuoX0cuq8okD7uX
	 +zzt460RU07DiJzPzyrj7IU7+JKNdY4udMdRKsijV3ZCNoq0s9gu/8wtL9v7DvsWxq
	 b6RAT8atV35QJJZZde8S0fOh37JCKLj/oVV2/i/Q=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v4 20/31] fs/stlmfs: Document ARM SCMI Telemetry filesystem
Date: Fri, 12 Jun 2026 23:37:50 +0100
Message-ID: <20260612223802.1337232-21-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612223802.1337232-1-cristian.marussi@arm.com>
References: <20260612223802.1337232-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,gmail.com,linaro.org,st.com,oss.nxp.com,amd.com,ti.com,arm.com,linux.dev,meta.com,lwn.net,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-92232-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:arm-scmi@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:sudeep.holla@kernel.org,m:james.quinlan@broadcom.com,m:f.fainelli@gmail.com,m:vincent.guittot@linaro.org,m:etienne.carriere@st.com,m:peng.fan@oss.nxp.com,m:michal.simek@amd.com,m:d-gole@ti.com,m:jic23@kernel.org,m:elif.topuz@arm.com,m:lukasz.luba@arm.com,m:philip.radford@arm.com,m:brauner@kernel.org,m:souvik.chakravarty@arm.com,m:leitao@kernel.org,m:kas@kernel.org,m:puranjay@kernel.org,m:usama.arif@linux.dev,m:kernel-team@meta.com,m:cristian.marussi@arm.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cristian.marussi@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxfoundation.org:email,vger.kernel.org:from_smtp,arm.com:dkim,arm.com:email,arm.com:mid,arm.com:from_mime,lwn.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4481F67CE5C

Introduce initial ARM SCMI Telemetry filesystem documentation.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v3 --> v4
 - refactored mount description
v2 --> v3
 - changed tstamp_exp to tstamp_rate
---
 Documentation/filesystems/stlmfs.rst | 210 +++++++++++++++++++++++++++
 1 file changed, 210 insertions(+)
 create mode 100644 Documentation/filesystems/stlmfs.rst

diff --git a/Documentation/filesystems/stlmfs.rst b/Documentation/filesystems/stlmfs.rst
new file mode 100644
index 000000000000..123e0e68e041
--- /dev/null
+++ b/Documentation/filesystems/stlmfs.rst
@@ -0,0 +1,210 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================================
+STLMFS - Arm SCMI Telemetry Pseudo Filesystem
+=============================================
+
+.. contents::
+
+Overview
+========
+
+ARM SCMI is a System and Configuration Management protocol, based on a
+client-server model, that defines a number of messages that allows a
+client/agent like Linux to discover, configure and make use of services
+provided by the server/platform firmware.
+
+SCMI v4.0 introduced support for System Telemetry, through which an agent
+can dynamically enumerate configure and collect Telemetry Data Events (DE)
+exposed by the platform.
+
+This filesystem, in turn, exposes to userspace the set of discovered DEs
+allowing for their configuration and retrieval.
+
+Rationale
+=========
+
+**Why not using SysFS/KernFS or DebugFS ?**
+
+The provided userspace interface aims to satisfy 2 main concurrent
+requirements:
+
+ - expose an FS-based human-readable interface that can be used to
+   discover, configure and access Telemetry data directly easily also from
+   the shell without any special tool
+
+ - allow also alternative machine-friendly, more-performant, binary
+   interfaces that can be used by custom tools without the overhead of
+   multiple accesses through the VFS layers and the hassle of navigating
+   vast filesystem tree structures
+
+All of the above is meant to be available on production systems, not
+simply as a tool for development or testing, so debugFS is NOT an option
+here.
+
+An initial design based on SysFS and chardev/ioctl based interfaces was
+dropped in favour of this full-fledged filesystem implementation since:
+
+- SysFS is a standard way to expose device related properties using a few
+  common helpers built on kernfs; this means, though, that unfortunately in
+  our scenario we would have to generate a dummy simple device for each
+  discovered DE.
+  This by itself seems an abuse of the SysFS framework, but even ignoring
+  this, the sheer number of potentially discoverable DEs (in the order of
+  tens of thousands easily) would have led to the creation of a sensibly
+  vast number of dummy DE devices.
+
+- SysFS usage itself has its well-known constraints and best practices,
+  like the one-file/one-value rule, that hardly cope with SCMI Telemetry
+  needs.
+
+- The need to implement more complex file operations (ioctls/mmap) in
+  order to support the alternative binary interfaces does not fit with
+  SysFS/kernFS facilities.
+
+- Given the nature of the Telemetry protocol, the hybrid approach with
+  chardev/ioctl was itself problematic: on one side being upper-limited
+  in the number of chardev potentially created by the minor numbers
+  availability, on the other side the hassle of having to maintain a
+  completely different interface on the side of a FS based one.
+
+Design
+======
+
+STLMFS is a pseudo filesystem used to expose ARM SCMI Telemetry data
+discovered dynamically at run-time via SCMI.
+
+Inodes are all dynamically created at mount-time from a dedicated
+kmem_cache based on the gathered available SCMI Telemetry information.
+
+Since inodes represent the discovered Telemetry entities, which in turn are
+statically defined at the platform level and immutable throughout the same
+session (boot), allocated inodes are freed only at unmount-time and the
+user is not allowed to delete or create any kind of file within the STLMFS
+filesystem after mount has completed.
+
+A single instance of STLMFS is created at the filesystem level, using
+get_tree_single(), given that the same SCMI backend entities will be
+involved no matter how many times you mount it.
+
+STLMFS configurations gets appplied by issuing the related SCMI commands to
+the backend SCMI platform server: for such reason any configuration applied
+by this FS interface will survive the unmount or the unload of the module, but
+not a reboot.
+
+Mountpoints
+===========
+
+A pre-defined mountpoint is available at::
+
+	/sys/fs/arm_telemetry/
+
+The filesystem can be typically mounted with::
+
+	mount -t stlmfs none /sys/fs/arm_telemetry
+
+It does NOT support namespaces (no FS_USERNS_MOUNT) since it would NOT make
+sense to allow this FS to be mounted inside a container.
+
+All files are created world readable and, where needed for configuration,
+owner writable.
+
+Usage
+=====
+
+.. Note::
+	See Documentation/ABI/testing/stlmfs for a detailed description of
+	this ABI.
+
+Once mounted the FS will proceed to create a top subdirectory for each of the
+discovered SCMI Telemetry instances named as 'tlm_<N>' under which it will
+create the following directory structure::
+
+	/sys/fs/arm_telemetry/tlm_0/
+	|-- all_des_enable
+	|-- all_des_tstamp_enable
+	|-- available_update_intervals_ms
+	|-- current_update_interval_ms
+	|-- de_implementation_version
+	|-- des/
+	|   |-- ...
+	|   |-- ...
+	|   `-- ...
+	|-- des_bulk_read
+	|-- des_single_sample_read
+	|-- groups
+	|   |-- ...
+	|   |-- ...
+	|   `-- ...
+	|-- intervals_discrete
+	|-- reset
+	|-- tlm_enable
+	`-- version
+
+Each subdirectory is defined as follows.
+
+des/
+----
+A subtree containing in turn one subdirectory for each discovered DE and
+named by Data Event ID in hexadecimal form as in::
+
+	|-- des
+	|   |-- 0x00000000
+	|   |-- 0x00000016
+	|   |-- 0x00001010
+	|   |-- 0x0000A000
+	|   |-- 0x0000A001
+	|   |-- 0x0000A002
+	|   |-- 0x0000A005
+	|   |-- ..........
+	|   |-- ..........
+	|   |-- 0x0000A007
+	|   |-- 0x0000A008
+	|   |-- 0x0000A00A
+	|   |-- 0x0000A00B
+	|   |-- 0x0000A00C
+	|   `-- 0x0000A010
+
+where each dedicated DE subdirectory in turn will contain files used to
+describe some DE characteristics, configure it, or read its current data
+value as in::
+
+	tlm_0/des/0xA001/
+	|-- compo_instance_id
+	|-- compo_type
+	|-- enable
+	|-- instance_id
+	|-- name
+	|-- persistent
+	|-- tstamp_enable
+	|-- tstamp_rate
+	|-- type
+	|-- unit
+	|-- unit_exp
+	`-- value
+
+groups/
+-------
+
+An optional subtree containing in turn one subdirectory for each discovered
+Group and named by Group ID as in::
+
+	|-- groups
+	|   |-- 0
+	|   |-- ..
+	|   `-- 1
+
+where each dedicated GROUP subdirectory in turn will contain files used to
+describe some Group characteristics, configure it, or read its current data
+values, as in::
+
+	scmi_tlm_0/groups/0/
+	|-- available_update_intervals_ms
+	|-- composing_des
+	|-- current_update_interval_ms
+	|-- des_bulk_read
+	|-- des_single_sample_read
+	|-- enable
+	|-- intervals_discrete
+	`-- tstamp_enable
+
-- 
2.54.0


