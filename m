Return-Path: <linux-doc+bounces-91043-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zVByMR91ImrDXgEAu9opvQ
	(envelope-from <linux-doc+bounces-91043-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 09:05:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA64645C0D
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 09:05:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=korg header.b=vT2fhohF;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91043-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91043-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF915302224F
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 06:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97566436361;
	Fri,  5 Jun 2026 06:57:15 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64812436352;
	Fri,  5 Jun 2026 06:57:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780642635; cv=none; b=iiZwShRUTwTyAIxFAOcMFfmKgqC2rJhiJ9HHvbKHELE8MXjwW8EDa/D2KgT6FnOGcEOz9IqXBk0PAK+KspzJlZNwl3krXqjrorZq/vc4IxwKkJ2CIb5CgGXt2yOrQ1W+0dpvEma+saAMMo/XR9tXS+jCvxbip4NX+MdazUkHH6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780642635; c=relaxed/simple;
	bh=+19Zsk5vOXZMyuMg7RMcM29ulngnILx4+uZ4DNkfhqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ihZNGI74Q1D4mKoB8xtPO05m/oWdODjU/WRg+sngtoOvr6CaG+yu1kl8eItCLz9x45GKJ37+iXcAZixnnb6kdNRHwkTR6j9Bbjzhr2pv6DvqYKXFYeo5TULN7aXofZurfD7moWeg9zRaZGrDcotGG0P5bWDC89d/25KHm33oC+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vT2fhohF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EAE1C2BCF4;
	Fri,  5 Jun 2026 06:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1780642634; bh=+19Zsk5vOXZMyuMg7RMcM29ulngnILx4+uZ4DNkfhqg=;
	h=From:Date:Subject:To:Cc:From;
	b=vT2fhohFphNNPru2XOOUvCyDL1p5NKcSO42ZRUJ2m+qZVdA+pKSaKJj54t+AGYBEr
	 WHqkm78f+KzD3FQa1DKcm1u1IrLtN4Tp3gUomPpUO0BusNCx9W+owBNG1fexFLjvoe
	 +xISEKsmEEyPv9WkQMbUUF4AqsFOJ59hx6x8Xvfo=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84022CD6E6B;
	Fri,  5 Jun 2026 06:57:14 +0000 (UTC)
From: Cryolitia PukNgae <cryolitia.pukngae@linux.dev>
Date: Fri, 05 Jun 2026 14:57:04 +0800
Subject: [PATCH RESEND] checkpatch: Suppress warnings when Reported-by: is
 followed by Link:
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-checkpatch-v1-1-8c68ae618513@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OOw+CMBSF/wq5szUtPhqcHGR10NEwtJerLUZK2
 kI0hP9uwdXxnHznMUIgbynAIRvB02CDdW0SYpUBGtU+iNk6ach5vudbLhgawmenIhqmC1lz1CS
 JCkiBztPdvpeyG1zKa3k+QfXzQ68bwjg3zaSxITr/WVYHsfD/BgbBBNvJWnGUivSGH/s2/YuEZ
 o3uBdU0TV89BkK0wgAAAA==
X-Change-ID: 20260401-checkpatch-b97d0cbe7ee9
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
 Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-doc@vger.kernel.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, zhanjun@uniontech.com, 
 niecheng1@uniontech.com, kernel@uniontech.com, 
 Cryolitia PukNgae <cryolitia@uniontech.com>, Petr Vorel <pvorel@suse.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780642625; l=1814;
 i=cryolitia.pukngae@linux.dev; s=20260401; h=from:subject:message-id;
 bh=c9WOjIkf6PqQcC+UWyqhsH7Lp0mHPos984XKOAN5Tdo=;
 b=wmZomkal1ceAYLxYqsR55LBmE95VujryRzX7m4nZXkxbncAL+HlNFyns9W1vugQF9VpuvsNUC
 tdG5nZGkDf6Dw3/lubNoHtBG5fuOHAJhPQlmNOcAaM9Hs2hBtq7nwCj
X-Developer-Key: i=cryolitia.pukngae@linux.dev; a=ed25519;
 pk=kF6wBkp7j9167keuk8Q9RvPgMRPuHlJztbLy0vbJ3K0=
X-Endpoint-Received: by B4 Relay for cryolitia.pukngae@linux.dev/20260401
 with auth_id=712
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91043-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[canonical.com,perches.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:apw@canonical.com,m:joe@perches.com,m:dwaipayanray1@gmail.com,m:lukas.bulwahn@gmail.com,m:akpm@linux-foundation.org,m:linux-doc@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:zhanjun@uniontech.com,m:niecheng1@uniontech.com,m:kernel@uniontech.com,m:cryolitia@uniontech.com,m:pvorel@suse.cz,m:lukasbulwahn@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cryolitia.pukngae@linux.dev,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cryolitia.pukngae@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.cz:email,vger.kernel.org:from_smtp,linux.dev:mid,linux.dev:dkim,linux.dev:from_mime,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEA64645C0D

From: Cryolitia PukNgae <cryolitia@uniontech.com>

> The tag should be followed by a Closes: tag pointing to the report,
> unless the report is not available on the web. The Link: tag can be
> used instead of Closes: if the patch fixes a part of the issue(s)
> being reported.

Accroding to Documentation/process/submitting-patches.rst , Link: is
also acceptable to followed a Reported-by:, if the patch fixes a part
of the issue(s) being reported.

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>
---
 scripts/checkpatch.pl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 0492d6afc9a1..bb452f5313b6 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3233,10 +3233,10 @@ sub process {
 			if ($sign_off =~ /^reported(?:|-and-tested)-by:$/i) {
 				if (!defined $lines[$linenr]) {
 					WARN("BAD_REPORTED_BY_LINK",
-					     "Reported-by: should be immediately followed by Closes: with a URL to the report\n" . $herecurr . "\n");
-				} elsif ($rawlines[$linenr] !~ /^closes:\s*/i) {
+					     "Reported-by: should be immediately followed by Closes: or Link: with a URL to the report\n" . $herecurr . "\n");
+				} elsif ($rawlines[$linenr] !~ /^(closes|link):\s*/i) {
 					WARN("BAD_REPORTED_BY_LINK",
-					     "Reported-by: should be immediately followed by Closes: with a URL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
+					     "Reported-by: should be immediately followed by Closes: or Link: with a URL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
 				}
 			}
 		}

---
base-commit: ddd664bbff63e09e7a7f9acae9c43605d4cf185f
change-id: 20260401-checkpatch-b97d0cbe7ee9

Best regards,
--  
Cryolitia PukNgae <cryolitia.pukngae@linux.dev>



