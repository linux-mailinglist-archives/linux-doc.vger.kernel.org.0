Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6FA1B7F9D
	for <lists+linux-doc@lfdr.de>; Fri, 24 Apr 2020 22:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729422AbgDXUBt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Apr 2020 16:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729425AbgDXUBs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Apr 2020 16:01:48 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7164CC09B04A
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:48 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a32so4300022pje.5
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ACPRkKaJUyZo8C7iIU0IKcYFjC5Ccd7f4ibW90mBkI0=;
        b=r/j9BvpKD2+h7VVgkG6ZqnvbwTKfJUON8chtw0D9EhgYbrohwaxbHnSVC6DKEdMEoe
         oUXUi8/KX/T7uSpfkE4CekO3PnJenQRoXtAgul+AqPvsi9ow75wBY9tjEYhz6nTdaqVv
         4rG72mUD5zmnY1U56LkaTOIe79apgYVIYuaDdelF24YVNO12eYio7lJ/BvWIwgM/Dfjc
         oTm1k2Zqjev5iWhdRYVG1o2lZQ0HszP/yehulR/satJVmmY7IK32kv4qPzMJgc5Ip3DC
         c0kEPOPrsCds0d6wzib3xL7J3JBfcXPJbr9I1gFyucTNRsTuVHqP+okYgh+Uapw2Eot6
         sUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ACPRkKaJUyZo8C7iIU0IKcYFjC5Ccd7f4ibW90mBkI0=;
        b=QRZzlWMegubvNbLiEhdTA423DRyODOiBK/TJLnagqYA6aXUZ2QLnrYcoHXcOfSBe9a
         FxdkrPL9EB8adIRGlJxs1jeoAy7ah9AFWDcHLeINEjQgxt7sOtdk/+DRBPyPwJQa67uu
         aaBklpIFMMnwDxNhIJx75TWmDeILm2ALb8/cNuEl354Jit3vOCxq229gAjEeAS4fhisw
         1aB8DkfmSWjPuD4gcpuE/1gElfKP8AzdUgIvYO1J3vnGdCAqtIKppkk0sXCWtLJbEVHL
         Wm1ML6Zq06vhqwcInOlGHB7Z7I5PwSzyl5IJNOP//p1KervgLC66VlBaTNTToyUJJDY5
         6Bog==
X-Gm-Message-State: AGi0PuYNvzsf3G2sDy6qE3VP5Afin1ZuyPfir+bX4vIZx2liboC4mtaq
        tmgmpYlGgQA378bLus8QmCGSmQ==
X-Google-Smtp-Source: APiQypKfmGSdN3v0D8zcRUOZanqmk0b+MRKxMtXLO8IYCYWXEgvCIFclKnMbij53lOKaXmiqTriYqA==
X-Received: by 2002:a17:90a:276a:: with SMTP id o97mr8248471pje.194.1587758507788;
        Fri, 24 Apr 2020 13:01:47 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o11sm5532224pgd.58.2020.04.24.13.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:01:47 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/14] remoteproc: Call core functions based on synchronisation flag
Date:   Fri, 24 Apr 2020 14:01:29 -0600
Message-Id: <20200424200135.28825-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424200135.28825-1-mathieu.poirier@linaro.org>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Call the right core function based on whether we should synchronise
with a remote processor or boot it from scratch.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_internal.h | 50 ++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index dda7044c4b3e..3985c084b184 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -72,6 +72,12 @@ static inline bool rproc_needs_syncing(struct rproc *rproc)
 static inline
 int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
 {
+	if (rproc_needs_syncing(rproc)) {
+		if (rproc->sync_ops && rproc->sync_ops->sanity_check)
+			return rproc->sync_ops->sanity_check(rproc, fw);
+		return 0;
+	}
+
 	if (rproc->ops && rproc->ops->sanity_check)
 		return rproc->ops->sanity_check(rproc, fw);
 
@@ -81,6 +87,12 @@ int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
 static inline
 u64 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
 {
+	if (rproc_needs_syncing(rproc)) {
+		if (rproc->sync_ops && rproc->sync_ops->get_boot_addr)
+			return rproc->sync_ops->get_boot_addr(rproc, fw);
+		return 0;
+	}
+
 	if (rproc->ops && rproc->ops->get_boot_addr)
 		return rproc->ops->get_boot_addr(rproc, fw);
 
@@ -90,6 +102,12 @@ u64 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
 static inline
 int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
 {
+	if (rproc_needs_syncing(rproc)) {
+		if (rproc->sync_ops && rproc->sync_ops->load)
+			return rproc->sync_ops->load(rproc, fw);
+		return 0;
+	}
+
 	if (rproc->ops && rproc->ops->load)
 		return rproc->ops->load(rproc, fw);
 
@@ -98,6 +116,12 @@ int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
 
 static inline int rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
+	if (rproc_needs_syncing(rproc)) {
+		if (rproc->sync_ops && rproc->sync_ops->parse_fw)
+			return rproc->sync_ops->parse_fw(rproc, fw);
+		return 0;
+	}
+
 	if (rproc->ops && rproc->ops->parse_fw)
 		return rproc->ops->parse_fw(rproc, fw);
 
@@ -108,6 +132,13 @@ static inline
 int rproc_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc, int offset,
 		     int avail)
 {
+	if (rproc_needs_syncing(rproc)) {
+		if (rproc->sync_ops && rproc->sync_ops->handle_rsc)
+			return rproc->sync_ops->handle_rsc(rproc, rsc_type,
+							   rsc, offset, avail);
+		return 0;
+	}
+
 	if (rproc->ops && rproc->ops->handle_rsc)
 		return rproc->ops->handle_rsc(rproc, rsc_type, rsc, offset,
 					      avail);
@@ -119,6 +150,13 @@ static inline
 struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
 						   const struct firmware *fw)
 {
+	if (rproc_needs_syncing(rproc)) {
+		if (rproc->sync_ops && rproc->sync_ops->find_loaded_rsc_table)
+			return rproc->sync_ops->find_loaded_rsc_table(rproc,
+								      fw);
+		return NULL;
+	}
+
 	if (rproc->ops && rproc->ops->find_loaded_rsc_table)
 		return rproc->ops->find_loaded_rsc_table(rproc, fw);
 
@@ -127,6 +165,12 @@ struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
 
 static inline int rproc_start_device(struct rproc *rproc)
 {
+	if (rproc_needs_syncing(rproc)) {
+		if (rproc->sync_ops && rproc->sync_ops->start)
+			return rproc->sync_ops->start(rproc);
+		return 0;
+	}
+
 	if (rproc->ops && rproc->ops->start)
 		return rproc->ops->start(rproc);
 
@@ -135,6 +179,12 @@ static inline int rproc_start_device(struct rproc *rproc)
 
 static inline int rproc_stop_device(struct rproc *rproc)
 {
+	if (rproc_needs_syncing(rproc)) {
+		if (rproc->sync_ops && rproc->sync_ops->stop)
+			return rproc->sync_ops->stop(rproc);
+		return 0;
+	}
+
 	if (rproc->ops && rproc->ops->stop)
 		return rproc->ops->stop(rproc);
 
-- 
2.20.1

