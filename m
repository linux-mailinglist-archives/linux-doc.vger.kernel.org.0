Return-Path: <linux-doc+bounces-79025-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEhyJ4jUsmlDQAAAu9opvQ
	(envelope-from <linux-doc+bounces-79025-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 15:58:16 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42057273CD1
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 15:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 766F031CF6DD
	for <lists+linux-doc@lfdr.de>; Thu, 12 Mar 2026 14:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F74D37B03D;
	Thu, 12 Mar 2026 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eI9EOVx5"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF7F3C7E04;
	Thu, 12 Mar 2026 14:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327301; cv=none; b=RltaCrHk4YpiLQ3KW79uH+83gHAwrw9xezE3u1hfHmS0fTYYtiYZ3ApBN8VN7Z9rFRTc+vORop/CeqG/HVoFCC80lLodfmne/DjBtQ9eCuzKIOhwWufIFDf2ofsJIpxEhHov1Z16FZxQD/MA87k4Y7sW8NCMBkmlCvRBcSW28pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327301; c=relaxed/simple;
	bh=/CHoc+FkUbZ/G/HUmmVJrEFw6CHF1JFp1pKCy84zzTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CbjuLTJiDofJNnEepBVEpzQ6rvNZ4VxUbNfy5H84u0CPJvhSQ4H6zT2UqAP4mRgREvJKA1nSHvnwKiog6YND4LBxiSe0BBFYM4vMZfZOdMJL778Axy46VVrlPgHOysxjFUQaMkV9wwlq66XSYdJnVR/1sWJUV46g8N2S/nRkQCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eI9EOVx5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70852C2BCB2;
	Thu, 12 Mar 2026 14:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773327301;
	bh=/CHoc+FkUbZ/G/HUmmVJrEFw6CHF1JFp1pKCy84zzTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eI9EOVx5zap3s1YACmRlf9VBhoFZ8KnqvxqcJZBJWJhw4zKMzRtm4Q2tnc6H3fVZV
	 fzXwNxwtew9dMa43kLkwBUrVtfTPSiO3oSe9hxkhTmmRCM8JTctzNCCjtDR+9mGwhb
	 0euvlgNzx6RCGMp0mxcdNVnve/jDWwB8mzrr9Rqcy/VUHsxP8SMhRew/oaR9H+asKL
	 lSQ2se836uNqtn0xM8EeKVwadbJ/tqKTxLV8jy/bD2Gy4Mrs99welAp4A13XhpGHHL
	 paCmLXncq1rWAJtsBcbgu3Ab1Gx7LZRgzWSNXBdL74ztRpjYXieTmTd1IWv6tCZeIt
	 yyV5NLNvlOrMA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w0hRD-00000008yCa-2piM;
	Thu, 12 Mar 2026 15:54:59 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 22/28] docs: c_lex: don't exclude an extra token
Date: Thu, 12 Mar 2026 15:54:42 +0100
Message-ID: <53ada4bea4e5e211794cc201f8e90d6ed2194055.1773326442.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773326442.git.mchehab+huawei@kernel.org>
References: <cover.1773326442.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-79025-lists,linux-doc=lfdr.de,huawei];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 42057273CD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On simple match, replace only the match and following spaces.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/c_lex.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/lib/python/kdoc/c_lex.py b/tools/lib/python/kdoc/c_lex.py
index a61f5fe88363..bc70b55f0dbe 100644
--- a/tools/lib/python/kdoc/c_lex.py
+++ b/tools/lib/python/kdoc/c_lex.py
@@ -486,6 +486,8 @@ class CMatch:
                     continue
                 else:
                     # Name only token without BEGIN/END
+                    if i > start:
+                        i -= 1
                     yield start, i
                     start = None
 
-- 
2.52.0


