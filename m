Return-Path: <linux-doc+bounces-96471-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BeXMKhrsU2rxgAMAu9opvQ
	(envelope-from <linux-doc+bounces-96471-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 21:33:46 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA8A745C54
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 21:33:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NRgPnzno;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96471-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96471-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F3E7300FB5B
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 19:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3443B3C11;
	Sun, 12 Jul 2026 19:33:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464402BE033;
	Sun, 12 Jul 2026 19:33:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783884816; cv=none; b=ciFV1z8ke4H9NkcZex3FUzGKHR69SOlRn/eEdkk6Mx5a5iiwvq65R4EVf+rBerVNoh3Z+nikIql2oUNQ7XVDSvksRiCKsRW8Ku1DGGpO2eSGhAGeKaYcwAPqBSy5l+TTKWbBW4HcskDf8P7QpamcMX6L9hrSPdKFww2UjetKRUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783884816; c=relaxed/simple;
	bh=QFKalSKwIi7ekI2DPNRqSKWoIx9BDEHFio9J7E9UmZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kRxgbr4kjZW+8nKKFKg/XhiqXWX81fB2NMWFNR4WucTufTxEkgiyZ7eRZ86KqbqQvCWFirqlUhRjUYjdrq7TfKgm6VSQFNtnVBTtqrClJHX/8nTyuBrC/y0+rrtNBFpBniDptZ8NakenqJ3biI6tBufeLbuxcrR8DyzO1cM9Ayo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRgPnzno; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5771F000E9;
	Sun, 12 Jul 2026 19:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783884813;
	bh=gyuURlUoCp/s/g0oxdLk+8I+A6XzSyGAveEBSGo5ERc=;
	h=From:To:Cc:Subject:Date;
	b=NRgPnzno+xayBlPZWhbhoeGIqtd1ILhKqQNSZCwwZqRjQRl/mhgZUyrRhQiUYmk/o
	 FjoTF6YWmqIJqay81Lzeq/XulBNppRP7M9b+nhKqyT/ZqvFo7Rk+JXnwLu2zjJXELZ
	 uiOANn0+6nZ48DkE7FPAYo6Mjtj14OlpKetMlRpqwUxlYfTXuN7yQ0+UDBTfw8lDLj
	 Nvit8Cj/GAqBDJcu1lq64EGcaG9Blkt/bi1Ts6gDUlbiuHOGzMAeRCcyURPz1+a9Wl
	 hYmBqkm6hC6qsNY1RYu6nV+RjlEf7D593RM4eNqx2qoTliyGCrVjG5NN6rb/C+aYxM
	 YnxG56CZRo/EQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wizvg-00000004KW0-0mv1;
	Sun, 12 Jul 2026 21:33:32 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v2 0/1] fixes for maintainers_include
Date: Sun, 12 Jul 2026 21:33:28 +0200
Message-ID: <cover.1783884625.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96471-lists,linux-doc=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:mchehab@kernel.org,m:mchehab+huawei@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:manuelebner@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BA8A745C54

Hi Jon,

This v2 replaces v1 series:
	[PATCH 0/2] A couple of fixes for maintainers_include.py

It basically fixes an issue reported by Manuel that entries
are printed duplicated.

In reality, the output maintainer entries are not properly
named per subsystem, so they appear to be duplicated.

Fixing the name output solves the issue and keeps the list
alphabetically sorted, as expected.

Mauro Carvalho Chehab (1):
  docs: maintainers_include: fix entry names

 Documentation/sphinx/maintainers_include.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.55.0


