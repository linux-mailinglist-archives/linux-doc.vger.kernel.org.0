Return-Path: <linux-doc+bounces-74086-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wORhNeGQeGmirAEAu9opvQ
	(envelope-from <linux-doc+bounces-74086-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jan 2026 11:18:09 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C5D929EE
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jan 2026 11:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DB773069006
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jan 2026 10:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A48F33BBCF;
	Tue, 27 Jan 2026 10:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLSMyY3Q"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEC02ECE9B;
	Tue, 27 Jan 2026 10:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508821; cv=none; b=dSHOb4lGHT4yhIyGRB+Kxm4NXdyY+abQCyhOtq0nGvW3gciY+m+x0MzbcR8Vz4gPzHBwBalf0AGPglCGCazplD4/bK4F70rkGsyocpKZRsRDBhwlH7BG1xgs005vlD6bmXystbvjdKTwa0/5Nz83IgwGLvbGFOZayfiOZ5/PRtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508821; c=relaxed/simple;
	bh=vKb19cG6OgBr5ql7sUWNlT1BfFB8/8ARacrIsLZ926E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qfo4K7VNmYt8maVCuaJ1AMV6nL9TTYBlOoHRArnnbdpeQ4XfcQdegiwrMItq4AsN4XZSlXyn3SW4K+S6GSyBMGMaT+AcSvPFnp7uhREJUInqyZdWyldAT3xUxOl/QLT1YmM5mdQ56YB+OLNuLGoKIjfq/h1U+5vnrj2mobarGqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLSMyY3Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5700C19425;
	Tue, 27 Jan 2026 10:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508820;
	bh=vKb19cG6OgBr5ql7sUWNlT1BfFB8/8ARacrIsLZ926E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hLSMyY3QjgHB4OQam4WZOn0JRpONPcIHuHbZiG2Hj2B1lljB+wi1u1Q8eEBZXueVr
	 S8KcaCWPXtpwcBGZUHdT2wzihpTbRep4oMiI8idRQhjFw6pCpE14TE3WCDfO6d7P1s
	 n3QaD0z5pgCrsSxU6+UUsjv2b9qfQj/ffVIbbCbQeZgL8Y9XTf8wpsvJvF+wn5C6jh
	 pu0rt8U3NHizC2dH+GW15jj8tAHVlfZlfupXffIHKsxR5R1m+pRsx8dCcibi7PlhtW
	 GuTduo7QjFlUor8r7BSCtHsMq2KELLFgImsLldpjv4TA1b0hJy5HfCxrE2WntKnwzw
	 9aLolQRkS8y2A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vkg4o-0000000BVIa-3x21;
	Tue, 27 Jan 2026 11:13:38 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 02/14] docs: kdoc_re: don't go past the end of a line
Date: Tue, 27 Jan 2026 11:13:21 +0100
Message-ID: <f76d9b4be627850c1024d726d0b73629c81f1d3b.1769508371.git.mchehab+huawei@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-74086-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 71C5D929EE
X-Rspamd-Action: no action

The logic which checks if the line ends with ";" is currently
broken: it may try to read past the buffer.

Fix it by checking before trying to access line[pos].

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 tools/lib/python/kdoc/kdoc_re.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_re.py b/tools/lib/python/kdoc/kdoc_re.py
index 78322bbf29e4..3c759199ccf0 100644
--- a/tools/lib/python/kdoc/kdoc_re.py
+++ b/tools/lib/python/kdoc/kdoc_re.py
@@ -261,7 +261,7 @@ class NestedMatch:
             out += new_sub
 
             # Drop end ';' if any
-            if line[pos] == ';':
+            if pos < len(line) and line[pos] == ';':
                 pos += 1
 
             cur_pos = pos
-- 
2.52.0


