Return-Path: <linux-doc+bounces-37339-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F45A2BD89
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 09:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73B933A1A00
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 08:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EDE1B4239;
	Fri,  7 Feb 2025 08:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Iucv3ZQy"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689B5233D8F
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 08:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915716; cv=none; b=t5eIP2fLUO4hVyxALUkOZaNejF7LDSO+7goUCBRuN97Uqcik6eeqaidNRA7ehAjQnMpd7G8bW4cyU18oDAV2yM6eXxQFIYn2ETJQ5vAWZw3Kay9u/TjK7Yk3RZiAlrWKkNesjA+xENfSxPCqquOttVU83HSZ+/Zi+s7Eaf+PXs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915716; c=relaxed/simple;
	bh=NyKzY0K0Ma12vUJu1+XLB5k9FElHY2Np8fadJc87zXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fMpYUIvCDB3fF87M4LpoD5b72l7q9CkA2d433jgB5yqF5yEO4cOw+QgKZrN05+xbZoBbSbjQu9fOc/ILwzWCvgOLSsa7J33OaelmzY5T0X60Fa2dPHADn6/drAtBujpWs45NACc01Yue/sod3TblYLMY+wCBiAtOqKcopH10Kdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Iucv3ZQy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738915713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uNvqfRY/p43Kh27tUfS4izlyaUMw4mc0s7iE7l5Z3Sk=;
	b=Iucv3ZQyWrCGFiNGqTFK3soV4vh1m02Pm/ViMZBU8ICNngdNo7RC3Ge/hlCZHTSgA5+CB8
	qZpKyjAzJIdnKG9MAFXx/mr3HMrWBFzcsSf/Typ2QbYFwMUQAayR59TeQ7RHehyEDpB2nt
	HVXSLTKAEniEyxVMOsmuhsvvooKoJ9E=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-OXCGS9RaM6qtz8Xrm8anhQ-1; Fri, 07 Feb 2025 03:08:31 -0500
X-MC-Unique: OXCGS9RaM6qtz8Xrm8anhQ-1
X-Mimecast-MFC-AGG-ID: OXCGS9RaM6qtz8Xrm8anhQ
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216311faa51so36290185ad.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Feb 2025 00:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915711; x=1739520511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNvqfRY/p43Kh27tUfS4izlyaUMw4mc0s7iE7l5Z3Sk=;
        b=TFbWIqeVpN6DL5n8dlqPdMjYoQ4sNscuTJNOOe+A7Fzinqas8BFnbcTcwRq3DqDMxI
         7JY/07KAno5jkgj76rFIKVHCmL/VLnTwNInV1jb9dnJ+/8ettARfxzc6PeT4k86Kf6U8
         YH8v2D5IXZXv5AdAWTMhzUyV+JyNmdbeMdGfKXDoIEda6RjBsP8AfCUDpHQfivpvhsQS
         LwH6sytxDDuxqJNhV4vN5BmTHmgppbEGpg9HPAWFdv0TSv/wQh2UzigUoAogVwLLXgEz
         zwKLpbZM6iFF0uM73jhJdeKoS1GVrdeAIXhXEnzIElqOBIg9cR+gd2/aW2efz7abtRkq
         j2+A==
X-Forwarded-Encrypted: i=1; AJvYcCW94tJza3lnqVwOS06sVhRRYvwsVPvNWJNNIZj5+0Joo9O/TLs3n8rCzqaOoWjTyOO5MOOvLSjQzdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMNDVlakUQpMQEh3NFiOjIarckGOwFZPd3luA2cGIenYHELNMm
	sz8m2pRp63pPO0V8LBr7wgDr3eljjEqsADrl/I9tzW1CQgJfRw5EsCKnSl+r8MxSDUWzIt1KVqd
	VPD/frhD+WZOo6/m99JJRUhgYp3btohElnMMFign3TAxjHOifFV3szwPU7g==
X-Gm-Gg: ASbGnctZUBdZ7ud/SaMgSB/yRN+RlNAOjemd7NS5nlBHYQnDQxAF2+8MFZuDjR0G8Mt
	ZZlZ1G4Uhjej+wxp57zNt3E2YQAkX630DEyuQ9H7T2pLP9x3s5BjEBzUJShfJJIO8SJZhrUfQrI
	Eph0msOhE4oQdHOPxVDeFCvINlTzg05efL+86qsnHFfWn8jsU97sYAkryMlxIpmOSyQCMkIibrD
	MvL8tB1z+9ZblqRsot30RAY2INhibb8CjDE675xx//rIf5HM5VdKWt/AplJriWnhMSfWWXg
X-Received: by 2002:a17:902:f60f:b0:215:6c5f:d142 with SMTP id d9443c01a7336-21f4f7a257fmr37890145ad.20.1738915710618;
        Fri, 07 Feb 2025 00:08:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHs60RhVNrgryoHKynyiSh2tPFd7Ldxk7PRowHjlbIPWF1HtpbSpHjjlk+tvWfekAFaJaB6cg==
X-Received: by 2002:a17:902:f60f:b0:215:6c5f:d142 with SMTP id d9443c01a7336-21f4f7a257fmr37889855ad.20.1738915710241;
        Fri, 07 Feb 2025 00:08:30 -0800 (PST)
Received: from localhost ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653afa7sm24407295ad.66.2025.02.07.00.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:08:29 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org
Cc: Ondrej Kozina <okozina@redhat.com>,
	Milan Broz <gmazyland@gmail.com>,
	Thomas Staudt <tstaudt@de.ibm.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Kairui Song <ryncsn@gmail.com>,
	Pingfan Liu <kernelfans@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Dave Hansen <dave.hansen@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH v8 2/7] crash_dump: make dm crypt keys persist for the kdump kernel
Date: Fri,  7 Feb 2025 16:08:10 +0800
Message-ID: <20250207080818.129165-3-coxu@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207080818.129165-1-coxu@redhat.com>
References: <20250207080818.129165-1-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A configfs /sys/kernel/config/crash_dm_crypt_keys is provided for user
space to make the dm crypt keys persist for the kdump kernel. Take the
case of dumping to a LUKS-encrypted target as an example, here is the
life cycle of the kdump copies of LUKS volume keys,

 1. After the 1st kernel loads the initramfs during boot, systemd uses
    an user-input passphrase to de-crypt the LUKS volume keys or simply
    TPM-sealed volume keys and then save the volume keys to specified
    keyring (using the --link-vk-to-keyring API) and the keys will expire
    within specified time.

 2. A user space tool (kdump initramfs loader like kdump-utils) create
    key items inside /sys/kernel/config/crash_dm_crypt_keys to inform
    the 1st kernel which keys are needed.

 3. When the kdump initramfs is loaded by the kexec_file_load
    syscall, the 1st kernel will iterate created key items, save the
    keys to kdump reserved memory.

 4. When the 1st kernel crashes and the kdump initramfs is booted, the
    kdump initramfs asks the kdump kernel to create a user key using the
    key stored in kdump reserved memory by writing yes to
    /sys/kernel/crash_dm_crypt_keys/restore. Then the LUKS encrypted
    device is unlocked with libcryptsetup's --volume-key-keyring API.

 5. The system gets rebooted to the 1st kernel after dumping vmcore to
    the LUKS encrypted device is finished

Eventually the keys have to stay in the kdump reserved memory for the
kdump kernel to unlock encrypted volumes. During this process, some
measures like letting the keys expire within specified time are
desirable to reduce security risk.

This patch assumes,
1) there are 128 LUKS devices at maximum to be unlocked thus
   MAX_KEY_NUM=128.

2) a key description won't exceed 128 bytes thus KEY_DESC_MAX_LEN=128.

And here is a demo on how to interact with
/sys/kernel/config/crash_dm_crypt_keys,

    # Add key #1
    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
    # Add key #1's description
    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description

    # how many keys do we have now?
    cat /sys/kernel/config/crash_dm_crypt_keys/count
    1

    # Add key#2 in the same way

    # how many keys do we have now?
    cat /sys/kernel/config/crash_dm_crypt_keys/count
    2

    # the tree structure of /crash_dm_crypt_keys configfs
    tree /sys/kernel/config/crash_dm_crypt_keys/
    /sys/kernel/config/crash_dm_crypt_keys/
    ├── 7d26b7b4-e342-4d2d-b660-7426b0996720
    │   └── description
    ├── count
    ├── fce2cd38-4d59-4317-8ce2-1fd24d52c46a
    │   └── description

Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 Documentation/admin-guide/kdump/kdump.rst |  28 ++++
 kernel/Kconfig.kexec                      |  10 ++
 kernel/Makefile                           |   1 +
 kernel/crash_dump_dm_crypt.c              | 154 ++++++++++++++++++++++
 4 files changed, 193 insertions(+)
 create mode 100644 kernel/crash_dump_dm_crypt.c

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 5376890adbeb..83d422d761b6 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -551,6 +551,34 @@ from within add_taint() whenever the value set in this bitmask matches with the
 bit flag being set by add_taint().
 This will cause a kdump to occur at the add_taint()->panic() call.
 
+Write the dump file to encrypted disk volume
+============================================
+
+CONFIG_CRASH_DM_CRYPT can be enabled to support saving the dump file to an
+encrypted disk volume. User space can interact with
+/sys/kernel/config/crash_dm_crypt_keys for setup,
+
+1. Tell the first kernel what keys are needed to unlock the disk volumes,
+    # Add key #1
+    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
+    # Add key #1's description
+    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description
+
+    # how many keys do we have now?
+    cat /sys/kernel/config/crash_dm_crypt_keys/count
+    1
+
+    # Add key #2 in the same way
+
+    # how many keys do we have now?
+    cat /sys/kernel/config/crash_dm_crypt_keys/count
+    2
+
+2. Load the dump-capture kernel
+
+3. After the dump-capture kerne get booted, restore the keys to user keyring
+   echo yes > /sys/kernel/crash_dm_crypt_keys/restore
+
 Contact
 =======
 
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 4d111f871951..5226775fd4c6 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -116,6 +116,16 @@ config CRASH_DUMP
 	  For s390, this option also enables zfcpdump.
 	  See also <file:Documentation/arch/s390/zfcpdump.rst>
 
+config CRASH_DM_CRYPT
+	bool "Support saving crash dump to dm-crypt encrypted volume"
+	depends on KEXEC_FILE
+	depends on CRASH_DUMP
+	depends on DM_CRYPT
+	help
+	  With this option enabled, user space can intereact with
+	  /sys/kernel/config/crash_dm_crypt_keys to make the dm crypt keys
+	  persistent for the dump-capture kernel.
+
 config CRASH_HOTPLUG
 	bool "Update the crash elfcorehdr on system configuration changes"
 	default y
diff --git a/kernel/Makefile b/kernel/Makefile
index 87866b037fbe..9d1cabf1ec46 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -72,6 +72,7 @@ obj-$(CONFIG_VMCORE_INFO) += vmcore_info.o elfcorehdr.o
 obj-$(CONFIG_CRASH_RESERVE) += crash_reserve.o
 obj-$(CONFIG_KEXEC_CORE) += kexec_core.o
 obj-$(CONFIG_CRASH_DUMP) += crash_core.o
+obj-$(CONFIG_CRASH_DM_CRYPT) += crash_dump_dm_crypt.o
 obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC_FILE) += kexec_file.o
 obj-$(CONFIG_KEXEC_ELF) += kexec_elf.o
diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
new file mode 100644
index 000000000000..62a3c47d8b3b
--- /dev/null
+++ b/kernel/crash_dump_dm_crypt.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <keys/user-type.h>
+#include <linux/crash_dump.h>
+#include <linux/configfs.h>
+#include <linux/module.h>
+
+#define KEY_NUM_MAX 128	/* maximum dm crypt keys */
+#define KEY_DESC_MAX_LEN 128	/* maximum dm crypt key description size */
+
+static unsigned int key_count;
+
+struct config_key {
+	struct config_item item;
+	const char *description;
+};
+
+static inline struct config_key *to_config_key(struct config_item *item)
+{
+	return container_of(item, struct config_key, item);
+}
+
+static ssize_t config_key_description_show(struct config_item *item, char *page)
+{
+	return sprintf(page, "%s\n", to_config_key(item)->description);
+}
+
+static ssize_t config_key_description_store(struct config_item *item,
+					    const char *page, size_t count)
+{
+	struct config_key *config_key = to_config_key(item);
+	size_t len;
+	int ret;
+
+	ret = -EINVAL;
+	len = strcspn(page, "\n");
+
+	if (len > KEY_DESC_MAX_LEN) {
+		pr_err("The key description shouldn't exceed %u characters", KEY_DESC_MAX_LEN);
+		return ret;
+	}
+
+	if (!len)
+		return ret;
+
+	kfree(config_key->description);
+	ret = -ENOMEM;
+	config_key->description = kmemdup_nul(page, len, GFP_KERNEL);
+	if (!config_key->description)
+		return ret;
+
+	return count;
+}
+
+CONFIGFS_ATTR(config_key_, description);
+
+static struct configfs_attribute *config_key_attrs[] = {
+	&config_key_attr_description,
+	NULL,
+};
+
+static void config_key_release(struct config_item *item)
+{
+	kfree(to_config_key(item));
+	key_count--;
+}
+
+static struct configfs_item_operations config_key_item_ops = {
+	.release = config_key_release,
+};
+
+static const struct config_item_type config_key_type = {
+	.ct_item_ops = &config_key_item_ops,
+	.ct_attrs = config_key_attrs,
+	.ct_owner = THIS_MODULE,
+};
+
+static struct config_item *config_keys_make_item(struct config_group *group,
+						 const char *name)
+{
+	struct config_key *config_key;
+
+	if (key_count > KEY_NUM_MAX) {
+		pr_err("Only %u keys at maximum to be created\n", KEY_NUM_MAX);
+		return ERR_PTR(-EINVAL);
+	}
+
+	config_key = kzalloc(sizeof(struct config_key), GFP_KERNEL);
+	if (!config_key)
+		return ERR_PTR(-ENOMEM);
+
+	config_item_init_type_name(&config_key->item, name, &config_key_type);
+
+	key_count++;
+
+	return &config_key->item;
+}
+
+static ssize_t config_keys_count_show(struct config_item *item, char *page)
+{
+	return sprintf(page, "%d\n", key_count);
+}
+
+CONFIGFS_ATTR_RO(config_keys_, count);
+
+static struct configfs_attribute *config_keys_attrs[] = {
+	&config_keys_attr_count,
+	NULL,
+};
+
+/*
+ * Note that, since no extra work is required on ->drop_item(),
+ * no ->drop_item() is provided.
+ */
+static struct configfs_group_operations config_keys_group_ops = {
+	.make_item = config_keys_make_item,
+};
+
+static const struct config_item_type config_keys_type = {
+	.ct_group_ops = &config_keys_group_ops,
+	.ct_attrs = config_keys_attrs,
+	.ct_owner = THIS_MODULE,
+};
+
+static struct configfs_subsystem config_keys_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_namebuf = "crash_dm_crypt_keys",
+			.ci_type = &config_keys_type,
+		},
+	},
+};
+
+static int __init configfs_dmcrypt_keys_init(void)
+{
+	int ret;
+
+	config_group_init(&config_keys_subsys.su_group);
+	mutex_init(&config_keys_subsys.su_mutex);
+	ret = configfs_register_subsystem(&config_keys_subsys);
+	if (ret) {
+		pr_err("Error %d while registering subsystem %s\n", ret,
+		       config_keys_subsys.su_group.cg_item.ci_namebuf);
+		goto out_unregister;
+	}
+
+	return 0;
+
+out_unregister:
+	configfs_unregister_subsystem(&config_keys_subsys);
+
+	return ret;
+}
+
+module_init(configfs_dmcrypt_keys_init);
-- 
2.48.1


