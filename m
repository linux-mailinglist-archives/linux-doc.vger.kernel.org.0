Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B595D6E120D
	for <lists+linux-doc@lfdr.de>; Thu, 13 Apr 2023 18:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjDMQRf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Apr 2023 12:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbjDMQRe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 12:17:34 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87F89EC7
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 09:17:31 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id k36-20020a05600c1ca400b003f0a7c483feso1494831wms.4
        for <linux-doc@vger.kernel.org>; Thu, 13 Apr 2023 09:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681402650; x=1683994650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=38Yb3K2X39JYdroVCYnZn1iH0zsgOPm1opWg6u9OrnA=;
        b=FYMc15O2+ikuHwDZXewujBymuKjb0wLG3G9POi/bxOvkCAVqfUklYRLX0godmEWGyl
         Mb0djbmpWZ0hLSRiWdLcrBCLV45eQOqDXCa0Nc2vK5NzWC60U92C3lcWGqlYAXV/KtCQ
         rCqtnkk3YhyRaaoUwTApDJTHO7XmmgvmhppYk+Dlp8WGbqjPYJPws+iIgqZTOLr5qqxA
         ICXBCUnEN9BY+gBFYb06nnH6hPPOnmzEqivs0CbguiSY4J1A6j5dGec27xGTfZ2nKqbp
         76aOt1t7EtPrYCm14ndD5tk1sxdtnsLnaaLtQ2NHqC8XWn1I6tX1sRe0BuacrDD9WZRx
         hJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681402650; x=1683994650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38Yb3K2X39JYdroVCYnZn1iH0zsgOPm1opWg6u9OrnA=;
        b=bZ0JGWbjXIqH7bT2HnQjuc4feEKwsq6GVuD691BZ+N7jxkKpJS+ji0nXZ//rC32fJc
         9NLsA8sFLa+qKgLtuJ0bq49jtJAYnrvSEi0FeqbSrM/X2Nat9auT8JeovofrK0qYBxJL
         NFSYka67bpOBAONKuMA1iF1tO6E/6eOhbhqoRlj95ARdh+2MRALUNk9sVWa1Z9JLXEB/
         0OKEAlaLzBstpg+M5h2fw7zXn9tZN3zAJlAAlJSXznuG2gMw/kxSANsl/hWW3dSluUX6
         bp65SMIsgk7z+Sx48E9UkPgl9q8SDD/gPwL2q3F77kWC1MmZw9Ka/rnTV4/epmn4VHJ6
         28NA==
X-Gm-Message-State: AAQBX9cDGue9VAU3Klnt04VXIsATC0RSBB29Sk1OtsBzHbbqHedZNFHt
        Xv00+0Jma62AfglRZZxUVSfjBw==
X-Google-Smtp-Source: AKy350bmCsEok/fFa5YgX7ncV0/zToqAzAd+sbPw5hmVDKRgBIpNP0624v+FkMa0rAlXJlrVKb571A==
X-Received: by 2002:a1c:6a14:0:b0:3f0:7db5:607a with SMTP id f20-20020a1c6a14000000b003f07db5607amr2179470wmc.33.1681402650384;
        Thu, 13 Apr 2023 09:17:30 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id w16-20020a05600c475000b003f092f0e0a0sm9350624wmo.3.2023.04.13.09.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 09:17:30 -0700 (PDT)
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
Subject: [PATCH 0/4] riscv: Allow userspace to directly access perf counters
Date:   Thu, 13 Apr 2023 18:17:21 +0200
Message-Id: <20230413161725.195417-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
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

riscv used to allow direct access to cycle/time/instret counters,
bypassing the perf framework, this patchset intends to allow the user to
mmap any counter when accessed through perf. But we can't break the
existing behaviour so we introduce a sysctl perf_user_access like arm64
does, which defaults to the legacy mode described above.

The core of this patchset lies in patch 4, the first 3 patches are
simple fixes.

base-commit-tag: v6.3-rc1

Alexandre Ghiti (4):
  perf: Fix wrong comment about default event_idx
  include: riscv: Fix wrong include guard in riscv_pmu.h
  riscv: Make legacy counter enum match the HW numbering
  riscv: Enable perf counters user access only through perf

 Documentation/admin-guide/sysctl/kernel.rst |  23 +++-
 arch/riscv/include/asm/perf_event.h         |   3 +
 arch/riscv/kernel/Makefile                  |   2 +-
 arch/riscv/kernel/perf_event.c              |  65 +++++++++++
 drivers/perf/riscv_pmu.c                    |  42 ++++++++
 drivers/perf/riscv_pmu_legacy.c             |  24 ++++-
 drivers/perf/riscv_pmu_sbi.c                | 113 ++++++++++++++++++--
 include/linux/perf/riscv_pmu.h              |   9 +-
 include/linux/perf_event.h                  |   3 +-
 tools/lib/perf/mmap.c                       |  65 +++++++++++
 10 files changed, 332 insertions(+), 17 deletions(-)
 create mode 100644 arch/riscv/kernel/perf_event.c

-- 
2.37.2

