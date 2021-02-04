Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78BCF30C636
	for <lists+linux-doc@lfdr.de>; Tue,  2 Feb 2021 17:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236688AbhBBQly (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Feb 2021 11:41:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236646AbhBBQj6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Feb 2021 11:39:58 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B9EC0613D6
        for <linux-doc@vger.kernel.org>; Tue,  2 Feb 2021 08:39:17 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id y205so14695572pfc.5
        for <linux-doc@vger.kernel.org>; Tue, 02 Feb 2021 08:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CFdPZ29w2xwH6QzN+c2d/PUiDMRAiYL/DxdkhsE38Vw=;
        b=UyL3T6EbSC1C8Q2rt6EMnLI9SICMZ0JlqENLHs+JcpsFDf/OfZtZ3OIi6App5/kPbr
         7xRb9XxedOjpoVFhKKqG/kUIENOqa1xtP2oOKXtevFtjI8+Z3uZDuXy9uIhRyxyWD7U2
         YLeiihRm0vya1Qvf13eKiONK+UmGnP8vD8PLyTg1jjtfiZGZOj+JtTavDcv5Kq6Geh8m
         eZLNiGOKnNkaz1nadcI8zQ0jY6PDcCF/7hSgU2u8/mx3C1/cTdfhYeQITN5sy4H1zZXs
         7h4zb2+uWU2IpoK7baF/dON6qtp2X0mupTBPje+u2wiuUps54+oxVKvARJsUXUTccgqN
         iEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CFdPZ29w2xwH6QzN+c2d/PUiDMRAiYL/DxdkhsE38Vw=;
        b=JCthUp8n+vuMQXyr4+/i1MAhfENhgA1WtaoELtfGEhwVS9kOo+XLMvPKx+AQOgj2ts
         3qA0Wd2lpDBK+nMObpsZXZuYJsjo2Xl0ARVXaiv79cVtn4rGzuPCQeQ2tmvbkzTLpgsf
         FCPkSCSEcuW/+zCExjI2zTyuhplJJCE+c8GauBud0oMbtavqmblQebKS5IDdYzhk/pOw
         rqvA5TcTAclkEjAB56kpVGiYUwD7uj2cn5o4+rZEao6rtNiZ99a0qhLkYREegFukfrCj
         WKdGP1Rtz5qAfSJ6Dp9bGTErldeGd6YJC+eIYAXOXuMyFcm5nAfPQRpB6kshFHBM/Wlz
         2xYg==
X-Gm-Message-State: AOAM5331Edpd4X9XGudd1Fif6Z4bwp9csuX9P6Q9g6ns0Af3BQYgKwDz
        NDXZ4eBvAet5fCueMvoSi6J56w==
X-Google-Smtp-Source: ABdhPJx82MyntuaE9MkO6TG9T/KZW9O2xzn/2CIWSRhrtnmVVJ0rg72Mc73Q66LiK/rQDmU7Djgriw==
X-Received: by 2002:a63:4f09:: with SMTP id d9mr23201993pgb.70.1612283957164;
        Tue, 02 Feb 2021 08:39:17 -0800 (PST)
Received: from localhost ([45.137.216.202])
        by smtp.gmail.com with ESMTPSA id x186sm21996440pfd.57.2021.02.02.08.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 08:39:16 -0800 (PST)
From:   Leo Yan <leo.yan@linaro.org>
To:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        John Garry <john.garry@huawei.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Daniel Kiss <Daniel.Kiss@arm.com>,
        Denis Nikitin <denik@chromium.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 3/7] perf cs-etm: Fix bitmap for option
Date:   Wed,  3 Feb 2021 00:38:38 +0800
Message-Id: <20210202163842.134734-4-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210202163842.134734-1-leo.yan@linaro.org>
References: <20210202163842.134734-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Suzuki K Poulose <suzuki.poulose@arm.com>

When set option with macros ETM_OPT_CTXTID and ETM_OPT_TS, it wrongly
takes these two values (14 and 28 prespectively) as bit masks, but
actually both are the offset for bits.  But this doesn't lead to
further failure due to the AND logic operation will be always true for
ETM_OPT_CTXTID / ETM_OPT_TS.

This patch defines new independent macros (rather than using the
"config" bits) for requesting the "contextid" and "timestamp" for
cs_etm_set_option().

[leoy: Extract the change as a separate patch for easier review]
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index bd446aba64f7..c25c878fd06c 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -156,6 +156,10 @@ static int cs_etm_set_timestamp(struct auxtrace_record *itr,
 	return err;
 }
 
+#define ETM_SET_OPT_CTXTID	(1 << 0)
+#define ETM_SET_OPT_TS		(1 << 1)
+#define ETM_SET_OPT_MASK	(ETM_SET_OPT_CTXTID | ETM_SET_OPT_TS)
+
 static int cs_etm_set_option(struct auxtrace_record *itr,
 			     struct evsel *evsel, u32 option)
 {
@@ -169,17 +173,17 @@ static int cs_etm_set_option(struct auxtrace_record *itr,
 		    !cpu_map__has(online_cpus, i))
 			continue;
 
-		if (option & ETM_OPT_CTXTID) {
+		if (option & ETM_SET_OPT_CTXTID) {
 			err = cs_etm_set_context_id(itr, evsel, i);
 			if (err)
 				goto out;
 		}
-		if (option & ETM_OPT_TS) {
+		if (option & ETM_SET_OPT_TS) {
 			err = cs_etm_set_timestamp(itr, evsel, i);
 			if (err)
 				goto out;
 		}
-		if (option & ~(ETM_OPT_CTXTID | ETM_OPT_TS))
+		if (option & ~(ETM_SET_OPT_MASK))
 			/* Nothing else is currently supported */
 			goto out;
 	}
@@ -406,7 +410,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 		evsel__set_sample_bit(cs_etm_evsel, CPU);
 
 		err = cs_etm_set_option(itr, cs_etm_evsel,
-					ETM_OPT_CTXTID | ETM_OPT_TS);
+					ETM_SET_OPT_CTXTID | ETM_SET_OPT_TS);
 		if (err)
 			goto out;
 	}
-- 
2.25.1

