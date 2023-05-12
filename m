Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33BF9700348
	for <lists+linux-doc@lfdr.de>; Fri, 12 May 2023 11:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240401AbjELJEa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 12 May 2023 05:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240378AbjELJEU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 May 2023 05:04:20 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C3D11559
        for <linux-doc@vger.kernel.org>; Fri, 12 May 2023 02:04:07 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3063208beedso9211906f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 12 May 2023 02:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683882246; x=1686474246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOQ/DlOGIctkGIcCTQtutRYPiw4IXxyRImNc8aVkxjk=;
        b=pcba1+uq/tkvdmjmQc1k0s5XhFgG4/E/TIRDBO/sNR/P0n+Jypo9JpGOVUOZ1sYhpc
         K6DC7rio/DIg3AQJXqk/986STBuCuxctiX4PNpQOLvkIacGSrVTXHP3EEyncOM8Vt44t
         ckOE/rnvkxumONDZCzR0JJpYANPA5nwuzFgcztVSCrQ26H7Ca3f6VdvMoH2WocjmPD+2
         JQSpRPF8k0RlLkD1F0jdx6eT6thzDHFZbt4Xj/2DhUCpu+NZvQZwug+he17lHM5b1Ui2
         zTP800qCwgEHjUNKHvYLUwVRHmntT1rwrUwoiQVQG8fL3/moRB8byaY8dRKm2w9oE0gz
         bfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683882246; x=1686474246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOQ/DlOGIctkGIcCTQtutRYPiw4IXxyRImNc8aVkxjk=;
        b=ehxWH2pbDroX7x0pA+t66w1CUCX4PUQgrXw3u+XttJLsOK+Opl4pJSSRWk54Uk2HlR
         lzdd4c4E2MCiJOm9C15ZWrrE1WehXhe5B77B5oaqeUpnf5BZux32tf7jsVFDMVVTihx5
         mFU0gy5oGlF8/fK01G6KxbaR9KKeOcMTT0fzNqYlTSb4r5/pctoKAhMXKXE5vZgvp26N
         uPjke5VTlX9dHAgHQWtXRQ/HVHNICWRBf9sNWICIfOlJTci1HarTPRYz8XVC57g1xQX0
         WzBj08LmSmc03xVXDcAl9+JA4pLPS2klxt40ip6OWTT3f+lGnRfcXJlzlGAPLK6OHGxg
         jBiQ==
X-Gm-Message-State: AC+VfDxMbJE6PXbcbz/guT71Gdfs0IBNmxXA2jSuJ6+wWPaNwvpeYG0n
        eagJyznoU8uHMlQmfiiMlyPnYQ==
X-Google-Smtp-Source: ACHHUZ5goOCUzTjChWxdDq9l5hFZBiYUR1vs3XG/CA63CCoohpET/2lu8oGivMch6urud3hl8eKx7g==
X-Received: by 2002:a5d:4b02:0:b0:307:a33d:d093 with SMTP id v2-20020a5d4b02000000b00307a33dd093mr8200432wrq.16.1683882245915;
        Fri, 12 May 2023 02:04:05 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id h8-20020a1ccc08000000b003f17eaae2c9sm28149299wmb.1.2023.05.12.02.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 02:04:05 -0700 (PDT)
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
Subject: [PATCH v2 10/10] perf: tests: Adapt mmap-basic.c for riscv
Date:   Fri, 12 May 2023 10:53:21 +0200
Message-Id: <20230512085321.13259-11-alexghiti@rivosinc.com>
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

riscv now supports mmaping hardware counters to userspace so adapt the test
to run on this architecture.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 tools/perf/tests/mmap-basic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/mmap-basic.c b/tools/perf/tests/mmap-basic.c
index e68ca6229756..f5075ca774f8 100644
--- a/tools/perf/tests/mmap-basic.c
+++ b/tools/perf/tests/mmap-basic.c
@@ -284,7 +284,7 @@ static struct test_case tests__basic_mmap[] = {
 			 "permissions"),
 	TEST_CASE_REASON("User space counter reading of instructions",
 			 mmap_user_read_instr,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
 			 "permissions"
 #else
 			 "unsupported"
@@ -292,7 +292,7 @@ static struct test_case tests__basic_mmap[] = {
 		),
 	TEST_CASE_REASON("User space counter reading of cycles",
 			 mmap_user_read_cycles,
-#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
+#if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || __riscv_xlen == 64
 			 "permissions"
 #else
 			 "unsupported"
-- 
2.37.2

