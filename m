Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6E67700308
	for <lists+linux-doc@lfdr.de>; Fri, 12 May 2023 10:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240145AbjELI4A (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 12 May 2023 04:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239941AbjELIz7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 May 2023 04:55:59 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CAB88A4D
        for <linux-doc@vger.kernel.org>; Fri, 12 May 2023 01:55:58 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3078aa0b152so4767277f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 12 May 2023 01:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683881755; x=1686473755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QY27g5sr+JNiqZNrge47UBk9a46tJHd9T9wI0BAUVg=;
        b=Ftw175Ch82/1rbUuTQSZES/+yQ6S8AeXWJ5VcD+TAgo+kc3ujHnyYxk4Vx9cWrqXnk
         YV1zC8iOv4vkkA6pJla1yGyDXtKGzVeWoBbvbgQIRku/rrYOOkyAl4n/In1DM2/acQxv
         Fy03pankF2FBw0WocZAXDXLeqL1Sx+IN1VNZ9xDcInu6f8+LjY5+0JSebcnEEdlyqU5R
         szfalpQSRS/qB5VqQ3dVGsQdS4BrcefwZCRWAvc6h1KgNQ94PIYkcg6HoRgC4WOIP8QD
         cr/J2fXZedxcjopfHa3NT7Tr0qGvUU921a6drV0BrkCy5kwIV9/QkaG6a2casUQCe5zo
         JsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683881755; x=1686473755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QY27g5sr+JNiqZNrge47UBk9a46tJHd9T9wI0BAUVg=;
        b=T28VWA119zP/J+SjUHdUa96ijDUGPWUchP95cKhvu0zpNMYTRuE0b/R2C4kOP5U9Z2
         Iq0C4gOQlsHqqTBVnfdqTccPVqesCns5NlxIKbEHEjMx5AewUhbB8QVubwoiU+1RUOXE
         Sl+XQH5oj+YXh81Mqn7RRjv3ZFEe2spDlcXvrim59NBTFuPfjP/B/AW9yFIQBPqwncd8
         lFgxNseajsIw+dRBNwpSFUBmOFUdWFJU/Wsmn3U2o2nrRU4mZzr08Gxg+JW6Pr+vJXKp
         aOSd07NUCtlGzvZODqNl+vksbw1ryKpnoiS+0dmwbh7MyprBnOewaQMuvT3VLdX/08k4
         oggA==
X-Gm-Message-State: AC+VfDy9k/HBa+I+xJ+Td0miPNbh7TmySdOYxZ5hfyxqBSDCv/fXbR/+
        os/jwV4m40gd1etLz3xuCI/Zkg==
X-Google-Smtp-Source: ACHHUZ54C+iKB9qdjhqaI3PGXYLZY6qG7W+R5zNSWjtlKD00ABBpJbsQ+mSkX+9abDl3CAFaMrFsdQ==
X-Received: by 2002:adf:f344:0:b0:308:d687:c1f9 with SMTP id e4-20020adff344000000b00308d687c1f9mr641587wrp.63.1683881755165;
        Fri, 12 May 2023 01:55:55 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d4a84000000b003062b6a522bsm22955661wrq.96.2023.05.12.01.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 01:55:54 -0700 (PDT)
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
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 02/10] include: riscv: Fix wrong include guard in riscv_pmu.h
Date:   Fri, 12 May 2023 10:53:13 +0200
Message-Id: <20230512085321.13259-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512085321.13259-1-alexghiti@rivosinc.com>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
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
2.37.2

