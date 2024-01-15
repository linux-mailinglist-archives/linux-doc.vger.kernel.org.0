Return-Path: <linux-doc+bounces-6840-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C5982DBCB
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jan 2024 15:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBB4D1F21D5B
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jan 2024 14:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57351862F;
	Mon, 15 Jan 2024 14:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZKQ3noT3"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD3318029
	for <linux-doc@vger.kernel.org>; Mon, 15 Jan 2024 14:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705330055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6EAnPeJipP0+07a3Rzv2/tb0sjf4e9bqcclnBtzQ1Hw=;
	b=ZKQ3noT3lMoVquehcRddhaUCwGV6ujheO9KpWFHab+hmC6hI3flsI6pCuKys4shfIyBBqN
	baBenEE2mvEKS4NbrYPik3cvmQ2Kf8oIQENcet3PGysWAZOK1jdGPA9Uw6se1EqK1wG2w0
	AeJ9ZD4eVynshdmzT7EPi84UsGog8HA=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-Fch2ZxH8NzWBSqeVv73ztw-1; Mon, 15 Jan 2024 09:47:34 -0500
X-MC-Unique: Fch2ZxH8NzWBSqeVv73ztw-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-5f957a0d3e2so11288147b3.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Jan 2024 06:47:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705330054; x=1705934854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6EAnPeJipP0+07a3Rzv2/tb0sjf4e9bqcclnBtzQ1Hw=;
        b=ayzZrHSG1/8t+EF2Exrd7iZveJIbHRYp4sGa3bo0iQ66Itm/5/t6Y+sMiKLCMgK1By
         CYNC7IC82dVY+CHGcxyPe4/2dj88STfSj+HihCDXpapB2Yz7hf879BVCzA7KnHPwIrm+
         ur7qfuRTIXug5r/7P2sIstJ+CwBg8nfsCx5bJ7UUwAl7UUe1YExeW5DpNHufni6CwuIA
         VKUPVKoPFUkMRXT3YkTD8RBfAHeyE3hP1T5TQlT9hOa69UWXtm84td7cTdliBqeel/TQ
         xoM4O3gZYW89zFWZJUWiZEGl8mkuBCDf+32bjO+UfqxjyRzOd0o1HH1CJ3AWcokO+kkA
         eJSw==
X-Gm-Message-State: AOJu0Yxw3z4lqkSGI1JqET7a7CcgeZKe/77lSOc7FzLM3+uW7B8rA5SV
	Y4sIKIYsLuFWEsf4nDEjUM0JE4PDAxipXy6hwugmP4Djc/sL+RkSqjJwpKQUQRm6Yc+mvcraJNb
	0+vgZQhVGnaieJp1K3rjwEPtTnYiq
X-Received: by 2002:a81:9201:0:b0:5af:778e:d53b with SMTP id j1-20020a819201000000b005af778ed53bmr4653029ywg.0.1705330053961;
        Mon, 15 Jan 2024 06:47:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcCQGz1Mr7VFhpZST+41Zk2azRO3t8k7Tu1u+nJkXT6NHZsv59rkNJWBrwhybUyX7sFdqIfA==
X-Received: by 2002:a81:9201:0:b0:5af:778e:d53b with SMTP id j1-20020a819201000000b005af778ed53bmr4653002ywg.0.1705330053647;
        Mon, 15 Jan 2024 06:47:33 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id ne13-20020a056214424d00b006815cf9a644sm1020720qvb.55.2024.01.15.06.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 06:47:33 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dakr@redhat.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-pci@vger.kernel.org
Subject: [PATCH 09/10] pci: devres: remove legacy pcim_release()
Date: Mon, 15 Jan 2024 15:46:20 +0100
Message-ID: <20240115144655.32046-11-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115144655.32046-2-pstanner@redhat.com>
References: <20240115144655.32046-2-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks to preceding cleanup steps, pcim_release() is now not needed
anymore and can be replaced by pcim_disable_device(), which is the exact
counterpart to pcim_enable_device().
This permits removing further parts of the old devres API.

Replace pcim_release() with pcim_disable_device().
Remove the now surplus get_dr() function.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 38 ++++++++------------------------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 7c4edcaeb8fe..87bc62be21eb 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -464,48 +464,26 @@ int pcim_intx(struct pci_dev *pdev, int enable)
 }
 EXPORT_SYMBOL_GPL(pcim_intx);
 
-static void pcim_release(struct device *gendev, void *res)
+static void pcim_disable_device(void *pdev_raw)
 {
-	struct pci_dev *dev = to_pci_dev(gendev);
-
-	if (!dev->pinned)
-		pci_disable_device(dev);
-}
-
-static struct pci_devres *get_pci_dr(struct pci_dev *pdev)
-{
-	struct pci_devres *dr, *new_dr;
-
-	dr = devres_find(&pdev->dev, pcim_release, NULL, NULL);
-	if (dr)
-		return dr;
+	struct pci_dev *pdev = pdev_raw;
 
-	new_dr = devres_alloc(pcim_release, sizeof(*new_dr), GFP_KERNEL);
-	if (!new_dr)
-		return NULL;
-	return devres_get(&pdev->dev, new_dr, NULL, NULL);
+	if (!pdev->pinned)
+		pci_disable_device(pdev);
 }
 
 /**
  * pcim_enable_device - Managed pci_enable_device()
  * @pdev: PCI device to be initialized
  *
- * Managed pci_enable_device().
+ * Managed pci_enable_device(). Device will automatically be disabled on
+ * driver detach.
  */
 int pcim_enable_device(struct pci_dev *pdev)
 {
-	struct pci_devres *dr;
-	int rc;
-
-	dr = get_pci_dr(pdev);
-	if (unlikely(!dr))
-		return -ENOMEM;
-
-	rc = pci_enable_device(pdev);
-	if (!rc)
-		pdev->is_managed = 1;
+	devm_add_action(&pdev->dev, pcim_disable_device, pdev);
 
-	return rc;
+	return pci_enable_device(pdev);
 }
 EXPORT_SYMBOL(pcim_enable_device);
 
-- 
2.43.0


