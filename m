Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61DAC3AE36A
	for <lists+linux-doc@lfdr.de>; Mon, 21 Jun 2021 08:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhFUGrI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Jun 2021 02:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbhFUGrD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Jun 2021 02:47:03 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F471C0617AF
        for <linux-doc@vger.kernel.org>; Sun, 20 Jun 2021 23:44:45 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id p13so12919982pfw.0
        for <linux-doc@vger.kernel.org>; Sun, 20 Jun 2021 23:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MngqRxxEHl2ppcxz+/r0UlSDgAGtoX4UkbK2llRyjcc=;
        b=iDFn5N19FrrTYa7TxJRsUW4oiVbP2ALDloiMjEcD7XYz+nk/kVL3RD3W1cpYEQ77Wf
         yCQx1eT/Ap8/72YEUDmRPU8BNore/4yJOawiFSuZrOPXawDt8kboJNj1qJL4EjZSrTFb
         dKRiO0JPvqtD2qjEEWM5HJ7tnlRdqtKHqKMi5ABX4V/THftJJCqZ4djRotOE7ziKO2Sb
         EicQkU/b23u+GAsfO568WK76/I87GlwVTSUJkXAC6fc3saRmNPBv0bP5rxh34tdo1JWL
         y7GOdTjclhbn1hJ65xdQwcO2k5iZ9WA2glv0eRpHWpxon2kT38OHQAq+aMUgvzuM1LLx
         xPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MngqRxxEHl2ppcxz+/r0UlSDgAGtoX4UkbK2llRyjcc=;
        b=SuLWr0OTW/+FaV0jxYnW2jqQPjnDkSsLSyNeQTtczy0alWNOiAn0pxGOKOaAodarm7
         WoIVJtfsmgIiixSw9CE/7+De+cSacjFOZWAX11yrCT8zxcCJABkbKkC2qTxlM8Ots4SZ
         +UNb+9o1o6+IwgaVJQWIZwTHTS8SCGX4Pdc0gFto26cL06cdf7e3KtBvrSsLkCBxoagr
         BTZH1hQjgfheAx4Ldw9YIcRyY/t6TYgfsuWN2fye8C06GLCSk5T+Ng4UG2PmR26EVeeh
         xLafjUe3KOmDyIxOVxLPhp1ULOUlne5v1cpQfhuvmH3wfNCmQxmNvCRh8pJ61RlU/vCS
         f60Q==
X-Gm-Message-State: AOAM530Nt1UzAp9Ksi0axVa8e215z6HPjja/nWVUaET1D8Ux/36yYzeR
        teZFjyWGHWumdPySbud5oS2cCKka//TgS56Y
X-Google-Smtp-Source: ABdhPJz3uS2NIZaMaM/MYhOpgEafGu609FiIcSOzqpTKLKoyHWUGdazm9z6mtIzuamYok1wtYwHFuA==
X-Received: by 2002:a63:451f:: with SMTP id s31mr22278023pga.209.1624257884801;
        Sun, 20 Jun 2021 23:44:44 -0700 (PDT)
Received: from localhost.localdomain ([240b:10:c9a0:ca00:61b8:26ec:dc30:8823])
        by smtp.gmail.com with ESMTPSA id o34sm12744450pgm.6.2021.06.20.23.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 23:44:44 -0700 (PDT)
From:   Tomohito Esaki <etom@igel.co.jp>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, Tomohito Esaki <etom@igel.co.jp>
Subject: [PATH 3/4] dt-bindings: display: Add virtual DRM
Date:   Mon, 21 Jun 2021 15:44:02 +0900
Message-Id: <20210621064403.26663-4-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621064403.26663-1-etom@igel.co.jp>
References: <20210621064403.26663-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add device tree bindings documentation for virtual DRM.

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 .../devicetree/bindings/display/vdrm.yaml     | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/vdrm.yaml

diff --git a/Documentation/devicetree/bindings/display/vdrm.yaml b/Documentation/devicetree/bindings/display/vdrm.yaml
new file mode 100644
index 000000000000..6493bb0fc09f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/vdrm.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/vdrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Virtual DRM Device Tree Bindings
+
+description:
+  This document defines device tree properties virtual DRM. The initial
+  position, size and z-position of the plane used in the virtual DRM is
+  specified.
+  The current limitation is that these settings are applied to all crtc.
+
+properties:
+  compatible:
+    const: virt-drm
+
+patternProperties:
+  "^plane(@.*)?$":
+    description: Information of the planes used in virtual DRM
+    type: object
+
+    properties:
+      x:
+        type: int
+        description: x-coordinate of the left-top of the plane in pixels
+
+      y:
+        type: int
+        description: y-coordinate of the left-top of the plane in pixels
+
+      width:
+        type: int
+        description: width of the plane in pixels
+
+      height:
+        type: int
+	description: height of the plane in pixels
+
+      zpos:
+        type: int
+        description: z-position of the plane
+
+    required:
+      - x
+      - y
+      - width
+      - height
+      - zpos
+
+required:
+  - compatible
+  - "^plane(@.*)?$"
+
+examples:
+ - |
+   vdrm@0 {
+       compatible = "virt-drm";
+       plane@0 {
+           x = <200>;
+	   y = <100>;
+	   width = <800>;
+	   height = <600>;
+	   zpos = <1>;
+       };
+   };
-- 
2.25.1

