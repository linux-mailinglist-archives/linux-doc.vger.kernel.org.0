Return-Path: <linux-doc+bounces-62811-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A15CBC8A5F
	for <lists+linux-doc@lfdr.de>; Thu, 09 Oct 2025 12:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 333BB4F14AF
	for <lists+linux-doc@lfdr.de>; Thu,  9 Oct 2025 10:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D5C2E62C6;
	Thu,  9 Oct 2025 10:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/5C61gR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55EF2E6CB6
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007467; cv=none; b=Yt6kLkIQLgGq8hOvvQ710o0TNsye9eihYewjoPV9yCGfHcIkDHs+VOe94lnOkKZfI6l4e46AblmU/Ed3C/8LSOOfYCyf7LmVjkZhr6G6KK4pf/2AhIAIbGrxWUPvZaMtPwy5bgy4Z2Z/pEwcEsIp26FevbqOM8AEgrNkDkACFSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007467; c=relaxed/simple;
	bh=0RaB9b3mDxARpzNAU+b9+OM/53UguV9OX02ut00avNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ry+hZIppnyut10NinZVVVGRSiFbLkIxErt7W//VrWk/3laDZaE6+f2Yu/7cDAA8sK68sxLfQaj3yJPjgGyolrB/OxHq1bz+uuibPKZ6VNbu1skXP7j3Vx6l0gQG4Go9TMdCzOkBaSfaEIuG23Pt36I0sVFaHdbY4A7M95kij9XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/5C61gR; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3305c08d9f6so687564a91.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 03:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007463; x=1760612263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8p2Xfne7CGpLjN/MkaU3Ee28S3aCNgQ2oxnJpFebIbs=;
        b=A/5C61gRN5+BtVe0oAtzwEP551cuqM59naP4sL5MXsMQCW4ngR811ENWiTChuESkq9
         AKKX349RReYymf1WXkgbqaDRoo9YK9Qs3AVvTQ7RTwLwv/1jMMUWfDxhByVdS0XWWyd2
         Dck+cQ8kxIYa8GE3J5yQhPzuN10gaO6HMeKK1vB1zROXfjEvPqClPc0mEFusJYSvGPoL
         /bUvnZGxuAro6Uyfed39BMglJFBEKKbB9umLgImQGGmHpaMHIAJ9Qe9jVI2MWuk6DHh1
         fAP390fwSUMADEQympYscpO13ucL5iil1xi3uWMEr+5N8bGOeNuBfP4MAFwN5v4f/RS5
         0pOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007463; x=1760612263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8p2Xfne7CGpLjN/MkaU3Ee28S3aCNgQ2oxnJpFebIbs=;
        b=nODPc8k4Rs9D6z6yGaRveYNv5hQKdtvhBmZtTMWysaAtgM11kOZqLO17VsLgEmLpBc
         RA7niId8vaXGoUmK4a8GcuPUx0710QicJJCKvRMwug3AHlJ3Bg9+N4K8+BbrypEcDWkE
         Xsn/TTbJSopXjTfhuacGUhUIZYWrvFVmY/fp+9I4lU6LSSXefeoHR++WWWzINt7+GLVy
         MpLUoxjUt2yhdlDLNZESXMYxeHSyYaKK68XIaZvvBimpT4NJoPoj/ASkPgXb3OKyeYe6
         7KMHk7mh2tmhuAl0pPEqXYga6qj5r3irZ52Db53iB0+7hzXvck550ZJJI9TAQjrhNAVw
         fyKw==
X-Forwarded-Encrypted: i=1; AJvYcCX/4U02DKxQ1HIH1FJWkyFeAamaD4fkBnaSOS8Rl9oUqzbLjDNMwM4VlgrvfMr30kr//IJP2LxZ2jw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw53JekpIG05NmH+kNspfNz3y9KAj3lmrbNl4YMNz9yJouaaODR
	PtLNEA5Sd9azX/jda1cGvnQfeyeB472ql9g73EFOSNWPExCncuwQKVZA
X-Gm-Gg: ASbGncvdXpdUwNiCI6a7+iykNrVNfGKxShecuXEap0wzNtmFkrrI/II03LK0sgvF/4A
	xcqFU94R/Pu2PntP2+gLDslb110Hc8gMeFqJMARiKe/FEOLEYkoYYJjku7g9V9bT/xgAnD1k4IB
	X5GLov+vW/9fmyac2ZBCg/DyAvxDWBHydaWn03S1lboVqyIqVMLY2WE25kCtEPJngHmWsGdgzfI
	OjRgje3GnLZXV2SL3E9qZFxoC+M3OkXLK7rt/gNOxzltYCqbb30DCE8cvch8u3AkgleblTPi+Ej
	vPjPFNTQ+d+/kttlt9MUS+Tvl1clJiqjLaS1jyoNQZSnnleHY89s/hdsjqcHTEKk6sErKDg9eXN
	zTGmf2bZED5/M1MswZ+l3lnQbxCW6M31kjFTR3kbn41ns43e5JHaL8rL7d1ae
X-Google-Smtp-Source: AGHT+IGh87PYrVHyXpdGI3lpiqctQ3hOQgwGz+QU0SKFptl527HtAxTN0ZxVB5GZOA/u2hsAdulJlA==
X-Received: by 2002:a17:90b:3e83:b0:32e:23c9:6f41 with SMTP id 98e67ed59e1d1-33b51676ef2mr8250254a91.5.1760007463200;
        Thu, 09 Oct 2025 03:57:43 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b52a4f8bfsm2196325a91.10.2025.10.09.03.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:57:42 -0700 (PDT)
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
Subject: [PATCH v7 09/23] mm/ksw: ignore false positives from exit trampolines
Date: Thu,  9 Oct 2025 18:55:45 +0800
Message-ID: <20251009105650.168917-10-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009105650.168917-1-wangjinchao600@gmail.com>
References: <20251009105650.168917-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because trampolines run after the watched function returns but before the
exit_handler is called, and in the original stack frame, so the trampoline
code may overwrite the watched stack address.

These false positives should be ignored. is_ftrace_trampoline() does
not cover all trampolines, so add a local check to handle the remaining
cases.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/watch.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index 887cc13292dc..722ffd9fda7c 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -2,6 +2,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/cpuhotplug.h>
+#include <linux/ftrace.h>
 #include <linux/hw_breakpoint.h>
 #include <linux/irqflags.h>
 #include <linux/mutex.h>
@@ -18,10 +19,46 @@ bool panic_on_catch;
 module_param(panic_on_catch, bool, 0644);
 MODULE_PARM_DESC(panic_on_catch, "panic immediately on corruption catch");
 
+#define TRAMPOLINE_NAME "return_to_handler"
+#define TRAMPOLINE_DEPTH 16
+
+/* Resolved once, then reused */
+static unsigned long tramp_start, tramp_end;
+
+static void ksw_watch_resolve_trampoline(void)
+{
+	unsigned long sz, off;
+
+	if (likely(tramp_start && tramp_end))
+		return;
+
+	tramp_start = kallsyms_lookup_name(TRAMPOLINE_NAME);
+	if (tramp_start && kallsyms_lookup_size_offset(tramp_start, &sz, &off))
+		tramp_end = tramp_start + sz;
+}
+
+static bool ksw_watch_in_trampoline(unsigned long ip)
+{
+	if (tramp_start && tramp_end && ip >= tramp_start && ip < tramp_end)
+		return true;
+	return false;
+}
 static void ksw_watch_handler(struct perf_event *bp,
 			      struct perf_sample_data *data,
 			      struct pt_regs *regs)
 {
+	unsigned long entries[TRAMPOLINE_DEPTH];
+	int i, nr = 0;
+
+	nr = stack_trace_save_regs(regs, entries, TRAMPOLINE_DEPTH, 0);
+	for (i = 0; i < nr; i++) {
+		//ignore trampoline
+		if (is_ftrace_trampoline(entries[i]))
+			return;
+		if (ksw_watch_in_trampoline(entries[i]))
+			return;
+	}
+
 	pr_err("========== KStackWatch: Caught stack corruption =======\n");
 	pr_err("config %s\n", ksw_get_config()->user_input);
 	dump_stack();
@@ -168,6 +205,7 @@ int ksw_watch_init(void)
 {
 	int ret;
 
+	ksw_watch_resolve_trampoline();
 	ret = ksw_watch_alloc();
 	if (ret <= 0)
 		return -EBUSY;
-- 
2.43.0


