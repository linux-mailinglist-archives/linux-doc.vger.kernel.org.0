Return-Path: <linux-doc+bounces-96629-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3r5UK2N2VWoQowAAu9opvQ
	(envelope-from <linux-doc+bounces-96629-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 01:36:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8EB74FBEC
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 01:36:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=us1bp+RP;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96629-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96629-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D8F93080248
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 23:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C4A3D666F;
	Mon, 13 Jul 2026 23:35:33 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E723B813E
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 23:35:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985732; cv=none; b=Ct5i03mFcG8QmP/a50Dqv410Cw0QygTubfbkVOXqLb4KufshGCahQHNvOkihHw0apPABiC0O5FL+16PVzHetgvYN2kN14AG6lVrPAyWwAub/P+U/UeFJqb/tJJh4hcIsAlf6qVmCkrHrupUZA+eOS7ydsIgCIpUg0DHTbZK3ygE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985732; c=relaxed/simple;
	bh=Jhyde+qVXhwYKT+jfqAojkE5MDc+zEv4Q/4BXY9Wek4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0CiGCyf5jJ+YrWrUMV75pDoYzjhu740OvoHM0U4u4H8A5qJnrsrVQflWTnKix4pzAaQMOSAe7BZ7aw69u0WkL97DVCSSU/bIsTPXDx2HOmzWemviBeocVAcuQqX3naKgaPdc2cYipjnYwCaT7XBvwzXFKu9TGrJ0ZhhetU18h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=us1bp+RP; arc=none smtp.client-ip=95.215.58.174
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783985727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PH+ap9Z9jRyHTeU0JE3+i1OoIv68/HHTxd5g9JcEcPs=;
	b=us1bp+RPkonMUZZxUUEVxKxPBLUCgn2Q4dko7zeD5Is3wP17wEYbGzutlnb+UdysOScUJd
	IvpYVdVlqDP8f0sK4aVrd5YA07PmdOEq7NSZ0fe7u+jMVKSuKFkPiwqt1FxuxxEsOMKlEx
	65Q3idmHPoUevsf0zPEDanbJ7BGNAlU=
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
Subject: [PATCH RESEND 2/3] x86/vdso: Use kstrtouint() to validate vdso32= boot parameter
Date: Tue, 14 Jul 2026 01:34:25 +0200
Message-ID: <20260713233422.127348-7-thorsten.blum@linux.dev>
In-Reply-To: <20260713233422.127348-5-thorsten.blum@linux.dev>
References: <20260713233422.127348-5-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1839; i=thorsten.blum@linux.dev; h=from:subject; bh=Jhyde+qVXhwYKT+jfqAojkE5MDc+zEv4Q/4BXY9Wek4=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmhZVzVHf2rE48VdrbOElj9hm9S1ErOSZdqP/31TJfWV zCZyhTWUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABOJtmT4H5WouPJrSt7yJXpi iUpigZtzRBoYbzr/kphtq3HjaPvJNEaGY9EP71oZy8WHv1jzb1WgYtSrvLy11r4eJtuyvT5ObZD nAgA=
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
	TAGGED_FROM(0.00)[bounces-96629-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:from_mime,linux.dev:mid,linux.dev:email,linux.dev:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F8EB74FBEC

Replace the deprecated simple_strtoul() with kstrtouint() when parsing
the vdso32= boot parameter and its X86_32 vdso= alias.

simple_strtoul() accepts partial input and silently converts invalid
input to 0. Use kstrtouint() for strict input validation instead and
reject malformed input. Accept only 0 and 1; warn and disable vDSO
support otherwise.

kstrtouint() converts the input string directly to an unsigned int,
avoiding an implicit conversion when assigning to vdso32_enabled.

Update the vdso32= handler comment to reflect the supported values.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/x86/entry/vdso/vdso32-setup.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso32-setup.c b/arch/x86/entry/vdso/vdso32-setup.c
index 8894013eea1d..5f3e548ebf19 100644
--- a/arch/x86/entry/vdso/vdso32-setup.c
+++ b/arch/x86/entry/vdso/vdso32-setup.c
@@ -30,10 +30,8 @@ unsigned int __read_mostly vdso32_enabled = VDSO_DEFAULT;
 
 static int __init vdso32_setup(char *s)
 {
-	vdso32_enabled = simple_strtoul(s, NULL, 0);
-
-	if (vdso32_enabled > 1) {
-		pr_warn("vdso32 values other than 0 and 1 are no longer allowed; vdso disabled\n");
+	if (kstrtouint(s, 0, &vdso32_enabled) || vdso32_enabled > 1) {
+		pr_warn("vdso32= values other than 0 and 1 are invalid; vdso disabled\n");
 		vdso32_enabled = 0;
 	}
 
@@ -41,9 +39,9 @@ static int __init vdso32_setup(char *s)
 }
 
 /*
- * For consistency, the argument vdso32=[012] affects the 32-bit vDSO
+ * For consistency, the argument vdso32=[01] affects the 32-bit vDSO
  * behavior on both 64-bit and 32-bit kernels.
- * On 32-bit kernels, vdso=[012] means the same thing.
+ * On 32-bit kernels, vdso=[01] means the same thing.
  */
 __setup("vdso32=", vdso32_setup);
 

