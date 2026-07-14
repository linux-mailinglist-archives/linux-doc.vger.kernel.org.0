Return-Path: <linux-doc+bounces-96782-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JbLqFBNTVmqh3QAAu9opvQ
	(envelope-from <linux-doc+bounces-96782-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 17:17:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E05C75654A
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 17:17:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=omkuNMDG;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96782-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-96782-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CF3630486CB
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 15:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F099B4B8DFD;
	Tue, 14 Jul 2026 15:15:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53564A2E2D
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 15:15:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042123; cv=none; b=FJs5MzUbpspLQN9V7Mf+kqBHhU2A7kHlvmiZQ2yny9A55Sv3H5bIJ5Kra/XCUc2MsZCOswFa0NN4rK/HbS0vsZ+gcs/n6uCLrDUaOQf6wDqDfApt1ptOPXUgRr5BDNV5M1yjvhOPDppD0bAMq4+npTrM7MBwp1yWw+42SqBL1og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042123; c=relaxed/simple;
	bh=7r/bDrW/3tccMnKG0Sox3jGGc6LraNqsuBFxlk3AlCo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J6o2tYqnZ5aVJADbuxyiuojVEtJhR0SkQ4EyIgyI7yrhD/V//H1KbMrPT35xOwAw6g4lUs10P1PBYafeqeZG9loyAkOCA1s7FbpFiF2x+8p8LzO6mlICGUMKiMD1MLFH/dVlievgF7j9IBenJSskvrOQliVcJWpNYhK/kfdxrXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=omkuNMDG; arc=none smtp.client-ip=209.85.210.202
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8488ac68185so6844062b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 08:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784042121; x=1784646921; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHOmohYTYSD8/2ryEq7eNVyF04S9VyCIkpjOIEDjYJc=;
        b=omkuNMDG56nX5cYtruAlP06g4Dz3SQcY195KR+vy2exrp2lg0UHZkis1JYBFzK9YSY
         i0bcAXBPV+WcKYtGo8aPsO4qcrNdj76isdvHHagy4tWg47MlR01B6KOLiUB8cKzCmnyK
         OX7dwnb789/1O+y9iQjgJOUDXMaOpXDw+a5DUBmDkfNoKZ+GfXs3GBAu1NinlplSqBwX
         wFhOth0IqjWQcgmSrf2DS6UWl1KODeI0czSDWI+c/bzwBtnNGBLxy3jcr2zbSwgEoFMk
         wVgghz7Z1rLmYASz0TE0dEUMbG2h+EM2rccIBJKOLwvQO2TEAlNjcN8K84mitYkY/MD1
         KvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784042121; x=1784646921;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHOmohYTYSD8/2ryEq7eNVyF04S9VyCIkpjOIEDjYJc=;
        b=Cjs2BsKehxg3en2u3uKBg8Wiwimxd5WlmIK696DFo/+xjfytu8ijgQji82N7nb5zDt
         DI5kqRpieyO2v5cyfDAcERi9SwI+rAOIqyPWOx1qGjEdAvKpbMkCKC8J7xU2B/havS+J
         99mkoLeV3Oq3QeYjPnaMQgjxzESfPXI0Gjw2tOaIdT6iCQS4GC4CgPzP7KgiEymeefBV
         sSSeRGiKO+8FeDjFoZxfC6AMPMKZa/JS8GBIj6GdaenJEdOMkqb1ju4sQ0YpNGPe2k3T
         XyHN8Q4vYQojbZ3ItWgNPibrIV9xqOUW5RtJvV+HlmRk1Sc5WvVsSP1mOzfpH02vm9E3
         0obg==
X-Forwarded-Encrypted: i=1; AHgh+Rq1XrnREYsoGMN994n5MByd81qZrQziNV0AgE+5VEWCp+Qdr3xuw4eRccrJmrU8ZHQ+kI9WLUAJb7A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj1XORaGrKiUQHEoxuT4OOvXLkicBNChkYORSfToIm8GeJ89FA
	CXBfOOFzB1p8ZlfAQ/4WuN9sO2zdJjtxyaz5eE8HI9cg9rRAyAI/TcBG2+H/pHNnqkM/UViiq/z
	P4DEhwRRLMA==
X-Received: from pfux16.prod.google.com ([2002:a05:6a00:bd0:b0:848:8b16:23d6])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d19:b0:848:76af:db37
 with SMTP id d2e1a72fcca58-84889611b82mr12946882b3a.7.1784042120956; Tue, 14
 Jul 2026 08:15:20 -0700 (PDT)
Date: Tue, 14 Jul 2026 08:14:56 -0700
In-Reply-To: <20260714151505.3466855-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260714151505.3466855-1-vipinsh@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260714151505.3466855-12-vipinsh@google.com>
Subject: [PATCH v5 11/20] vfio: Enforce preserved devices are retrieved via LIVEUPDATE_SESSION_RETRIEVE_FD
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
	TAGGED_FROM(0.00)[bounces-96782-lists,linux-doc=lfdr.de];
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
X-Rspamd-Queue-Id: 0E05C75654A

From: David Matlack <dmatlack@google.com>

Enforce that files for incoming (preserved by previous kernel) VFIO
devices are retrieved via LIVEUPDATE_SESSION_RETRIEVE_FD rather than by
opening the corresponding VFIO character device or via
VFIO_GROUP_GET_DEVICE_FD.

Both of these methods would result in VFIO initializing the device
without access to the preserved state of the device passed by the
previous kernel.

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Co-developed-by: Vipin Sharma <vipinsh@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 drivers/vfio/device_cdev.c             |  8 ++++++++
 drivers/vfio/group.c                   |  9 +++++++++
 drivers/vfio/pci/vfio_pci_liveupdate.c |  6 ++++++
 drivers/vfio/vfio.h                    | 18 ++++++++++++++++++
 4 files changed, 41 insertions(+)

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index 970932f22ecb..0050f0fe456b 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -49,6 +49,14 @@ static int vfio_device_cdev_open(struct vfio_device *device, struct file **filep
 		}
 
 		*filep = file;
+	} else if (vfio_liveupdate_incoming_is_preserved(device)) {
+		/*
+		 * Since it is live update preserved device, it must be
+		 * retrieved via LIVEUPDATE_SESSION_RETRIEVE_FD instead of
+		 * opening /dev/vfio/devices/vfioX.
+		 */
+		ret = -EBUSY;
+		goto err_free_device_file;
 	}
 
 	file->private_data = df;
diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index b2299e5bc6df..62b4eaabc829 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -316,6 +316,15 @@ static int vfio_group_ioctl_get_device_fd(struct vfio_group *group,
 	if (IS_ERR(device))
 		return PTR_ERR(device);
 
+	/*
+	 * This device was preserved across a Live Update. Accessing it via
+	 * VFIO_GROUP_GET_DEVICE_FD is not allowed.
+	 */
+	if (vfio_liveupdate_incoming_is_preserved(device)) {
+		vfio_device_put_registration(device);
+		return -EBUSY;
+	}
+
 	fd = FD_ADD(O_CLOEXEC, vfio_device_open_file(device));
 	if (fd < 0)
 		vfio_device_put_registration(device);
diff --git a/drivers/vfio/pci/vfio_pci_liveupdate.c b/drivers/vfio/pci/vfio_pci_liveupdate.c
index 4baac80d03f0..f0ea37d98696 100644
--- a/drivers/vfio/pci/vfio_pci_liveupdate.c
+++ b/drivers/vfio/pci/vfio_pci_liveupdate.c
@@ -47,6 +47,12 @@
  *   ...
  *   ioctl(session_fd, LIVEUPDATE_SESSION_FINISH, ...);
  *
+ * .. note::
+ *    After kexec, if a device was preserved by the previous kernel, attempting
+ *    to open a new file for the device via its character device
+ *    (``/dev/vfio/devices/X``) or via ``VFIO_GROUP_GET_DEVICE_FD`` will fail
+ *    with ``-EBUSY``.
+ *
  * Restrictions
  * ============
  *
diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index e4b72e79b7e3..496180950eb6 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -11,6 +11,7 @@
 #include <linux/cdev.h>
 #include <linux/module.h>
 #include <linux/vfio.h>
+#include <linux/pci.h>
 
 struct iommufd_ctx;
 struct iommu_group;
@@ -461,4 +462,21 @@ static inline void vfio_device_debugfs_init(struct vfio_device *vdev) { }
 static inline void vfio_device_debugfs_exit(struct vfio_device *vdev) { }
 #endif /* CONFIG_VFIO_DEBUGFS */
 
+#ifdef CONFIG_VFIO_PCI_LIVEUPDATE
+static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_device *device)
+{
+	struct device *d = device->dev;
+
+	if (dev_is_pci(d))
+		return pci_liveupdate_is_incoming(to_pci_dev(d));
+
+	return false;
+}
+#else
+static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_device *device)
+{
+	return false;
+}
+#endif /* CONFIG_VFIO_PCI_LIVEUPDATE */
+
 #endif
-- 
2.55.0.795.g602f6c329a-goog


