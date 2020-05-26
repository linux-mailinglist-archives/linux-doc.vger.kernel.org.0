Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 807B41B7F91
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2020 22:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729508AbgDXUCI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Apr 2020 16:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729500AbgDXUB4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Apr 2020 16:01:56 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E612C09B049
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:55 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id fu13so3715823pjb.5
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rb70E/sjGdouOLoWnX7vl3Ag+u7wzfoBCVwZVo3HJd8=;
        b=nQ2U1b8khZFfIfjOuvs7xqMrSwowogjemD4mPQXzUxFybJtnqqu0wz83C9Xy9WzxjK
         BR5SM0fkeuVtP00aV10s31vFYUrPfKfroOSGtQ+x6c7zp9iEYrg9LYxy2nQo6XVNJK9o
         tA1hkmNN3wXKGrpFuueUK2WquyplBhHywJqkjiteGWj/SpancKa4wHsaBVd3r+ITQLt5
         nZYDGLys/6olCPsbJAs2TYqvlArstuJvbBTyyWSo1tvYu1Yfjaa8t/JPfuKttZwiLnGS
         kmn3KZKlGNFMPu+I4r7/7/mGV+j+taV3mOtBzqEvITyaCXnXG+PF4q1J1AJATywYH+TO
         AAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rb70E/sjGdouOLoWnX7vl3Ag+u7wzfoBCVwZVo3HJd8=;
        b=DQIaLcdQejy+TbyPeHb7bXxf2FmNMv/HSLZI8VlUdAvoHaRduK6WV0PqEICaVxxAyE
         omQKEYDzEoGd/RJwWuv6Vc+oOij2RBGqgn57Al61mc7DMiv26u5tQCMsrQ+IyO2366mc
         VvIJUnF/nYDiXN7MoLmUB57WTq2XAx2QqmMyKfU6tQ1GGDe3Jr0wwze++r2rRe3SMkff
         f9mtxqeTuA5hct++NBrytebWhi8YDmyqpVhAsHWUOZiyo2TISwVT/bKZ67PnZlD1pnsy
         8Vul6vYKvwZCNh6L7woGlz/8lafwJIbF7dWzLB3SsZli5L/HefHQBwrUBKLqdQlf6mrb
         /keQ==
X-Gm-Message-State: AGi0PuYUhcdR+bB+JOYBcUMz07a+1SnxYb0NkjMsaAx6gCNYr6q3Kaey
        wfghu5msxbTH03ti4QovQiQ/gw==
X-Google-Smtp-Source: APiQypK4C28yh0PLdX0/fSmEWnxbUJ2uF1f02JWzlTKDSyT3ZBXAedHvxEuxZren5njEVG7AHjvb4A==
X-Received: by 2002:a17:90a:1b67:: with SMTP id q94mr8348667pjq.84.1587758514536;
        Fri, 24 Apr 2020 13:01:54 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o11sm5532224pgd.58.2020.04.24.13.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:01:53 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/14] remoteproc: Document function rproc_set_state_machine()
Date:   Fri, 24 Apr 2020 14:01:34 -0600
Message-Id: <20200424200135.28825-14-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424200135.28825-1-mathieu.poirier@linaro.org>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a few words on the newly added rproc_set_state_machine()
in order to adversite the new API and help put people into
context.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 Documentation/remoteproc.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/remoteproc.txt b/Documentation/remoteproc.txt
index 2be1147256e0..550ed9a06a27 100644
--- a/Documentation/remoteproc.txt
+++ b/Documentation/remoteproc.txt
@@ -132,6 +132,23 @@ On success, the new rproc is returned, and on failure, NULL.
   **never** directly deallocate @rproc, even if it was not registered
   yet. Instead, when you need to unroll rproc_alloc(), use rproc_free().
 
+::
+
+  int rproc_set_state_machine(struct rproc *rproc,
+			      const struct rproc_ops *sync_ops,
+			      struct rproc_sync_flags sync_flags)
+
+This function should be called for cases where the remote processor has
+been started by another entity, be it a boot loader or trusted environment,
+and the remoteproc core is to synchronise with the remote processor rather
+then boot it.  The synchronisation flags @sync_flags tell the core whether
+it should synchronise with a remote processor when the core initialises, after
+a remote processor has crashed and after it was voluntarily stopped.  Operations
+provided in the @sync_ops should reflect the reality of the use case.  For
+example if the remoteproc core is to synchronise with a remote processor at
+initialisation time, sync_ops::find_loaded_rsc_table should provide a pointer to
+the resource table in memory rather than fetch it from the firmware image.
+
 ::
 
   void rproc_free(struct rproc *rproc)
-- 
2.20.1

