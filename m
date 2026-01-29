Return-Path: <linux-doc+bounces-74585-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HiQBIHRe2m0IgIAu9opvQ
	(envelope-from <linux-doc+bounces-74585-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 22:30:41 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9B6B4BBA
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 22:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 351823095482
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 21:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFBC364026;
	Thu, 29 Jan 2026 21:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C8e2Ortj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA58B362132
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 21:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769721954; cv=none; b=YCff/7F5eTO25/Nd+CYfbPa1UfPi6AIGmHWnFzVqSrl6QvtoifKUOs3+WW8zbVSj9bFYDgs191/sm+hAtbry1/MZeJ5nmfNE3JRfmsJ2eIc+2qMHcbF9hfBjwNjJGxI3miCfIl6G+7hTmqD1p4rUU7rFzyQYE3xgaDft5avkkDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769721954; c=relaxed/simple;
	bh=PH5iGzvJjXTHpagZy3PRNHKNaI45nyOejtuOEQ4Vpv0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P4fBM82ob3zgFNkwfmpPZmRUGRcDSUIEY9sSZvo8WosjJ6O6DNH/1D1tNiiU9fFZzGin8fP2qdCZtfQdL1QsYTzqd9BaR4pqC7Lazl5sohpiCFPFcw2EuXqf5mP3+KIgPX1fkIZDpGSE2OeDm8MS7LlbOVwYjmFxOwyRciB8J0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C8e2Ortj; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a78c094ad6so15278605ad.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 13:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769721951; x=1770326751; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3umikqL/So8idv3VwvFYaIe6+4TeFw4VgnmENinGbaA=;
        b=C8e2OrtjW0pK6NU4+4pA7apan1abQ64W9AU73v+5MLSgoxU3PFLcQ35UnxyjSkvxW/
         jHGFZ0Sly19gY9qnHYAz8wYk5VaqCdHZM2Cics4NzJGADMN6HvBtPJacvT1eGdo2suwt
         ZRhpTHioWcJ/pWkH0ykH2wBZy2qfsg2XW+OMkV0yYJMVLWQKMlkq16WIsS6txca3VotJ
         /nsOLnywSf0t5LPsRcB/2fTdZdo82Z7dYxby8mo6zDWAS6vlF4PYmOhwl6or4V/1gc9D
         hPaf+DOmaNpeQvVe1RnN7NwGGMG7zJ7jnVbWavgGDvg2WFb4KxJJzZQJx5nEe3d+Yclm
         xQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769721951; x=1770326751;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3umikqL/So8idv3VwvFYaIe6+4TeFw4VgnmENinGbaA=;
        b=rTCLelA9OQI9nlmWg8QqT1y5znmrCVzoFVd+8w5Nd4Y31cZ/LnTq6vZpceeImb8GXf
         G2L31fcGfHcmhtjnvdbdIgXnacMczUdvTW7/THMZ9XAUNRKquXLnUMngjaE7R0bF+has
         6XLt10HPh26e6NXvrf+YjRmOzdtv4AgqODURVaKWNHBuZRwADc0R2+osuoeuOgr8cttl
         HZuaeXvJTcv9XuwbtuWS0z985Carn9BZdaPCwjJgbJeoxdKpPnA/FYQw1FX/NDeSOdWJ
         qXNvjv52xSFYpXmxBMIjWKlblaAOFVeG9PQloD15QxTzuNEtJHYkYaE1nBKjcWYtXlLe
         A8MA==
X-Forwarded-Encrypted: i=1; AJvYcCWxwhEuINnXEPqpwDu+S0pR0BGoF7qMlYlJsSSjINErni3YurSTfIDVHFQxVYD/9CHbfMHfidpYeEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQBKxf1vuZhnn0Kr1bY1tVgysbLsuipUT9XP3q/lICDwQ9wpM6
	Lp/pKa3NDWmq/ip0bZ/jtYSdoGSV/DTX5BLU4sjf4mccXy/UkVkh3WLR5HKMydWab5PeY56bU6x
	A73FYiL5NVbxWmQ==
X-Received: from plrf5.prod.google.com ([2002:a17:902:ab85:b0:2a7:6c0c:5916])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:c952:b0:295:3584:1bbd with SMTP id d9443c01a7336-2a8d8176d76mr6976645ad.41.1769721950767;
 Thu, 29 Jan 2026 13:25:50 -0800 (PST)
Date: Thu, 29 Jan 2026 21:24:55 +0000
In-Reply-To: <20260129212510.967611-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260129212510.967611-9-dmatlack@google.com>
Subject: [PATCH v2 08/22] vfio: Enforce preserved devices are retrieved via LIVEUPDATE_SESSION_RETRIEVE_FD
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	"=?UTF-8?q?Micha=C5=82=20Winiarski?=" <michal.winiarski@intel.com>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Tomita Moeko <tomitamoeko@gmail.com>, 
	Vipin Sharma <vipinsh@google.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-74585-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[45];
	FREEMAIL_CC(0.00)[nvidia.com,amazon.com,fb.com,linux-foundation.org,google.com,kernel.org,linux.microsoft.com,ziepe.ca,lwn.net,intel.com,lists.infradead.org,vger.kernel.org,kvack.org,wunner.de,soleen.com,linuxfoundation.org,linux.intel.com,gmail.com,linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmatlack@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB9B6B4BBA
X-Rspamd-Action: no action

Enforce that files for incoming (preserved by previous kernel) VFIO
devices are retrieved via LIVEUPDATE_SESSION_RETRIEVE_FD rather than by
opening the corresponding VFIO character device or via
VFIO_GROUP_GET_DEVICE_FD.

Both of these methods would result in VFIO initializing the device
without access to the preserved state of the device passed by the
previous kernel.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/vfio/device_cdev.c |  4 ++++
 drivers/vfio/group.c       |  9 +++++++++
 include/linux/vfio.h       | 18 ++++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index 935f84a35875..355447e2add3 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -57,6 +57,10 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
 	struct vfio_device *device = container_of(inode->i_cdev,
 						  struct vfio_device, cdev);
 
+	/* Device file must be retrieved via LIVEUPDATE_SESSION_RETRIEVE_FD */
+	if (vfio_liveupdate_incoming_is_preserved(device))
+		return -EBUSY;
+
 	return __vfio_device_fops_cdev_open(device, filep);
 }
 
diff --git a/drivers/vfio/group.c b/drivers/vfio/group.c
index d47ffada6912..63fc4d656215 100644
--- a/drivers/vfio/group.c
+++ b/drivers/vfio/group.c
@@ -311,6 +311,15 @@ static int vfio_group_ioctl_get_device_fd(struct vfio_group *group,
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
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index dc592dc00f89..0921847b18b5 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -16,6 +16,7 @@
 #include <linux/cdev.h>
 #include <uapi/linux/vfio.h>
 #include <linux/iova_bitmap.h>
+#include <linux/pci.h>
 
 struct kvm;
 struct iommufd_ctx;
@@ -431,4 +432,21 @@ static inline int __vfio_device_fops_cdev_open(struct vfio_device *device,
 
 struct vfio_device *vfio_find_device(const void *data, device_match_t match);
 
+#ifdef CONFIG_LIVEUPDATE
+static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_device *device)
+{
+	struct device *d = device->dev;
+
+	if (dev_is_pci(d))
+		return to_pci_dev(d)->liveupdate_incoming;
+
+	return false;
+}
+#else
+static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_device *device)
+{
+	return false;
+}
+#endif
+
 #endif /* VFIO_H */
-- 
2.53.0.rc1.225.gd81095ad13-goog


