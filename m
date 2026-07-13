Return-Path: <linux-doc+bounces-96630-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VVqwD4l2VWoWowAAu9opvQ
	(envelope-from <linux-doc+bounces-96630-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 01:36:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1AA74FBF5
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 01:36:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=edGOrYYn;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96630-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96630-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63FE730414AD
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 23:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3095D3D47A9;
	Mon, 13 Jul 2026 23:35:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A875A3B83E8;
	Mon, 13 Jul 2026 23:35:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985741; cv=none; b=RIbAEDZdwg6ajnNWt4jMubJlZrYO5Yj28AjPeVENaPMxXXV7K1/U7/Gs6SCkReKUfaX1uufIiJfc3QYQlxBb8sxw0EU7lIgWliziYIJzAakrZJg7OzFITDuLMIcAUgvguHmDKnAk9dlDu9QqRxJtZC93UE9z3XKZn+L7Qlv3pfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985741; c=relaxed/simple;
	bh=InC2Ob/G4nuEO2jCESpqrqfJ6O7kWO0SzBJV9ZyCYVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PedNsKm+2siq2MmahqOjlbbj6LXV/+wXZwIENqs4sxvkj8OjSlElUhNMRS2l/ioxA7/CYfNO0tmQeLZzIlCNTxRl7h1x94QSiINVBF2Gr/LqGVwisVWpPa+1nOGWp3iqf70xSTA0Pyo7EGGfZ26PxmDUCOX8rGo++Srhv4eQN6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=edGOrYYn; arc=none smtp.client-ip=95.215.58.177
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783985730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cIwLEttMqxETjzLJiAGOPU3xmr3RXS2AuNjyPF/Tv1U=;
	b=edGOrYYnMWbgwgHbECxFlLMU6FTFPWsUtTY7Ze78K33GY+0rKfAWpPXN697ApaA7SbhpOk
	3ArG+Hl1HH4yZMDEbYJUKrrXElttftSM8/2qJpqaZrqWMQwrnHQt0lWcWA72HGoD7E/Ebz
	S2LHg14NYgXMLiQx1cKg8e3hBrfEJvc=
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
Subject: [PATCH RESEND 3/3] Documentation/arch/x86: Remove obsolete vdso32=2 compatibility note
Date: Tue, 14 Jul 2026 01:34:26 +0200
Message-ID: <20260713233422.127348-8-thorsten.blum@linux.dev>
In-Reply-To: <20260713233422.127348-5-thorsten.blum@linux.dev>
References: <20260713233422.127348-5-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=thorsten.blum@linux.dev; h=from:subject; bh=InC2Ob/G4nuEO2jCESpqrqfJ6O7kWO0SzBJV9ZyCYVs=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmhZVxO33WF1pWyfPGRLg6L+Jgla277cWbJNT49gzybh PWGk007SlkYxLgYZMUUWR7M+jHDt7SmcpNJxE6YOaxMIEMYuDgFYCIJbxj+mR5W/KQtL6sftlrh eKbzon227aLfn5ncbjaf/MVWUHT3A0aGj8fNbRincnII8t6xPrpt78WYdYKONmvCl07k4c3prz/ GCQA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96630-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email,linux.dev:from_mime,linux.dev:mid,linux.dev:email,linux.dev:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D1AA74FBF5

Commit b0b49f2673f0 ("x86, vdso: Remove compat vdso support") removed
compat vDSO support and documented vdso32=2 as an alias for vdso32=0.

However, since commit c06989da39cd ("x86/vdso: Ensure vdso32_enabled
gets set to valid values only"), vdso32_setup() accepts only 0 and 1.

Remove the obsolete vdso32=2 compatibility note and document only the
supported values.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..8a55ec37d066 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8260,15 +8260,12 @@ Kernel parameters
 
 	vdso32=		[X86] Control the 32-bit vDSO
 			vdso32=1: enable 32-bit VDSO
-			vdso32=0 or vdso32=2: disable 32-bit VDSO
+			vdso32=0: disable 32-bit VDSO
 
 			See the help text for CONFIG_COMPAT_VDSO for more
 			details.  If CONFIG_COMPAT_VDSO is set, the default is
 			vdso32=0; otherwise, the default is vdso32=1.
 
-			For compatibility with older kernels, vdso32=2 is an
-			alias for vdso32=0.
-
 			Try vdso32=0 if you encounter an error that says:
 			dl_main: Assertion `(void *) ph->p_vaddr == _rtld_local._dl_sysinfo_dso' failed!
 

