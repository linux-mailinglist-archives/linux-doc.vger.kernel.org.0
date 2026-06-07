Return-Path: <linux-doc+bounces-91247-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CN7OOu2LJWpwJAIAu9opvQ
	(envelope-from <linux-doc+bounces-91247-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 07 Jun 2026 17:19:09 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5715A650D72
	for <lists+linux-doc@lfdr.de>; Sun, 07 Jun 2026 17:19:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=nczgX5s1;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91247-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91247-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C4E3300DD60
	for <lists+linux-doc@lfdr.de>; Sun,  7 Jun 2026 15:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4461EB5C2;
	Sun,  7 Jun 2026 15:18:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29C227F72C
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 15:18:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780845536; cv=none; b=T2M+mR46SlJyofsaUF+vY5B0Bai1v51YVU8AfT4XFUoMblNl7H7vz7c85Ge+WLw97YwlAmXB58fgyxM7VHnyEtkbPY502bF3gxaem19joG4+FRyfzMUYANpMihRHsKwEIgispmLN+zQplhJ7xXqc+nLo6KjMAid+9tbaEg9pzqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780845536; c=relaxed/simple;
	bh=OYMwu3Fju+f/m8eswGA1SlTLZA0MB/ymEEvGRmV1vKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jGUZ9ph/YVd1ww9D+CKaw3ypChZ7ftq2PoFVuuItC55L+ZVFUla/vvXhBlk4TrDJnNvzj/D+8Z3EONyp4eZ6j39vEC+GhKHE/f4T2tnPTzMMRUVwXzIMlrlCrZqsAyx2BsMyVeh4ukEfkox5TdO9Wpif7YpKFuoF3pH0SqSj0Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nczgX5s1; arc=none smtp.client-ip=91.218.175.181
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780845520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xy4T/MjM8NbUD4tvmpx+3DPpHKif/NUp83oSBCJIiAQ=;
	b=nczgX5s1EZl14V4LvE45s0Wz85Rp8H70CYVEA+EFc0309GjcT9oZmxByq9o1QX64ob8A4q
	U3uoz4Yew0osY8mgg8Dh1KRGGxTqTRAk1ff28390xbFOG+4Ey1BtprT+RUnDvIe+kQaTeH
	dgDGPK5dzaVxAOaNlvbXmoMpCRzGtCY=
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
Subject: [PATCH 0/3] x86/vdso: improve vdso=/vdso32= boot parameter validation
Date: Sun,  7 Jun 2026 17:16:15 +0200
Message-ID: <20260607151614.79567-5-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=940; i=thorsten.blum@linux.dev; h=from:subject; bh=OYMwu3Fju+f/m8eswGA1SlTLZA0MB/ymEEvGRmV1vKk=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmq3XZXXT1rMt+vq+44IH29pihlnmmhZ6WFnIHQtphz+ nfYjn7oKGVhEONikBVTZHkw68cM39Kayk0mETth5rAygQxh4OIUgImU+DD89ymQadGam8dx6E6+ s2A6o+qqm81P5nsEf9twx/r2idxbMowM5zX3yxvc4vu8wHLXq68v3ZhfH91ov+68250rtzxWfJ3 SwwAA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91247-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:from_mime,linux.dev:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5715A650D72

Replace the deprecated simple_strtoul() [1] with kstrtouint() when
parsing the vDSO boot parameters. This provides strict input validation,
rejects partial input, and warns when disabling vDSO for invalid values.

Adjust both warnings for consistency and update the documentation.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Thorsten Blum (3):
  x86/vdso: use kstrtouint() to validate vdso= boot parameter
  x86/vdso: use kstrtouint() to validate vdso32= boot parameter
  Documentation/arch/x86: remove obsolete vdso32=2 compatibility note

 Documentation/admin-guide/kernel-parameters.txt |  5 +----
 arch/x86/entry/vdso/vdso32-setup.c              | 10 ++++------
 arch/x86/entry/vdso/vma.c                       |  6 +++++-
 3 files changed, 10 insertions(+), 11 deletions(-)


base-commit: 979c294509f9248fe1e7c358d582fb37dd5ca12d

