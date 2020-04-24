Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2133A1B7F9F
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2020 22:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729574AbgDXUC3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Apr 2020 16:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729444AbgDXUBr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Apr 2020 16:01:47 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE233C09B051
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:45 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id y6so4304859pjc.4
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UgVYOEmLZR8T9VFdpsNRc2Uupq9jBoUolgKHoUHryRE=;
        b=h89uziQxnhqYDcmCgJtLSGdwCmHn0rC3Bu6mCDpOZ1qvYGWQlY3Z/6z+q6XrQXUluw
         nBTa+n77E8ofbTHybs+f9luqWuEGK2sawnmbePJGXfy0Oc0mXGNd4b8etpYU09LVnKpa
         MTlPo9c+GaghCNR8InPWnE9jvvacc0i224AGTD5P+PxgUr1eaHcNoYS4mSvrOgKyMmAl
         3na+xIhktKRyb3SSIQVjk1ypUZxjl0/3pGUtbgGKS8NWqEW0twKZzV1lRfw2OuRBYGZq
         +moyE4C56HRvW/psOtJRhtJCti2DhCRmKO8k55+XHzf0FvEMYgBsdZDUX0eV3AxvaRPz
         N7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UgVYOEmLZR8T9VFdpsNRc2Uupq9jBoUolgKHoUHryRE=;
        b=GKyvpB+mFlN08pAFX5z9H8hFV8xj83vx6nR9j2LKtV6KsWm5H6ALDuyRRLdVE6Kazr
         aVHeDdxqg6NbsSRseqbaGNZNsAVwDqAeM+ZpvUwkSVXcpUBW9t+HU7Nz9TNrTL9tIaDl
         z9nkaP8lmCghaF/hchcAsvVrezdFa5BjiA0G0oo6gyiD10AONPpQySngl71XnX9AK6lP
         e6QIx1VeoLYaEbFwu+tS3Dmt4ibHaWNQSiAFNbeUPZbpqFk9AtF3izpSlFgv78LK1Ycl
         pNwpeRhhvLtFkVVhP5iXnv3/X/uJmq5GJ2gCeaWGdWuku87GGxX1EeGe3vueSQXvJXDF
         h81A==
X-Gm-Message-State: AGi0PubdRUtDWQTnd82Byuj/Uh7xhQJ0eNSe6qhku3fCslCqhJXSaqmF
        jH2JAq26ziNI8a5jo+nLn7Qiow==
X-Google-Smtp-Source: APiQypJ83gbDmQF4KfzVXB98/GgtBjTuNiayG+21Qtkv8hHGZIq9fXWsjiw9IoOg1wXRMARx3iDpOw==
X-Received: by 2002:a17:90a:e608:: with SMTP id j8mr8415911pjy.44.1587758505366;
        Fri, 24 Apr 2020 13:01:45 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o11sm5532224pgd.58.2020.04.24.13.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:01:44 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/14] remoteproc: Refactor function rproc_trigger_auto_boot()
Date:   Fri, 24 Apr 2020 14:01:27 -0600
Message-Id: <20200424200135.28825-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424200135.28825-1-mathieu.poirier@linaro.org>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Refactor function rproc_trigger_auto_boot() so that it can deal with
scenarios where the remote processor is already running.  As such give
it a new name to better represent the capabilities and add a call to
rproc_boot() if instructed by the platform code to synchronise with the
remote processor rather than boot it from scratch.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e90a21de9de1..9de0e2b7ca2b 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1457,10 +1457,17 @@ static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
 	release_firmware(fw);
 }
 
-static int rproc_trigger_auto_boot(struct rproc *rproc)
+static int rproc_trigger_auto_initiate(struct rproc *rproc)
 {
 	int ret;
 
+	/*
+	 * If the remote processor is already booted, all we need to do is
+	 * synchronise it it.  No point in dealing with a firmware image.
+	 */
+	if (rproc_needs_syncing(rproc))
+		return rproc_boot(rproc);
+
 	/*
 	 * We're initiating an asynchronous firmware loading, so we can
 	 * be built-in kernel code, without hanging the boot process.
@@ -1971,9 +1978,12 @@ int rproc_add(struct rproc *rproc)
 	/* create debugfs entries */
 	rproc_create_debug_dir(rproc);
 
-	/* if rproc is marked always-on, request it to boot */
+	/*
+	 * If the auto boot flag is set, request to boot the remote
+	 * processor or synchronise with it.
+	 */
 	if (rproc->auto_boot) {
-		ret = rproc_trigger_auto_boot(rproc);
+		ret = rproc_trigger_auto_initiate(rproc);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.20.1

