Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D531743797
	for <lists+linux-doc@lfdr.de>; Fri, 30 Jun 2023 10:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbjF3IkP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 30 Jun 2023 04:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232665AbjF3Ijx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jun 2023 04:39:53 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF381FCD
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 01:39:52 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fafe87c6fbso2536198e87.3
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 01:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688114391; x=1690706391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOVYMufG9/FqBaKJMl/ssTpZw9h9Tbb5FABAwd0Y76o=;
        b=EBbwFVdpIP6AbRzaCcRxUMVywY4aT8TXXYQBzuXycm69Am66X12dUUj6ysptXYgNIr
         kGTOqS2hMSiKkr9t8z64Utml0NDzDblWb9Ih06lJFn88rRYmLS/ZPqlg6vNJLf55epe+
         mfrndHAolhwfEvfAkLITFEqkTzZdBDYfiD5T/qT4GIQHOmdzObxuWC0UwwP9TFrFmFpM
         bOPDk4nWuDmSYim/muDHyo6QJDgHMVwWgX305aJ7W6a9SKOfVaW1r9NQOFu5pEKK5lfc
         w7NUfhwrRVI6RlDSQw5InTNym6I+xWKhvZhPrW4P4cphlohLHplbvosEpLUxq3VL/KAk
         2BsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114391; x=1690706391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOVYMufG9/FqBaKJMl/ssTpZw9h9Tbb5FABAwd0Y76o=;
        b=kTw/d7/TiZ/l6a3nd3J6Df5ubgDXNJry7rsQl3lHBsKMSFaslj/g+cW9fKVsFKO2Sh
         4XDVc2O3GTGBXq9hHCIzwhlcSYii/fdDt24ewArSGuRXoWF5WRD0oV1bv+BkKxyaa6cz
         TYfH6m0agplY6Ne9+o5LDglaRWoZsCDK+pxqcgjdBn7z6nBsTMvPVuZ0CzgLQnKz3sX5
         Uk0seIW3WXbFUKKrUctikXmXiGHziRpJixN04ABaguWPK87i8JJNxVfnXTmOrRonNzFf
         9CjkhtseBofAlIT2Ihm64VMJl1xMyReTAUhZpwJH27c9NbuUAqWkFg5LDUNsWRMQcqAF
         fHnA==
X-Gm-Message-State: ABy/qLbWVOE+cI6ZW7F7fTcW6HQD9q6qa8JIxWalZ9d1FrmsWSIruNnE
        jteBAZc1z4GdP+bw/y+G0cJOesjiq1DQmgByPCA=
X-Google-Smtp-Source: APBJJlGNGYeNhgyNFQCIWRKRLA0RLNxSwiPewnnuJneE3RkbWYcI3Hv4y5MnEIudbxWchriJpKLCFg==
X-Received: by 2002:a05:6512:31d4:b0:4f8:5f32:b1da with SMTP id j20-20020a05651231d400b004f85f32b1damr2010376lfe.24.1688114390713;
        Fri, 30 Jun 2023 01:39:50 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l6-20020adff486000000b00313fd294d6csm9704615wro.7.2023.06.30.01.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:39:50 -0700 (PDT)
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
Subject: [PATCH v3 08/10] Documentation: admin-guide: Add riscv sysctl_perf_user_access
Date:   Fri, 30 Jun 2023 10:30:11 +0200
Message-Id: <20230630083013.102334-9-alexghiti@rivosinc.com>
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

riscv now uses this sysctl so document its usage for this architecture.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 26 +++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index d85d90f5d000..c376692b372b 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -941,16 +941,34 @@ enabled, otherwise writing to this file will return ``-EBUSY``.
 The default value is 8.
 
 
-perf_user_access (arm64 only)
-=================================
+perf_user_access (arm64 and riscv only)
+=======================================
+
+Controls user space access for reading perf event counters.
 
-Controls user space access for reading perf event counters. When set to 1,
-user space can read performance monitor counter registers directly.
+arm64
+=====
 
 The default value is 0 (access disabled).
+When set to 1, user space can read performance monitor counter registers
+directly.
 
 See Documentation/arm64/perf.rst for more information.
 
+riscv
+=====
+
+When set to 0, user access is disabled.
+
+When set to 1, user space can read performance monitor counter registers
+directly only through perf, any direct access without perf intervention will
+trigger an illegal instruction.
+
+The default value is 2, which enables legacy mode (user space has direct
+access to cycle and insret CSRs only). Note that this legacy value
+is deprecated and will be removed once all userspace applications are fixed.
+
+Note that the time CSR is for now always accessible to all modes.
 
 pid_max
 =======
-- 
2.39.2

