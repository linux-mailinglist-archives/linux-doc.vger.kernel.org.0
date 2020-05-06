Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A04251C7C31
	for <lists+linux-doc@lfdr.de>; Wed,  6 May 2020 23:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729724AbgEFVQC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 May 2020 17:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729740AbgEFVPc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 May 2020 17:15:32 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4505AC061A41
        for <linux-doc@vger.kernel.org>; Wed,  6 May 2020 14:15:31 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id z6so1111325plk.10
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2020 14:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DGtsWyyI3BG3brxddaQI3/YJe05pwv0JTAbKs1mm5vc=;
        b=i3QVmD+M2KxEd2oig7EU863j/gw4WgNr+A5ERu8swusXsfmMSvoCVZ6y+3PmiBSic3
         OI5/3sT1ZliIcrUaTG+3/Drqlxy7R7GEBOoRaeYOXE/QvrpuL80B5YxvPtTVZGntVqCe
         1LNXkTkCQplLNdvEReEpPd9Ns3RsqPNM6lX/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DGtsWyyI3BG3brxddaQI3/YJe05pwv0JTAbKs1mm5vc=;
        b=F9EXR//87QL9mWhpi8eMwiQHK/bWPKnVw8d6mi9Kz10qJsrglugQC8JcEqm44u6eBy
         40p/rP+CIyZr/O1K8R/ltP9LMDv/761lIURixRx5s53EAHhB1E68AXZPPP11POvaf8+r
         Ng4WvcoVqyrF6G1gmnIXvo0ph1h2SbsxTBlQnjaT/4ejva/R+GJE//RvwVP1hDIKtksz
         l36h+jRKGG6Q4x7aGciG5Q9mvS21AxqH+K9JHrTgWFLwbUuXavph5vjxc7w9AiPaD+nh
         W7xCD3rtH+qdPT1ce0OSMefj+a1ZlgN2qWyINNMg/Y2Q+5flYnrv0MyPSTfCXDsmWSMw
         a1HQ==
X-Gm-Message-State: AGi0PuZGt/b/pfcuZtYTo7kyJfHXYZEa5vUgLenBK4BwA/7DVHm7k6pj
        B3eirSEEDJ8Vx8TmcoKxLNtCAg==
X-Google-Smtp-Source: APiQypLS8ol9AGtmbzC3gVURa+GQr+E7rZo3lMFLZDHm89H4EJ8dabmqGYPh2Aqcp0SuM1iqnJoT7A==
X-Received: by 2002:a17:902:8b82:: with SMTP id ay2mr9692747plb.94.1588799730685;
        Wed, 06 May 2020 14:15:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y3sm2684831pfb.132.2020.05.06.14.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 14:15:29 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Pavel Tatashin <pasha.tatashin@soleen.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>, jmorris@namei.org,
        sashal@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 3/6] pstore/ram: Refactor DT size parsing
Date:   Wed,  6 May 2020 14:15:20 -0700
Message-Id: <20200506211523.15077-4-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200506211523.15077-1-keescook@chromium.org>
References: <20200506211523.15077-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Refactor device tree size parsing routines to be able to pass a non-zero
default value for providing a configurable default for the coming
"max_reason" field.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/ram.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index 795622190c01..c2f76b650f91 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -645,18 +645,23 @@ static int ramoops_init_prz(const char *name,
 }
 
 static int ramoops_parse_dt_size(struct platform_device *pdev,
-				 const char *propname, u32 *value)
+				 const char *propname,
+				 u32 default_value, u32 *value)
 {
 	u32 val32 = 0;
 	int ret;
 
 	ret = of_property_read_u32(pdev->dev.of_node, propname, &val32);
-	if (ret < 0 && ret != -EINVAL) {
+	if (ret == -EINVAL) {
+		/* field is missing, use default value. */
+		val32 = default_value;
+	} else if (ret < 0) {
 		dev_err(&pdev->dev, "failed to parse property %s: %d\n",
 			propname, ret);
 		return ret;
 	}
 
+	/* Sanity check our results. */
 	if (val32 > INT_MAX) {
 		dev_err(&pdev->dev, "%s %u > INT_MAX\n", propname, val32);
 		return -EOVERFLOW;
@@ -689,19 +694,20 @@ static int ramoops_parse_dt(struct platform_device *pdev,
 	pdata->mem_type = of_property_read_bool(of_node, "unbuffered");
 	pdata->dump_oops = !of_property_read_bool(of_node, "no-dump-oops");
 
-#define parse_size(name, field) {					\
-		ret = ramoops_parse_dt_size(pdev, name, &value);	\
+#define parse_size(name, field, default_value) {			\
+		ret = ramoops_parse_dt_size(pdev, name, default_value,	\
+					    &value);			\
 		if (ret < 0)						\
 			return ret;					\
 		field = value;						\
 	}
 
-	parse_size("record-size", pdata->record_size);
-	parse_size("console-size", pdata->console_size);
-	parse_size("ftrace-size", pdata->ftrace_size);
-	parse_size("pmsg-size", pdata->pmsg_size);
-	parse_size("ecc-size", pdata->ecc_info.ecc_size);
-	parse_size("flags", pdata->flags);
+	parse_size("record-size", pdata->record_size, 0);
+	parse_size("console-size", pdata->console_size, 0);
+	parse_size("ftrace-size", pdata->ftrace_size, 0);
+	parse_size("pmsg-size", pdata->pmsg_size, 0);
+	parse_size("ecc-size", pdata->ecc_info.ecc_size, 0);
+	parse_size("flags", pdata->flags, 0);
 
 #undef parse_size
 
-- 
2.20.1

