Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A13877655F0
	for <lists+linux-doc@lfdr.de>; Thu, 27 Jul 2023 16:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbjG0O2e (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jul 2023 10:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233749AbjG0O2d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 10:28:33 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE3230D4
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 07:28:31 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fbd33a57ddso11164645e9.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 07:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690468110; x=1691072910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66arnrPbHIu5M0dnPIGmis7CQPk0GPDOyAbE7q1SCMA=;
        b=c8JQYNtxWw5WK3euMF4rZHhmXo98QlKuUKMY+1Sg7Uqh3fqw9BDZ4Jxnn1YXpVefZi
         OdCWRKz/hUNg4LgncgOqHD58F06IL5aK6lBoHv5aOmASBZDbxIKX4FrhRqLLeWo9zhjh
         lJ0JLwcenXNUc1NDfRyHB0IvIoG8Uwa/wkBEiN6X5pQwanP80QTTLX8OBauFHpPFcyP/
         FlLRH9iueZNjQ6X3yvNDXQMmzy9/RitIKdaTvJCEKflJyQmujCVUnezqfwM6aDKALDW3
         Tf0gPdODKV84li+wkh2+o0JxJou4my+H4BUWRHab+O2O5LWQbBWcRi9y6ZiYrWeU+LZW
         TjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468110; x=1691072910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66arnrPbHIu5M0dnPIGmis7CQPk0GPDOyAbE7q1SCMA=;
        b=esnwo7Y6e0+ZSgsGUIrGrnMPYVEPhr+9YpXUTOFQ8s7+S7IxQowDKc+oSjTedT4CDn
         i3L+aex7U2CXpqI8c5NK3+K59PqDNLSp78jK/xhsB4/6qfEokdeLAnfxviCSKjinYRqo
         xVgau7VDpN7HCfkYptNZwyiVH5tilwjHrEZirakDVJZq1kihKhFKbWHE9rnqXGNIKwFq
         uzO8s6EEKYcd/8csPYc3y9fXRumM6QmRWE9ugifiM2V0F0qIhtISVN2GCUTsWTHe9Eil
         6pljFhFjr44kBn6EmtB5fYUgXVj1OfeG0ukaZJWlK92UyZhYCoqCiTvujh2uNZDHccLQ
         pYSw==
X-Gm-Message-State: ABy/qLZUHJf7hUBW2X933kjTAHAQ20d8FJxVcFleKsnkFnXrVfM8Ymuz
        HWWzPzAHOuo/eSup5HdWI0IOzw==
X-Google-Smtp-Source: APBJJlEVnuXj4+O4kAtoh5f0WIgrGxafvY8B+/Plh9+DeSiTI5SRqpG66kaKsMCtpZNnCm7ngZTE2Q==
X-Received: by 2002:a1c:ed0e:0:b0:3f9:9a93:217f with SMTP id l14-20020a1ced0e000000b003f99a93217fmr1976415wmh.3.1690468109878;
        Thu, 27 Jul 2023 07:28:29 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id x17-20020a05600c21d100b003fbca05faa9sm1958433wmj.24.2023.07.27.07.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:28:29 -0700 (PDT)
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
Subject: [PATCH v4 09/10] tools: lib: perf: Implement riscv mmap support
Date:   Thu, 27 Jul 2023 16:14:27 +0200
Message-Id: <20230727141428.962286-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727141428.962286-1-alexghiti@rivosinc.com>
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
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

riscv now supports mmaping hardware counters so add what's needed to
take advantage of that in libperf.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 tools/lib/perf/mmap.c | 65 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tools/lib/perf/mmap.c b/tools/lib/perf/mmap.c
index 0d1634cedf44..378a163f0554 100644
--- a/tools/lib/perf/mmap.c
+++ b/tools/lib/perf/mmap.c
@@ -392,6 +392,71 @@ static u64 read_perf_counter(unsigned int counter)
 
 static u64 read_timestamp(void) { return read_sysreg(cntvct_el0); }
 
+#elif __riscv_xlen == 64
+
+/* TODO: implement rv32 support */
+
+#define CSR_CYCLE	0xc00
+#define CSR_TIME	0xc01
+
+#define csr_read(csr)						\
+({								\
+	register unsigned long __v;				\
+		__asm__ __volatile__ ("csrr %0, " #csr		\
+		 : "=r" (__v) :					\
+		 : "memory");					\
+		 __v;						\
+})
+
+static unsigned long csr_read_num(int csr_num)
+{
+#define switchcase_csr_read(__csr_num, __val)           {\
+	case __csr_num:                                 \
+		__val = csr_read(__csr_num);            \
+		break; }
+#define switchcase_csr_read_2(__csr_num, __val)         {\
+	switchcase_csr_read(__csr_num + 0, __val)        \
+	switchcase_csr_read(__csr_num + 1, __val)}
+#define switchcase_csr_read_4(__csr_num, __val)         {\
+	switchcase_csr_read_2(__csr_num + 0, __val)      \
+	switchcase_csr_read_2(__csr_num + 2, __val)}
+#define switchcase_csr_read_8(__csr_num, __val)         {\
+	switchcase_csr_read_4(__csr_num + 0, __val)      \
+	switchcase_csr_read_4(__csr_num + 4, __val)}
+#define switchcase_csr_read_16(__csr_num, __val)        {\
+	switchcase_csr_read_8(__csr_num + 0, __val)      \
+	switchcase_csr_read_8(__csr_num + 8, __val)}
+#define switchcase_csr_read_32(__csr_num, __val)        {\
+	switchcase_csr_read_16(__csr_num + 0, __val)     \
+	switchcase_csr_read_16(__csr_num + 16, __val)}
+
+	unsigned long ret = 0;
+
+	switch (csr_num) {
+	switchcase_csr_read_32(CSR_CYCLE, ret)
+	default:
+		break;
+	}
+
+	return ret;
+#undef switchcase_csr_read_32
+#undef switchcase_csr_read_16
+#undef switchcase_csr_read_8
+#undef switchcase_csr_read_4
+#undef switchcase_csr_read_2
+#undef switchcase_csr_read
+}
+
+static u64 read_perf_counter(unsigned int counter)
+{
+	return csr_read_num(CSR_CYCLE + counter);
+}
+
+static u64 read_timestamp(void)
+{
+	return csr_read_num(CSR_TIME);
+}
+
 #else
 static u64 read_perf_counter(unsigned int counter __maybe_unused) { return 0; }
 static u64 read_timestamp(void) { return 0; }
-- 
2.39.2

