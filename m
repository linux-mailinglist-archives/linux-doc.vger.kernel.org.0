Return-Path: <linux-doc+bounces-61659-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2786B99AE8
	for <lists+linux-doc@lfdr.de>; Wed, 24 Sep 2025 13:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 895D3324153
	for <lists+linux-doc@lfdr.de>; Wed, 24 Sep 2025 11:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D5130649E;
	Wed, 24 Sep 2025 11:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KadITuav"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F488305067
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 11:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758714738; cv=none; b=TUIFu4yVQ7cGD40B+Yz1/zPFq5d99YTMSokCqrJT9xJNsoFcCK2q4TittmDmruQ4qFUoqlWdQuXHscJe/tCsL0tMmPHtuydmSfeMlR7hJktWlZe+TGu8hwkgR90rxPpieX1/ARCNfbDlLunBz7oLp4YUgTovVcRJ2c0uvgEU6dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758714738; c=relaxed/simple;
	bh=EtuMaKP8CWfi9pjY9FcQGV9HEHi4WtiOKMPT566R1T4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blOCIctTGbi32V29ts7zRfxu3fS44jhMe3ZGsyQ3I0tjsTaTzhIa6nsb4l8YQPQmfaufDh0oDsqP5cTiGCLcwqdaZvHsKVdHyrjMCIux2wQ2ofBAShDCCU0px7oEc1BsIxKn6dRQteh/UuD4AcnVfGX3Ax3KUHav/T4t87xeQGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KadITuav; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2445805aa2eso69581165ad.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 04:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758714731; x=1759319531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VplC5p74+BCL3Xjzqw2UL/AL1hevTQUKrGPaYOT40mY=;
        b=KadITuavOA2ZmCjJymWSBloH7MHKJhTzOxSIBdRu1FkjkiP29qrosSqXUEPQlFMyLs
         AoQ7Y7As/bc2Hu9BKtRbo8IXLVzg8m/8eg36xI/JzJXCJZwichsTS82hJ9rrgvH73HTn
         iv652MEycbMu4T/2HhU9eKlF9etjgeImW09rguRcU8I3gCpnhO+8o3wBo6GBY0c21Rh4
         s+uz24ctoCl+ogVBkKYZZcFO4wwhZi0RSU1CNE0PxfJzS5geUElVPuwlw+5H4JdiVOeK
         HrvWswubwt1KYoAq/nUTpmUgUqNbF8aqej2vWvo1dNqcfFtOWz4QnbDnGE7SnNY87Cpd
         4VXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714731; x=1759319531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VplC5p74+BCL3Xjzqw2UL/AL1hevTQUKrGPaYOT40mY=;
        b=fMvpDlGFJGMfdBQqCh3SqnxmgKTCtyO5cKFjVkGWSvQwnJXp1JwqgCk/uXxSMmey0O
         dH3pJnY959EYcdmyvZja8gb5CKPGYP9YA7vweqpU1vWJ0M9XpDW/5ZKItBL1ibCbC45K
         obdCKrrCyCKnjqTOsVBczyrxp+rRdMco0rJbfNsnKMzsWtjY935TJFuNRVKpPqC8gDGV
         fhVI6bGQ20dE/XH5UKwTplQfE3nPVYGOTURU4HC2jRwwNoK2zgqUzU4YxfinWFkC7tMZ
         UlVyEwDlmw4LmTBZvT3uBfp5dkHNjQ4oML8ELZDGRDiN3TlqI8p/vzqzgttGZUEBaRKf
         79ig==
X-Forwarded-Encrypted: i=1; AJvYcCVJoEh2YnOYmnDfTFtSw8r76FqIWuCUEyNKyn46hTKYaZ0rh7JFTViZGpDFEoshI5+2lX0bn58Y3W0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGq0Ppy24thVpPTlPWVY9N1vMF5FJsbJ6nlS83Pex/ZHGLEMQ1
	4a+D+SWa+IzzumdgFTERMvYvgm2EBn8so/v8IMOpAOtq4QIb1Nctavb9
X-Gm-Gg: ASbGnctWMknMmA4P6qHsswjAfBEPquhYh0NUbSk9eaKLySB9XX6UO6XK7DSwS8zwwFM
	Awa66AlRBqVp/ukgapfRnA34+NY/9bDTCuJCrKOiRLv3RQ7lqN+vb5eGxH6vpDp9XXtQ03kKrBT
	NSwTdhS7Us4U0Ud97ShJH2cqfxTrSGRABOQQsjZ306JF9Djb/8XW5cLMsTAgE3168zTcHjiejXb
	CWzCaFqT4hwKkfA/up2eGHvuwvL9JvrCKZvTkyLmEIJUC/UQ97zHUp9tTcZJawzIrpbyNj84Ct7
	PmXKKvybUA1Asv7/YBvKeyYjI9EVqO5n/2bMTDT1Su5llp/gl5tVyINkpZc7aFGoTZ3rY0FNv3c
	aLXRDD2wYfR602sQi4V7t+p+o1w==
X-Google-Smtp-Source: AGHT+IGFrnEbp9Ui8MNObSoQqRzgjbRIw9qZ/ysMx9tVm7YuXfu+8QvxKGGvJ7LyD8Oz3yVl/creWg==
X-Received: by 2002:a17:903:230a:b0:273:31fb:a872 with SMTP id d9443c01a7336-27cc2aa7dc7mr73054015ad.6.1758714731497;
        Wed, 24 Sep 2025 04:52:11 -0700 (PDT)
Received: from localhost ([23.142.224.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ec0eb4293sm18798485ad.138.2025.09.24.04.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 04:52:10 -0700 (PDT)
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
Subject: [PATCH v5 10/23] mm/ksw: support CPU hotplug
Date: Wed, 24 Sep 2025 19:50:53 +0800
Message-ID: <20250924115124.194940-11-wangjinchao600@gmail.com>
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

Register CPU online/offline callbacks via cpuhp_setup_state_nocalls()
so stack watches are installed/removed dynamically as CPUs come online
or go offline.

When a new CPU comes online, register a hardware breakpoint for the holder,
avoiding races with watch_on()/watch_off() that may run on another CPU. The
watch address will be updated the next time watch_on() is called.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/watch.c | 52 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index 722ffd9fda7c..f32b1e46168c 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -89,6 +89,48 @@ static void ksw_watch_on_local_cpu(void *info)
 	WARN(ret, "fail to reinstall HWBP on CPU%d ret %d", cpu, ret);
 }
 
+static int ksw_watch_cpu_online(unsigned int cpu)
+{
+	struct perf_event_attr attr;
+	struct ksw_watchpoint *wp;
+	call_single_data_t *csd;
+	struct perf_event *bp;
+
+	mutex_lock(&all_wp_mutex);
+	list_for_each_entry(wp, &all_wp_list, list) {
+		attr = wp->attr;
+		attr.bp_addr = (u64)&holder;
+		bp = perf_event_create_kernel_counter(&attr, cpu, NULL,
+						      ksw_watch_handler, wp);
+		if (IS_ERR(bp)) {
+			pr_warn("%s failed to create watch on CPU %d: %ld\n",
+				__func__, cpu, PTR_ERR(bp));
+			continue;
+		}
+
+		per_cpu(*wp->event, cpu) = bp;
+		csd = per_cpu_ptr(wp->csd, cpu);
+		INIT_CSD(csd, ksw_watch_on_local_cpu, wp);
+	}
+	mutex_unlock(&all_wp_mutex);
+	return 0;
+}
+
+static int ksw_watch_cpu_offline(unsigned int cpu)
+{
+	struct ksw_watchpoint *wp;
+	struct perf_event *bp;
+
+	mutex_lock(&all_wp_mutex);
+	list_for_each_entry(wp, &all_wp_list, list) {
+		bp = per_cpu(*wp->event, cpu);
+		if (bp)
+			unregister_hw_breakpoint(bp);
+	}
+	mutex_unlock(&all_wp_mutex);
+	return 0;
+}
+
 static void ksw_watch_update(struct ksw_watchpoint *wp, ulong addr, u16 len)
 {
 	call_single_data_t *csd;
@@ -210,6 +252,16 @@ int ksw_watch_init(void)
 	if (ret <= 0)
 		return -EBUSY;
 
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					"kstackwatch:online",
+					ksw_watch_cpu_online,
+					ksw_watch_cpu_offline);
+	if (ret < 0) {
+		ksw_watch_free();
+		pr_err("Failed to register CPU hotplug notifier\n");
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.43.0


