Return-Path: <linux-doc+bounces-33511-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E22D79F99AC
	for <lists+linux-doc@lfdr.de>; Fri, 20 Dec 2024 19:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ED82189B547
	for <lists+linux-doc@lfdr.de>; Fri, 20 Dec 2024 18:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B003D21E0AD;
	Fri, 20 Dec 2024 18:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="kfogAW+r"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081A61A0B08
	for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734719471; cv=none; b=mAJNgf6e84XPXXd1pPIEsAarRe1hMEC9ghLIFtpHBYPIol1rISIL1twad3OECSUFfO1hZq8JJkGgRVZ7aXPVa5R3AApu0VwPTKbWTQevoTiMNGfpjWt4BaCg4NrBcE5IrTF5+akO+8G+nJFbQS/jAHYCDbLTHvSxkJnkVoWlSo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734719471; c=relaxed/simple;
	bh=Pp6Ldf58PYunvY6VQcSqpnxNdU2lLM5QRxoBrK89u/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UWd6i5P0+8lzGzz/jfRUzIC1Z7ME/73qgUbFMvZh8seXPI7Ma7/HLxAKQ6Ke5mMtUQw4hZdhB8oqKDZssVWVK+QMWPhTO8uJyfRyGD3GCTAxrzJoys2sSCpL7Q0JZuBuFg/tJ1P3yEcUhIkyan1lOWRkQjCcNAF1oZNQ+hCKwus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=kfogAW+r; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467918c35easo30053191cf.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 10:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1734719468; x=1735324268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7LqhFf40ELF1z9a1LHRAa1GlyoDFrXmdQu6fcG+/PmI=;
        b=kfogAW+ra8n4MxhzST7MS2gEZ39IVSYiMp4yq3QtFLiPWyomzmivAJIg9i+zQaswoi
         /fEBUv+nZ4H/2RgBWs+byCIBEZD9elyqyrvWRGUV2HPh/WblMExBBvvAtanAUHDrAGxN
         RAgyAg1vYtOxX3XQFBb19mbPhMhKSbfGvnp0vdVZPs0Z63PbViZE3ChpFTs8w/RzFVQ7
         bDuCOJ63SloeBuhRXorM97c9I7cXdSXzXr4wINo1Hifc6UteIrf9S5kbLAKTODBgQ8bs
         vlk3fhL5DIF2sVZtFt8HzmirysB3qwyrTHCEKviUyeybRazVYH1vwM6sDDaouSGOHzLS
         qUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734719468; x=1735324268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LqhFf40ELF1z9a1LHRAa1GlyoDFrXmdQu6fcG+/PmI=;
        b=wkub+xgWFxSa/hBPBlsJNqB2ciqML9w0+Sie5U8JrrobZz3hMf8RCdh5xzp4mzed+N
         ZDPFGMZEIGRelCoXfqxRSKsw+MntT756qKM5sWeY2EY9kR6PaQRqYeLXf5Kvvi75efH5
         p6IFeP4D/sZXJHpWXTDn8OwzVnbzwkri/3MimvH4Mn5KhaAXzd2GSd0Kw9yERCrP09S7
         OTSRVdnZadge/8ikeoeotkCuLV/Vh28S41HKPFWiglcviGrFY+YxcN3w6MoKQoFMtvi1
         l/5onA0GXJMXH+bHYj8alk57BcxUOPCyaBLtgcauDHIVt2gPOg3W7Fm5NJMEXK/65XQl
         7ElA==
X-Gm-Message-State: AOJu0Yz49+VZkOhlNfKO4GvSv/gpKn/ljga9iwbjyxEKqx476ZyPSFOF
	F1HQEwNu/IN5VgCOwanNNej0Vs0sM7jIneZf1emmxD75vBjdB/DJ9oq2GBRQo68=
X-Gm-Gg: ASbGncuXaT+TyMBztQO+Xs9saQDAA7/L4nRZfBtIjUZIsTqe9TbUzcrApYpkw8Dyaxg
	IMXx7wPRPW365i1O8EjhkXZFjyejr8/6jctZU6ze8tAP3MFozyw2+LolNckWqfKbrDPXqq6HrDZ
	XHZ/kahdXB0U5sVhs82eMjtWG0oKig0JCXYCLFZxLjI2s6KCLvOcRpcbIHyhVZGTX/irc4hJZIR
	U1syvLT9gXvleLIbPqIRVUNQXhpNbrIM33UStu9FUpzm+8CHzkoRqyO0ZJIqkMdhSSzDyt2eMIO
	pUJJwANGTYeti4Ol86mzGqfE4SuuBFGteZWmyrIJf5mH
X-Google-Smtp-Source: AGHT+IG3VokA/S8fofMspA55D5E3KmSdSbGr/5Yuv/solpuLg8rBGZZ4rdOtCnC4ib5JVUy6xBuUew==
X-Received: by 2002:ac8:5952:0:b0:467:b7de:da93 with SMTP id d75a77b69052e-46a4a8baed3mr53699701cf.6.1734719467879;
        Fri, 20 Dec 2024 10:31:07 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2bc86asm158342685a.16.2024.12.20.10.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 10:31:06 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	kernel-team@meta.com,
	corbet@lwn.net,
	david@redhat.com,
	osalvador@suse.de,
	akpm@linux-foundation.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	gregkh@linuxfoundation.org,
	rafael@kernel.org
Subject: [PATCH v2] mm: add build-time option for hotplug memory default online type
Date: Fri, 20 Dec 2024 13:31:02 -0500
Message-ID: <20241220183102.257410-1-gourry@gourry.net>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Memory hotplug presently auto-onlines memory into ZONE_NORMAL when
CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y.

The memhp_default_state boot param was added to allow runtime config.

Remove CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE, and replace it with
CONFIG_MHP_DEFAULT_ONLINE_TYPE as a choice config. The choices
sync up with the 'memhp_default_state' boot parameter.

Selections:
  CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE
    => mhp_default_online_type = "offline"
       Memory will not be onlined automatically.

  CONFIG_MHP_DEFAULT_ONLINE_TYPE_AUTO
    => mhp_default_online_type = "online"
       Memory will be onlined automatically.
       The zone will be chosen by the kernel.

  CONFIG_MHP_DEFAULT_ONLINE_TYPE_KERNEL
    => mhp_default_online_type = "online_kernel"
       Memory will be onlined automatically.
       The zone will be kernel capable (typically ZONE_NORMAL).

  CONFIG_MHP_DEFAULT_TYPE_MOVABLE
    => mhp_default_online_type = "online_movable"
       Memory will be onlined automatically.
       The zone will be ZONE_MOVABLE.

CONFIG_MHP_DEFAULT_ONLINE_TYPE defaults to "offline" to match the
existing CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=n behavior.

Existing users of CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y can use
CONFIG_MHP_DEFAULT_ONLINE_TYPE_AUTO for the same behavior.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../admin-guide/kernel-parameters.txt         |  2 +-
 .../admin-guide/mm/memory-hotplug.rst         |  2 +-
 arch/loongarch/configs/loongson3_defconfig    |  6 +-
 drivers/base/memory.c                         |  4 +-
 include/linux/memory_hotplug.h                |  5 +-
 mm/Kconfig                                    | 64 +++++++++++++++++--
 mm/memory_hotplug.c                           | 29 +++++++--
 7 files changed, 91 insertions(+), 21 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e73383450240..2169a4db6781 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3351,7 +3351,7 @@
 			[KNL] Set the initial state for the memory hotplug
 			onlining policy. If not specified, the default value is
 			set according to the
-			CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE kernel config
+			CONFIG_MHP_DEFAULT_ONLINE_TYPE kernel config
 			option.
 			See Documentation/admin-guide/mm/memory-hotplug.rst.
 
diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index cb2c080f400c..aa5e703233e7 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -280,7 +280,7 @@ The following files are currently defined:
 		       blocks; configure auto-onlining.
 
 		       The default value depends on the
-		       CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE kernel configuration
+		       CONFIG_MHP_DEFAULT_ONLINE_TYPE kernel configuration
 		       option.
 
 		       See the ``state`` property of memory blocks for details.
diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index 4dffc90192f7..ffc3514b8a00 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -113,7 +113,11 @@ CONFIG_ZBUD=y
 CONFIG_ZSMALLOC=m
 # CONFIG_COMPAT_BRK is not set
 CONFIG_MEMORY_HOTPLUG=y
-CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=y
+# CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE is not set
+CONFIG_MHP_DEFAULT_ONLINE_TYPE_AUTO=y
+# CONFIG_MHP_DEFAULT_ONLINE_TYPE_KERNEL is not set
+# CONFIG_MHP_DEFAULT_ONLINE_TYPE_MOVABLE is not set
+CONFIG_MHP_DEFAULT_ONLINE_TYPE="online"
 CONFIG_MEMORY_HOTREMOVE=y
 CONFIG_KSM=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 67858eeb92ed..348c5dbbfa68 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -512,7 +512,7 @@ static ssize_t auto_online_blocks_show(struct device *dev,
 				       struct device_attribute *attr, char *buf)
 {
 	return sysfs_emit(buf, "%s\n",
-			  online_type_to_str[mhp_default_online_type]);
+			  online_type_to_str[mhp_get_default_online_type()]);
 }
 
 static ssize_t auto_online_blocks_store(struct device *dev,
@@ -524,7 +524,7 @@ static ssize_t auto_online_blocks_store(struct device *dev,
 	if (online_type < 0)
 		return -EINVAL;
 
-	mhp_default_online_type = online_type;
+	mhp_set_default_online_type(online_type);
 	return count;
 }
 
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index b27ddce5d324..eaac5ae8c05c 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -144,8 +144,6 @@ extern u64 max_mem_size;
 
 extern int mhp_online_type_from_str(const char *str);
 
-/* Default online_type (MMOP_*) when new memory blocks are added. */
-extern int mhp_default_online_type;
 /* If movable_node boot option specified */
 extern bool movable_node_enabled;
 static inline bool movable_node_is_enabled(void)
@@ -303,6 +301,9 @@ static inline void __remove_memory(u64 start, u64 size) {}
 #endif /* CONFIG_MEMORY_HOTREMOVE */
 
 #ifdef CONFIG_MEMORY_HOTPLUG
+/* Default online_type (MMOP_*) when new memory blocks are added. */
+extern int mhp_get_default_online_type(void);
+extern void mhp_set_default_online_type(int online_type);
 extern void __ref free_area_init_core_hotplug(struct pglist_data *pgdat);
 extern int __add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags);
 extern int add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags);
diff --git a/mm/Kconfig b/mm/Kconfig
index 7949ab121070..29107df78275 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -550,20 +550,70 @@ menuconfig MEMORY_HOTPLUG
 
 if MEMORY_HOTPLUG
 
-config MEMORY_HOTPLUG_DEFAULT_ONLINE
-	bool "Online the newly added memory blocks by default"
-	depends on MEMORY_HOTPLUG
+choice
+	prompt "Memory Hotplug Default Online Type"
+	default MHP_DEFAULT_ONLINE_TYPE_OFFLINE
 	help
+	  Default memory type for driver managed hotplug memory.
+
 	  This option sets the default policy setting for memory hotplug
 	  onlining policy (/sys/devices/system/memory/auto_online_blocks) which
 	  determines what happens to newly added memory regions. Policy setting
 	  can always be changed at runtime.
+
+	  The default is 'offline'.
+
+	  Select offline to defer onlining to drivers and user policy.
+	  Select auto to let the kernel choose what zones to utilize.
+	  Select online_kernel to generally allow kernel usage of this memory.
+	  Select online_movable to generally disallow kernel usage of this memory.
+
+	  Example kernel usage would be page structs and page tables.
+
 	  See Documentation/admin-guide/mm/memory-hotplug.rst for more information.
 
-	  Say Y here if you want all hot-plugged memory blocks to appear in
-	  'online' state by default.
-	  Say N here if you want the default policy to keep all hot-plugged
-	  memory blocks in 'offline' state.
+config MHP_DEFAULT_ONLINE_TYPE_OFFLINE
+	bool "offline"
+	help
+	  Driver managed memory will not be onlined by default.
+	  Choose this for systems with drivers and user policy that
+	  handle onlining of hotplug memory policy.
+
+config MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO
+	bool "auto"
+	help
+	  Select this if you want the kernel to automatically online
+	  memory into the zone it thinks is reasonable. This memory
+	  may be utilized for kernel data (e.g. page tables).
+
+config MHP_DEFAULT_ONLINE_TYPE_ONLINE_KERNEL
+	bool "kernel"
+	help
+	  Select this if you want the kernel to automatically online
+	  hotplug memory into a zone capable of being used for kernel
+	  data (e.g. page tables). This typically means ZONE_NORMAL.
+
+config MHP_DEFAULT_ONLINE_TYPE_ONLINE_MOVABLE
+	bool "movable"
+	help
+	  Select this if you want the kernel to automatically online
+	  hotplug memory into ZONE_MOVABLE. This memory will generally
+	  not be utilized for kernel data (e.g. page tables).
+
+	  This should only be used when the admin knows sufficient
+	  ZONE_NORMAL memory is available to describe hotplug memory,
+	  otherwise hotplug memory may fail to online. For example,
+	  sufficient kernel-capable memory (ZONE_NORMAL) must be
+	  available to allocate page structs to describe ZONE_MOVABLE.
+
+endchoice
+
+config MHP_DEFAULT_ONLINE_TYPE
+       string
+       default "offline" if MHP_DEFAULT_ONLINE_TYPE_OFFLINE
+       default "online" if MHP_DEFAULT_ONLINE_TYPE_ONLINE_AUTO
+       default "online_kernel" if MHP_DEFAULT_ONLINE_TYPE_ONLINE_KERNEL
+       default "online_movable" if MHP_DEFAULT_ONLINE_TYPE_ONLINE_MOVABLE
 
 config MEMORY_HOTREMOVE
 	bool "Allow for memory hot remove"
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 3b6f93962481..11421accaff9 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -219,11 +219,26 @@ void put_online_mems(void)
 
 bool movable_node_enabled = false;
 
-#ifndef CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE
-int mhp_default_online_type = MMOP_OFFLINE;
-#else
-int mhp_default_online_type = MMOP_ONLINE;
-#endif
+static int mhp_default_online_type = -1;
+int mhp_get_default_online_type(void)
+{
+	int type;
+
+	if (mhp_default_online_type >= 0)
+		return mhp_default_online_type;
+
+	type = mhp_online_type_from_str(CONFIG_MHP_DEFAULT_ONLINE_TYPE);
+	if (type < 0)
+		type = MMOP_OFFLINE;
+
+	mhp_default_online_type = type;
+	return mhp_default_online_type;
+}
+
+void mhp_set_default_online_type(int online_type)
+{
+	mhp_default_online_type = online_type;
+}
 
 static int __init setup_memhp_default_state(char *str)
 {
@@ -1328,7 +1343,7 @@ static int check_hotplug_memory_range(u64 start, u64 size)
 
 static int online_memory_block(struct memory_block *mem, void *arg)
 {
-	mem->online_type = mhp_default_online_type;
+	mem->online_type = mhp_get_default_online_type();
 	return device_online(&mem->dev);
 }
 
@@ -1575,7 +1590,7 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		merge_system_ram_resource(res);
 
 	/* online pages if requested */
-	if (mhp_default_online_type != MMOP_OFFLINE)
+	if (mhp_get_default_online_type() != MMOP_OFFLINE)
 		walk_memory_blocks(start, size, NULL, online_memory_block);
 
 	return ret;
-- 
2.47.1


