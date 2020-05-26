Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3A391B7FAA
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2020 22:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729592AbgDXUCn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Apr 2020 16:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729350AbgDXUBk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Apr 2020 16:01:40 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94121C09B04A
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:40 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x15so5325189pfa.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=waQEaUAc8T/vBKYd/zXfwKYFWqlxffUg008FrjfIrmw=;
        b=hTGfqd8yUCMrEdbo4rCuRrcxrgEuIVxsi1FKpsn5N9UVWk0yhp8NSaQUCiTweALuTl
         nSsjV+VSYO34bwnqqtZVCDRTL1kN6AZ/b2OmfeMgy13IG8dHrg7cgyE0a88sR1mMoywU
         Rkf3TXu2y2l9NgvP5jlyQRXcTjLLdpsEGmp1spmaHKWht3WF+oaFfxr3NDvCABivdKDw
         wB2B7y6DKbqoOoevPhDD9+sWs4AZr1deXLnLmUWvvifSKPwfsyjQzN6g+o7qN40U9k2B
         v3Y5xi26tYT2O3tApbY+hsoralVI34cTrxMeJYG4pyYpMPor+ewEgJO3BMWx9UE9r7DU
         xJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=waQEaUAc8T/vBKYd/zXfwKYFWqlxffUg008FrjfIrmw=;
        b=iGySQ0YRiqhp2aXGzdPHk4GM5oMnRrQRyugQbWy8PSSGdOQESB+BGj55WfhO+jEGlh
         Z5sccHd/XfvrZGUAakpnzMQsoODsS50+C+JkKImkTcBXdibcRCCGGXPXvRqkV7QtUeLM
         68cMj1bNrc/IbnokPaTOvPhFZCLIp3JPfy9BIQ3/UYViHDA678Q0WaW5vG2LBJ2jAq7b
         0Jty4/t35y2GVPiMpc7EP1FI4upP/tPht2QK6s67GwXcTHN3ppNeUUupFv5F/MlamQW3
         OUpce9v/RtIsOtY7Iz10aukTaxpx0ERgmFnJa027RoRuw8vXuU/Ji8IRu71+Q8dXIkbU
         oSVQ==
X-Gm-Message-State: AGi0PuaFbLAsVWXrLx30zgGcPahi5cERee541OkSWipwRgouxgNaqrQN
        uWnOn4uNnrhZYeVL+HiyE15yLA==
X-Google-Smtp-Source: APiQypJXz4J3bpJOYburAtZcTnIr5jdsIwknm2zBGZGBjDvTEnEyq+jyTMnkG66K+fPMs/ob8wx0mA==
X-Received: by 2002:a63:6285:: with SMTP id w127mr3451248pgb.449.1587758500035;
        Fri, 24 Apr 2020 13:01:40 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o11sm5532224pgd.58.2020.04.24.13.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:01:39 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/14] remoteproc: Introduce function rproc_alloc_internals()
Date:   Fri, 24 Apr 2020 14:01:23 -0600
Message-Id: <20200424200135.28825-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424200135.28825-1-mathieu.poirier@linaro.org>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In scenarios where the remote processor's lifecycle is entirely
managed by another entity there is no point in allocating memory for
a firmware name since it will never be used.  The same goes for a core
set of operations.

As such introduce function rproc_alloc_internals() to decide if the
allocation of a firmware name and the core operations need to be done.
That way rproc_alloc() can be kept as clean as possible.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 448262470fc7..1b4756909584 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2076,6 +2076,30 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	return 0;
 }
 
+static int rproc_alloc_internals(struct rproc *rproc,
+				 const struct rproc_ops *ops,
+				 const char *name, const char *firmware)
+{
+	int ret;
+
+	/*
+	 * In scenarios where the remote processor's lifecycle is entirely
+	 * managed by another entity there is no point in carrying a set
+	 * of operations that will never be used.
+	 *
+	 * And since no firmware will ever be loaded, there is no point in
+	 * allocating memory for it either.
+	 */
+	if (!ops)
+		return 0;
+
+	ret = rproc_alloc_firmware(rproc, name, firmware);
+	if (ret)
+		return ret;
+
+	return rproc_alloc_ops(rproc, ops);
+}
+
 /**
  * rproc_alloc() - allocate a remote processor handle
  * @dev: the underlying device
@@ -2105,7 +2129,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 {
 	struct rproc *rproc;
 
-	if (!dev || !name || !ops)
+	if (!dev || !name)
 		return NULL;
 
 	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
@@ -2128,10 +2152,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	if (!rproc->name)
 		goto put_device;
 
-	if (rproc_alloc_firmware(rproc, name, firmware))
-		goto put_device;
-
-	if (rproc_alloc_ops(rproc, ops))
+	if (rproc_alloc_internals(rproc, ops, name, firmware))
 		goto put_device;
 
 	/* Assign a unique device index and name */
-- 
2.20.1

