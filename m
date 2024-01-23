Return-Path: <linux-doc+bounces-7267-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 762C2838AD6
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jan 2024 10:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2022E28B6A5
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jan 2024 09:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CE15FDAC;
	Tue, 23 Jan 2024 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QtbvgXM1"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB0D5FBA8
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706003113; cv=none; b=BBohfRurAsGIeNB1UvadgeYs0faE8w9iLLckyl77Y2cGZKVPKw4f692xEHsbW505P8va1zq9l0qX7x0+YT9KKBAJGYjeTVscl0X+M93rEYuRfqhUnMmJkvjH+qdNIGcmufJueNSk++Vbxt1I7c+cKBLgpD8BgdsY4pnbL42KOq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706003113; c=relaxed/simple;
	bh=3Iz4WGGoq+pCd7AYX21h5ZoVleqGHZ1r8bx9B4kfr1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hf7X4dkrFwkRVxkvwPHiqoxNr0Ft22tLfEVP9kdi+XIXHSy2M6LUtgUsjK5SNrEFzvHRVISx+lOA8SDsoogYRTqwlJlp80TEQhMIfv7xo6/7Rt3rcmxsxxU7cH14sYujFJKHiGnSiKAGEY9242g+Bs1rlvw8cqkLz3v6erZqD8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QtbvgXM1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706003110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FWMdjy11RuBqd4YsQRKnY1KCsHHpGsFFOhcTWKEv36g=;
	b=QtbvgXM1KWoPghp2T+yGVVT27ojbKSsgpKz4Pf/Ze/kOKbVBM91utfHk0AnsR4WUjf4HRt
	DIYDzXL3kUaK5t5sHX3EB0zQWLPe9hNq7upF+mfydcCMfOJYyK2ZTJi9XczsX/T3D1G58K
	/U9eFP9gj8l059OI4DKY2PEdy1wJzbo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-1gbp78vcNf2wCxZvVMU0Kg-1; Tue, 23 Jan 2024 04:45:08 -0500
X-MC-Unique: 1gbp78vcNf2wCxZvVMU0Kg-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-42a335c8fcfso8359161cf.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 01:45:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706003107; x=1706607907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWMdjy11RuBqd4YsQRKnY1KCsHHpGsFFOhcTWKEv36g=;
        b=lrC9h+gUkXQzSKchSQGruePK27b4AIrgW+TokIU3U1rqmyaBUbVJ7I6PTUXeuzvEIb
         iB5mCTiwX1BQbhzTrjb5GON86Bfqw+HlyzVyQfMVzKzAQKQ9lWiAS4VeKh0hBwUrFz3b
         bdrNGACwtNpjm8Zni7CkvVKxuPg42A/dL9SRhUI3u/UVh8Soyi9A8v75BhIqJbEml/e6
         so07OF+GRWVSew+CDSyRGvf4XzX/gm9JXQ17wxyctemFHTR1HDMiX7x9W6wx4jGwCirG
         srj2tz31iWXYUkoQOnb05kEwcf4HhpXOE+83S1FG75m6tpCT2xCxBIwWr6g+EdbU5gBY
         AeyA==
X-Gm-Message-State: AOJu0YwyMIvTpy1RU1udGCChtITMaQaik8ctkdxGqwP1OY+xPAR0UCYJ
	EaB2TzEoIF0rldd7cETsu1xqIy6/GIHXds/xvZV2E98vjAo/LzsyTsp2vWxTKaqu0rxGFhjuh4s
	/K/7ArG1fh4y5BqKHdX2Z7oU6D2o+hkOm00ukJXR4CxzBAd8kE+ucOAYXsA==
X-Received: by 2002:a05:6214:21c5:b0:686:9443:87b1 with SMTP id d5-20020a05621421c500b00686944387b1mr4377405qvh.2.1706003107754;
        Tue, 23 Jan 2024 01:45:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFss4rceMk+iJ1mHCcS+hUWfR7kWRFY2O8zC9T9j0KLwTPnx3az+4pz7feAJyO8Yaas1sCjsw==
X-Received: by 2002:a05:6214:21c5:b0:686:9443:87b1 with SMTP id d5-20020a05621421c500b00686944387b1mr4377391qvh.2.1706003107503;
        Tue, 23 Jan 2024 01:45:07 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id nc5-20020a0562142dc500b00685e2ffcaf5sm2958704qvb.38.2024.01.23.01.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 01:45:07 -0800 (PST)
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
	linux-pci@vger.kernel.org,
	stable@kernel.vger.org
Subject: [PATCH v2 10/10] drm/vboxvideo: fix mapping leaks
Date: Tue, 23 Jan 2024 10:43:07 +0100
Message-ID: <20240123094317.15958-11-pstanner@redhat.com>
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

When the PCI devres API was introduced to this driver, it was wrongly
assumed that initializing the device with pcim_enable_device() instead
of pci_enable_device() will make all PCI functions managed.

This is wrong and was caused by the quite confusing devres API for PCI
in which some, but not all, functions become managed that way.

The function pci_iomap_range() is never managed.

Replace pci_iomap_range() with the actually managed function
pcim_iomap_range().

Additionally, add a call to pcim_request_region() to ensure exclusive
access to BAR 0.

CC: <stable@kernel.vger.org> # v5.10+
Fixes: 8558de401b5f ("drm/vboxvideo: use managed pci functions")
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_main.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
index 42c2d8a99509..7f686a0190e6 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_main.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
@@ -42,12 +42,11 @@ static int vbox_accel_init(struct vbox_private *vbox)
 	/* Take a command buffer for each screen from the end of usable VRAM. */
 	vbox->available_vram_size -= vbox->num_crtcs * VBVA_MIN_BUFFER_SIZE;
 
-	vbox->vbva_buffers = pci_iomap_range(pdev, 0,
-					     vbox->available_vram_size,
-					     vbox->num_crtcs *
-					     VBVA_MIN_BUFFER_SIZE);
-	if (!vbox->vbva_buffers)
-		return -ENOMEM;
+	vbox->vbva_buffers = pcim_iomap_range(
+			pdev, 0, vbox->available_vram_size,
+			vbox->num_crtcs * VBVA_MIN_BUFFER_SIZE);
+	if (IS_ERR(vbox->vbva_buffers))
+		return PTR_ERR(vbox->vbva_buffers);
 
 	for (i = 0; i < vbox->num_crtcs; ++i) {
 		vbva_setup_buffer_context(&vbox->vbva_info[i],
@@ -115,12 +114,15 @@ int vbox_hw_init(struct vbox_private *vbox)
 
 	DRM_INFO("VRAM %08x\n", vbox->full_vram_size);
 
+	ret = pcim_request_region(pdev, 0, "vboxvideo");
+	if (ret)
+		return ret;
+
 	/* Map guest-heap at end of vram */
-	vbox->guest_heap =
-	    pci_iomap_range(pdev, 0, GUEST_HEAP_OFFSET(vbox),
-			    GUEST_HEAP_SIZE);
-	if (!vbox->guest_heap)
-		return -ENOMEM;
+	vbox->guest_heap = pcim_iomap_range(pdev, 0,
+			GUEST_HEAP_OFFSET(vbox), GUEST_HEAP_SIZE);
+	if (IS_ERR(vbox->guest_heap))
+		return PTR_ERR(vbox->guest_heap);
 
 	/* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
 	vbox->guest_pool = devm_gen_pool_create(vbox->ddev.dev, 4, -1,
-- 
2.43.0


