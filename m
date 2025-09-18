Return-Path: <linux-doc+bounces-60167-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8391B5492C
	for <lists+linux-doc@lfdr.de>; Fri, 12 Sep 2025 12:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B2DF560260
	for <lists+linux-doc@lfdr.de>; Fri, 12 Sep 2025 10:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF362F2914;
	Fri, 12 Sep 2025 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwL2Tz0X"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9243C2F28EB
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 10:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672010; cv=none; b=fY/VAUva1+pJT+if5FXTnTzW9+qRvI3Bq53vGYuDVmSpDPLyMo069B0eCcQg4RgK42nXzqU+5V2vXfdvxWkdYzYQqUxNFYbLcI9i2vJ0ltWNWINjtxcUon9W6juAFmOG6qRG8csSuez+d8QNpDLUglJ7FnJ3KHdM+usHHPDdx/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672010; c=relaxed/simple;
	bh=k6timgyy8B4GPUl9IUPi95Oa04aVieHJCexEN+DVT5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/m+qm7FcrbE3lBHF//JgudjEGeqGC+kJLu4AfoINfz7bnxUTyA+7v/pXN6k139xNfJRIITqyOYu4EWelfS5rnubqlnhVXkWlsUacvhUKUaQ3xxm4QxV/ji2dwJf+LspLY1BuvsDDLOYO8FPsjzZ6w/LBOQWY+BFIs3IKT7D1oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwL2Tz0X; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2445806e03cso19803115ad.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 03:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757672008; x=1758276808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5u/a2s8j5yqiSFbkPas+Re9l+zCPojPRf0oLtuMcdk=;
        b=MwL2Tz0XVsS+r5ozTCrIlMb06yMsEs8UVob0h1JVcrLV+Z3G355tyMmhBvyDldpfwO
         gn8PhuE70WA82Rrf4h+uTDiOkgIWnz+qN9b/HBSlPHHODyImOSkbwI8dMr7G6Z/iojfn
         hDKzeJLbX2gJ/Rmk59EpxX5GRVhwBdoqmH8OpjlNd7GyliXwnoeXtnl8MWvA/n9VCiHX
         GTovlx31S0rHMtYXf/Za7qkPTd091638SUjb7coZoMWdvCv2h8PJm867sYRfE2+uL7xN
         yUfme2a6ytDj7+yW4s1GG4ZDlEa92fHzLZPjEPvVTJMXE/lKW2GqRv2d+iZufspPfZYF
         Jwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672008; x=1758276808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5u/a2s8j5yqiSFbkPas+Re9l+zCPojPRf0oLtuMcdk=;
        b=PiV3nFDVP1LwwYZ9Eea22+ERVtswjugLbaKhykcFo81/m0zpjA3+XluhHY17robfrZ
         FrnhsDHxRSCqBlhLwrPfuoQ08qPdfzQkxwcF7Ye7dT4NKFN/dFTE2SGXSfIANktbaOOr
         EHGrvY9x9xtO4B4qQBotmn2TNuHHPPPclCJTMczLOWcACFoiQLhB4lQP3yQq3rhDl4mi
         mfLGaVtvR2FgCzNpnF3Jlk/2kREUZWSRPCtW4o7Vyure6kMXxZ8gGjTzKM8souwPxvPJ
         ks93r0+onUJtWWkdb7QbB3Z9k5afM+SMutisUqaEKR9aodfdwOPaRwvbAeubX2E37OR5
         LqIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQGh4OYOx90NInTKr/d1f2dluwsmknkVWBAFt6ViiCm3eekA85kqA446GLusZxuWttph4IB3hZkDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhjSQHdF7nOnd6heq54OY+3rxulwszkpumQOSrn9kUsTIAHZe9
	ZPlHmQjkoYxk9brfbPAgz0ksNX3k5vsHZJDppq4N1k/nXxSgxS/DOb+p
X-Gm-Gg: ASbGncunLDePMbjWHeN1hJ/3da3Ly3tAEW8Y60kvZunn0QyTeYxhZ5KT472zNGWRQix
	6gsKbUcdinJbTFqJF3kTHIZZBltprlglzkL88B7Ef1savNXkJTF9muERxaagFqhK4HwBuhJbm1n
	xpHFSFWgIhxw++2HsXygH8YpbDDEFzimJXrHVr/ENdjAKNwPC26ugMAOeAmX/xupiJIjyZMM3CN
	5Rl5t5ThZWmGodHL2mHHb3opAyv1AIxBZk+39dIDyS6+r1mb/PGekbeTy4IjHhCU2SFHZN7k3Rd
	89UEuGClGlKH5KeEYYLJ8pSsuUnyyKnypfV5KaMLOgNbDWMLWOULsZkA4uXYe05JjyJpOJsQbns
	sIsGYyAowV8nBUP/RMoIUNIYVDHG3bCoo9tU=
X-Google-Smtp-Source: AGHT+IHfq4U4MFqDIc6ZxO6yNatWwL7n6+/zPGuAMGcOfOLtnumo4rnkiu74aB1UWkUMdayihYaGMA==
X-Received: by 2002:a17:902:ebc2:b0:24a:ceea:b96f with SMTP id d9443c01a7336-25d24e9dc1dmr34403925ad.24.1757672007735;
        Fri, 12 Sep 2025 03:13:27 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dd9509002sm5179465a91.0.2025.09.12.03.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:13:27 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
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
Subject: [PATCH v4 18/21] mm/ksw: add recursive stack corruption test
Date: Fri, 12 Sep 2025 18:11:28 +0800
Message-ID: <20250912101145.465708-19-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912101145.465708-1-wangjinchao600@gmail.com>
References: <20250912101145.465708-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test that triggers stack writes across recursive calls,verifying
detection at specific recursion depths.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/test.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
index 2b196f72ffd7..3e867d778e91 100644
--- a/mm/kstackwatch/test.c
+++ b/mm/kstackwatch/test.c
@@ -150,6 +150,27 @@ static void silent_corruption_test(void)
 		silent_corruption_victim(i);
 }
 
+/*
+ * Test Case 3: Recursive Call Corruption
+ * Test corruption detection at specified recursion depth
+ */
+static void recursive_corruption_test(int depth)
+{
+	u64 buffer[BUFFER_SIZE];
+
+	pr_info("recursive call at depth %d\n", depth);
+	pr_info("buffer 0x%lx\n", (unsigned long)buffer);
+	if (depth <= MAX_DEPTH)
+		recursive_corruption_test(depth + 1);
+
+	buffer[0] = depth;
+
+	/* make sure the compiler do not drop assign action */
+	barrier_data(buffer);
+
+	pr_info("returning from depth %d\n", depth);
+}
+
 static ssize_t test_proc_write(struct file *file, const char __user *buffer,
 			       size_t count, loff_t *pos)
 {
@@ -181,6 +202,11 @@ static ssize_t test_proc_write(struct file *file, const char __user *buffer,
 			pr_info("triggering silent corruption test\n");
 			silent_corruption_test();
 			break;
+		case 3:
+			pr_info("triggering recursive corruption test\n");
+			/* depth start with 0 */
+			recursive_corruption_test(0);
+			break;
 		default:
 			pr_err("Unknown test number %d\n", test_num);
 			return -EINVAL;
@@ -202,7 +228,8 @@ static ssize_t test_proc_read(struct file *file, char __user *buffer,
 		"Usage:\n"
 		"  echo 'test0' > /proc/kstackwatch_test  - Canary write test\n"
 		"  echo 'test1' > /proc/kstackwatch_test  - Canary overflow test\n"
-		"  echo 'test2' > /proc/kstackwatch_test  - Silent corruption test\n";
+		"  echo 'test2' > /proc/kstackwatch_test  - Silent corruption test\n"
+		"  echo 'test3' > /proc/kstackwatch_test  - Recursive corruption test\n";
 
 	return simple_read_from_buffer(buffer, count, pos, usage,
 				       strlen(usage));
-- 
2.43.0


