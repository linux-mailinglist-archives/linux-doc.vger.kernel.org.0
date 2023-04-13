Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F95B6E121E
	for <lists+linux-doc@lfdr.de>; Thu, 13 Apr 2023 18:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjDMQUh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Apr 2023 12:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjDMQUg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 12:20:36 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E847280
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 09:20:35 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id bi22-20020a05600c3d9600b003f0ad935166so932700wmb.4
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 09:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681402833; x=1683994833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbhrF1vaRRoJzYyea1JBFcTA2VAH3WkbBcvliTXkyWM=;
        b=xVRpVSn8CzSugrtbdPwe0szyiwDqMkR+UEllz4W7naM2gmqv/Mjyn0tKhvPZYVFy5B
         qr7sBJ8yOjlJ7nfDYo+ia+PpSt/Cr4cMPH2Otf/r4hvuEXhldV8NkSKpARdKTc9lj0q8
         UyeAxkjzT9B3qvstiOW4L4Iu/x4tV+F3KeldSXVb+gMF5feNEXAVY/IiZUN0E06bBf6E
         MTOzvMFWYX11zNGN7XMXfnV9f5u6Sdp8SmuzAJAkd80wMkQwfswo2ikmUIHm4fLfLcb+
         OwbsxPWDKcdl/YA0HMvx62LAYuGXYdbz6xIExRTw8/ntNeRjdkzZfbQzrpdFj2AyhHtW
         QEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681402833; x=1683994833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbhrF1vaRRoJzYyea1JBFcTA2VAH3WkbBcvliTXkyWM=;
        b=dVwjmUtBBtI5fdL/FX+CE5W4ucfebHVMkOkuWeJdz38A1JQDS4Re09Xx2AlzLSqBmR
         OQEeisIkEiti6cRMYqRXijm8ILkkPB2Wb0xncNDrKHAEy9ahqbi/knP+1wTzR+5fb2zl
         RfMUN07Uj9akaAhgUSojjpvdqy5X5UqNh9h8PwE9HZ01619nsH5OGcXgUi7Q8SpWHdJj
         VtFEmUZL3Mqb9TvIai5e/JtElzFpmFm7HDhqJcGmHYZeK9flhuiBrCLTwdsNn8NKjFE6
         fY3uVm/QFzYgCyQU7BPhS41rsKO2wkE5uWRuVHNvzd7qwTDRno2dR0jABSx2D7BRjgwC
         EgmA==
X-Gm-Message-State: AAQBX9eXVoWEpOLlsMarxxY6Nd21nFd9PKcVnF1W4rlEkhoo+E6kW/TR
        tXeLvDnZMpY5aWdg9WIvISQfwg==
X-Google-Smtp-Source: AKy350Zp5PeohDBdd7Xv3HthFjOkMMVG4oUVL5Rpyjw5IcUHxehnqFrVF/5LhGA4zzMyI3xHwOYFNg==
X-Received: by 2002:a05:600c:2244:b0:3f0:7e63:e034 with SMTP id a4-20020a05600c224400b003f07e63e034mr2268188wmm.29.1681402833535;
        Thu, 13 Apr 2023 09:20:33 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b003f09fd301ddsm5004185wmq.1.2023.04.13.09.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 09:20:33 -0700 (PDT)
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
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 3/4] riscv: Make legacy counter enum match the HW numbering
Date:   Thu, 13 Apr 2023 18:17:24 +0200
Message-Id: <20230413161725.195417-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230413161725.195417-1-alexghiti@rivosinc.com>
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

RISCV_PMU_LEGACY_INSTRET used to be set to 1 whereas the offset of this
hardware counter from CSR_CYCLE is actually 2: make this offset match the
real hw offset so that we can directly expose those values to userspace.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 drivers/perf/riscv_pmu_legacy.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index ca9e20bfc7ac..0d8c9d8849ee 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -12,8 +12,11 @@
 #include <linux/perf/riscv_pmu.h>
 #include <linux/platform_device.h>
 
-#define RISCV_PMU_LEGACY_CYCLE		0
-#define RISCV_PMU_LEGACY_INSTRET	1
+enum {
+	RISCV_PMU_LEGACY_CYCLE,
+	RISCV_PMU_LEGACY_TIME,
+	RISCV_PMU_LEGACY_INSTRET
+};
 
 static bool pmu_init_done;
 
-- 
2.37.2

