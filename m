Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3964B76C7ED
	for <lists+linux-doc@lfdr.de>; Wed,  2 Aug 2023 10:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbjHBIGI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 2 Aug 2023 04:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232499AbjHBIGH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Aug 2023 04:06:07 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C0FAC
        for <linux-doc@vger.kernel.org>; Wed,  2 Aug 2023 01:06:06 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31792ac0fefso3467244f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 02 Aug 2023 01:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690963564; x=1691568364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFKT0CCXN0CmmHE2x8MUQw5sccSB1SdakxOhkM1UsG4=;
        b=Adz4V7ebnS4I/sTqKU8RSqQEnKbk+n8KbATevT3pt2JKoSYYQPOQxfDEVEBfvip2nx
         AngRsIDgef7MaOxkLUmDETDs6o8j015PBBys0v/5d1MMOsHH3wCG0pMzCQ+boByDZJzW
         WXik2xuDgv/KfsnxBicFvsOoSJVq8bx2MDTxE8SLF1FC9QhLAM1J6Ux9ZeRZzpytge6i
         JbFsreahsXB+e74yq7ZevOSM9Wiyv+5NvC8D+bdJyNm5uYQd2Jz5DFeO+kjORGPLNy5y
         8ND7l4FtK3RsDrDHLAeY5MPDyZWtGoR+6ygXi0vJ9janNWqopEiqBN65X7PN//eY3QbX
         7gvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963564; x=1691568364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFKT0CCXN0CmmHE2x8MUQw5sccSB1SdakxOhkM1UsG4=;
        b=aFqeTorDPnNG8+al+0CXpmiS2e9N8OmBBE4/MyOSqqBRjZSJac08eO7TB8pIkdMk2u
         3uP6UrH/CmZr2R4wnb3u+akFnBDy4CW8v++LTjg7ppElpCC18v4Y8VUw9z0vH/DDIMGs
         0/Jc+4h/qMx/+nDvb9DoW0mcMH2KbLpzsF7SAzlNz1znxrMlOa4cBu3a3cIGm3shQt/m
         DfpmB1mcOs5Fvo+KbrRS63O6D66JzKZgABC6e+igntIUOyHNaxs7EAolPw7EpTjOFoV3
         pDXiKxFKKm70vphte3dPy0GiAoXe2vSdFvcRq77aeRgUD9KAhHkivswH0pxTVPrbfVUe
         6uNQ==
X-Gm-Message-State: ABy/qLbwpCTaWl6+Ze7uhYRjBLpV5u3i3qUjSHnaTtfU4l8vwVj144Lh
        K57qBgudS4WTDJd86QvAzCcA1Q==
X-Google-Smtp-Source: APBJJlG8oarSGyXOlT0EQobPAzvsBrq4qipdC0dcvV40KYMzzWjCixkSHe1ttjuuxvHCGFnvfLcJNg==
X-Received: by 2002:a5d:654b:0:b0:314:1f6:2c24 with SMTP id z11-20020a5d654b000000b0031401f62c24mr4197414wrv.36.1690963564470;
        Wed, 02 Aug 2023 01:06:04 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id z8-20020adfec88000000b0031773a8e5c4sm18156602wrn.37.2023.08.02.01.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:06:04 -0700 (PDT)
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
        Conor Dooley <conor.dooley@microchip.com>,
        Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v6 02/10] include: riscv: Fix wrong include guard in riscv_pmu.h
Date:   Wed,  2 Aug 2023 10:03:20 +0200
Message-Id: <20230802080328.1213905-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802080328.1213905-1-alexghiti@rivosinc.com>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
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

