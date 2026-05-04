Return-Path: <linux-doc+bounces-85673-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBweI4rA+Gnh0AIAu9opvQ
	(envelope-from <linux-doc+bounces-85673-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 17:51:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0691B4C0E70
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 17:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1168A301704C
	for <lists+linux-doc@lfdr.de>; Mon,  4 May 2026 15:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C50F3E0C55;
	Mon,  4 May 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPWw4xHl"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE8A3DF019;
	Mon,  4 May 2026 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909888; cv=none; b=Ug8fWk3lqccTC39y4+j0bMz08DZZUk/ACxK7b7Wl9piqqMaab+ye5HqHBAJtG74bmqXtYimHe8JycucZlFiD59uiuIj3HnFpczjwC0rpleb8IWEwBWvHtJhOiBPeVZbYBgFNz3HA4H8hw+DkPoKsggNtQod1nr1omTv8i0YAbvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909888; c=relaxed/simple;
	bh=SZ479FGDm0wvtVJRY64Rny25k4jq7VQuvT+6JysK1C4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DDAVpsUa7GmEZv9ajBvXBntmtuAArMGBLweartChBUxMn3CyyKWscXhUjITuiErrcatwAbsH2G0RW5dQ19PpBz0duUnwz4KRItPrqBHpUx7HjuKJUOcFvpFcRBx1ik2pf70F4N5xY1bIgCoBzJHQ919Q0jQ5TWdQwx21vIk13Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPWw4xHl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5435C2BCFB;
	Mon,  4 May 2026 15:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777909888;
	bh=SZ479FGDm0wvtVJRY64Rny25k4jq7VQuvT+6JysK1C4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CPWw4xHlyVHyf22fcgjAnzXoTuO121JrQb28FFtkr343yuZZhOuJbaHzFiODOPqkW
	 IkRo3lYOAUS8FjhHtb0WrMtA+YTyJFgEJx3cXVpSShEONWl+8uimHmYs7EqVVToHHi
	 K2n52JTtlTmkeRvnTQDfa+YB95nmVeqCVHWNfnu8JSXI70631AsYQ4pB+fycDDrgLP
	 tc+tlyoy00Bi1XVOTibdIW7qg4QQmzbWpqqlr2JeT62KnnxDiaygBlQc/uz92F8Ylo
	 PdUBhP2FCoyBMg7Ti7Eys1lYrhgVvX46ZpBAEEXEmvjJrXyDOTOWav036KCrc6iFXm
	 apJ1m4J73Rblw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wJvZu-0000000Ey6j-3CkK;
	Mon, 04 May 2026 17:51:26 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Joe Perches <joe@perches.com>,
	Matteo Croce <technoboy85@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Matteo Croce <teknoraver@meta.com>
Subject: [PATCH 2/9] docs: escape ** glob pattern in MAINTAINERS descriptions
Date: Mon,  4 May 2026 17:51:11 +0200
Message-ID: <31f673089e2a83dc1fee17d47784579874476ca5.1777908711.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777908711.git.mchehab+huawei@kernel.org>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: 0691B4C0E70
X-Rspamd-Action: no action
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
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux-foundation.org,perches.com,gmail.com,linuxfoundation.org,meta.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-85673-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Matteo Croce <teknoraver@meta.com>

Escape '**' in the MAINTAINERS descriptions section to prevent
reStructuredText from interpreting it as bold/strong inline markup,
which causes a warning when running 'make htmldocs'.

Fixes: 420849332f9f ("get_maintainer: add ** glob pattern support")
Signed-off-by: Matteo Croce <teknoraver@meta.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index c7f9911ae45b..e679acf0633d 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -127,7 +127,8 @@ class MaintainersParser:
             output = None
             if descriptions:
                 # Escape the escapes in preformatted text.
-                output = "| %s" % (line.replace("\\", "\\\\"))
+                output = "| %s" % (line.replace("\\", "\\\\")
+                                        .replace("**", "\\**"))
                 # Look for and record field letter to field name mappings:
                 #   R: Designated *reviewer*: FullName <address@domain>
                 m = re.search(r"\s(\S):\s", line)
-- 
2.54.0


