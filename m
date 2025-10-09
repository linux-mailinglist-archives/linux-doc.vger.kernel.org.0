Return-Path: <linux-doc+bounces-62810-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FB0BC8A5C
	for <lists+linux-doc@lfdr.de>; Thu, 09 Oct 2025 12:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1923C3526FD
	for <lists+linux-doc@lfdr.de>; Thu,  9 Oct 2025 10:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC1A2E7180;
	Thu,  9 Oct 2025 10:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U35YTGR1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F052DE6F7
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 10:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007462; cv=none; b=HpuBPOYa8Zv0sKv07zFsYUmCl/n/cdYBXTQfLDl468hkRtrIqTrnKGG7eRdDhIFvo1oqzAweuxt+s1vXdt/PGJmm+QThAkXq5bHoy2uLjChUruY3D4LhMFGgR/kptfGP53q7zhALJZltagsA72NvN+liJqUiXzV/vbC9ciaBdM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007462; c=relaxed/simple;
	bh=9SDUPEZSlMV40T53tfVBMh3pQptZtl+KprWlK44Wx6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h4cOBP3ZmZmU3q82QJ/y3aX3QuWxHaVOsd8hr4YJqV5JU9YpC0EPNb+2dxIyqo2zFIgPSrNbbb3eETjWr09sqmoRmkJBb56J9ly+DCVeK3V0PIofbsm26foLUZdJB8POlp1uSZ7/7O3PJdv2mLKcL8m1FiQGl3876jqEEzm6ZbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U35YTGR1; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-78af743c232so733404b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 03:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007459; x=1760612259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtGUQc6HOhuSXywhIDZ+AUqHUInlRCKup6JfN/4+ZEc=;
        b=U35YTGR1XOw3Ox8Pl6Kjxy5ADSNVFT1SCGOzkwKooy6BBPrkchhq3AXydXskYQaRCW
         5mgC0HgsqO1m+WKxJkjWjHotEhsW9znpzgI2ar7sKwyyG8nzBBEMfG/0OEoSH9hEv+Py
         37mlt+O8C5R1KhfJwS2igzBWrQZu5Ls8w0e03JLTImEXg/ImzTadvfqynNMGUnRvxxlF
         4Nfu0W5rjBILkUpqIdv/B5vqNVIQnMOQvpIZ1jd4MTKMXrMFn+RQMPtQiRd1EuzJcyyJ
         PgxIYOsfSAhOtPRIuiDu4Vv9wzfbj1c2jto3sxsMejwJDZIX0Q7v7RlvlgN79p4IdRXu
         yqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007459; x=1760612259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtGUQc6HOhuSXywhIDZ+AUqHUInlRCKup6JfN/4+ZEc=;
        b=gC5QYHf7efWYyiRRiJtqHLH4teZdKYD09qqLs8xopE9+c7/0fSmNzMNKaz9tiYRcbO
         s91OprXNshghDCOGFmwpRs5quV0PzJuPXnT8R0W+du1z6pgqjTSoGQssNIZ3axl0I93p
         I1TgGefjDW/rZ9x5aaImNRx0jLgqQ1QMGvnIsYgvNq2aX+mS4enwxqvFXFgqabDkfBWA
         4onbCIhAFP4Xcyz6J2YoMk2a2UW8jUKlyRxJu/nGuDWG+uUAqnv9dG+QPVulC0W3ojBO
         T9fZ4fuOvlYqY5VWAjZnvNP5ycHMCH/5/5utsWYUtmR/q2WVa3zGd0fBWNGfe5y9yaHY
         u3RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB/3SHFglP6vyiPmV7+GEGRoebXym29n+aR3qqEfjPXj+DcwmtYN55m/fsLdP5ihV2rS6E/OYJV0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLZM5rsMl9izR9uD3BcEReUrFTugTDFgNXckNVzhKurbrheOWC
	CV65s8jEIWiig57Zu/IQU/KoeRLoSrI7+QQiTO53osJGiMpyYtFpyses
X-Gm-Gg: ASbGncvUT1gSJ+hQIoGrA1PsX/wHdHYPPzcpJLYQ7uQFLoX/akVp4JsgS9MoUk5rXg0
	1X114rnlZ12hrjBAtmT0gGN521LKa1bHA0bmHx0ppKW+zUAojFwZ1Jb1z8T4FCtp4F17fe9CX33
	YYPRrZMpbGnFKbOqV1POrr8v1tAjsFV1kpX4IH316lNX8OMl36HcwIbZDo3jp0y9Xnd3huACi2Z
	PL5ldOOvm9fYzoxPyAnKGsR68TGqP8cABbgXhIBu/EpXUdJM6stNzM/f0V+uq2hYT/94S2sbSUH
	KEhq0MvyFvkfrcSpVPCw+cd27GG1uVIoCkjpP9i5u6BigUVerNUDjC+VYG1HHfAjTuqLYQD273v
	VJ49Bhtg1NwkRKNzgbYsK2ysSshe2Hqdhn7KyjJoLkLYpfPC1o7ctsGoyuVsu
X-Google-Smtp-Source: AGHT+IGScwOqYQkzfr1btEBby7JhcFialvxPDnR54idjLQKUQn1BKVR6wxkZwyfRnUOrnLGfKhhFqw==
X-Received: by 2002:a05:6a20:4305:b0:2cc:692a:3a30 with SMTP id adf61e73a8af0-32da8154253mr8702045637.13.1760007459212;
        Thu, 09 Oct 2025 03:57:39 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f3b041sm20710766a12.24.2025.10.09.03.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:57:38 -0700 (PDT)
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
Subject: [PATCH v7 08/23] mm/ksw: Add atomic watchpoint management api
Date: Thu,  9 Oct 2025 18:55:44 +0800
Message-ID: <20251009105650.168917-9-wangjinchao600@gmail.com>
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

Add three functions for atomic lifecycle management of watchpoints:
- ksw_watch_get(): Acquires a watchpoint from a llist.
- ksw_watch_on(): Enables the watchpoint on all online CPUs.
- ksw_watch_off(): Disables the watchpoint and returns it to the llist.

For cross-CPU synchronization, updates are propagated using direct
modification on the local CPU and asynchronous IPIs for remote CPUs.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/kstackwatch.h |  4 ++
 mm/kstackwatch/watch.c       | 85 +++++++++++++++++++++++++++++++++++-
 2 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
index 4eac1be3b325..850fc2b18a9c 100644
--- a/mm/kstackwatch/kstackwatch.h
+++ b/mm/kstackwatch/kstackwatch.h
@@ -38,11 +38,15 @@ const struct ksw_config *ksw_get_config(void);
 /* watch management */
 struct ksw_watchpoint {
 	struct perf_event *__percpu *event;
+	call_single_data_t __percpu *csd;
 	struct perf_event_attr attr;
 	struct llist_node node; // for atomic watch_on and off
 	struct list_head list; // for cpu online and offline
 };
 int ksw_watch_init(void);
 void ksw_watch_exit(void);
+int ksw_watch_get(struct ksw_watchpoint **out_wp);
+int ksw_watch_on(struct ksw_watchpoint *wp, ulong watch_addr, u16 watch_len);
+int ksw_watch_off(struct ksw_watchpoint *wp);
 
 #endif /* _KSTACKWATCH_H */
diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index 1d8e24fede54..887cc13292dc 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -31,11 +31,83 @@ static void ksw_watch_handler(struct perf_event *bp,
 		panic("Stack corruption detected");
 }
 
+static void ksw_watch_on_local_cpu(void *info)
+{
+	struct ksw_watchpoint *wp = info;
+	struct perf_event *bp;
+	ulong flags;
+	int cpu;
+	int ret;
+
+	local_irq_save(flags);
+	cpu = raw_smp_processor_id();
+	bp = per_cpu(*wp->event, cpu);
+	if (!bp) {
+		local_irq_restore(flags);
+		return;
+	}
+
+	ret = modify_wide_hw_breakpoint_local(bp, &wp->attr);
+	local_irq_restore(flags);
+	WARN(ret, "fail to reinstall HWBP on CPU%d ret %d", cpu, ret);
+}
+
+static void ksw_watch_update(struct ksw_watchpoint *wp, ulong addr, u16 len)
+{
+	call_single_data_t *csd;
+	int cur_cpu;
+	int cpu;
+
+	wp->attr.bp_addr = addr;
+	wp->attr.bp_len = len;
+
+	cur_cpu = raw_smp_processor_id();
+	for_each_online_cpu(cpu) {
+		/* remote cpu first */
+		if (cpu == cur_cpu)
+			continue;
+		csd = per_cpu_ptr(wp->csd, cpu);
+		smp_call_function_single_async(cpu, csd);
+	}
+	ksw_watch_on_local_cpu(wp);
+}
+
+int ksw_watch_get(struct ksw_watchpoint **out_wp)
+{
+	struct ksw_watchpoint *wp;
+	struct llist_node *node;
+
+	node = llist_del_first(&free_wp_list);
+	if (!node)
+		return -EBUSY;
+
+	wp = llist_entry(node, struct ksw_watchpoint, node);
+	WARN_ON_ONCE(wp->attr.bp_addr != (u64)&holder);
+
+	*out_wp = wp;
+	return 0;
+}
+int ksw_watch_on(struct ksw_watchpoint *wp, ulong watch_addr, u16 watch_len)
+{
+	ksw_watch_update(wp, watch_addr, watch_len);
+	return 0;
+}
+
+int ksw_watch_off(struct ksw_watchpoint *wp)
+{
+	WARN_ON_ONCE(wp->attr.bp_addr == (u64)&holder);
+	ksw_watch_update(wp, (ulong)&holder, sizeof(ulong));
+	llist_add(&wp->node, &free_wp_list);
+	return 0;
+}
+
 static int ksw_watch_alloc(void)
 {
 	int max_watch = ksw_get_config()->max_watch;
 	struct ksw_watchpoint *wp;
+	call_single_data_t *csd;
 	int success = 0;
+	int cpu;
 	int ret;
 
 	init_llist_head(&free_wp_list);
@@ -45,6 +117,16 @@ static int ksw_watch_alloc(void)
 		wp = kzalloc(sizeof(*wp), GFP_KERNEL);
 		if (!wp)
 			return success > 0 ? success : -EINVAL;
+		wp->csd = alloc_percpu(call_single_data_t);
+		if (!wp->csd) {
+			kfree(wp);
+			return success > 0 ? success : -EINVAL;
+		}
+
+		for_each_possible_cpu(cpu) {
+			csd = per_cpu_ptr(wp->csd, cpu);
+			INIT_CSD(csd, ksw_watch_on_local_cpu, wp);
+		}
 
 		hw_breakpoint_init(&wp->attr);
 		wp->attr.bp_addr = (ulong)&holder;
@@ -54,6 +136,7 @@ static int ksw_watch_alloc(void)
 							ksw_watch_handler, wp);
 		if (IS_ERR((void *)wp->event)) {
 			ret = PTR_ERR((void *)wp->event);
+			free_percpu(wp->csd);
 			kfree(wp);
 			return success > 0 ? success : ret;
 		}
@@ -75,6 +158,7 @@ static void ksw_watch_free(void)
 	list_for_each_entry_safe(wp, tmp, &all_wp_list, list) {
 		list_del(&wp->list);
 		unregister_wide_hw_breakpoint(wp->event);
+		free_percpu(wp->csd);
 		kfree(wp);
 	}
 	mutex_unlock(&all_wp_mutex);
@@ -88,7 +172,6 @@ int ksw_watch_init(void)
 	if (ret <= 0)
 		return -EBUSY;
 
-
 	return 0;
 }
 
-- 
2.43.0


