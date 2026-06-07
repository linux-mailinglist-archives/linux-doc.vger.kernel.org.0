Return-Path: <linux-doc+bounces-91244-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QMVELOKLJWpoJAIAu9opvQ
	(envelope-from <linux-doc+bounces-91244-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 07 Jun 2026 17:18:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D74E650D65
	for <lists+linux-doc@lfdr.de>; Sun, 07 Jun 2026 17:18:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=OCljjPMR;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91244-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91244-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CC083014647
	for <lists+linux-doc@lfdr.de>; Sun,  7 Jun 2026 15:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48922BEC27;
	Sun,  7 Jun 2026 15:18:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6882773D3
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 15:18:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780845525; cv=none; b=YsWGYVchmU605Ngs4pOKhtX+P64mN1yyrFIZRq6o4DTdxmLCqIA9AtgvIozXMCeioX3hPCgw7olxvQdqDjIbG2YpQI4GbTv7mzVgOb0KTuQbKFP3KReSDrAHr+8qYW+js4L7iO2HavVoX6vuFij6MiN+Uy+bBdAhlNwl2rg3y5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780845525; c=relaxed/simple;
	bh=bfMHrToJcqjgW+DnKHgtGJx3PrOXXiuYQXaob0KiPpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOigNCKI6rNMBj9ZRpG6WEDJuAsscO7SvXD1Z92XZu15qqID318IPt2ZsvH+vxUIW2n/yiK+gdQhj1TojHrOHnapOaA6nNp+eHAS51cJqBY64zLpJuSpdW+yEaznOHiCO+x9SC43iRafo3Akhl1stsl01uHBKQEWW+ezUtO93hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OCljjPMR; arc=none smtp.client-ip=91.218.175.177
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780845521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AVnDiESh+x1DRYqYZbCBHy4sUn9oEX58Cf8ALyZWHeA=;
	b=OCljjPMR00HcmFwycoRDVGRUOFTDFHigrwxTY16SBe6EuHAAoZs15ITum/JZeIKsfsP3zB
	mx1yXJ33zCaN3FIzVLvteZp3lpUeYhshgychnVh1sgnTaiRoFQxosQXM1NUNTe4PqF6jQ1
	z7mr6sL12MBLNM5IPoHByLmT4K9tjJg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@linux.dev>
Subject: [PATCH 1/3] x86/vdso: use kstrtouint() to validate vdso= boot parameter
Date: Sun,  7 Jun 2026 17:16:16 +0200
Message-ID: <20260607151614.79567-6-thorsten.blum@linux.dev>
In-Reply-To: <20260607151614.79567-5-thorsten.blum@linux.dev>
References: <20260607151614.79567-5-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=thorsten.blum@linux.dev; h=from:subject; bh=bfMHrToJcqjgW+DnKHgtGJx3PrOXXiuYQXaob0KiPpQ=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmq3R59P1+t4znM4pHxR/3O/P0nZvxZ/Wvh6/jPIT/7L R4eXjj9VkcpC4MYF4OsmCLLg1k/ZviW1lRuMonYCTOHlQlkCAMXpwBMRMKO4Z/ewnsevw0Uim1b 3PjTpc1k5p0Ilc9VUjuVOyV3DX966G2Gf5rrvt+/Yn/32cLWsPTP+oujEt62xzQ+X/iwbf21T6u luVkA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91244-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:rdunlap@infradead.org,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thorsten.blum@linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[thorsten.blum@linux.dev,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:mid,linux.dev:dkim,linux.dev:from_mime,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D74E650D65

Replace the deprecated simple_strtoul() with kstrtouint() when parsing
the vdso= boot parameter.

simple_strtoul() accepts partial input and silently converts invalid
input to 0. Use kstrtouint() for strict input validation instead and
reject malformed input. Accept only 0 and 1; warn and disable vDSO
support otherwise.

kstrtouint() converts the input string directly to an unsigned int,
avoiding an implicit conversion when assigning to vdso64_enabled.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/x86/entry/vdso/vma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
index d903bce24f15..b45549cd7acf 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -270,7 +270,11 @@ bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
 #ifdef CONFIG_X86_64
 static __init int vdso_setup(char *s)
 {
-	vdso64_enabled = simple_strtoul(s, NULL, 0);
+	if (kstrtouint(s, 0, &vdso64_enabled) || vdso64_enabled > 1) {
+		pr_warn("vdso= values other than 0 and 1 are invalid; vdso disabled\n");
+		vdso64_enabled = 0;
+	}
+
 	return 1;
 }
 __setup("vdso=", vdso_setup);

