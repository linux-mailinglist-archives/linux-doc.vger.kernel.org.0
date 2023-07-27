Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8C917655B1
	for <lists+linux-doc@lfdr.de>; Thu, 27 Jul 2023 16:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbjG0OPi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jul 2023 10:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232774AbjG0OPi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 10:15:38 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8339E30D2
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 07:15:36 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b9b5ee9c5aso15194591fa.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 07:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690467335; x=1691072135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejdl0KVafWeUDCoat0LuZ8Fy/MsW+LGPGn9twtI85O4=;
        b=xCt9C05W1VphhOi6OHJ+m4dwlujqmo7vBPKV6Y0OWx7fRMj79yzK7Nk8K3icSTrYCB
         pK1An74ohRZpjEt3rQzR7XVUMbnHALMVMSiuUwVsTPgO6U2nFT32bnVt24n6iWeOdygP
         qGiBwgnHHZyNs8Zu6bl82tL45DJKrlbWEAie2pHhWl7b7Q3xkulmAe5LnJtUaYIJ74YY
         rZHO9fQZLQSKG+M0yFbH4cccCTi7qDc0BrkvL9TovzPwXCOPv2LR+/h7R9CWOKIzaWOZ
         EIneyUPToIo0bBhqEGKns6FSBA22SUVCCfcFMhHLi0Pgchs4o4M6pNRzBICX9X07vr3J
         hZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690467335; x=1691072135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejdl0KVafWeUDCoat0LuZ8Fy/MsW+LGPGn9twtI85O4=;
        b=YLKS7+FNFr49L4Y1apcYNfNix2vGD6DwoBMHBC1naPNfr8P3qD312pCbewOsUpTX6G
         Cbm7T+HuqMwiSKQUsiDEEFV+cvaVIwBeDQAkqOJXb+vxeRAW8CbjnK9BZ3qEVii7Sula
         v78kw6ySU6EZQ2bdvbSzD7PbTo/FelLWoLU41ZhWaYpjK8+M6MZ3pbbl0H1Ni2OT1lyo
         nlLx6L35vfZnU9sXmFplADsvp1hpxF3IQNTLqD1WLQXZZS0ltCQ5aZ7cuW8Cx+oWztkR
         VeqCWOkzZxdwKnxvnOcT57TrQ7H1FNPPT27pzPE3uwxrAQHtnN6LjAKwWsTZMWMX9iMQ
         yEzg==
X-Gm-Message-State: ABy/qLZXc/8cPNEWKGOlQInfN5juargRMzoyVlP1T3nD2kxYvzPXKBdJ
        ezZURZ2q3q5Tyv8Hst20Kc8/RA==
X-Google-Smtp-Source: APBJJlHY17a6wPpkEEXxMQBJOAf/w61Kl62dSVUuEtexW6i7EBwi5BqZSmXnNR9+IbGjMAWrwBYHGQ==
X-Received: by 2002:a2e:9983:0:b0:2b7:7e:e95e with SMTP id w3-20020a2e9983000000b002b7007ee95emr1883680lji.45.1690467334531;
        Thu, 27 Jul 2023 07:15:34 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c294200b003fc02e8ea68sm4850057wmd.13.2023.07.27.07.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:15:33 -0700 (PDT)
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
Subject: [PATCH v4 01/10] perf: Fix wrong comment about default event_idx
Date:   Thu, 27 Jul 2023 16:14:19 +0200
Message-Id: <20230727141428.962286-2-alexghiti@rivosinc.com>
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

