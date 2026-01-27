Return-Path: <linux-doc+bounces-74095-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CxZDf6PeGmarAEAu9opvQ
	(envelope-from <linux-doc+bounces-74095-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jan 2026 11:14:22 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB2492915
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jan 2026 11:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4B0730292C7
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jan 2026 10:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBAC33E35C;
	Tue, 27 Jan 2026 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGRwvzsA"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6976A2EB847;
	Tue, 27 Jan 2026 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508824; cv=none; b=fqYYR2cTactnbTpVWuxINTp1rqmuvHCbzINMtJzWPxf63yIyNGFXLKdxQ+YBN6GfgeXt9yBJLpCP5UnVA3KtNp8ZJiXg7aSt81MjOXJJToNEMKE1xWRGXVPEkgmYBIFYBLSofQFw3MQWpJvyls679YBxzyo+wgWbcZO4m6YAQE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508824; c=relaxed/simple;
	bh=ke0HGtScLJiBKD8MrGheWvUGb+iFmgWRAEg0k71Rkk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bjl9vejXF2Cxlh2jPT8D/IOPx+KdbK1NIp6fn7tkGkPy7db0OxS/9CW5HRw7WFcSNhBUpTel8pG8iOPEq0qSy+VxG3WAnltzVHQwhkiKFb1BbESrAUhGZnVWZSYTJTzNPl+rzJ4bC68Mnl64k/sXEku+ZQMoUnxoQhDjl4WDe1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGRwvzsA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4A3C2BCAF;
	Tue, 27 Jan 2026 10:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508824;
	bh=ke0HGtScLJiBKD8MrGheWvUGb+iFmgWRAEg0k71Rkk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LGRwvzsAL3UyI/I7TkM1KkLkilf2x1Xk6CJECtoyLostdlQFHpOjObU36S/YLHZrW
	 qBbyR+8oDw7Ep+0N2CEizsiQBvJKPxxUIJ0fqkQuV2fzePqCLm6NW9LvRBX+Tx8asn
	 Re+Z7PXwiLpi6aYTiPB9QEu3grnxuOhHDWtoKon+F/ncrMsmMBrH7UBlGtzt5ov1vJ
	 G0k9NirGgEP0STBCHZYk9UYN4fYiAJXNdtoWpvQwSMN0OVAqdlzinhIgGKLaFpl/jz
	 xHv2/e0cTHHJGLP4adw4NtXNNGo8Xnn4Aw3q1wLvnHSSkumDUIiuQEuG9Zykrlcyvv
	 DuX5Tya32xyxw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vkg4r-0000000BVS5-2OiP;
	Tue, 27 Jan 2026 11:13:41 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 10/14] docs: kdoc_parser: don't exclude defaults from prototype
Date: Tue, 27 Jan 2026 11:13:29 +0100
Message-ID: <3ff0619365bc401b70e9fd818b58e02337574b8b.1769508371.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769508371.git.mchehab+huawei@kernel.org>
References: <cover.1769508371.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-74095-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DDB2492915
X-Rspamd-Action: no action

If we do that, the defaults won't be parsed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 38d415778a7c..ee3a09396a78 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -210,7 +210,6 @@ var_xforms = [
     (KernRe(r"(?://.*)$"), ""),
     (KernRe(r"(?:/\*.*\*/)"), ""),
     (KernRe(r";$"), ""),
-    (KernRe(r"=.*"), ""),
 ]
 
 #
-- 
2.52.0


