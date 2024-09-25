Return-Path: <linux-doc+bounces-25727-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC279862B9
	for <lists+linux-doc@lfdr.de>; Wed, 25 Sep 2024 17:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56F4828730D
	for <lists+linux-doc@lfdr.de>; Wed, 25 Sep 2024 15:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3EE918FC67;
	Wed, 25 Sep 2024 15:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="btIfw3b8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156E318E772
	for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276544; cv=none; b=T+ZdmjUXFiQiZo7Rh+q7fNK2ztyp+4q4/DwX/ixp7bONKrQB/UYsoGpTFJ5HN5XLa7wfS6jaL6+/1LKtMWki6rdocOEGPoJsTGjGI2gYY/cUQpTQwaVa+jGFKdEAVjFF6lESoevYFRlXBek79+pPKtq8C2o5WAks3TEWsE1L4ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276544; c=relaxed/simple;
	bh=5QDZ8e6v38oe4vdIzJiUkWBfZtQ8UHIt+vUykdg9FgY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kG4PR6lqqUz1+bhdrYB/Fgw9Qv8WWrH9DOwIlOccPGXp04hE9BPHdkRRUKMBxK8ay9Of7UYsluwEu0UIGlT87FDdGRS1Pgvgg1aPooGFA2GGBzyefZgU9rhrVmFqgaa6D8U8DT2frBf6lw6rruFaIA5IKLYaT5RPpvwhaPxMb/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=btIfw3b8; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5c25e0a50bfso4183821a12.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 08:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276540; x=1727881340; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sMLI1adUSxUIp8UXfDcqdD38QxXI+e+F/+Ag4yCxL7E=;
        b=btIfw3b8uzUX3qs7RbZNOIodIRQS3kYxnKbB07MkGpXPYtKc+y45geOrWIRE35o0GJ
         5YzfMc8m/wwUmK922QVfZyXI+B9wuA11T+flD5UOxahZBXEtemDkGE3W7/J4g0rup0hY
         RyswEcm3adw5fvIh3eha8RaOBvemjfbbMcjxK6TO86cFNcWaluqJU/uHawwpriFuKlzC
         b5Ay07lm9xUJ9+hbAhwj5blziH/yfFSGqOTaAfwczL1nqILOKB83UYvc+v0ZoNMQWtNe
         zpF1gMq1hKxaI61gGVFhZCZNMi0lZFV8gGArhbSqFgJ/PphdZxS/hEKLUNBePwgIibqI
         GGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276540; x=1727881340;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMLI1adUSxUIp8UXfDcqdD38QxXI+e+F/+Ag4yCxL7E=;
        b=CDaLcqPJ0SSjCgAWMn5gyYIzRoPisXFmcewOHq3rep8yw4wZi462jE0MyutnWsUGOO
         YIFZl9PDn2fDR2kzlJBu+gmrQ/EnfSVOecyhkphgNQQbXeeCYfH7x8ZINQ9wN8oSf29r
         +Vdb1dS6A8tfleCPLQKBwWjWWBTnaNgCtdFg0HO8Wg14WlArwsmY3aKnkrwibtio3tAu
         pi1Exkyenie6k+x3Tojx/+s0bfXrAinTUE+hG3wjSHYahZBqD4Lg/BUbJE/TUUdirDOc
         W4crD4Ek5H1xuvKBXEgP8Onp0DgYE68rCUnGas+eWHn5Zv2wNIILX7t/nd23gTLnFhOr
         MQYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRMLC35yeCgCrzsXpgyQ0+IVwlZFX63u/JHVDmdSjIt+tFyXXRKFj74UFBeB+kLTojDSC78qmCPMI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/24GGmGMRXKDuw4JTQV1waEBxAzbf2QK/ujRv+1Ut4LYCxN60
	7vl7ruQBMQT+tL2Ylx+7USLgRqzsc0crRZbF9RVhDVSNQ3cUyjcm6fKgFomEW/rwGXaItw==
X-Google-Smtp-Source: AGHT+IHqdrbnTURYSpf/5afh17e1i3rk5opqYbKAlLurQBauppiTWqSh5+YV6ICpl369+Ha35/G5jy3r
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a17:906:6d8:b0:a8a:76fd:ae67 with SMTP id
 a640c23a62f3a-a93a061ba72mr129666b.10.1727276539991; Wed, 25 Sep 2024
 08:02:19 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:12 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2056; i=ardb@kernel.org;
 h=from:subject; bh=VKZKKQxE7f774DDxhaNjhf6gM8y+4CHtkhz4ITFKHVU=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6l6HjphM91K+tMbfPlum+q87xXbcaBq/plqB6J0rH
 Clz7dQ6SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwESez2L4w3XU9mNkQveSSXqf
 bkfpTfktlPbu753X3m4//t4RvX456gUjw9ItwQrWWxY9aPiwtX3xVeeW5YpKNdGO1l4qU7KmnF4 VzwoA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-42-ardb+git@google.com>
Subject: [RFC PATCH 12/28] x86/pm-trace: Use RIP-relative accesses for .tracedata
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Use RIP-relative accesses and 32-bit offsets for .tracedata, to avoid
the need for relocation fixups at boot time.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/pm-trace.h | 4 ++--
 drivers/base/power/trace.c      | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/pm-trace.h b/arch/x86/include/asm/pm-trace.h
index bfa32aa428e5..123faf978473 100644
--- a/arch/x86/include/asm/pm-trace.h
+++ b/arch/x86/include/asm/pm-trace.h
@@ -8,10 +8,10 @@
 do {								\
 	if (pm_trace_enabled) {					\
 		const void *tracedata;				\
-		asm volatile(_ASM_MOV " $1f,%0\n"		\
+		asm volatile("lea " _ASM_RIP(1f) ", %0\n"	\
 			     ".section .tracedata,\"a\"\n"	\
 			     "1:\t.word %c1\n\t"		\
-			     _ASM_PTR " %c2\n"			\
+			     ".long %c2 - .\n"			\
 			     ".previous"			\
 			     :"=r" (tracedata)			\
 			     : "i" (__LINE__), "i" (__FILE__));	\
diff --git a/drivers/base/power/trace.c b/drivers/base/power/trace.c
index cd6e559648b2..686a0276ccfc 100644
--- a/drivers/base/power/trace.c
+++ b/drivers/base/power/trace.c
@@ -167,7 +167,7 @@ EXPORT_SYMBOL(set_trace_device);
 void generate_pm_trace(const void *tracedata, unsigned int user)
 {
 	unsigned short lineno = *(unsigned short *)tracedata;
-	const char *file = *(const char **)(tracedata + 2);
+	const char *file = offset_to_ptr((int *)(tracedata + 2));
 	unsigned int user_hash_value, file_hash_value;
 
 	if (!x86_platform.legacy.rtc)
@@ -187,9 +187,9 @@ static int show_file_hash(unsigned int value)
 
 	match = 0;
 	for (tracedata = __tracedata_start ; tracedata < __tracedata_end ;
-			tracedata += 2 + sizeof(unsigned long)) {
+			tracedata += 2 + sizeof(int)) {
 		unsigned short lineno = *(unsigned short *)tracedata;
-		const char *file = *(const char **)(tracedata + 2);
+		const char *file = offset_to_ptr((int *)(tracedata + 2));
 		unsigned int hash = hash_string(lineno, file, FILEHASH);
 		if (hash != value)
 			continue;
-- 
2.46.0.792.g87dc391469-goog


