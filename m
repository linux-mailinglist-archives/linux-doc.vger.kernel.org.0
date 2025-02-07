Return-Path: <linux-doc+bounces-37340-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A565A2BD8B
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 09:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EF9B3A0753
	for <lists+linux-doc@lfdr.de>; Fri,  7 Feb 2025 08:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2170A234972;
	Fri,  7 Feb 2025 08:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cmFUIBLT"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645DC1A08CA
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 08:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915724; cv=none; b=WwIzF8FsCd3Afkt5BJWBKGYNMbq70WYCjWtW2LP1seB3J5ksEZ1wB/IaJvATWIN0FVChyfzjjbmMXAwUo5comAp72re14K31NwDU6m+KrBgI6D0wGxoYpgnJUJEp2/pdUIosjYq98tJFcHcwjel8fr5Zmdb0veE7Qbk/ZGKmTO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915724; c=relaxed/simple;
	bh=ooq2LTWco/Q5VgSj/ws9UJuLfY+jbL51jd44eN8UAD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mc2A/2rMLF2LdBSHKwxiCttkZFBel8bR8AwbnXB+pGVseAVK0HxT/UWECgQh1Agih1Y4S2GlPyVpDWEB0tVl7r506nhXPNJRetOU2pK9BytU0ynYwaB+IBpHnd7GJs/ARV2RBCux6nAaATOmw0F48tmrzxNgUDRKHFYPNP6sGL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cmFUIBLT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738915721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vs/fEt8187919W7bAsJ6ILZH4C6hECupt8Iw6rDvcR8=;
	b=cmFUIBLT/kuugijcRVSUdMNs4bkLAg5sJxOraJPhsKzAwrxP3wNe3HNa9NjSR31Rf5x8EV
	smHKzPohLZP6tNNZmodEU2oNbvg9szjbmyfPWLOXHUcMAfY+LwykSj5AAfaUH2udOVjZr8
	xu77N23KEDzUIqIqKzqpR3kvVnQh+jM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-IByWbJUJOeOvFCCf_sbDTg-1; Fri, 07 Feb 2025 03:08:40 -0500
X-MC-Unique: IByWbJUJOeOvFCCf_sbDTg-1
X-Mimecast-MFC-AGG-ID: IByWbJUJOeOvFCCf_sbDTg
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2163a2a1ec2so61847495ad.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Feb 2025 00:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915719; x=1739520519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vs/fEt8187919W7bAsJ6ILZH4C6hECupt8Iw6rDvcR8=;
        b=mQ7lwuPjlGe1TuJlqOpoIoqLS7mly5o3CG7xAIHs1QZ1LnPfXskbBwVZx0q64lwVL6
         cwBpP8eIIGylcKc7XV4a6Q9kFIQ326Euk0wqQBbkhneKZsSScOJ7B8u4qAp0ve6BZ0Kh
         tgkyAggTggUSTJDKmF3xFMyuz/WJCZrp/vCfyFqe+nHRBEwRDR2QpFUvdviSWNEYXU/0
         60dWM68M/11lvxygawZMYw33Y/N1A0zaPW0bX6fQa7/Q+orZwbf/dUhBq27SfBd5I1lm
         MvePRbB5fjJHxDrp5aa0Ag9Ce1zDaSou/Zm0+E/dEjn9C14EfWEYYN47bekZ7N2ED0VE
         ZKLA==
X-Forwarded-Encrypted: i=1; AJvYcCU79Mi56QW6jIObEi6MvMoyOvEpFEmS0U/3ZHphSjxnvCzSSqITc0qySfJF/nRXYrpJmZ1odAxVClU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUpA/+Q5s5JrFn0ePlBro0IrODYG+cLEvCoAqpcX6sE05VGCLM
	dp1/pQ7S3em2WDfDX47wyOWmC1N0ujYIvAE47xYMca1uoGmkFu8zNT1diz/exXJC4Ijdked2ZY/
	K9wDA6bF/NkjJ22neQsSTsAIbzOuUF41A11AG9D4/Q5QDQdQ61ncEZ62qDA==
X-Gm-Gg: ASbGncumSq4/l6Z+he4MQ+TupV+mUbhOmenRwJ+OxHWRR71jksNWzrQ7ckxGQ7q2gdp
	P0HR8BNsq7q+jXCzdGRVGws6LlcylF2i8DAFplkKIRmbqIfAQkUMXddHbHCykwLzw5aWeSe0IJv
	oPAu5zA810jwlztpn2fxhwaOX6eO0x6dqnroIG7a715dDowlpkablRUaIE/NFUL2RkOeVlC8ZYa
	e6eucIb79OQe9tcc1efkbn+obdTEZg+hi5QXl0N87dIWGbYmi2Wl0vJQN/ENG8rZwnsciYQ
X-Received: by 2002:a17:902:f542:b0:21e:ff31:526 with SMTP id d9443c01a7336-21f4e77b902mr43522005ad.43.1738915719226;
        Fri, 07 Feb 2025 00:08:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDtGAWMniDa7kdL3sNgA7bh1GCtIrQ4jLjUrxyTT7Lx6LA9FXZwINkgBT1U4ESkAYbK9t2sg==
X-Received: by 2002:a17:902:f542:b0:21e:ff31:526 with SMTP id d9443c01a7336-21f4e77b902mr43521655ad.43.1738915718900;
        Fri, 07 Feb 2025 00:08:38 -0800 (PST)
Received: from localhost ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f365616ecsm24825295ad.100.2025.02.07.00.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:08:37 -0800 (PST)
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
Subject: [PATCH v8 4/7] crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging
Date: Fri,  7 Feb 2025 16:08:12 +0800
Message-ID: <20250207080818.129165-5-coxu@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207080818.129165-1-coxu@redhat.com>
References: <20250207080818.129165-1-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When there are CPU and memory hot un/plugs, the dm crypt keys may need
to be reloaded again depending on the solution for crash hotplug
support. Currently, there are two solutions. One is to utilizes udev to
instruct user space to reload the kdump kernel image and initrd,
elfcorehdr and etc again. The other is to only update the elfcorehdr
segment introduced in commit 247262756121 ("crash:
add generic infrastructure for crash hotplug support").

For the 1st solution, the dm crypt keys need to be reloaded again. The
user space can write true to
/sys/kernel/config/crash_dm_crypt_key/reuse so the stored keys can be
re-used.

For the 2nd solution, the dm crypt keys don't need to be reloaded.
Currently, only x86 supports the 2nd solution. If the 2nd solution
gets extended to all arches, this patch can be dropped.

Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 Documentation/admin-guide/kdump/kdump.rst |  4 ++
 kernel/crash_dump_dm_crypt.c              | 52 +++++++++++++++++++++--
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 83d422d761b6..1283f0244614 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -574,6 +574,10 @@ encrypted disk volume. User space can interact with
     cat /sys/kernel/config/crash_dm_crypt_keys/count
     2
 
+    # To support CPU/memory hot-plugging, re-use keys already saved to reserved
+    # memory
+    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
+
 2. Load the dump-capture kernel
 
 3. After the dump-capture kerne get booted, restore the keys to user keyring
diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index 00dc6a3f71ca..e4e0cc1c3399 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -28,6 +28,20 @@ static size_t get_keys_header_size(size_t total_keys)
 	return struct_size(keys_header, keys, total_keys);
 }
 
+static void get_keys_from_kdump_reserved_memory(void)
+{
+	struct keys_header *keys_header_loaded;
+
+	arch_kexec_unprotect_crashkres();
+
+	keys_header_loaded = kmap_local_page(pfn_to_page(
+		kexec_crash_image->dm_crypt_keys_addr >> PAGE_SHIFT));
+
+	memcpy(keys_header, keys_header_loaded, get_keys_header_size(key_count));
+	kunmap_local(keys_header_loaded);
+	arch_kexec_protect_crashkres();
+}
+
 static int read_key_from_user_keying(struct dm_crypt_key *dm_key)
 {
 	const struct user_key_payload *ukp;
@@ -150,8 +164,36 @@ static ssize_t config_keys_count_show(struct config_item *item, char *page)
 
 CONFIGFS_ATTR_RO(config_keys_, count);
 
+static bool is_dm_key_reused;
+
+static ssize_t config_keys_reuse_show(struct config_item *item, char *page)
+{
+	return sprintf(page, "%d\n", is_dm_key_reused);
+}
+
+static ssize_t config_keys_reuse_store(struct config_item *item,
+					   const char *page, size_t count)
+{
+	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
+		kexec_dprintk(
+			"dm-crypt keys haven't be saved to crash-reserved memory\n");
+		return -EINVAL;
+	}
+
+	if (kstrtobool(page, &is_dm_key_reused))
+		return -EINVAL;
+
+	if (is_dm_key_reused)
+		get_keys_from_kdump_reserved_memory();
+
+	return count;
+}
+
+CONFIGFS_ATTR(config_keys_, reuse);
+
 static struct configfs_attribute *config_keys_attrs[] = {
 	&config_keys_attr_count,
+	&config_keys_attr_reuse,
 	NULL,
 };
 
@@ -233,10 +275,12 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 		return -ENOENT;
 	}
 
-	image->dm_crypt_keys_addr = 0;
-	r = build_keys_header();
-	if (r)
-		return r;
+	if (!is_dm_key_reused) {
+		image->dm_crypt_keys_addr = 0;
+		r = build_keys_header();
+		if (r)
+			return r;
+	}
 
 	kbuf.buffer = keys_header;
 	kbuf.bufsz = get_keys_header_size(key_count);
-- 
2.48.1


