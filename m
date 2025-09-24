Return-Path: <linux-doc+bounces-61653-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D53B99ABB
	for <lists+linux-doc@lfdr.de>; Wed, 24 Sep 2025 13:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BEEF19C749E
	for <lists+linux-doc@lfdr.de>; Wed, 24 Sep 2025 11:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04662FF668;
	Wed, 24 Sep 2025 11:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDVcJXf0"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D85D301001
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758714711; cv=none; b=kyUxJqQCse9V02mxkNsx+Nb0cgbr8xyvmdWPntEnAXJ6LtM8xVo7Ap1mkeEtjHX397baKTogHy4pxUcnm05h2S88d0IEO4gPL1QTE9s1TmVfL8HjA/tqb/CACqZOJ/YeE4mm7mC4omjiHKTzAKGbPTuV08DoNNd6tn1mTOUbh7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758714711; c=relaxed/simple;
	bh=JuRa9sqqB7Pb4oITEW69e6hBS72ry7/vRFUMRsXtE7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A1p76fKVACsV+SeYNQLmxYCWnKHQzY6b+aQQRpQ9Mnhfa37EPKQj3oHvQrS16CT3NzLHVlopdb5dtvQUZ2sEdI4JdqhfMcR3pfjlosvqGRe4nwM94ml1PB2YJx+INLS8Y9J7qAhRBdNJwPc2A9+rCVpQgTlyARMWKA1JpFQQkAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDVcJXf0; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-77f169d8153so4099454b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 04:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758714705; x=1759319505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9dguoBkY6LX1N0DOj75LxFoPgkZue82QF3pLTyVov0=;
        b=MDVcJXf0o69BlqOAiLOKFiTRCsPMpixTpmoRwfpWlodam/IXXrIRWkdkrcxAm4G7ye
         C+faCeeQQNG/TYBm5oScF87mRf0uU0QfAhqAUKOqf70Bo44+qzUO9dVyKNxpREgDwgIl
         8JDmLpQXCTVjptpu6ouPdKuWVlCovQeGBxwamcfrwDNO6W0uVKUDpFk9EG1VtCjKolp2
         vYqrlN+FQ9n7W6HrAx3ipldB5Ms46n3N9F+Jrf3T8FZ6g1sRtoQczlmWBgADHrdD5yd5
         0cPPvA318b2UISUpi7upSxbnB8K75OHAWvoAJdD4FAZnPLrVKb/axuoBWxzRgyZqpmCa
         FjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714705; x=1759319505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9dguoBkY6LX1N0DOj75LxFoPgkZue82QF3pLTyVov0=;
        b=LcU0FUKoVDrvLkp2h4l7hIaWmwY9ZrC4KbQ3dBPmfQzKPZE8FVYKBh7meoc+eXXrx8
         2KnAQRmcozUEXPpnfcHSlQxLwnwqh94mYC+tZ5W5x7sRLWjn+nkbazfpoOeS1clAF7f4
         7zGFkQ/5oZXSyyI6PSdg48O2lm2Wvyx6s5SIW18qQYmTqyjlCgYdIMXy/2W8Gy/ytWgv
         KAZ+F9TIhxXDEsFuT14hx4jT1UhU+JClfOgKOB5LuvF05H2M3HujAFeW+1aKuKILiaoB
         JN3yApYZuBFWIuAqAOOz8qeRBZQ5AFkwKhFUX8EHakwVsMES2XFWy1HdrAUgEWCFJPSi
         aH7w==
X-Forwarded-Encrypted: i=1; AJvYcCWwPSgB7yFwGiPa40ZJVB5sjYIhs4oLYXHF6rrCzj3cN8AbdfOOTnYnEFGrZMWS7SknWV63ZaHDSMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLQNWquDSbyb8iKvLOAEXdgIpkHeATF8iupBTn3L4EJOJeWAKx
	h9/7Vv+tLdTjbfd9VqPAxJLhMdJZqhFIQ0McyjxMD4vouQfCgaQ6ugvn
X-Gm-Gg: ASbGncvvRFceCpVmIStRlcFDOOG+a+WjIEIR+Ldksp1yMbon9ccKo3wlcJyERjOdOmP
	B5kaJLunb1a1KUyuED+SUmPFdvoXondmmc6+tnsYAY/gPHj4CKiBSvHqR7HAp/Yem7KCLnbYyDq
	LRoENLzdSgP8Lr2ADZVUZ7wGL/BcmQSBrczgbgo4FtQfJqYQQIhA5U9uuV7rUVIBrJPTCxgno8K
	nn5vemuCjqvPeDJoM3dYHz5LTrxG9hYgQh7hT9GPKBe8WPbOlZLg7AKBPj+i0Wh7uY4XqzO1OeM
	zoSmT2Ne2M0KkZvOBuf7I4amD4J7s35Ea16JTwESpH1a4ZHrf6HV5H9L0lmQhwxV2Um9aR1mSGg
	qBrC+kw1zvAA0shwPW43Fs75W/g==
X-Google-Smtp-Source: AGHT+IEasneXpiW3mfzS6InuZbVOqKXOEJYnqzt5bTMRV5lm54Ib2pRaVdJ4xzF5Ie29cXcRAIIxXQ==
X-Received: by 2002:a05:6a00:228b:b0:77f:50df:df31 with SMTP id d2e1a72fcca58-77f53b0ed0cmr6348588b3a.20.1758714705264;
        Wed, 24 Sep 2025 04:51:45 -0700 (PDT)
Received: from localhost ([23.142.224.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfc2490dcsm18664494b3a.36.2025.09.24.04.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 04:51:44 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
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
Subject: [PATCH v5 03/23] HWBP: Add modify_wide_hw_breakpoint_local() API
Date: Wed, 24 Sep 2025 19:50:46 +0800
Message-ID: <20250924115124.194940-4-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924115124.194940-1-wangjinchao600@gmail.com>
References: <20250924115124.194940-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

Add modify_wide_hw_breakpoint_local() arch-wide interface which allows
hwbp users to update watch address on-line. This is available if the
arch supports CONFIG_HAVE_REINSTALL_HW_BREAKPOINT.
Note that this allows to change the type only for compatible types,
because it does not release and reserve the hwbp slot based on type.
For instance, you can not change HW_BREAKPOINT_W to HW_BREAKPOINT_X.

Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 arch/Kconfig                  | 10 ++++++++++
 arch/x86/Kconfig              |  1 +
 include/linux/hw_breakpoint.h |  6 ++++++
 kernel/events/hw_breakpoint.c | 37 +++++++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index d1b4ffd6e085..e4787fc814df 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -418,6 +418,16 @@ config HAVE_MIXED_BREAKPOINTS_REGS
 	  Select this option if your arch implements breakpoints under the
 	  latter fashion.
 
+config HAVE_REINSTALL_HW_BREAKPOINT
+	bool
+	depends on HAVE_HW_BREAKPOINT
+	help
+	  Depending on the arch implementation of hardware breakpoints,
+	  some of them are able to update the breakpoint configuration
+	  without release and reserve the hardware breakpoint register.
+	  What configuration is able to update depends on hardware and
+	  software implementation.
+
 config HAVE_USER_RETURN_NOTIFIER
 	bool
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 52c8910ba2ef..4ea313ef3e82 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -247,6 +247,7 @@ config X86
 	select HAVE_FUNCTION_TRACER
 	select HAVE_GCC_PLUGINS
 	select HAVE_HW_BREAKPOINT
+	select HAVE_REINSTALL_HW_BREAKPOINT
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK	if X86_64
 	select HAVE_IRQ_TIME_ACCOUNTING
diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint.h
index db199d653dd1..ea373f2587f8 100644
--- a/include/linux/hw_breakpoint.h
+++ b/include/linux/hw_breakpoint.h
@@ -81,6 +81,9 @@ register_wide_hw_breakpoint(struct perf_event_attr *attr,
 			    perf_overflow_handler_t triggered,
 			    void *context);
 
+extern int modify_wide_hw_breakpoint_local(struct perf_event *bp,
+					   struct perf_event_attr *attr);
+
 extern int register_perf_hw_breakpoint(struct perf_event *bp);
 extern void unregister_hw_breakpoint(struct perf_event *bp);
 extern void unregister_wide_hw_breakpoint(struct perf_event * __percpu *cpu_events);
@@ -124,6 +127,9 @@ register_wide_hw_breakpoint(struct perf_event_attr *attr,
 			    perf_overflow_handler_t triggered,
 			    void *context)		{ return NULL; }
 static inline int
+modify_wide_hw_breakpoint_local(struct perf_event *bp,
+				struct perf_event_attr *attr) { return -ENOSYS; }
+static inline int
 register_perf_hw_breakpoint(struct perf_event *bp)	{ return -ENOSYS; }
 static inline void unregister_hw_breakpoint(struct perf_event *bp)	{ }
 static inline void
diff --git a/kernel/events/hw_breakpoint.c b/kernel/events/hw_breakpoint.c
index 8ec2cb688903..5ee1522a99c9 100644
--- a/kernel/events/hw_breakpoint.c
+++ b/kernel/events/hw_breakpoint.c
@@ -887,6 +887,43 @@ void unregister_wide_hw_breakpoint(struct perf_event * __percpu *cpu_events)
 }
 EXPORT_SYMBOL_GPL(unregister_wide_hw_breakpoint);
 
+/**
+ * modify_wide_hw_breakpoint_local - update breakpoint config for local CPU
+ * @bp: the hwbp perf event for this CPU
+ * @attr: the new attribute for @bp
+ *
+ * This does not release and reserve the slot of a HWBP; it just reuses the
+ * current slot on local CPU. So the users must update the other CPUs by
+ * themselves.
+ * Also, since this does not release/reserve the slot, this can not change the
+ * type to incompatible type of the HWBP.
+ * Return err if attr is invalid or the CPU fails to update debug register
+ * for new @attr.
+ */
+#ifdef CONFIG_HAVE_REINSTALL_HW_BREAKPOINT
+int modify_wide_hw_breakpoint_local(struct perf_event *bp,
+				    struct perf_event_attr *attr)
+{
+	int ret;
+
+	if (find_slot_idx(bp->attr.bp_type) != find_slot_idx(attr->bp_type))
+		return -EINVAL;
+
+	ret = hw_breakpoint_arch_parse(bp, attr, counter_arch_bp(bp));
+	if (ret)
+		return ret;
+
+	return arch_reinstall_hw_breakpoint(bp);
+}
+#else
+int modify_wide_hw_breakpoint_local(struct perf_event *bp,
+				    struct perf_event_attr *attr)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+EXPORT_SYMBOL_GPL(modify_wide_hw_breakpoint_local);
+
 /**
  * hw_breakpoint_is_used - check if breakpoints are currently used
  *
-- 
2.43.0


