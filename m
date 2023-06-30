Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDE83743745
	for <lists+linux-doc@lfdr.de>; Fri, 30 Jun 2023 10:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbjF3Idr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 30 Jun 2023 04:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232579AbjF3Ido (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jun 2023 04:33:44 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5C31BE9
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 01:33:43 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbc77e76abso3543675e9.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 01:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688114021; x=1690706021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFKT0CCXN0CmmHE2x8MUQw5sccSB1SdakxOhkM1UsG4=;
        b=YGAogcVzokF+D0qjqmU3kpfxHH4NCQmZL5hxdf7X6SSw33kykvLvK6O3yH62Wh5KJs
         AI+kFCJ+XKcyflz03tZeBSOK3mdSvkfolRUwvwoE2OoTCMNudeW3PdTVP95e6GocLU/N
         YygZJOZT/1wW8FkrtFxcSBXYCawVlOJln1BQSnbywabffKuPzm96PK063d/COMXtlZoM
         RfVe8d3eFPxGt8MI4tg2xzpfBf6tCr8koxakv9E5o1JNI2//NwB2JCt6o9+Vh8ajvvu+
         lKsjBGdikrwy1dWQPmQywiFnnCn9wnpbQ1KHhOw4ctZqEtIougO0WReOzYJMEwk93dxp
         UkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114021; x=1690706021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFKT0CCXN0CmmHE2x8MUQw5sccSB1SdakxOhkM1UsG4=;
        b=ABznnIrF54Vep0QxhC6mAhbZXEizvsOBXAVZ4grU6FtKiTfZb4vFZ3LKl6eDIt8dUP
         gRCjUwXpj062mOPU4GQudaZb61k2UohVqDu95TcronDk0MZbJgP/LSh1SZ8eQtFqG25Q
         DeQfMnhBn218r//iHEgZ7mE7pGBYAaC8G+hOPBctCfln9YGl0dLRsX8Nkf+5c4jFPJvt
         wRFrMat9zOxDEIfxkr9x8ERalCLg0QfTA82MUe0b+nN1n5AAymHMJtZ12gL5Vs5VyFe4
         2dO/Kxn0g73vXEEYToJVnlgLioBkPqxNDLmaIfZbTvglVQhkLmZx3gde/4JgTMsXBtfk
         ISuA==
X-Gm-Message-State: AC+VfDzsmJlMkE6CdhCmbLU5rCaAdAhPAW3Tgbplwn+50brzED8rYLFS
        nUVIwltZ0ycrv0O8fWcLbJLw1w==
X-Google-Smtp-Source: ACHHUZ7Qad/4yQ+SzjVoKc4hjwSg7WrVeGOPcXS9LsZnNjqu+cFkrpDtf3BchhUp9ScTeVkytqKaOg==
X-Received: by 2002:a05:600c:2292:b0:3f8:fc2a:c7eb with SMTP id 18-20020a05600c229200b003f8fc2ac7ebmr1334297wmf.5.1688114021658;
        Fri, 30 Jun 2023 01:33:41 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id n20-20020a7bcbd4000000b003fb739d27aesm10273826wmi.35.2023.06.30.01.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:33:41 -0700 (PDT)
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
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 02/10] include: riscv: Fix wrong include guard in riscv_pmu.h
Date:   Fri, 30 Jun 2023 10:30:05 +0200
Message-Id: <20230630083013.102334-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630083013.102334-1-alexghiti@rivosinc.com>
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The current include guard prevents the inclusion of asm/perf_event.h
which uses the same include guard: fix the one in riscv_pmu.h so that it
matches the file name.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/perf/riscv_pmu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 43fc892aa7d9..9f70d94942e0 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -6,8 +6,8 @@
  *
  */
 
-#ifndef _ASM_RISCV_PERF_EVENT_H
-#define _ASM_RISCV_PERF_EVENT_H
+#ifndef _RISCV_PMU_H
+#define _RISCV_PMU_H
 
 #include <linux/perf_event.h>
 #include <linux/ptrace.h>
@@ -81,4 +81,4 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
 
 #endif /* CONFIG_RISCV_PMU */
 
-#endif /* _ASM_RISCV_PERF_EVENT_H */
+#endif /* _RISCV_PMU_H */
-- 
2.39.2

