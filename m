Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8384774377E
	for <lists+linux-doc@lfdr.de>; Fri, 30 Jun 2023 10:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbjF3Ih6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 30 Jun 2023 04:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbjF3Ihy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jun 2023 04:37:54 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92FA43588
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 01:37:49 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-311367a3e12so1898988f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 01:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688114268; x=1690706268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvJvx6RMtbDuAT1323RkBbGas4rmn6vZDZsiVVfiSsE=;
        b=lWYkSVEYk5z1FejtVVUA0klldRhytVUq4PVf4APQO/bNNLW/bXq2VaOOZVOHGfJo0O
         BoiDmTkHr4BJGzf9seJQJSJWO4tDokNB9OYnzyZ9xNSeJpd/4l9Cw3LYv2YWRbwKkPer
         cpYZTFs3FNiAgtWi/HbXsX6KJ6ti6gDFyhxO0m+hPO62v2Nzayz78ya/YGGdx3ahDrla
         NaD5ITslJvXdKypZQhW3fQZDMwKaiO2M0Gc7BNqUcEoQXxKdIbAhuUFjt90uq+1HtX6X
         Cw665ivPIqqU5u4yQz+OKSxIg2E766BxHZiRcVrVuGpi5q3pnpJFT/KRyebn+/o6G7Ry
         PRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114268; x=1690706268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvJvx6RMtbDuAT1323RkBbGas4rmn6vZDZsiVVfiSsE=;
        b=bXnqYuWQjpZhLsdjGUWIkiQTyRQjT1AplJzwpbsvtel9gYSkwEz3M407kaz5ATeHNz
         CSoOPmJgsUg8ou4XTRKCzc+Wa4KUd1uhS4lEqqGWXPWdUb7J9KHmt1oYBCid07Bkws2b
         IfPpZ6rNjoI7a+8XyTRSua6ZiiinBsYUxhAAGsH12VsBFbuxEMKhlNoNkCQKDORLPO1u
         CHo3UOWxpxkXuMM4jf7f2yYOC0s7qVeSTO+lhaOBNWaVWw7TPSApYqoffzNiYSLBb0J3
         JS9WTVsMarMtWVNWpQ0awviDNdGxlFGMwdy19xb/Ss9mcXkdiMccYHHmff2CcRNb+k2t
         +Ibw==
X-Gm-Message-State: ABy/qLbHOPDPNRRVADpAtHdHLo63kWXFQwvlLvVTDXVVYpQz4vMCbY3v
        kEiPa8z4s0ouLsRviqzf7I3hsg==
X-Google-Smtp-Source: APBJJlG6zuYcHOK0e1CApmkChpZ6WGYLrjfJBoOIUDquuicfotpS+IYjw6DMOOQWgIsvHOVOFPC1aQ==
X-Received: by 2002:adf:f6c7:0:b0:313:f60d:4958 with SMTP id y7-20020adff6c7000000b00313f60d4958mr1674659wrp.53.1688114268066;
        Fri, 30 Jun 2023 01:37:48 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id i10-20020a5d630a000000b003141f5aff08sm1576732wru.82.2023.06.30.01.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:37:47 -0700 (PDT)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atishp@atishpatra.org>,
        Anup Patel <anup@brainfault.org>,
        Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
        Andrew Jones <ajones@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 06/10] drivers: perf: Implement perf event mmap support in the legacy backend
Date:   Fri, 30 Jun 2023 10:30:09 +0200
Message-Id: <20230630083013.102334-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630083013.102334-1-alexghiti@rivosinc.com>
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Implement the needed callbacks in the legacy driver so that we can
directly access the counters through perf in userspace.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/perf/riscv_pmu_legacy.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index 6a000abc28bb..79fdd667922e 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -71,6 +71,29 @@ static void pmu_legacy_ctr_start(struct perf_event *event, u64 ival)
 	local64_set(&hwc->prev_count, initial_val);
 }
 
+static uint8_t pmu_legacy_csr_index(struct perf_event *event)
+{
+	return event->hw.idx;
+}
+
+static void pmu_legacy_event_mapped(struct perf_event *event, struct mm_struct *mm)
+{
+	if (event->attr.config != PERF_COUNT_HW_CPU_CYCLES &&
+	    event->attr.config != PERF_COUNT_HW_INSTRUCTIONS)
+		return;
+
+	event->hw.flags |= PERF_EVENT_FLAG_USER_READ_CNT;
+}
+
+static void pmu_legacy_event_unmapped(struct perf_event *event, struct mm_struct *mm)
+{
+	if (event->attr.config != PERF_COUNT_HW_CPU_CYCLES &&
+	    event->attr.config != PERF_COUNT_HW_INSTRUCTIONS)
+		return;
+
+	event->hw.flags &= ~PERF_EVENT_FLAG_USER_READ_CNT;
+}
+
 /*
  * This is just a simple implementation to allow legacy implementations
  * compatible with new RISC-V PMU driver framework.
@@ -91,6 +114,9 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
 	pmu->ctr_get_width = NULL;
 	pmu->ctr_clear_idx = NULL;
 	pmu->ctr_read = pmu_legacy_read_ctr;
+	pmu->event_mapped = pmu_legacy_event_mapped;
+	pmu->event_unmapped = pmu_legacy_event_unmapped;
+	pmu->csr_index = pmu_legacy_csr_index;
 
 	perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
 }
-- 
2.39.2

