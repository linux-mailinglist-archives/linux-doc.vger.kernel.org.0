Return-Path: <linux-doc+bounces-7266-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5B8838AD1
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jan 2024 10:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51F151C24176
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jan 2024 09:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D725FB80;
	Tue, 23 Jan 2024 09:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dmt8N05Y"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDB05F861
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 09:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706003110; cv=none; b=BTjeEZEF+1zhxtoyBSO4GlNcWkiIwxSEyLUcg8D0VmGrTUyVfVnYYRhQYeWVOAltOevOkBnYonv4CcCiqMzCgon/TOSTwNsSsvkOuZqq85KpBleIF7gb18ZC6uu1gYq9FRy97ZdRVWsNdWUCkVRf4gw1Wx6q6GBSyme2u0KBd/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706003110; c=relaxed/simple;
	bh=q2R0g7Hy2U3uiquhdJnwowChrgBPdiPXucNQWzskgyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C94nfq1Cp+eTqfOC2wFlwMt73OpMSp3PnEj0rmlkWWXFQCDVUxffZJmdhBfrdJnvAi3/Wi818Tyqw9Ma+aUl9HLbbIe54XPeqpZ2C0sM265ezjAxQdECwQpMzD3XosV2AryBkMuGqZJc7k3S2IYtNNtMeHhwPFZMA0VeoNZuPr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dmt8N05Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706003107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n8ldR1APM7FCb8Va/7W7rWsZ/5PXg9NQPlDweLxrFR8=;
	b=Dmt8N05YaRA67plzdhtYK2081Lwy+wmiIwWxJV8BtJfMado4/HRykXC3Mq3oTwqeeSnnyE
	d2DfEVloDdE+jaKOACcRhetS4CmlLO0PsGzV4IIadiBZAag7Oa/2QXbCW6JzXa1eXOrBWq
	Umkbgs0sY3sdcMVKMRdJeTe56bgjjyM=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-TgaAoqokOX6gdNcyDN0XQg-1; Tue, 23 Jan 2024 04:45:05 -0500
X-MC-Unique: TgaAoqokOX6gdNcyDN0XQg-1
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-46afa962c3eso27821137.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 01:45:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706003105; x=1706607905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8ldR1APM7FCb8Va/7W7rWsZ/5PXg9NQPlDweLxrFR8=;
        b=SeKrtCjI6zaLPq9LQOxbmvDF4Cb+9e/r9XQpDSDubtTHdDZrrG2I8ynbdFaQg/YyQx
         UPeBjo7Q1lS4SquWR+aS0yYzn8mPdz0oyFircDDYlUL4qXomVB2oCFINqVtjgJ0kiwu/
         2grngulqJPWe9+ecqowOF4x1iSbwvyf6bgdJBBdAukrMRRfLiXSOW5DII7pJKYChbPzO
         UtpXpNJXu1AMoRMXTxAv+4KlF7rEAfLQetdvHH6DYeeVJQDdGTRjCywMeYQkk+s5WrIq
         fVWEJV6wdN/PS1GxKQhZmcL8AcdrG0MQwvNplCoYEEgAdRLeh/3xeWEGPJ7G+gefFl+6
         ecHg==
X-Gm-Message-State: AOJu0YzDTVOVaagRY2WSyKJNC17yfEYZ59J9kWVkjfSIkEuZydYp74nv
	x/a0OCVQZGJkqCMr8vuUHcZg2jIpxerfHVDaMuLMtshnDavljYn+3mGtUvqe2H6/Jo+dkahaWlx
	jj8M+2jzJdgrmeamfIOAasFIDIe9Arl/jMwo+dnVWYFef+bmnJb1kbeNxLg==
X-Received: by 2002:a05:6102:5493:b0:469:b7ba:85e2 with SMTP id bk19-20020a056102549300b00469b7ba85e2mr3802825vsb.1.1706003105400;
        Tue, 23 Jan 2024 01:45:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBtpt9W0N9DjO3th5WheR6cQoXtCbywpbrf12aGS9J/9nurG+TirAyDVaNm7jxUkx0ffoI5g==
X-Received: by 2002:a05:6102:5493:b0:469:b7ba:85e2 with SMTP id bk19-20020a056102549300b00469b7ba85e2mr3802807vsb.1.1706003105097;
        Tue, 23 Jan 2024 01:45:05 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id nc5-20020a0562142dc500b00685e2ffcaf5sm2958704qvb.38.2024.01.23.01.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 01:45:04 -0800 (PST)
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
Subject: [PATCH v2 09/10] PCI: remove legacy pcim_release()
Date: Tue, 23 Jan 2024 10:43:06 +0100
Message-ID: <20240123094317.15958-10-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123094317.15958-1-pstanner@redhat.com>
References: <20240123094317.15958-1-pstanner@redhat.com>
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
Remove the now surplus function get_pci_dr().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/pci/devres.c | 49 +++++++++++++++++++-------------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 4314d0863282..f368181c6c92 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -463,48 +463,41 @@ int pcim_intx(struct pci_dev *pdev, int enable)
 	return 0;
 }
 
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
+ * Returns: 0 on success, negative error code on failure.
+ *
+ * Managed pci_enable_device(). Device will automatically be disabled on
+ * driver detach.
  */
 int pcim_enable_device(struct pci_dev *pdev)
 {
-	struct pci_devres *dr;
-	int rc;
+	int ret;
 
-	dr = get_pci_dr(pdev);
-	if (unlikely(!dr))
-		return -ENOMEM;
+	ret = devm_add_action(&pdev->dev, pcim_disable_device, pdev);
+	if (ret != 0)
+		return ret;
 
-	rc = pci_enable_device(pdev);
-	if (!rc)
-		pdev->is_managed = 1;
+	/*
+	 * We prefer removing the action in case of an error over
+	 * devm_add_action_or_reset() because the later could theoretically be
+	 * disturbed by users having pinned the device too soon.
+	 */
+	ret = pci_enable_device(pdev);
+	if (ret != 0)
+		devm_remove_action(&pdev->dev, pcim_disable_device, pdev);
 
-	return rc;
+	return ret;
 }
 EXPORT_SYMBOL(pcim_enable_device);
 
-- 
2.43.0


