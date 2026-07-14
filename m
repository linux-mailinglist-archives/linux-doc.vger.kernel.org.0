Return-Path: <linux-doc+bounces-96779-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a9OxCR1TVmqj3QAAu9opvQ
	(envelope-from <linux-doc+bounces-96779-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 17:17:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2C4756552
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 17:17:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=nkAVN8ha;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96779-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-96779-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D5133024E30
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 15:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3574A13A7;
	Tue, 14 Jul 2026 15:15:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F41496906
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 15:15:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042121; cv=none; b=bhBEHkT+AEEI8nUQ7tih8L97dYk3JbbG0lrfeMaHHErx9YXlIdKMJ1yDh/faG9i8/WPccjg4uVwTYIwLEoiNFQciITD9kMuCpe7NWdm0MpIm+y4IcAEh1dOaS5iCzm8PqxDuZ7Q/nQhGMAe8P0FcqcQBG/vsdt/JkiIrJUBcSpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042121; c=relaxed/simple;
	bh=D1azvDxApPs5xbXiJtVJUqLP/cxUk13HfBV7O9ih/3A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YiTOoCcr9X7IE9kp8mZy6ozq0ZLs4A4nv9ChW5FdN8z76Fu+DLmfTStj6W9TQEzb+i1Yhgh+/03IZIvqn8lvDsLViXe0WKNkqKIy2A78ilqPd2mTQonULXYHPCYaWah5AKAPlIhkYStBBXlqtKk2bJJd7m/eW9H3skzLOgydV/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nkAVN8ha; arc=none smtp.client-ip=209.85.210.201
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8484ba00601so1527795b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 08:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784042118; x=1784646918; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEd+0Hxb+fZMWIajq41a/8wnr7549OLbqTKKS2EBeVQ=;
        b=nkAVN8ha9vPSVAEThwr9y96KS7Jl6hScvKVpUMEdQb7bYzh9SK6UqJeijRbfzNq8Cq
         C+7UjICjP8xXv/ZoMP/WVJlviwDRFGIGQ0vB+2JCwqwH/1yIPI1K4uHEGAIL7yjI/K/N
         tq9hgX8bIosrjvwonH8xk6FMOygLMnU5Dd5dmD9SRtnJMbSJGVeCLzLds8tQchi4FNI3
         27tBOn6nQiqLVFYz3RI4kgxS6SGyYRI7WQuKoa4yqYMQkJswOczV407dvvveQQHf7Gtu
         9aBj/RPuIDC+0JztGtF8YkbVEtSz7VtASGtyq0N2ME74QayvECMni3fmB4N08q119YC3
         Jp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042118; x=1784646918;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tEd+0Hxb+fZMWIajq41a/8wnr7549OLbqTKKS2EBeVQ=;
        b=S83TgE+j0HLbEv4AgdXDqRlXGHZk3Xja3A8Jo+xEDowwtTezNnIxtn/ltlVo2Xa95L
         SF7FHbvcIaGbNJ235NQ6UcnhCjWQl4FMjhLsCEc2M6z5YoMsv4NYi1VWW5gEoxKC5sRq
         ZTNStLDJmHyXPvMc4PI2w9Bk/2LE+fMojbam2lxLdrvmiFaM+imZWBh7HD9+l+svE46d
         BmhhL533/6cMBy0mZ/KFDDfOitOULGSoXIZ1dyIOSn/Gq6Gc2gfKSiq/APi4c1GaJQ6c
         KI1bqigBeBTa0NdBJ3kUYxitzgVHq7UZmVeQooMDWIzmKLpqFOR4Qb6Q9O/Faw+fGg/B
         PNNw==
X-Forwarded-Encrypted: i=1; AHgh+RpJhs9OeRawR0qJtDQtTHHqL8tHc6ew1J+Tq5YYZ8eNJhEmLiUumDDO8H8JNt+PozpYVDh/UkOWcWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBObKhNAsNCKSGc+D6wi/WuFQ9f8gynSDd89kqIBaSDtlSFtV7
	IqEqpJGDpP3PdWVKWKvsWY296+ucLorPJ6rZ+mrocrUUJMrzS0hQcoRSutOa7m1RAS1Crsl657t
	g5D41BM6m9w==
X-Received: from pfblh20.prod.google.com ([2002:a05:6a00:7114:b0:847:86de:a817])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d9e:b0:848:7459:5f62
 with SMTP id d2e1a72fcca58-848897d2bbcmr12462324b3a.44.1784042117867; Tue, 14
 Jul 2026 08:15:17 -0700 (PDT)
Date: Tue, 14 Jul 2026 08:14:53 -0700
In-Reply-To: <20260714151505.3466855-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260714151505.3466855-1-vipinsh@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260714151505.3466855-9-vipinsh@google.com>
Subject: [PATCH v5 08/20] vfio: Refactor vfio_device_fops_cdev_open()
From: Vipin Sharma <vipinsh@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rientjes@google.com, rodrigo.vivi@intel.com, 
	rppt@kernel.org, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vipinsh@google.com, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, 
	yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96779-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[vipinsh@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:ajayachandra@nvidia.com,m:alex@shazbot.org,m:amastro@fb.com,m:ankita@nvidia.com,m:apopple@nvidia.com,m:bhelgaas@google.com,m:chrisl@kernel.org,m:christian.koenig@amd.com,m:corbet@lwn.net,m:dmatlack@google.com,m:graf@amazon.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:jgg@ziepe.ca,m:jrhilke@google.com,m:julianr@linux.ibm.com,m:kees@kernel.org,m:kevin.tian@intel.com,m:leon@kernel.org,m:leonro@nvidia.com,m:lukas@wunner.de,m:mattev@meta.com,m:michal.winiarski@intel.com,m:parav@nvidia.com,m:pasha.tatashin@soleen.com,m:praan@google.com,m:pratyush@kernel.org,m:rananta@google.com,m:rientjes@google.com,m:rodrigo.vivi@intel.com,m:rppt@kernel.org,m:saeedm@nvidia.com,m:schnelle@linux.ibm.com,m:skhan@linuxfoundation.org,m:skhawaja@google.com,m:vipinsh@google.com,m:vivek.kasireddy@intel.com,m:witu@nv
 idia.com,m:yanjun.zhu@linux.dev,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vipinsh@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[46];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C2C4756552

Refactor vfio_device_fops_cdev_open() to use a static helper
vfio_device_cdev_open(). This helper will be used in subsequent
patches to support opening the device file during Live Update restore.

No functional change intended.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 drivers/vfio/device_cdev.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index 54abf312cf04..2231423fe56d 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -16,14 +16,8 @@ void vfio_init_device_cdev(struct vfio_device *device)
 	device->cdev.owner = THIS_MODULE;
 }
 
-/*
- * device access via the fd opened by this function is blocked until
- * .open_device() is called successfully during BIND_IOMMUFD.
- */
-int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
+static int vfio_device_cdev_open(struct vfio_device *device, struct file *file)
 {
-	struct vfio_device *device = container_of(inode->i_cdev,
-						  struct vfio_device, cdev);
 	struct vfio_device_file *df;
 	int ret;
 
@@ -37,14 +31,14 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
 		goto err_put_registration;
 	}
 
-	filep->private_data = df;
+	file->private_data = df;
 
 	/*
 	 * Use the pseudo fs inode on the device to link all mmaps
 	 * to the same address space, allowing us to unmap all vmas
 	 * associated to this device using unmap_mapping_range().
 	 */
-	filep->f_mapping = device->inode->i_mapping;
+	file->f_mapping = device->inode->i_mapping;
 
 	return 0;
 
@@ -53,6 +47,18 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
 	return ret;
 }
 
+/*
+ * device access via the fd opened by this function is blocked until
+ * .open_device() is called successfully during BIND_IOMMUFD.
+ */
+int vfio_device_fops_cdev_open(struct inode *inode, struct file *file)
+{
+	struct vfio_device *device = container_of(inode->i_cdev,
+						  struct vfio_device, cdev);
+
+	return vfio_device_cdev_open(device, file);
+}
+
 static void vfio_df_get_kvm_safe(struct vfio_device_file *df)
 {
 	spin_lock(&df->kvm_ref_lock);
-- 
2.55.0.795.g602f6c329a-goog


