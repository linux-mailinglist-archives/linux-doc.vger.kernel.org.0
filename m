Return-Path: <linux-doc+bounces-96810-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fdX5Cqx+Vmqd7QAAu9opvQ
	(envelope-from <linux-doc+bounces-96810-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 20:23:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC4D757D09
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 20:23:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="W/uYmZ8g";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96810-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-96810-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F5F630333E0
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 18:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772FA412BF1;
	Tue, 14 Jul 2026 18:23:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A4A412C0E
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 18:23:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784053416; cv=none; b=Xj84IMaAu1NVYnNpT5We3/BYqVgagUfIQBVMprObYygIgB7qJWDWh7uFWK4VfDZcNbyH+NDEAkmchKX3lPTJOzlDw/6kEabbVxCUYvh1UfvXBQviUvTkFyRhf2GcpL1RcYzqgNA7JZy2Ij0163KDH2Z32OLGqHLIfqKAoge8ZKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784053416; c=relaxed/simple;
	bh=4jktZnR0Pc2J7o9JFOWqLz2AFfowdAE5d7umNHBmtls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dpQaxSb9x/T48sGbaoCGKUp5YJAOizq0tyREnm4+GALm/w+jXVTqyuayXoP/xuCurMBqs6fERIuJgSr/tZP6OIS9poYLKygEF0c1gKnAhAcbDwSHvYyUUZSN+h+RTuf+NM9GofikwQhWjDzUt9zS9jokUxSjpjjHCT3clCf2ZKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/uYmZ8g; arc=none smtp.client-ip=209.85.219.52
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ff88549786so56077286d6.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 11:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784053413; x=1784658213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dlvBm4NItea/+plJuhWRRJi1bfhjVkmixX1HjLGBPlA=;
        b=W/uYmZ8gEQNcJJpfYjNkCOkHIRSulmC9MgO0+6GH5Zlz1ob9T27rWwkjFtwDYGT32V
         T3sl0sF0ziCMO02IF+45IUl6Z4XE6Fer5piqLvLFaSGjKOKoSchXa6uCx1XyknDeVKM7
         5Xvz9XyZavQGDN18vGn8XDUW5ABO6s3cIk/ibFGDnBFUoDXIOOuaJT5JNZvsSMnc1uGN
         ct2JiGDWuP5HVlU6kUFBRRC2WElQb2DfEEWBcT6mjpbkzxxQ6Dm77+S8JtiQurrlLjtN
         Z7jqPeyRd3NvonDHfCNtkocjzC0zSUbWc4/ONJxIKKrX1bZNB8DrlIcGzpx/xZAV2iP5
         ijkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784053413; x=1784658213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlvBm4NItea/+plJuhWRRJi1bfhjVkmixX1HjLGBPlA=;
        b=gKU9NMCU7riVcV6NhKpTQj78gwbZFKi+ELuQJfyGuX+74JZs1fhKz+mLXZCrzE2Dpu
         lt7LbS1TCOrB5TjQWdle+S7Wbc7NJL+ob+6oWN0UliwpKM3Sxa4derZ0n+uGDXwbjJYu
         Amf2/2Xz9Dea/EbHd5h8+dAhgpqZOmRQBOECuf46TEY8nwi4+W8DtUOUhX+66hTvu5NI
         AVeMCDIcZ4tBVa2oV04JRbGjT5IjXsGqikj7C4k8Oj5/fHmfr+SAHQGEKLnn7UpY77WQ
         KR7AwWTULRvxCR9f4SjpRpCYhhOc1yTRHMu9LyluP4whkOeY7+pNnsnrOtHNY6jBPduB
         KXNg==
X-Forwarded-Encrypted: i=1; AHgh+RqwPldHNyLWbUi+73hR1AeZcLQavOunrGsM5OTlRocN4LVGNTF+6VzfysUPMFAf/HMbWqvg5ziDkUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH+u+NjqCX30TldyT78Ng7k2oM6jaExnz0RhIICvsHDP6pBhNx
	5y0otg1YCer33EH2O71LQI3yC1kyqa8n71hMoteT9+SbHofBCb0wDqFY
X-Gm-Gg: AfdE7cmMim/QJXvStHPO7lKz7dTaJV/zFyHm20iqlftuWnv9b4GtkOIozt3W1IsJqJL
	JN0pbudRsnAQuyzeXEN83HfIUPZArZ9F0HI5WSL+hbW017WF2tMd/FZWOKzOfPA7q/e5pfPDIJp
	IsyOD3UYPkSvurV/z2vwadR/x5DZheyoW42dSmk4jYmNyGlwtnp99EHC0WwwCDXQ2IzpeEfXLz5
	wx7vWEY0jvKF2r0IkrxC+aAJtE6fG923l3bKmWh93PHkPmBm/iRtECZlM6p4Vzp6GT3sSkLxeV3
	gpXKhy5KrAcu/5w0E5p9IXYu9silhfXrqikwQrFOjDSeQ3YoZur167a4gxfPexYOY9dtpCj4aku
	u4ZDZ5yojR4HO8YHxCTq88wfHsZI40wFI9jfOLPYBZbqsG9J6E4IiCmYiWiEst8u/WURzRzGfqP
	Dx9PnJZqrC1HdY20e1Jk7+Q44mZYAK/RmS+2aMTQ7a4bG/qLEc05o=
X-Received: by 2002:a05:6214:5913:b0:8f2:2e4e:f5f with SMTP id 6a1803df08f44-90401b75879mr187179916d6.45.1784053413454;
        Tue, 14 Jul 2026 11:23:33 -0700 (PDT)
Received: from localhost ([48.45.163.146])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd248e666sm173753776d6.0.2026.07.14.11.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:23:32 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Matthew Wilcox <willy@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jinchao Wang <wangjinchao600@gmail.com>
Subject: [RFC PATCH 03/13] x86/hw_breakpoint: Add arch_reinstall_hw_breakpoint
Date: Wed, 15 Jul 2026 02:22:33 +0800
Message-ID: <20260714182243.10687-4-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714182243.10687-1-wangjinchao600@gmail.com>
References: <20260714182243.10687-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,alien8.de,linux.intel.com,zytor.com,kernel.org,arm.com,efficios.com,lwn.net,infradead.org,vger.kernel.org,kvack.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-96810-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:peterz@infradead.org,m:tglx@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:x86@kernel.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,m:mathieu.desnoyers@efficios.com,m:david@kernel.org,m:corbet@lwn.net,m:willy@infradead.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-doc@vger.kernel.org,m:wangjinchao600@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[wangjinchao600@gmail.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjinchao600@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACC4D757D09

The new arch_reinstall_hw_breakpoint() function can be used in an
atomic context, unlike the more expensive free and re-allocation path.
This allows callers to efficiently re-establish an existing breakpoint,
and x86 advertises the capability via HAVE_REINSTALL_HW_BREAKPOINT.

Since a REINSTALL may change bp_len, setup_hwbp() must clear the
slot's stale len/type and enable bits in DR7 before re-encoding:
OR-merging the new encoding over the old one would keep the CPU
watching with the stale width (verified in QEMU by reading DR7 after
re-arming watch_len=1 over a len8 breakpoint: 0x999906aa merged
without the clearing, 0x199906aa with it).

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 arch/x86/Kconfig                     |  1 +
 arch/x86/include/asm/hw_breakpoint.h |  2 ++
 arch/x86/kernel/hw_breakpoint.c      | 16 ++++++++++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index bdad90f210e4..5be698db0241 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -246,6 +246,7 @@ config X86
 	select HAVE_FUNCTION_TRACER
 	select HAVE_GCC_PLUGINS
 	select HAVE_HW_BREAKPOINT
+	select HAVE_REINSTALL_HW_BREAKPOINT
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK	if X86_64
 	select HAVE_IRQ_TIME_ACCOUNTING
diff --git a/arch/x86/include/asm/hw_breakpoint.h b/arch/x86/include/asm/hw_breakpoint.h
index aa6adac6c3a2..c22cc4e87fc5 100644
--- a/arch/x86/include/asm/hw_breakpoint.h
+++ b/arch/x86/include/asm/hw_breakpoint.h
@@ -21,6 +21,7 @@ struct arch_hw_breakpoint {
 
 enum bp_slot_action {
 	BP_SLOT_ACTION_INSTALL,
+	BP_SLOT_ACTION_REINSTALL,
 	BP_SLOT_ACTION_UNINSTALL,
 };
 
@@ -65,6 +66,7 @@ extern int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
 
 
 int arch_install_hw_breakpoint(struct perf_event *bp);
+int arch_reinstall_hw_breakpoint(struct perf_event *bp);
 void arch_uninstall_hw_breakpoint(struct perf_event *bp);
 void hw_breakpoint_pmu_read(struct perf_event *bp);
 void hw_breakpoint_pmu_unthrottle(struct perf_event *bp);
diff --git a/arch/x86/kernel/hw_breakpoint.c b/arch/x86/kernel/hw_breakpoint.c
index 877509539300..4221dbb899f9 100644
--- a/arch/x86/kernel/hw_breakpoint.c
+++ b/arch/x86/kernel/hw_breakpoint.c
@@ -100,6 +100,10 @@ static int manage_bp_slot(struct perf_event *bp, enum bp_slot_action action)
 		old_bp = NULL;
 		new_bp = bp;
 		break;
+	case BP_SLOT_ACTION_REINSTALL:
+		old_bp = bp;
+		new_bp = bp;
+		break;
 	case BP_SLOT_ACTION_UNINSTALL:
 		old_bp = bp;
 		new_bp = NULL;
@@ -134,10 +138,13 @@ static void setup_hwbp(struct arch_hw_breakpoint *info, int slot, bool enable)
 	__this_cpu_write(cpu_debugreg[slot], info->address);
 
 	dr7 = this_cpu_read(cpu_dr7);
+	/*
+	 * Clear the slot's stale len/type and enable bits first: a REINSTALL
+	 * with a different bp_len would otherwise OR-merge both encodings.
+	 */
+	dr7 &= ~__encode_dr7(slot, 0xf, 0);
 	if (enable)
 		dr7 |= encode_dr7(slot, info->len, info->type);
-	else
-		dr7 &= ~__encode_dr7(slot, info->len, info->type);
 
 	/*
 	 * Enabling:
@@ -188,6 +195,11 @@ int arch_install_hw_breakpoint(struct perf_event *bp)
 	return arch_manage_bp(bp, BP_SLOT_ACTION_INSTALL);
 }
 
+int arch_reinstall_hw_breakpoint(struct perf_event *bp)
+{
+	return arch_manage_bp(bp, BP_SLOT_ACTION_REINSTALL);
+}
+
 void arch_uninstall_hw_breakpoint(struct perf_event *bp)
 {
 	arch_manage_bp(bp, BP_SLOT_ACTION_UNINSTALL);
-- 
2.53.0


