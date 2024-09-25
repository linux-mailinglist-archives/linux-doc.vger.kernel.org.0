Return-Path: <linux-doc+bounces-25732-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE80986385
	for <lists+linux-doc@lfdr.de>; Wed, 25 Sep 2024 17:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98293B2EF94
	for <lists+linux-doc@lfdr.de>; Wed, 25 Sep 2024 15:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626D6192583;
	Wed, 25 Sep 2024 15:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QheHwjD5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41B51922D7
	for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 15:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276556; cv=none; b=Ne8tYt42ihAiYWLF9e+/ckv+RLLyzkTlTHjc7225bpdSUv4kewV9U5gZnTS/sG/aHhtOVIo1O+gmwxtsWpIcrsqGoBnDYHtXf6wNqoTPbdz/jA/FfvY16PdTa+XMRC8KLAG8zQvtDEoeiJUsh4wL7rkoi9WUuUsud8U6iL9HEDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276556; c=relaxed/simple;
	bh=CMurddgdDXZCJtwTh7sicisjqXrlKeRuIZ1TFq/8oX8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A4VQuGWaKMAONeg97V1+WequuoO4EhZ3/6KN4cTM9eHlnl9tVtFLdn/WDogYHeW+NxJNoB62l9tzw2Jfq31ux+2A/sJIpNDBZHwcSYLB3Heg8BhtyknyFh71PThvRDcv00Skp+EHfyXIJEpd5+4Pa5Bo/mBfI2uyHTp/6jLKkx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QheHwjD5; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-374b69e65e8so2626719f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 08:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276553; x=1727881353; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GQ1cTLWN/qm1UuyAwDsDiC37ecAWh5CqzUoGN/3jT3Q=;
        b=QheHwjD5gcp3pQg1btz606WQxjCEVHcr1ocQck8aZdG3CSc99pWkXkDgo0M34zSU0I
         dtwwyONfaMKeysdhicSDnH3SgJC/XbwybTtvx43xSJPonNlHzlXLd01XPNTmd8BGYbJG
         1kE6Nv5tPc/5Z0Y+DESalkSnexq3RW330glSb5cKl38X9bGlfHo7gzPgOoyTLbmLCj4/
         zFo4liVFFN1L0oEl2QIwtVmZNdsZn5WijD/a20yAXU8VO4mg9O8c3GMQc6OVRtfiYf3v
         niyirVOUBznJP8RSQBAHP8REttly+HIqe6ErgmXiFM4hq27L91W2t8t6hxUkCVEAs23F
         JjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276553; x=1727881353;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQ1cTLWN/qm1UuyAwDsDiC37ecAWh5CqzUoGN/3jT3Q=;
        b=I/RODttZR20+jRbYsd1AaZKatSHyLZe4JWRtZextyMkxJb5UCd1qLEB7I9eaQpEgXx
         oJ4wBdUKPBW4CnyWx/8pcVoJoTKvLYbr8PAEvPWF9+EakiriL7pmSBJQwGeyb1F0SUOV
         3D7qCfUh2u/rBIP0b/ZMYEhvYI60njGoiNU9Xu2IQjuaqYxS7Jmxf81dJ3QRuAQyrD+4
         r1rP9i2o1+P46A8u8W/E3IJcWT7XD1Q9pKA6vi+OwamRJ2PM92i8ClB+me3MXNAa16XJ
         kSWcBqk1Zm5xpAJZBN4HJ2tlaDZeuVzetmJax3YhRcC3vKabyyLd/Z1IY2HPX4d8k9oa
         s/tA==
X-Forwarded-Encrypted: i=1; AJvYcCWBm9KZLm5BJo69XeYyiNppmYgm8TQ69iK21rfLdkhNCcaDwYBO/a6Pbtf5jXbapu0BdyFpqMp/Kb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnNV41Po+qCi4CFOqzG+je5m4f21rzSGU5PQ9YZ20GuTXg6DjE
	u8n+cGpXvRyQqnGgBuHO33ctj9WwcduIlBfKRx2bUiHQ00hUC8TIOYIzQN25sxpVAEM10Q==
X-Google-Smtp-Source: AGHT+IEbuxsanqyADq8Deat2AYN/hrx0yHWhBh+K99NJ5NNzbtyXWGf28ibYOumK1/7kTAhssaq/BKmU
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:6000:1948:b0:371:8d08:6302 with SMTP id
 ffacd0b85a97d-37cc2466282mr1755f8f.2.1727276552813; Wed, 25 Sep 2024 08:02:32
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:17 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089; i=ardb@kernel.org;
 h=from:subject; bh=Gk3vl5lcNVlUG5WaXx6+kW7e4vi5Wc78FqbNjCEkOO8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6pHFHOXq05/1nFnPcudQmJ7wpr7dLDufJIa/O8C5x
 Txd0oW5o5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExENobhf+k7pXk1KeYh8xfa
 vazOipusdTSTNTQtS+jqxsxgKQvlywz/y0srlXSWbHHluXU+4voFET+GHMONjSy3U2vjQqX5RWI YAQ==
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-47-ardb+git@google.com>
Subject: [RFC PATCH 17/28] x86/hibernate: Prefer RIP-relative accesses
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

Replace some absolute symbol references with RIP-relative ones, so we
don't need to fix them up at boot.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/power/hibernate_asm_64.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/power/hibernate_asm_64.S b/arch/x86/power/hibernate_asm_64.S
index 0a0539e1cc81..1d96a119d29d 100644
--- a/arch/x86/power/hibernate_asm_64.S
+++ b/arch/x86/power/hibernate_asm_64.S
@@ -39,7 +39,7 @@ SYM_FUNC_START(restore_registers)
 	movq	%rax, %cr4;  # turn PGE back on
 
 	/* We don't restore %rax, it must be 0 anyway */
-	movq	$saved_context, %rax
+	leaq	saved_context(%rip), %rax
 	movq	pt_regs_sp(%rax), %rsp
 	movq	pt_regs_bp(%rax), %rbp
 	movq	pt_regs_si(%rax), %rsi
@@ -70,7 +70,7 @@ SYM_FUNC_START(restore_registers)
 SYM_FUNC_END(restore_registers)
 
 SYM_FUNC_START(swsusp_arch_suspend)
-	movq	$saved_context, %rax
+	leaq	saved_context(%rip), %rax
 	movq	%rsp, pt_regs_sp(%rax)
 	movq	%rbp, pt_regs_bp(%rax)
 	movq	%rsi, pt_regs_si(%rax)
-- 
2.46.0.792.g87dc391469-goog


