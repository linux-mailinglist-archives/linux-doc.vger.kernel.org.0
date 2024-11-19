Return-Path: <linux-doc+bounces-31148-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A849D2E28
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2024 19:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93BC81F23918
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2024 18:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B15D1D150D;
	Tue, 19 Nov 2024 18:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="un+QSUpg"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F701CFEAE
	for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2024 18:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732041863; cv=none; b=ZJ7EZfDxtjlz+9LSQoPwCZHk5gBijTwja/uHu6gillEUXke3rZhjL1r651QkeHFVLtwQq3CMbnVaeDqKGE5YWWhJznUJYoSbpVYq1513LbCvuh7vZ9d4oIC8ht+427XZpsMoglDyCy6KxL6z4JDq4niNaBLEmaCweu3Fr/gigBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732041863; c=relaxed/simple;
	bh=IarxwQtxc2hQvhVZR9jrJYlPoreFUzzBh5T+o0qvzW4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HOYp1TEUIjTIBCDFnRTVHpWM7rFU6m/7zNpqtoWnuSo1rHPorQhTIn0Ofh2cgsZRv6ZqhVLe88nNEWW7NdkGjr+qWVAKCH7BovbhphZqA7d/PLDBiHscb7AAIGG3ShqViVusiuxrNhFQGyGL4vf8khTJPQbbWPt2phiaMKdOsSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=un+QSUpg; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43151e4ef43so30665825e9.3
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2024 10:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732041860; x=1732646660; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7raj8+o6anDV7XgBulw7mIVhDmj5A5pDYJQm9ULQW+c=;
        b=un+QSUpg42VXc4TZWgqnpaucAG4GAYyZmI9+nEjFsDJ8w4w6xW5iX0KZlvQk2gpZFJ
         zoFf2Q1oXoOmW+7cwFIWD3Apud3zkJ9VvdI9BO0fDhC/MW1VH2WMIbPcRkCqGEJDSs6b
         za4e4CruTPW1eya1q4TWbPqciff179JjtwGXRjpNwaw26B6wKh2qTMLbeivIOX0Ob3W4
         kbwbinpH+xMSVURRhXa1+lxEfMKIT6PhwX0SXTG5rFsKElAyVs+PTmW33/P4lbtbIMUr
         NplLbN0asZit9dTXzucALCCbI6yriRtG/KEZCt9I3izfcRM+9R8OJ6QJ8Y3opHGjeDCZ
         UOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732041860; x=1732646660;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7raj8+o6anDV7XgBulw7mIVhDmj5A5pDYJQm9ULQW+c=;
        b=U2+YpSgxzJN+qJg9eNAxTvMc9idzmISdmmDPURxTyqpZlVNvRHqhMeWX9jccROOBfU
         Q2ZkCIH77XDkPVBT9DFehDEfq8Jt7G5yDL97xpebrCFxsL4FiIALPtn5XJ3AGAWNgCTO
         Huj6S1K01BtlQa85zwYIp9b32V9Y23Sn6MQEt1NcQNjGhwjNx8g1r9oyADx+5J7cHSgY
         m4yzXM4qhXRO3L+79YckHslRWxuM6JGiui7e2MNe8B4ea4HVRIRIoR/bgGB4FpAf7g8d
         twJ/+5L6zkMP90ufCICPtHLlwc70bhZ3qb71+TGY4U9ZWYCXcH2iuckqQb/fBAjw4hg8
         owSA==
X-Gm-Message-State: AOJu0YxguXsAJVSURaKGImpuQguooqz2IuDcDYA6ZjbdLeeFUWti5BT2
	cxkHJuAS5+C2SceOet1Lc6utRnr3NBCdkb94etn+FTPz5jMdyDZqeOz75sQ7W60Fl+qXTbpgpDA
	0frjUarFbyw==
X-Google-Smtp-Source: AGHT+IH94Dq73gso4wswesMB24HRWw+5UPZSgOZVt0jGzxu94xZy2urcKvwiOPmGIeQpgnuHERE64duvSUhRqA==
X-Received: from beeg.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:f74])
 (user=jackmanb job=sendgmr) by 2002:a05:600c:18a3:b0:431:4760:d09a with SMTP
 id 5b1f17b1804b1-4334f02a519mr25e9.5.1732041860403; Tue, 19 Nov 2024 10:44:20
 -0800 (PST)
Date: Tue, 19 Nov 2024 18:43:57 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGzcPGcC/x3MQQqAIBBA0avIrBtQc5FdJVqYjTYbC8UIwrsnL
 d/i/xcKZaYCs3gh082Fz9ShBgH+cCkS8t4NWmqjlLIYzuwJ/VVxqxGtcXJym9SjDdCbK1Pg5/8 ta2sfvbXID18AAAA=
X-Change-Id: 20241119-force-cpu-bug-94a08ab0239f
X-Mailer: b4 0.15-dev
Message-ID: <20241119-force-cpu-bug-v1-1-2aa31c6c1ccf@google.com>
Subject: [PATCH] x86/bugs: Add force_cpu_bug= cmdline param
From: Brendan Jackman <jackmanb@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

Sometimes it can be very useful to run CPU vulnerability mitigations on
systems where they aren't known to mitigate any real-world
vulnerabilities. This can be handy for mundane reasons like "I wanna
debug this on the machine that quickly", but also for research reasons:
while some mitigations are focussed on individual vulns and uarches,
others are fairly general, and it's strategically useful to have an idea
how they'd perform on systems where we don't currently need them.

As evidence for this being useful, a flag specifically for Retbleed was
added in commit 5c9a92dec323 ("x86/bugs: Add retbleed=force").

It's a bit unfortunate that we have to do this by bug instead of by
mitigation. However, we don't have clear identifiers for the mitigations
that we do, so I don't think it's practical to do better here than "you
can pretend you're on a vulnerable CPU - now go and read the docs for
the per-vuln cmdline params to figure out how to run the mitigation you
want".

Being an early_param() means we get to do this before identify_cpu() and
cpu_select_mitigations(). But it's possible there's still other types of
bugs that get setup earlier and might miss this override...

I've only tested this by booting a QEMU guest and checking /proc/cpuinfo.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  6 ++++
 arch/x86/kernel/cpu/common.c                    | 40 +++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d401577b5a6ace87d250d9b1cc200691c6a0ed4e..260267a6d555076735fda09d171c918e6412b6e1 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1559,6 +1559,12 @@
 	floppy=		[HW]
 			See Documentation/admin-guide/blockdev/floppy.rst.
 
+	force_cpu_bug=	[X86,EARLY]
+			Force the kernel to assume the CPU is affected by the
+			given bug, regardless of its built-in information about
+			individual models.  Comma-separated list of the names of
+			vulnerabilities that would appear in /proc/cpuinfo.
+
 	forcepae	[X86-32]
 			Forcefully enable Physical Address Extension (PAE).
 			Many Pentium M systems disable PAE but may have a
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index f43bb974fc66d7b21ad52c64da22694ccc274187..b86b0200a5bf0de692f07d4ffef50ba7c360975d 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1318,6 +1318,10 @@ static bool __init vulnerable_to_rfds(u64 x86_arch_cap_msr)
 	return cpu_matches(cpu_vuln_blacklist, RFDS);
 }
 
+/*
+ * This sets up what we _really_ think the CPU has. The user might override this
+ * later via force_cpu_bug.
+ */
 static void __init cpu_set_bug_bits(struct cpuinfo_x86 *c)
 {
 	u64 x86_arch_cap_msr = x86_read_arch_cap_msr();
@@ -1462,6 +1466,42 @@ static void __init cpu_set_bug_bits(struct cpuinfo_x86 *c)
 	setup_force_cpu_bug(X86_BUG_L1TF);
 }
 
+static int __init force_cpu_bug_parse_cmdline(char *str)
+{
+	if (!str)
+		return -EINVAL;
+
+	while (str) {
+		char *next = strchr(str, ',');
+		int i;
+
+		if (next) {
+			*next = 0;
+			next++;
+		}
+
+		/*
+		 * Linear search because there aren't many bugs (well, at least
+		 * not for the definition of "many" that is relevant here...).
+		 *
+		 * Some configs have no gaps so we could stop at the first NULL,
+		 * but it isn't worth the ifdeffery.
+		 */
+		for (i = 0; i < ARRAY_SIZE(x86_bug_flags); i++) {
+			if (x86_bug_flags[i] && !strcmp(str, x86_bug_flags[i])) {
+				setup_force_cpu_bug(X86_BUG(i));
+				goto found;
+			}
+		}
+		pr_err("Ignoring unknown force_cpu_bug= option (%s).", str);
+found:
+		str = next;
+	}
+
+	return 0;
+}
+early_param("force_cpu_bug", force_cpu_bug_parse_cmdline);
+
 /*
  * The NOPL instruction is supposed to exist on all CPUs of family >= 6;
  * unfortunately, that's not true in practice because of early VIA

---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241119-force-cpu-bug-94a08ab0239f

Best regards,
-- 
Brendan Jackman <jackmanb@google.com>


