Return-Path: <linux-doc+bounces-79964-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO0bJHi2umlWawIAu9opvQ
	(envelope-from <linux-doc+bounces-79964-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 15:28:08 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9772BD1DE
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 15:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 899F83017F8C
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 14:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48CF3DBD5B;
	Wed, 18 Mar 2026 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRBhFuVx"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814AC3DBD4B;
	Wed, 18 Mar 2026 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843980; cv=none; b=ia6G/zGVGdhyUlF+14htOuG2W+P6/EnR7L8dQUYU07mxlmZ6AbuomT3o5qKv5Nf4+LbFFT9IkbqfrV2MOhPzDuULZJmnC9M19z+VvYksGh5zuKkbRSkzfPz0IlWA4z72CSiAmUsbyr04XOz3WLDIqddE2beOrhAXzQE+LZFhBmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843980; c=relaxed/simple;
	bh=RQumy4FMSELMY54MZNf0xAut5yu/9aPb0LwMaYDA7pE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fkAm77j+wskt5gNyijhfMraBjGrhM/ep3sScgAfaCRydVKMSpV3swLp9K5IAV0s52BW5LY8vRy4PuEO/gACu2HuXgqXVG8k7D1ENWvf937TkMsOs38Q6s5GMMCa/N4LeSRDCmIPkNfm9D5xyNX7vMGKaVI2Wn2dobY6sdqsbUUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRBhFuVx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513F6C19424;
	Wed, 18 Mar 2026 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773843980;
	bh=RQumy4FMSELMY54MZNf0xAut5yu/9aPb0LwMaYDA7pE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YRBhFuVxn6YlbZ1BDoL9m72GLWnWUp0cIIlLqyB7hqYHI3nRX5jKeuGrQ9IbQ2PHM
	 mRj52/kZHWPxwLpZNRjUHVUIQ0O/9LXfkOeyvkPLGjM5/odmJFUSLuhNa0JVgRM51v
	 RKNLvL0ozK5csN2anc0YMKegVQbDJRARWC2GqHQNOrhm2+8MQwWZPwuXMBLVlwpcgm
	 am+I1UUOWcMBKau0+G2gfoK25WdDKKUdMcsA14+j3jJKZFIgy1J20mhC7JnNv3ffpq
	 5uiIWu0j9GhDS8vcdSU/IjMdu4MRJiKq0qU9Ef5Rqn4SsYjDNoqhWkXgnCMyoSGQVP
	 22rzpY4yTL1PQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2rqk-00000004HeZ-1oVf;
	Wed, 18 Mar 2026 15:26:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] docs: kdoc_output: fix handling of simple tables
Date: Wed, 18 Mar 2026 15:26:11 +0100
Message-ID: <d9538e3c158186ebef43923e5355b8b226d99700.1773841456.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773841456.git.mchehab+huawei@kernel.org>
References: <cover.1773841456.git.mchehab+huawei@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79964-lists,linux-doc=lfdr.de,huawei];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[self.data:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D9772BD1DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix check for simple table delimiters.

ReST simple tables use "=" instead of "-". I ended testing it with
a table modified from a complex one, using "--- --- ---", instead
of searching for a real Kernel example.

Only noticed when adding an unit test and seek for an actual
example from kernel-doc markups.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 1b54117dbe19..2bfcd356654b 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -846,14 +846,14 @@ class ManFormat(OutputFormat):
         colspec_row = None
 
         pos = []
-        for m in KernRe(r'\-+').finditer(lines[i]):
+        for m in KernRe(r'\=+').finditer(lines[i]):
             pos.append((m.start(), m.end() - 1))
 
         i += 1
         while i < len(lines):
             line = lines[i]
 
-            if KernRe(r"^\s*[\-]+[ \t\-]+$").match(line):
+            if KernRe(r"^\s*[\=]+[ \t\=]+$").match(line):
                 i += 1
                 break
 
@@ -969,7 +969,7 @@ class ManFormat(OutputFormat):
                     self.data += text
                     continue
 
-                if KernRe(r"^\-+[ \t]\-[ \t\-]+$").match(line):
+                if KernRe(r"^\=+[ \t]\=[ \t\=]+$").match(line):
                     i, text = self.simple_table(lines, i)
                     self.data += text
                     continue
-- 
2.52.0


