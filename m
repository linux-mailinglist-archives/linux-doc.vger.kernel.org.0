Return-Path: <linux-doc+bounces-96627-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JiuaHER2VWoMowAAu9opvQ
	(envelope-from <linux-doc+bounces-96627-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 01:35:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD4874FBDD
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 01:35:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=ARblUxDw;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96627-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96627-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E92C3034E37
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 23:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18683B83E8;
	Mon, 13 Jul 2026 23:35:29 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1286346A0D
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 23:35:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985729; cv=none; b=nf4ZyaXtvvDPC2iXHz4/zgZ8TQNZWe52XG3FWcGb+A7KuOndF4627qV0nlVbsKO/RSaGgY0DHpGF9Lx7X4fbNmRp+5+rQV7f6re9kuwLHjthF5z9uBvzPAdLDQPuDs3WmTy0DUvmjotp/a6Xyix83eWFcYC6jV8xxcm5RruEiXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985729; c=relaxed/simple;
	bh=yPVMwCLgnyNe/t3eNvupdQki5tgzzLQWgNOEymae3F0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DFCQKwEPmveWmobDDBBJlgDys+QBNSXbbZHtJhDh0BIjZ5peZ4HCvw8axwhWhdMjn3fiDQr7851JmKC0axJPDOuJEX9gwLp1uj8Nty50qhYRi4UI/GuK7JIuUcehHPFthiaUzc9Q49wQRQWUyq2NdGrq4k1f1wkjh1eoeoOPagc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ARblUxDw; arc=none smtp.client-ip=95.215.58.179
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783985725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FHVGlNEvFJn/BK7H+YlbY2UWGmJPbcmZFwEi8OkY3qI=;
	b=ARblUxDwrB6jCMBB6Njvy92ejoBMiGOoWcPghFyE1TLYjUqXkvZubmmfTrSgdyeECPgdhs
	3qrPiBw5SnbePgtVILLcnMPw73mMVP1xhMJ3pp3qNjd6cVoxXA+kMtfKXuyG63eFZJO9Vc
	YXVGHGAdN6U/doxHSjcSF9eHWjIDzqw=
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
Subject: [PATCH RESEND 0/3] x86/vdso: Improve vdso=/vdso32= boot parameter validation
Date: Tue, 14 Jul 2026 01:34:23 +0200
Message-ID: <20260713233422.127348-5-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=940; i=thorsten.blum@linux.dev; h=from:subject; bh=yPVMwCLgnyNe/t3eNvupdQki5tgzzLQWgNOEymae3F0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmhpf9+ZMda23sfcQvLzv1ixnkyQu/fzUlffv7ewvJHv IeleFJdRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzk8XqG/9m7jijs3lnk57qJ /8mBdZbTldizCuvjTYT+8pwS7KsxyWBkOJm8vOhN5OLvlz0z/rzrutn4MMBj1uP/Zdcn+Yau+Kf uyQEA
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
	TAGGED_FROM(0.00)[bounces-96627-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.dev:from_mime,linux.dev:dkim,linux.dev:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AAD4874FBDD

Replace the deprecated simple_strtoul() [1] with kstrtouint() when
parsing the vDSO boot parameters. This provides strict input validation,
rejects partial input, and warns when disabling vDSO for invalid values.

Adjust both warnings for consistency and update the documentation.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Thorsten Blum (3):
  x86/vdso: Use kstrtouint() to validate vdso= boot parameter
  x86/vdso: Use kstrtouint() to validate vdso32= boot parameter
  Documentation/arch/x86: Remove obsolete vdso32=2 compatibility note

 Documentation/admin-guide/kernel-parameters.txt |  5 +----
 arch/x86/entry/vdso/vdso32-setup.c              | 10 ++++------
 arch/x86/entry/vdso/vma.c                       |  6 +++++-
 3 files changed, 10 insertions(+), 11 deletions(-)


base-commit: 979c294509f9248fe1e7c358d582fb37dd5ca12d

