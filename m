Return-Path: <linux-doc+bounces-12878-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F31C88EB9A
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 17:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 105A4B29816
	for <lists+linux-doc@lfdr.de>; Wed, 27 Mar 2024 16:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5560912FB08;
	Wed, 27 Mar 2024 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cb96jY4f"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC1A12F5B2
	for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711555308; cv=none; b=LbiXerOotZwL+55VRkVooKTV9O4TtfSJO2G+2HzTPAcS6ZS2xyMenqDDNrJPVq7cgL7UBAnunFky8XiUNdBLUo2Sk2aCKZ6eGidPMGqKtjx6O6D/2cc+CVnT+dCLKoGoP1josXP9e/i8vpnHDVbzgQHnLOIk0oZvEfYg57d+40Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711555308; c=relaxed/simple;
	bh=sCzNGZzazf+KJukAXuHWhrhnZJ5Xtoa9qDS9guDzCUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PMS86020isDAVZ0vvIJv4/mNsVYbXu9bqKeu9U4t6J3J8ZSXF2LaAaIm8JUQfPgU/NPvE48slLPd+c0wEu68YOtmViCXO6JNiPsaPcdFXI2DUHlSuSdul83AtUTW3tuRBOM1RkcuMhm4bpevdwVbhleqB4lgcUVizL7pj1bxs64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cb96jY4f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711555304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sV/lZgwkhea3I+lgwlHmyuTZ7NXsG6CjPnVg+nnNBQ8=;
	b=cb96jY4fLWHzY+GVMZec0xKRqvvvuyhZhBR7SSQm5DOxhOJuxJPuGRtvk6KQE4ggHwV+iH
	MG8xNShlpggahuxospxkBSW0D7WPASDROq1snsRm6fo2WVUOzCWCfOz07/51TqsHfeIwmI
	V2MxlpNaqa9nMNw9HiR2EWlukzj6CnQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-hEP_WjaXNxqHr-8cWLk1cw-1; Wed, 27 Mar 2024 12:01:43 -0400
X-MC-Unique: hEP_WjaXNxqHr-8cWLk1cw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3418f237c0bso3514307f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 09:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711555301; x=1712160101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sV/lZgwkhea3I+lgwlHmyuTZ7NXsG6CjPnVg+nnNBQ8=;
        b=Bdrf7O+R+yu3xWoEVPvhnfFECf9Upw/AodHJFBmyqE6BzSoYI+QIRy+DfMZ8v2Q1AV
         IjmeysIgOIxnVv+XSPDV1mo0CdTxiSNDQJxMkoKGPHRLWx5PlICeNGz/xKk/nUSS93dY
         7DYxc3LD8v6oVGuYh4ORj7x01RTUy9p4qkp2/e+lLJhndYIYutvT5wPJUcn/QvVcnrkw
         R4CxtFsvE9rn60Wg4TMaJfLGpoASd/lfrFrxyG58ZioefP36tgGlow+iGb0VoD1drjXN
         XK3PUWEOKdPS1ukavoVBFTNcZyuYYFWp3eUMKcPIRbdoBYJldyyCqQA1//wG0wduK5Ys
         B2DA==
X-Forwarded-Encrypted: i=1; AJvYcCU/xINMWV8nQACEYS2uCK86p0XR6G/9LTOfT7UBNiOk8U+09/wlnN8ywBu2z1NtlRrwTBFrPkh+XZKBE0FUbQIv76ZOZeeKS+hc
X-Gm-Message-State: AOJu0Yz7quUm2s+RAUuGt9lpX14OKqTsNTXteV2lPth9fvbyDpmcJbEG
	1v5Tybo0M96rLFoDsyjyXkudoO30PTHl0sEiMKwyrg3OW/ThxFJHYUAY5cTISX/bvpufwiVsmTy
	UzoIJNIrS1fYYKedJ2qNhVk4weGOl5fW1069ShQePUrBNnT7y/bF1Avmw
X-Received: by 2002:a05:6000:188a:b0:33e:8b95:b351 with SMTP id a10-20020a056000188a00b0033e8b95b351mr325959wri.9.1711555301593;
        Wed, 27 Mar 2024 09:01:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMHzSy070bVLduzjetNQIXt6kHnR1+LnSFRxpL9zxKrA3nP/E66ofJjxLjiEBU6orzyjofKw==
X-Received: by 2002:a05:6000:188a:b0:33e:8b95:b351 with SMTP id a10-20020a056000188a00b0033e8b95b351mr325938wri.9.1711555301136;
        Wed, 27 Mar 2024 09:01:41 -0700 (PDT)
Received: from klayman.redhat.com (net-2-34-30-89.cust.vodafonedsl.it. [2.34.30.89])
        by smtp.gmail.com with ESMTPSA id x3-20020adfcc03000000b0033e41e1ad93sm15114709wrh.57.2024.03.27.09.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 09:01:40 -0700 (PDT)
From: Marco Pagani <marpagan@redhat.com>
To: Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Tull <atull@opensource.altera.com>
Cc: Marco Pagani <marpagan@redhat.com>,
	linux-fpga@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] fpga: region: add owner module and take its refcount
Date: Wed, 27 Mar 2024 17:00:20 +0100
Message-ID: <20240327160022.202934-1-marpagan@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation of the fpga region assumes that the low-level
module registers a driver for the parent device and uses its owner pointer
to take the module's refcount. This approach is problematic since it can
lead to a null pointer dereference while attempting to get the region
during programming if the parent device does not have a driver.

To address this problem, add a module owner pointer to the fpga_region
struct and use it to take the module's refcount. Modify the functions for
registering a region to take an additional owner module parameter and
rename them to avoid conflicts. Use the old function names for helper
macros that automatically set the module that registers the region as the
owner. This ensures compatibility with existing low-level control modules
and reduces the chances of registering a region without setting the owner.

Also, update the documentation to keep it consistent with the new interface
for registering an fpga region.

Other changes: unlock the mutex before calling put_device() in
fpga_region_put() to avoid potential use after release issues.

Fixes: 0fa20cdfcc1f ("fpga: fpga-region: device tree control for FPGA")
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Xu Yilun <yilun.xu@intel.com>
Signed-off-by: Marco Pagani <marpagan@redhat.com>
---

v2:
- Fixed typo in the documentation sets -> set
- Renamed owner pointer get_br_owner -> br_owner
---
 Documentation/driver-api/fpga/fpga-region.rst | 13 ++++++----
 drivers/fpga/fpga-region.c                    | 26 +++++++++++--------
 include/linux/fpga/fpga-region.h              | 13 +++++++---
 3 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/Documentation/driver-api/fpga/fpga-region.rst b/Documentation/driver-api/fpga/fpga-region.rst
index dc55d60a0b4a..77190a5ef330 100644
--- a/Documentation/driver-api/fpga/fpga-region.rst
+++ b/Documentation/driver-api/fpga/fpga-region.rst
@@ -46,13 +46,16 @@ API to add a new FPGA region
 ----------------------------
 
 * struct fpga_region - The FPGA region struct
-* struct fpga_region_info - Parameter structure for fpga_region_register_full()
-* fpga_region_register_full() -  Create and register an FPGA region using the
+* struct fpga_region_info - Parameter structure for __fpga_region_register_full()
+* __fpga_region_register_full() -  Create and register an FPGA region using the
   fpga_region_info structure to provide the full flexibility of options
-* fpga_region_register() -  Create and register an FPGA region using standard
+* __fpga_region_register() -  Create and register an FPGA region using standard
   arguments
 * fpga_region_unregister() -  Unregister an FPGA region
 
+Helper macros ``fpga_region_register()`` and ``fpga_region_register_full()``
+automatically set the module that registers the FPGA region as the owner.
+
 The FPGA region's probe function will need to get a reference to the FPGA
 Manager it will be using to do the programming.  This usually would happen
 during the region's probe function.
@@ -82,10 +85,10 @@ following APIs to handle building or tearing down that list.
    :functions: fpga_region_info
 
 .. kernel-doc:: drivers/fpga/fpga-region.c
-   :functions: fpga_region_register_full
+   :functions: __fpga_region_register
 
 .. kernel-doc:: drivers/fpga/fpga-region.c
-   :functions: fpga_region_register
+   :functions: __fpga_region_register_full
 
 .. kernel-doc:: drivers/fpga/fpga-region.c
    :functions: fpga_region_unregister
diff --git a/drivers/fpga/fpga-region.c b/drivers/fpga/fpga-region.c
index b364a929425c..1beb7415c2dc 100644
--- a/drivers/fpga/fpga-region.c
+++ b/drivers/fpga/fpga-region.c
@@ -53,7 +53,7 @@ static struct fpga_region *fpga_region_get(struct fpga_region *region)
 	}
 
 	get_device(dev);
-	if (!try_module_get(dev->parent->driver->owner)) {
+	if (!try_module_get(region->br_owner)) {
 		put_device(dev);
 		mutex_unlock(&region->mutex);
 		return ERR_PTR(-ENODEV);
@@ -75,9 +75,9 @@ static void fpga_region_put(struct fpga_region *region)
 
 	dev_dbg(dev, "put\n");
 
-	module_put(dev->parent->driver->owner);
-	put_device(dev);
+	module_put(region->br_owner);
 	mutex_unlock(&region->mutex);
+	put_device(dev);
 }
 
 /**
@@ -181,14 +181,16 @@ static struct attribute *fpga_region_attrs[] = {
 ATTRIBUTE_GROUPS(fpga_region);
 
 /**
- * fpga_region_register_full - create and register an FPGA Region device
+ * __fpga_region_register_full - create and register an FPGA Region device
  * @parent: device parent
  * @info: parameters for FPGA Region
+ * @owner: owner module containing the get_bridges function
  *
  * Return: struct fpga_region or ERR_PTR()
  */
 struct fpga_region *
-fpga_region_register_full(struct device *parent, const struct fpga_region_info *info)
+__fpga_region_register_full(struct device *parent, const struct fpga_region_info *info,
+			    struct module *owner)
 {
 	struct fpga_region *region;
 	int id, ret = 0;
@@ -213,6 +215,7 @@ fpga_region_register_full(struct device *parent, const struct fpga_region_info *
 	region->compat_id = info->compat_id;
 	region->priv = info->priv;
 	region->get_bridges = info->get_bridges;
+	region->br_owner = owner;
 
 	mutex_init(&region->mutex);
 	INIT_LIST_HEAD(&region->bridge_list);
@@ -241,13 +244,14 @@ fpga_region_register_full(struct device *parent, const struct fpga_region_info *
 
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(fpga_region_register_full);
+EXPORT_SYMBOL_GPL(__fpga_region_register_full);
 
 /**
- * fpga_region_register - create and register an FPGA Region device
+ * __fpga_region_register - create and register an FPGA Region device
  * @parent: device parent
  * @mgr: manager that programs this region
  * @get_bridges: optional function to get bridges to a list
+ * @owner: owner module containing get_bridges function
  *
  * This simple version of the register function should be sufficient for most users.
  * The fpga_region_register_full() function is available for users that need to
@@ -256,17 +260,17 @@ EXPORT_SYMBOL_GPL(fpga_region_register_full);
  * Return: struct fpga_region or ERR_PTR()
  */
 struct fpga_region *
-fpga_region_register(struct device *parent, struct fpga_manager *mgr,
-		     int (*get_bridges)(struct fpga_region *))
+__fpga_region_register(struct device *parent, struct fpga_manager *mgr,
+		       int (*get_bridges)(struct fpga_region *), struct module *owner)
 {
 	struct fpga_region_info info = { 0 };
 
 	info.mgr = mgr;
 	info.get_bridges = get_bridges;
 
-	return fpga_region_register_full(parent, &info);
+	return __fpga_region_register_full(parent, &info, owner);
 }
-EXPORT_SYMBOL_GPL(fpga_region_register);
+EXPORT_SYMBOL_GPL(__fpga_region_register);
 
 /**
  * fpga_region_unregister - unregister an FPGA region
diff --git a/include/linux/fpga/fpga-region.h b/include/linux/fpga/fpga-region.h
index 9d4d32909340..d175babc3d68 100644
--- a/include/linux/fpga/fpga-region.h
+++ b/include/linux/fpga/fpga-region.h
@@ -36,6 +36,7 @@ struct fpga_region_info {
  * @mgr: FPGA manager
  * @info: FPGA image info
  * @compat_id: FPGA region id for compatibility check.
+ * @br_owner: module containing the get_bridges function
  * @priv: private data
  * @get_bridges: optional function to get bridges to a list
  */
@@ -46,6 +47,7 @@ struct fpga_region {
 	struct fpga_manager *mgr;
 	struct fpga_image_info *info;
 	struct fpga_compat_id *compat_id;
+	struct module *br_owner;
 	void *priv;
 	int (*get_bridges)(struct fpga_region *region);
 };
@@ -58,12 +60,17 @@ fpga_region_class_find(struct device *start, const void *data,
 
 int fpga_region_program_fpga(struct fpga_region *region);
 
+#define fpga_region_register_full(parent, info) \
+	__fpga_region_register_full(parent, info, THIS_MODULE)
 struct fpga_region *
-fpga_region_register_full(struct device *parent, const struct fpga_region_info *info);
+__fpga_region_register_full(struct device *parent, const struct fpga_region_info *info,
+			    struct module *owner);
 
+#define fpga_region_register(parent, mgr, get_bridges) \
+	__fpga_region_register(parent, mgr, get_bridges, THIS_MODULE)
 struct fpga_region *
-fpga_region_register(struct device *parent, struct fpga_manager *mgr,
-		     int (*get_bridges)(struct fpga_region *));
+__fpga_region_register(struct device *parent, struct fpga_manager *mgr,
+		       int (*get_bridges)(struct fpga_region *), struct module *owner);
 void fpga_region_unregister(struct fpga_region *region);
 
 #endif /* _FPGA_REGION_H */

base-commit: b1a91ca25f15b6d7b311de4465854a5981dee3d3
-- 
2.44.0


