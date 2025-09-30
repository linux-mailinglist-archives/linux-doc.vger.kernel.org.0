Return-Path: <linux-doc+bounces-62143-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85690BAB12A
	for <lists+linux-doc@lfdr.de>; Tue, 30 Sep 2025 04:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F1AC1C6A41
	for <lists+linux-doc@lfdr.de>; Tue, 30 Sep 2025 02:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DE5258EDE;
	Tue, 30 Sep 2025 02:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aiyBF/wn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D605C23CF12
	for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 02:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200331; cv=none; b=YEPrVeICBCh19IeiQtA+QKWJA5pDmFM/cELlJNGN4BAH1NUIYO0Zqn1n58YJBluRcyhXyh6forVuXBCobNmKHTRjUCcs0jh/2huMlMl68fV5nKwTwWb/O2pydkR05P4vK23PCCL9TwKKGS/8fC9KV/beEaWbvhtRfA3eWgXm5Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200331; c=relaxed/simple;
	bh=Sl2YI7Td/C9YkkJpnWkOlkyn4hvpDBvdNr6f7stAoSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cdcZ63hNGDXAa+iIiHkAY8Wh23DpfIBgZtWGqmBkdmzC7YGMLlfY5U3aVIaC3g5XFWeoDWX2sSINBmOywLpzc8VqcZZ5xLw7tnOs8Mgs3Brbg2+6NmivXfUugjpbFaUy/NfvPui2Gx82loLHJGmcr9u8LdhISEceU6QPJ04Jl/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aiyBF/wn; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7811fa91774so2934018b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 19:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200329; x=1759805129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sX4DcHmKN6k6jLli4BcDyPNAsEAGb3ORwL+dRbW7euA=;
        b=aiyBF/wnrDTAEUGQ3gs3hkoDo6ov65uut92C3I+ngMReOiufaQ1vmTFIu1XnSWaGGh
         khX0pjDWJadRCDMCM3CMXPMKCKltjKWNUtc51qshE5kXFvc287XTIF8QXgev3XVGSn9y
         05DxNPfZbgEUDZkoFxdl+YdQopelHsQzG3KhzdyKhxkrnE1Hv/+FHU7/2n9zyeLmIYVz
         uTo47nYJvcaZwtoT0ajVuJE7PlG/Oh+U/sm85SO4tUaIx1F5/CrTTe7S+qGifdVeBf89
         wV/OxahguZKjvN/XTCzxgnwE0taEPgzJ1LSh95A9Ols1FTzW4QPkrMnIoSn1CJaDFPvk
         oNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200329; x=1759805129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sX4DcHmKN6k6jLli4BcDyPNAsEAGb3ORwL+dRbW7euA=;
        b=Je8zhLKhtkkzbnDzhi8xnIqBI7101DzgBHTwlSEwUVzNZ8KXCkQJKFPbb4DgjD/m8Q
         VEMqgdiSljr671Pcvz++jhTx1Sd5wbJaErL3Iw6D1qd0Kg4T+tZm0iNJyH8p66sW9y1b
         Hv/tAjE8FFTQmY+eqVCQPuRXvBRDL7bOFGurZLFhmDsJIhnKg4MTqEDme6bgx2bPgiK4
         0M6XCtEIX33iFSimiD4t9ntExGr1sIWKz1/ev5Ih7xy+AltjyX0624L1su0fqURaYAcU
         vnPIfDQz8N+0xUIiSbtRSSiixbuSF9hH+6Sg2aYqrMo8XbwBtwP6AshPvpCDNQzab3Wn
         XxnQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5hSnMaNxt1EXb7HDMi2JHP4EOyk75IIqUAWbWNTHDSqtMc9CpvzO9jRnO+6UC5hi0XAn5a+wytIY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdxl2gLwwZdbF1+WJ0TLPiApmJDU9WDvGqPO6R0X6G3iCghA/m
	e7d+isCV14qHNaTuenBYso4KmibxsSq5aQozK3XqLDeV1DDIKNRKA/Eh
X-Gm-Gg: ASbGncug6nL2wSuBEoRmy0wqVsZCZxKAbvpuMB1PVATBeHu2FON7TKwVc+8bAGl19ua
	7qZniUJa3+6dyHkzx07/0s5WJeA+EXYZ8PDv0hY+FKzbiDCBNkTWV2QonO1ELPjGMzFP1CtOJiy
	fGgwEXOsrQYfxXpHf7AtKXYfc0aTowtgzWf+AzpxtgNi9xt+EZ3ARJb+GNS61zLNKoQo6LYRZDQ
	IdUCOKY27TtK2YqwqjSDliyqKua+dTXuVx0YXkGeg5ewJjbjAuSRQpZ7ykQbgBqvk0WDNapVY1A
	wcVSLW9r9gQcnoTZLTd/Q9fGF+bBm5Nqng8qNhPVI9tguWhAR0Hsc9lLvwuvlP14Rbt/2ssbjdx
	5GPvOUq+F8JApTos941H3HnZ1oOG0dCoN+fkO1QU7KhXN89x4tVN7Q2YIZvzJeEd1DsPbczGNd8
	I9QLwMbfQXi00=
X-Google-Smtp-Source: AGHT+IGTqTwXopd2ojQqxBEBkqI1vY+O5jS9ODQlBJjx1qTPcUYlj9RqM72R3p1od6/UyekDO+cXWA==
X-Received: by 2002:a05:6a00:b53:b0:76e:885a:c332 with SMTP id d2e1a72fcca58-780fcf080d2mr23371738b3a.32.1759200329155;
        Mon, 29 Sep 2025 19:45:29 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-782e36c803fsm5830819b3a.38.2025.09.29.19.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:45:28 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marco Elver <elver@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Rong Xu <xur@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	David Kaplan <david.kaplan@amd.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Nam Cao <namcao@linutronix.de>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	"David S. Miller" <davem@davemloft.net>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Cc: Jinchao Wang <wangjinchao600@gmail.com>
Subject: [PATCH v6 13/23] mm/ksw: add per-task ctx tracking
Date: Tue, 30 Sep 2025 10:43:34 +0800
Message-ID: <20250930024402.1043776-14-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930024402.1043776-1-wangjinchao600@gmail.com>
References: <20250930024402.1043776-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each task tracks its depth, stack pointer, and generation. A watchpoint is
enabled only when the configured depth is reached, and disabled on function
exit.

The context is reset when probes are disabled, generation changes, or exit
depth becomes inconsistent.

Duplicate arming on the same frame is skipped.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/stack.c | 67 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/mm/kstackwatch/stack.c b/mm/kstackwatch/stack.c
index 9f59f41d954c..e596ef97222d 100644
--- a/mm/kstackwatch/stack.c
+++ b/mm/kstackwatch/stack.c
@@ -12,6 +12,53 @@
 static struct kprobe entry_probe;
 static struct fprobe exit_probe;
 
+static bool probe_enable;
+static u16 probe_generation;
+
+static void ksw_reset_ctx(void)
+{
+	struct ksw_ctx *ctx = &current->ksw_ctx;
+
+	if (ctx->wp)
+		ksw_watch_off(ctx->wp);
+
+	ctx->wp = NULL;
+	ctx->sp = 0;
+	ctx->depth = 0;
+	ctx->generation = READ_ONCE(probe_generation);
+}
+
+static bool ksw_stack_check_ctx(bool entry)
+{
+	struct ksw_ctx *ctx = &current->ksw_ctx;
+	u16 cur_enable = READ_ONCE(probe_enable);
+	u16 cur_generation = READ_ONCE(probe_generation);
+	u16 cur_depth, target_depth = ksw_get_config()->depth;
+
+	if (!cur_enable) {
+		ksw_reset_ctx();
+		return false;
+	}
+
+	if (ctx->generation != cur_generation)
+		ksw_reset_ctx();
+
+	if (!entry && !ctx->depth) {
+		ksw_reset_ctx();
+		return false;
+	}
+
+	if (entry)
+		cur_depth = ctx->depth++;
+	else
+		cur_depth = --ctx->depth;
+
+	if (cur_depth == target_depth)
+		return true;
+	else
+		return false;
+}
+
 static int ksw_stack_prepare_watch(struct pt_regs *regs,
 				   const struct ksw_config *config,
 				   ulong *watch_addr, u16 *watch_len)
@@ -26,10 +73,22 @@ static void ksw_stack_entry_handler(struct kprobe *p, struct pt_regs *regs,
 				    unsigned long flags)
 {
 	struct ksw_ctx *ctx = &current->ksw_ctx;
+	ulong stack_pointer;
 	ulong watch_addr;
 	u16 watch_len;
 	int ret;
 
+	stack_pointer = kernel_stack_pointer(regs);
+
+	/*
+	 * triggered more than once, may be in a loop
+	 */
+	if (ctx->wp && ctx->sp == stack_pointer)
+		return;
+
+	if (!ksw_stack_check_ctx(true))
+		return;
+
 	ret = ksw_watch_get(&ctx->wp);
 	if (ret)
 		return;
@@ -50,6 +109,7 @@ static void ksw_stack_entry_handler(struct kprobe *p, struct pt_regs *regs,
 		return;
 	}
 
+	ctx->sp = stack_pointer;
 }
 
 static void ksw_stack_exit_handler(struct fprobe *fp, unsigned long ip,
@@ -58,6 +118,8 @@ static void ksw_stack_exit_handler(struct fprobe *fp, unsigned long ip,
 {
 	struct ksw_ctx *ctx = &current->ksw_ctx;
 
+	if (!ksw_stack_check_ctx(false))
+		return;
 
 	if (ctx->wp) {
 		ksw_watch_off(ctx->wp);
@@ -92,11 +154,16 @@ int ksw_stack_init(void)
 		return ret;
 	}
 
+	WRITE_ONCE(probe_generation, READ_ONCE(probe_generation) + 1);
+	WRITE_ONCE(probe_enable, true);
+
 	return 0;
 }
 
 void ksw_stack_exit(void)
 {
+	WRITE_ONCE(probe_enable, false);
+	WRITE_ONCE(probe_generation, READ_ONCE(probe_generation) + 1);
 	unregister_fprobe(&exit_probe);
 	unregister_kprobe(&entry_probe);
 }
-- 
2.43.0


