Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 103627655C1
	for <lists+linux-doc@lfdr.de>; Thu, 27 Jul 2023 16:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232852AbjG0OSR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jul 2023 10:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233414AbjG0OSQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 10:18:16 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 425331FCD
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 07:18:15 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbc1218262so10982475e9.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690467494; x=1691072294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NmnsqQcLcAcVyns3syLHoHVHQj0n5HXKDOsH4jqkjI=;
        b=cw4QPNr+KRTkqBfUl09eVKywkJyVBIIbls5qU6tgjai2Q+mltKyEq6s+YNGOkL0v50
         zHgxupgjLcJvEwDqGUK+MpEiGLmjBDydlZdLLFqczKUC/vcJ6p8i4ou2mVIKt8N/K4Cz
         PQRh0B4EkaM8AJyraBjtd2/Vy6YqPfIAZLXPu9wJ/pcjhMLAiclOGIcH3funcREbZrSk
         ZDnOY8Jyd6MiUcgKQpBlLJ2R+FVSSi0/WzE7qRm7KQJGUMEVvhTOpX/QQxOv+3Lj2jaK
         qze77T5yV1Q7OZ2ygxybUCkHJIPHoWcZuwVE+aLzBe/oDFyXUo2dvMc7A0Sdnbi1HnuJ
         MtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690467494; x=1691072294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NmnsqQcLcAcVyns3syLHoHVHQj0n5HXKDOsH4jqkjI=;
        b=S73EzBSS6DZkDu9DdAxLMs85Ea9ix/mPiATAGpCPl3W+/yFMfGx/y6RbvDVCibdSmz
         c/svSNPMzCwn5mP2sG80wlP1bs7tWuXDVvXoJ7r+Eu9GxkxHohoDyY3kmRyxYjyQyStq
         3KMRT4b5TRHNgD3sFxMPlFs6iWcyy5fGQpZw8n67XNfQOm267GkyDY2Gdg878Cc23XYX
         XO2U+u7BOxIP7IrygMmrczfzCunTF94qvbrvyNv5FaYRNVlFDvBIwnFZnAKN8yikrvgg
         D2/QC9DLnRXi9m1OkmsRv4oePCQDIdJeC+RAGcX6EfdJQgmfONlMOBXTIhd36yFG+YsL
         iwTw==
X-Gm-Message-State: ABy/qLZUeY5E3IGuem8Zdic69z+TyodjM6K+wWMXvfLf7P4RTIHIPB6C
        tujzIlprcAhxoMD5N0mowG4MzQ==
X-Google-Smtp-Source: APBJJlFcK0DHqPtDZhpEqc3VCknaUXpHURGMn4XFTFIMukq9HJ5GlH1YzutH1Su47Mc0J/AukGiQYg==
X-Received: by 2002:a1c:f704:0:b0:3fa:934c:8356 with SMTP id v4-20020a1cf704000000b003fa934c8356mr1710900wmh.10.1690467493682;
        Thu, 27 Jul 2023 07:18:13 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bcb96000000b003f91e32b1ebsm4841104wmi.17.2023.07.27.07.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:18:13 -0700 (PDT)
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
Subject: [PATCH v4 03/10] riscv: Make legacy counter enum match the HW numbering
Date:   Thu, 27 Jul 2023 16:14:21 +0200
Message-Id: <20230727141428.962286-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727141428.962286-1-alexghiti@rivosinc.com>
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
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

RISCV_PMU_LEGACY_INSTRET used to be set to 1 whereas the offset of this
hardware counter from CSR_CYCLE is actually 2: make this offset match the
real hw offset so that we can directly expose those values to userspace.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index ca9e20bfc7ac..6a000abc28bb 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -13,7 +13,7 @@
 #include <linux/platform_device.h>
 
 #define RISCV_PMU_LEGACY_CYCLE		0
-#define RISCV_PMU_LEGACY_INSTRET	1
+#define RISCV_PMU_LEGACY_INSTRET	2
 
 static bool pmu_init_done;
 
-- 
2.39.2

