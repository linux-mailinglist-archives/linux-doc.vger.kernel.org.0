Return-Path: <linux-doc+bounces-96780-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZZ6sHvtSVmqb3QAAu9opvQ
	(envelope-from <linux-doc+bounces-96780-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 17:17:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0DC756534
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 17:17:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=J2CWa0jP;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96780-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-96780-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 746073045A22
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 15:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C244A341F;
	Tue, 14 Jul 2026 15:15:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55B14A1383
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 15:15:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042122; cv=none; b=t+xgFhLmmsp4/7jTSUXHGhEWSek094Uqj17l9WvJxbHPwys7I7ZMYXekldwTf48t3qIXKSotumkdEmrtoABRwJjr8xmB8qIeq+DCH8eW8Vm+0ZJivetWjUu9KbkdDwGW+Cb2mWkqVfe/UaD1D4hcVGJMX0itZ9TA/QxBgbQdQoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042122; c=relaxed/simple;
	bh=KxwauFSG6vbKAkq6gpdomeQJiBPpzZsdR8oSo2q1AAs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JMMcVoK+Dcma99JkUkvSl4HtX92EVD7CN1BXktUyeRAhItbOq89Up4dCy4hPHFi2uoIyZY/C4s/2Tz8c+VJHfuW0eIwNpw6Wjto5ByMESvwlflr3ZaXEUorKZa+a7ChnxTmmS64bnubSLfq1NlIHJ2SlJ9GAcEBE7T2RRItYtgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J2CWa0jP; arc=none smtp.client-ip=209.85.216.73
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-38dbf293831so2505606a91.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 08:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784042119; x=1784646919; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fk6o2vphXfQkoL1z/+pIbWzomzkKJfAmoavVaL/E+Fg=;
        b=J2CWa0jPNcS/n5ijCnmp/29Y0SnnucVQHu1YQrfxNFWU/6AYE6afIWtoBJGunolgZn
         qZqyR1QXtXWDO+epUBNnsfmyO3Sle4EYwCvgCshErFthwxaY9YmUp8SxoCH4kADHnIXy
         iv3uc+3KRtgT1+p8UxUyl1Gvb+WG+DIxkLFoc1dTruqvO2VdxN0MRzVD24Ubm6A0lVr5
         5o+0iWaJayMbi0nI6sRgCQvzDJZ9GgLeDOfhsHP0WAnphxLjQpJxHGRJSSnQ8ggD8UWI
         US9Qwe9hqCpD5XPB+HdSOykJ0TkW81btzYkApyXLKoUDK0Lu0Ri6zvOUMYj6KxvZZUw4
         fhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042119; x=1784646919;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fk6o2vphXfQkoL1z/+pIbWzomzkKJfAmoavVaL/E+Fg=;
        b=edCiswttVOcpjjeBVmodUsPz89Pg1ZFoBjB5y0DuRlDANI++UzKNeaTryP+X6GsUAy
         wzcFlAmjWkJ6z29y9VrNRXPiQ1INH4AWhGp6NPPchSAe/XX+MDWyAglx8KD9OIOsLnaH
         XqryPbSj4tI3Z6nJ/sSvv7zJZTXnwdUCMr63fC8rP4pNQuLLCYQn/iVrTXXelZVFdS/g
         uplGoMCr+4eXl+FJ69teDcCdaKwD9YXsetvOXhMQkBeEXAuKaRKaS6hpN4JAZ00BTsvo
         azrghHmqo8fpTdtRlzG7N5ATshKXxkDZVGCjydInO60kREkjs1LDR0z+JazMO0maHHNI
         mjcA==
X-Forwarded-Encrypted: i=1; AHgh+RoC4zjZTBiq1P5fnAAlpSqbTRcNv80SDADzJSJzxm/qQWhHtFNDIHJCMbVit00wAnGe4CTqRESOmVg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3gu3kvS4r6dvtB2p/l6wLjM5yoPJ9laQkiK1bbn7M6tmvmNHy
	H4E03Aqgu5nKNb4nvsv5BP7mDs7cWauUmdmrDMfFdMETnq6WI5S0WuKob3xyokAInao/nJ1vOPV
	mK4Gwjan1kQ==
X-Received: from pjyu5.prod.google.com ([2002:a17:90a:e005:b0:383:f7b7:fb7])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dc9:b0:381:528a:808a
 with SMTP id 98e67ed59e1d1-38dc7735977mr13456012a91.27.1784042118892; Tue, 14
 Jul 2026 08:15:18 -0700 (PDT)
Date: Tue, 14 Jul 2026 08:14:54 -0700
In-Reply-To: <20260714151505.3466855-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260714151505.3466855-1-vipinsh@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260714151505.3466855-10-vipinsh@google.com>
Subject: [PATCH v5 09/20] vfio: Add API to open cdev device for Live Update restore
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96780-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[vipinsh@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:ajayachandra@nvidia.com,m:alex@shazbot.org,m:amastro@fb.com,m:ankita@nvidia.com,m:apopple@nvidia.com,m:bhelgaas@google.com,m:chrisl@kernel.org,m:christian.koenig@amd.com,m:corbet@lwn.net,m:dmatlack@google.com,m:graf@amazon.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:jgg@ziepe.ca,m:jrhilke@google.com,m:julianr@linux.ibm.com,m:kees@kernel.org,m:kevin.tian@intel.com,m:leon@kernel.org,m:leonro@nvidia.com,m:lukas@wunner.de,m:mattev@meta.com,m:michal.winiarski@intel.com,m:parav@nvidia.com,m:pasha.tatashin@soleen.com,m:praan@google.com,m:pratyush@kernel.org,m:rananta@google.com,m:rientjes@google.com,m:rodrigo.vivi@intel.com,m:rppt@kernel.org,m:saeedm@nvidia.com,m:schnelle@linux.ibm.com,m:skhan@linuxfoundation.org,m:skhawaja@google.com,m:vipinsh@google.com,m:vivek.kasireddy@intel.com,m:witu@nv
 idia.com,m:yanjun.zhu@linux.dev,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F0DC756534

During Live Update restore, VFIO PCI driver needs to recreate the device
file context that was preserved before kexec and return it to the user.

Provide an API for VFIO Live Update to get VFIO device file. Use an
anonymous inode when creating the file, since the retrieved device file
is not opened through any particular cdev inode, and the cdev inode does
not matter in practice.

Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 drivers/vfio/device_cdev.c | 39 ++++++++++++++++++++++++++++++++++++--
 include/linux/vfio.h       |  9 +++++++++
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index 2231423fe56d..970932f22ecb 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2023 Intel Corporation.
  */
+#include <linux/anon_inodes.h>
 #include <linux/vfio.h>
 #include <linux/iommufd.h>
 
@@ -16,9 +17,10 @@ void vfio_init_device_cdev(struct vfio_device *device)
 	device->cdev.owner = THIS_MODULE;
 }
 
-static int vfio_device_cdev_open(struct vfio_device *device, struct file *file)
+static int vfio_device_cdev_open(struct vfio_device *device, struct file **filep)
 {
 	struct vfio_device_file *df;
+	struct file *file = *filep;
 	int ret;
 
 	/* Paired with the put in vfio_device_fops_release() */
@@ -31,6 +33,24 @@ static int vfio_device_cdev_open(struct vfio_device *device, struct file *file)
 		goto err_put_registration;
 	}
 
+	/*
+	 * Simulate opening the character device using an anonymous inode. The
+	 * returned file has the same properties as a cdev file (e.g. operations
+	 * are blocked until BIND_IOMMUFD is called).
+	 */
+	if (!file) {
+		file = anon_inode_getfile_fmode("[vfio-device-liveupdate]",
+						&vfio_device_fops, NULL,
+						O_RDWR, FMODE_PREAD | FMODE_PWRITE);
+
+		if (IS_ERR(file)) {
+			ret = PTR_ERR(file);
+			goto err_free_device_file;
+		}
+
+		*filep = file;
+	}
+
 	file->private_data = df;
 
 	/*
@@ -42,11 +62,26 @@ static int vfio_device_cdev_open(struct vfio_device *device, struct file *file)
 
 	return 0;
 
+err_free_device_file:
+	kfree(df);
 err_put_registration:
 	vfio_device_put_registration(device);
 	return ret;
 }
 
+struct file *vfio_device_liveupdate_cdev_open(struct vfio_device *device)
+{
+	struct file *file = NULL;
+	int ret;
+
+	ret = vfio_device_cdev_open(device, &file);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return file;
+}
+EXPORT_SYMBOL_GPL(vfio_device_liveupdate_cdev_open);
+
 /*
  * device access via the fd opened by this function is blocked until
  * .open_device() is called successfully during BIND_IOMMUFD.
@@ -56,7 +91,7 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *file)
 	struct vfio_device *device = container_of(inode->i_cdev,
 						  struct vfio_device, cdev);
 
-	return vfio_device_cdev_open(device, file);
+	return vfio_device_cdev_open(device, &file);
 }
 
 static void vfio_df_get_kvm_safe(struct vfio_device_file *df)
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 42c3a9ae3a85..b896c64b11da 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -430,6 +430,15 @@ int vfio_virqfd_enable(void *opaque, int (*handler)(void *, void *),
 void vfio_virqfd_disable(struct virqfd **pvirqfd);
 void vfio_virqfd_flush_thread(struct virqfd **pvirqfd);
 
+#if IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV)
+struct file *vfio_device_liveupdate_cdev_open(struct vfio_device *device);
+#else
+static inline struct file *vfio_device_liveupdate_cdev_open(struct vfio_device *device)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+#endif /* IS_ENABLED(CONFIG_VFIO_DEVICE_CDEV) */
+
 struct vfio_device *vfio_find_device(const void *data, device_match_t match);
 
 #endif /* VFIO_H */
-- 
2.55.0.795.g602f6c329a-goog


