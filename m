Return-Path: <linux-doc+bounces-38520-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C58B9A3A6A9
	for <lists+linux-doc@lfdr.de>; Tue, 18 Feb 2025 20:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A45C17570D
	for <lists+linux-doc@lfdr.de>; Tue, 18 Feb 2025 18:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BF71E521F;
	Tue, 18 Feb 2025 18:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sf3o3ICE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C01E5207
	for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2025 18:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739905192; cv=none; b=Wk1XYWbZUFRukpapJ5cvpzEiAekzqwjBeDTk4J9j54bM6Z0pbWhlycE6w1N4mBPsAXQR1hCJUv/x7xweQTJO+IcPZWEVnQWXLJJUhYY3bfeHd6E4OFemwWPu/tPGhORnpqqVIqbQVqYcEttaLj9HcArI1PZneuHbs05/BW0jQt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739905192; c=relaxed/simple;
	bh=lOnH/mKyx1+Del/vxG0+xdTDX0A6bFVlFWfN1vk4eS8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GVVogYB6c12lOoEQOYRZU8L6Dpk2MZI0/XhxrP++rJ89yL+aOClVllMLeJ/zi4jluJP3lWjI6jnbwG6YsvDcpsH9Qn9VnVBafyp50C7BBDsucMVMERJ78a6C912v8qWRsjH93wQ6tdc2GMOYJyk9zIVqKJQARdmPeExakgjYVqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sf3o3ICE; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-38f4e47d0b2so880529f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2025 10:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739905189; x=1740509989; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=49VdnZqF35jWIGgVq9B0arGE7pdVdeiBK4kpJ+YCfcM=;
        b=Sf3o3ICE14ZrxJgSjc81zDMEfiI0JSSqI/oJZjAG2BICgrxrSslVE4KiLl54eeoY4o
         JHCwW/4OL/h9Jo6QN6mp8IEnib6yWyw5uehgl1ZInE+8q0SrQJq6mairPud87dJ8vSKx
         Ooio1N1hb2Pz5SZhiHUfRSgXokzHlUjijoFWh3xJukKdCNAKesT4oGRohbEYAfc3La6l
         gWOoRoO3UfnYUJvM+uu+3+LJ90fZv5r3kt+YtC2DakCXnUjVpo5ERyumJ7RUVQ+DLsmh
         yI5zGkmmEBvEHf8luMCGwgmsFp+4ZwTgLLQugdgat0AKEoTsJNezsbKF6IrH3KBqQGQ5
         YOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739905189; x=1740509989;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=49VdnZqF35jWIGgVq9B0arGE7pdVdeiBK4kpJ+YCfcM=;
        b=BSPvxwlx/4CKmuTCF4U4SIWtP2YOD8sAyUDLWYeJTBgYq8VVdcKL2zXGwRJl9Olm5o
         3/N/upR5X/H5azLnqMk90k0aJ6GgTLuSiALDVWVltrued2LoZBGT6vPWJq7ZQwV1aFVI
         mxZ6mMxKCJVzJO+ippfI/pNzMQp3xGBMbqkCPcOxlpNAw3fhFbqUEE3nwQ8kK3smc8Bs
         O6WWN6G8WnmdRRb99nC8tIdr8I6M3Lghq36/M4UcuD+8BNmV4++Y8j4BrKadoQkEw8cB
         ntwzePVYpTLMmUcFGLcLvb42Y63LJHITkZIffuqc78wagbC/4BqcvAbifnXyGBCjsKuP
         Sotw==
X-Gm-Message-State: AOJu0YwMWqpvn3qD5mrgE7iOy5uvfO9SVEO4Q8VIhNE76Wa6wQIg+8Oe
	/FMGMOwW7LeFE0y8gKa96xzAKQJ+s708Y1y8BTEd0v9iCG262cbJhST3lzXrUZjuKcqoaGR+D+B
	SfyoDaqY7jQ==
X-Google-Smtp-Source: AGHT+IHhKLqwSGAXXWpulCb43w7vxvu09Mncf89xWZhzkOuqLQF9FZl2NnsYRFUe7O9y/YtAfJq7psH2VIQSag==
X-Received: from wmbbi18.prod.google.com ([2002:a05:600c:3d92:b0:439:7d73:d8fc])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e6c8:0:b0:38d:eaee:3b32 with SMTP id ffacd0b85a97d-38f58796874mr416328f8f.26.1739905189680;
 Tue, 18 Feb 2025 10:59:49 -0800 (PST)
Date: Tue, 18 Feb 2025 18:59:39 +0000
In-Reply-To: <20250218-force-cpu-bug-v3-0-da3df43d1936@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250218-force-cpu-bug-v3-0-da3df43d1936@google.com>
X-Mailer: b4 0.15-dev-42535
Message-ID: <20250218-force-cpu-bug-v3-1-da3df43d1936@google.com>
Subject: [PATCH v3 1/4] x86/cpu: Remove some macros about feature names
From: Brendan Jackman <jackmanb@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

These macros used to abstract over CONFIG_X86_FEATURE_NAMES, but that
was removed in commit 7583e8fbdc49 ("x86/cpu: Remove
X86_FEATURE_NAMES"). Now they are just unnecessary indirection, remove
them.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/include/asm/cpufeature.h |  5 -----
 arch/x86/kernel/cpu/common.c      | 12 ++++++------
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index de1ad09fe8d7..f23942108b85 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -37,13 +37,8 @@ enum cpuid_leafs
 	NR_CPUID_WORDS,
 };
 
-#define X86_CAP_FMT_NUM "%d:%d"
-#define x86_cap_flag_num(flag) ((flag) >> 5), ((flag) & 31)
-
 extern const char * const x86_cap_flags[NCAPINTS*32];
 extern const char * const x86_power_flags[32];
-#define X86_CAP_FMT "%s"
-#define x86_cap_flag(flag) x86_cap_flags[flag]
 
 /*
  * In order to save room, we index into this array by doing
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 76598a93a8fa..f96a3a4829bd 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -667,8 +667,8 @@ static void filter_cpuid_features(struct cpuinfo_x86 *c, bool warn)
 		if (!warn)
 			continue;
 
-		pr_warn("CPU: CPU feature " X86_CAP_FMT " disabled, no CPUID level 0x%x\n",
-			x86_cap_flag(df->feature), df->level);
+		pr_warn("CPU: CPU feature %s disabled, no CPUID level 0x%x\n",
+			x86_cap_flags[df->feature], df->level);
 	}
 }
 
@@ -1539,9 +1539,9 @@ static void __init cpu_parse_early_param(void)
 
 				/* empty-string, i.e., ""-defined feature flags */
 				if (!x86_cap_flags[bit])
-					pr_cont(" " X86_CAP_FMT_NUM, x86_cap_flag_num(bit));
+					pr_cont(" %d:%d", bit >> 5, bit & 31);
 				else
-					pr_cont(" " X86_CAP_FMT, x86_cap_flag(bit));
+					pr_cont(" %s", x86_cap_flags[bit]);
 
 				setup_clear_cpu_cap(bit);
 				taint++;
@@ -1554,10 +1554,10 @@ static void __init cpu_parse_early_param(void)
 		}
 
 		for (bit = 0; bit < 32 * NCAPINTS; bit++) {
-			if (!x86_cap_flag(bit))
+			if (!x86_cap_flags[bit])
 				continue;
 
-			if (strcmp(x86_cap_flag(bit), opt))
+			if (strcmp(x86_cap_flags[bit], opt))
 				continue;
 
 			pr_cont(" %s", opt);

-- 
2.48.1.601.g30ceb7b040-goog


