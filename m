Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 657AF76C7E7
	for <lists+linux-doc@lfdr.de>; Wed,  2 Aug 2023 10:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbjHBIFH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 2 Aug 2023 04:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbjHBIFG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Aug 2023 04:05:06 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A33AC
        for <linux-doc@vger.kernel.org>; Wed,  2 Aug 2023 01:05:04 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31771bb4869so6615759f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Aug 2023 01:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690963503; x=1691568303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejdl0KVafWeUDCoat0LuZ8Fy/MsW+LGPGn9twtI85O4=;
        b=HVRel3iy2TysbHNmKF4T5Uc3LTv/kACnAUG0vRC18eZOb+FeI1/SOHRmzMrSR+0iuI
         zDSbXxGB8+I5Bj84nZnHIsY5j1f3zfytixIjpQZ0XXvZ42Zh1JGpuf+WZFKW60ASGN/y
         qd4szV5SrGTH/31OeXNSR0NV6dLD4tGXg69e96dpajfG1Ra/LqcsE91RhgxmeZagzl3T
         BH9jEmGUgv3fQLVzMGa56NgW/7UvTP4h6CZNJ8GZ8ti1rX0X/k246dJ9TBssCz5nml5Z
         HOnKC8VJQXNqZwOcT3RhKkvFmFqokaqSfTEn3fiDasyYFpiigObjmz5O1RwSHFAitIOd
         OOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963503; x=1691568303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejdl0KVafWeUDCoat0LuZ8Fy/MsW+LGPGn9twtI85O4=;
        b=kNqPX+bztfriAV+Btcd1f6vUXlYlqPHk2qlpqK65h5/bjYN59X2Y3tfFXltd3gGbJ8
         M+z+XGXnL7dN1hEGnoZYLegxDc90t1OEL5OsjPH0GPeDt9SYP/X7pe4/bgDvE1ngBtT3
         6MmxpblC1TqGo0tgx7dDVHaYZUyY3AM+r8gL9vdxNdXuO39/SUALd8lal/ruAZ50LFxM
         d2YuS53/W7DC2A24mJyE7DRjyUjJ2E/7C7aXjlcLUbyK7kFOShxyNcmeErSR1REEYAor
         x/GvZ8XvDE7Zqpy2o6FbEUlfSHHofcwJY+KFI+yrRWaWfOEZ0x9ubfBKEZCp+pHLSEUh
         2z5Q==
X-Gm-Message-State: ABy/qLYRW+6P8lIpAbqB6bjz05lXyCTctAuajemUSmmxjvPblkdzyIM+
        CubAJa6yOGoXsdiwr9hkAFNOsw==
X-Google-Smtp-Source: APBJJlFE+SO+E2RoYaNPf89zAKWdsBk3k3PC+ResQ8x4nsXktdgJw+DTaJ23RLYKJxMarQDGRsabsw==
X-Received: by 2002:adf:f4d0:0:b0:317:568d:d69f with SMTP id h16-20020adff4d0000000b00317568dd69fmr4264622wrp.12.1690963503254;
        Wed, 02 Aug 2023 01:05:03 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id a1-20020a056000050100b003141f96ed36sm18369977wrf.0.2023.08.02.01.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:05:02 -0700 (PDT)
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
        =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v6 01/10] perf: Fix wrong comment about default event_idx
Date:   Wed,  2 Aug 2023 10:03:19 +0200
Message-Id: <20230802080328.1213905-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802080328.1213905-1-alexghiti@rivosinc.com>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since commit c719f56092ad ("perf: Fix and clean up initialization of
pmu::event_idx"), event_idx default implementation has returned 0, not
idx + 1, so fix the comment that can be misleading.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/perf_event.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 2166a69e3bf2..1269c96bc3b6 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -445,7 +445,8 @@ struct pmu {
 
 	/*
 	 * Will return the value for perf_event_mmap_page::index for this event,
-	 * if no implementation is provided it will default to: event->hw.idx + 1.
+	 * if no implementation is provided it will default to 0 (see
+	 * perf_event_idx_default).
 	 */
 	int (*event_idx)		(struct perf_event *event); /*optional */
 
-- 
2.39.2

