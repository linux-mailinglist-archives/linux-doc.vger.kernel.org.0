Return-Path: <linux-doc+bounces-42728-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD49A8292B
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 17:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 857894A1C66
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 14:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF2B268C7D;
	Wed,  9 Apr 2025 14:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oxbfpY5d"
X-Original-To: linux-doc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9707D25EF85;
	Wed,  9 Apr 2025 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210256; cv=none; b=k0YQCud9jzAxZnPvDrQ3o9SdGVVfUiFNdyyiP//LcCqFdm4/kwr85zH+r4BURkyjCcwGi/0ftQN78fVAfLRmQP2yDeQyd/bJYPBs0NHUBGx50MSJ2RKzjnHbdUpfH8NSaNOS1fFjntH7MhlIK90Lb0dkCBhO3vRdKMpBOdp9FqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210256; c=relaxed/simple;
	bh=u6g5brnFv1TFE3DyYtnsYXrNMc4P3CJ84FcIW04VmMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O5diaqAAYFhNwKTLOfgailm6cCwYeE+axdYwPenbVwqP8PKu812bp+kYOwAE429PwuR5MsPgvzM3M14dTteYWHEA/fbir28sawi/otYWbfAZ01Ep1ryQwwG09EJMlS5sijR/ka9sW5a7K2GAuwhdD/WSOhkBzCsYhO4Bb97ZPGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oxbfpY5d; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D19E44282;
	Wed,  9 Apr 2025 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744210247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KEmrM0VCU/J7ievAToNUp1p2V609oJSHGiAFe/2zZVo=;
	b=oxbfpY5dUtHCfmiSZUJRPZhC7MQhoIcZO80cG6DM6IRXATITV5jtCO2kv1+TjPCMGu9pnS
	f4CRqoyhzKukNQV1CRr7QmImhUhmOBwVts/npK4qxw2rNiJH9EZM+lt32/a/cHMhKX0PE5
	Fl/tNJhC4u+vNj3hH4++3Rjv5XYOY7keVTNx1+jaJ2CQshTbtKNiNCFYNhjvw4edJ7qwc/
	b6vUx3zgwRGZzyEFzNQHZhvThiX3Fvv5/gYtQzD0aYgtJiT70geAik+CDgHbB6JiAaGGoO
	7bSJzOygCisM5MLX9FXSZHaOFjSIrkvYIrfxFeS+Xth8rZPDknywUGBfsXlyLA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 09 Apr 2025 16:50:34 +0200
Subject: [PATCH v7 1/2] drm/bridge: documentat bridge allocation and
 lifecycle
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-drm-bridge-alloc-doc-test-v7-1-a3ca4b97597f@bootlin.com>
References: <20250409-drm-bridge-alloc-doc-test-v7-0-a3ca4b97597f@bootlin.com>
In-Reply-To: <20250409-drm-bridge-alloc-doc-test-v7-0-a3ca4b97597f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeivdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhms
 hhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehluhhmrghgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

Document in detail the DRM bridge allocation and refcounting process based
on the recently introduced devm_drm_bridge_alloc().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v7:
 - remove mention of "legacy mode", we now support only refcounted
   bridges
 - rename patch title from "drm/bridge: add documentation of refcounted
   bridges", we now support only refcounted bridges

Changes in v6:
 - update to the new devm_drm_bridge_alloc() API
 - rewrite and improve various sentences for clarity
 - fix typos (Randy Dunlap)

This patch was added in v5.
---
 Documentation/gpu/drm-kms-helpers.rst |  6 +++
 drivers/gpu/drm/drm_bridge.c          | 73 +++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 5139705089f200b189876a5a61bf2a935cec433a..393cd0e4cb5af3fe98674e7a96c853ffb2556c97 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -151,6 +151,12 @@ Overview
 .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
    :doc: overview
 
+Bridge allocation and lifecycle
+-------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
+   :doc: bridge lifecycle
+
 Display Driver Integration
 --------------------------
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index b4c89ec01998b849018ce031c7cd84614e65e710..b7e1ad761dad52bdb2ec09d425e69ee23a18fd36 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -61,6 +61,79 @@
  * encoder chain.
  */
 
+/**
+ * DOC: bridge lifecycle
+ *
+ * In some use cases such as hot-plugging a DRM bridge device can
+ * physically disappear and reappear at runtime. To handle such cases
+ * without destroying and recreating the entire DRM pipeline, DRM bridge
+ * lifetime is managed using reference counting:
+ *
+ * - each &struct drm_bridge is reference counted since its allocation
+ * - any code taking a pointer to a bridge has APIs to get a reference and
+ *   put it when done, to ensure the memory allocated for the bridge won't
+ *   be deallocated while there is still a reference to it
+ * - the driver implementing the bridge also holds a reference, but the
+ *   allocated struct can survive the driver in case other references still
+ *   exist
+ * - deallocation is done when the last put happens, dropping the refcount
+ *   to zero
+ *
+ * Usage of refcounted bridges happens in two sides: the bridge *provider*
+ * and the bridge *consumers*. The bridge provider is the driver
+ * implementing the bridge. The bridge consumers are all parts of the
+ * kernel taking a &struct drm_bridge pointer, including other bridges,
+ * encoders and the DRM core.
+ *
+ * For bridge **providers**, the bridge driver declares a driver-specific
+ * struct embedding a &struct drm_bridge. E.g.::
+ *
+ *   struct my_bridge {
+ *       ...
+ *       struct drm_bridge bridge;
+ *       ...
+ *   };
+ *
+ * The driver must allocate and initialize ``struct my_bridge`` using
+ * devm_drm_bridge_alloc(), as in this example::
+ *
+ *     static int my_bridge_probe(...)
+ *     {
+ *         struct device *dev = ...;
+ *         struct my_bridge *mybr;
+ *
+ *         mybr = devm_drm_bridge_alloc(dev, struct my_bridge, bridge, &my_bridge_funcs);
+ *         if (IS_ERR(mybr))
+ *             return PTR_ERR(mybr);
+ *
+ *         // Get resources, initialize my_bridge members...
+ *         drm_bridge_add(&mybr->bridge);
+ *         ...
+ *     }
+ *
+ *     static void my_bridge_remove(...)
+ *     {
+ *         struct my_bridge *mybr = ...;
+ *
+ *         drm_bridge_remove(&mybr->bridge);
+ *         // Free resources
+ *         // ... NO kfree here!
+ *     }
+ *
+ * Bridge **consumers** need to handle the case of a bridge being removed
+ * while they have a pointer to it. As this can happen at any time, such
+ * code can incur in use-after-free. To avoid that, consumers have to call
+ * drm_bridge_get() when taking a pointer and drm_bridge_put() after they
+ * are done using it. This will extend the allocation lifetime of the
+ * bridge struct until the last reference has been put, potentially a long
+ * time after the bridge device has been removed from the kernel.
+ *
+ * Functions that return a pointer to a bridge, such as
+ * of_drm_find_bridge(), internally call drm_bridge_get() on the bridge
+ * they are about to return, so users using such functions to get a bridge
+ * pointer only have to take care of calling drm_bridge_put().
+ */
+
 /**
  * DOC:	display driver integration
  *

-- 
2.49.0


