Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F09381B7FA3
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2020 22:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729441AbgDXUCd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Apr 2020 16:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729431AbgDXUBr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Apr 2020 16:01:47 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10230C09B049
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:47 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id 7so4949291pjo.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FBdqDq0VMaj7zwangCHWNwKrKJkwsKj44UAlSOD4+hI=;
        b=d7r4l7Na8FJeJ/BgUKfyHxZF4kOAr524AMcWcrx7Wl+nAP2MT1cVwKm/K0x9jC+E9V
         wjGCifTbwvuY97Xaq96AhpZHGRgLSPU3cdsjiiqXcQ7aW/+RmZcf82B+NWqq25RYCYDH
         EkbZxXecCLTk5//7lSBZE5YfxTyslPWOt3vMrME4zrLiOeJ1eeuFoHg0YEGdi7d0ImDy
         VNNmm0xrZIv5JnoW0JgPK4uHDhhlOqdaciDoHtcwPTvR3w8NQMWPAEdRVNuSkIOxGc76
         O7g7EYBKtLjvfVeEw1Z42FjkUEqCMV+Kr1HT65HBvr86KoVlBJ+v713FQhFQq2UTZdSA
         NSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FBdqDq0VMaj7zwangCHWNwKrKJkwsKj44UAlSOD4+hI=;
        b=ATi+dgxlQnPXI7nH84R4/oDYVY8a71Ga7Ksek79tk6qebyCfAkMIt1pOIPvPGdLzoN
         SsLKP/EoccJswc1wQWaFWVAw8BlDBttUGw252FoJg6wzk5i3l5+DspRuKM9zaXNSPhNj
         yyBbxHBoMxYnsekHkrOHAIEy2gb+gKNtvfpu5jeOA77FCnIV67IVsLchyCeUhU4KEAUO
         6zKyCEBVUxINDOqRxblIwwDIYpC+HVt09S39ey71MofeBlzDUUFZSSmLs8hPU2IscJEM
         dxnhkg09nAHLpZA+ezzpV7FLG5yUvsPj+80WP8+2RsLofneDLexUiyfcd9WZ9nsh+sbR
         dMwQ==
X-Gm-Message-State: AGi0PuY2nGqsRIYJiICBZCxZ9OUsWdEWayNLDiEDoA4RJHlBylvjnanr
        m5/mDBOV2G/AxTulFXCDCdVBmA==
X-Google-Smtp-Source: APiQypLgAeie2x7ivDbbviyB5xQucMuPuY1GziJxdG1upZHceYt6LjmgNtHV4dxErjTY9cA3zY8Rdg==
X-Received: by 2002:a17:90a:a591:: with SMTP id b17mr8308969pjq.90.1587758506525;
        Fri, 24 Apr 2020 13:01:46 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o11sm5532224pgd.58.2020.04.24.13.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:01:46 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/14] remoteproc: Introducting new start and stop functions
Date:   Fri, 24 Apr 2020 14:01:28 -0600
Message-Id: <20200424200135.28825-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424200135.28825-1-mathieu.poirier@linaro.org>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add new functions to replace direct calling of rproc->ops->start() and
rproc->ops->stop().  That way different behaviour can be played out
when booting a remote processor or synchronising with it.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c     |  6 +++---
 drivers/remoteproc/remoteproc_internal.h | 16 ++++++++++++++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9de0e2b7ca2b..ef88d3e84bfb 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1339,7 +1339,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	}
 
 	/* power up the remote processor */
-	ret = rproc->ops->start(rproc);
+	ret = rproc_start_device(rproc);
 	if (ret) {
 		dev_err(dev, "can't start rproc %s: %d\n", rproc->name, ret);
 		goto unprepare_subdevices;
@@ -1360,7 +1360,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 
 stop_rproc:
-	rproc->ops->stop(rproc);
+	rproc_stop_device(rproc);
 unprepare_subdevices:
 	rproc_unprepare_subdevices(rproc);
 reset_table_ptr:
@@ -1493,7 +1493,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	rproc->table_ptr = rproc->cached_table;
 
 	/* power off the remote processor */
-	ret = rproc->ops->stop(rproc);
+	ret = rproc_stop_device(rproc);
 	if (ret) {
 		dev_err(dev, "can't stop rproc: %d\n", ret);
 		return ret;
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 47b500e40dd9..dda7044c4b3e 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -125,6 +125,22 @@ struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
 	return NULL;
 }
 
+static inline int rproc_start_device(struct rproc *rproc)
+{
+	if (rproc->ops && rproc->ops->start)
+		return rproc->ops->start(rproc);
+
+	return 0;
+}
+
+static inline int rproc_stop_device(struct rproc *rproc)
+{
+	if (rproc->ops && rproc->ops->stop)
+		return rproc->ops->stop(rproc);
+
+	return 0;
+}
+
 static inline
 bool rproc_u64_fit_in_size_t(u64 val)
 {
-- 
2.20.1

