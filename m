Return-Path: <linux-doc+bounces-83016-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EZrLK8L2WnnlQgAu9opvQ
	(envelope-from <linux-doc+bounces-83016-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 16:39:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 208733D8BE6
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 16:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75A6B3049710
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 14:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9DE33D4122;
	Fri, 10 Apr 2026 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DX7/qhj5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1339393DE9
	for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 14:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775831569; cv=none; b=HN53Q3AP6FInxlhgukBHKyXYnKAiZaIaU3bom1IJAH0Ur9uryPqnwyGhD5Q8HGgjKy+dKi5dbj8xka2+GvfYp5k4pCfKN4aVSXE4TTQ0X8+xrSyQBKKQOVOoEBwVSAQp2w5hJQ+NPJJ64NT09cGN5rx8JTA9kl4FUuowNFrUAHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775831569; c=relaxed/simple;
	bh=EfmncohSQ9vTs+eNg3hE/EFRN2S+XXHV3AGNMCBON1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LmAZdBrxonLK8AkMVbWpo5IpkCODmoJqOdjowM00XN9aVLqGxr2JgOeVS7jRRNXvtFIy2a+3n5eLwLi5UmdQ1R0SpN6qKKV7sUDhl2hbCTgIPq9V2Lu22NEPBwxTJTpHQfMSVJ8byXDs1l1cy8sPRQOyg5aInTz55gz4ckjpLgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DX7/qhj5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=M4gQa4ik9Vqb1C
	TQI7/zREAv4Ly39hpjzHvetRkvrDc=; b=DX7/qhj59z8LlxZ0B006ilr0tOgGoW
	3RS7GI9NjYg7+bt7q5KUUEx0HWeP1DPZ0SBb9uQBAEt3K2VoF3nB2ySqr5ADt0Ta
	obu2c0Oe8jSidlNdIO27JtqFP+uG3XPBBC4KyVp14WoY903NLdu0jbywMH35YrEH
	j6APEY9tnfz9d6eSJUJbcla6MS2yVl8EXhrmhyp9C2IwzN/f9m0iE4W8ledwe6/N
	QfdXMWJ7IoxmlWL73jOgW70QTK31jcf9F2n5ZwytGdj5jYqFRD9G3eGQvvkOrYYL
	SgVnYqtyLp0V8aBU5TyMqzRhIKFcjiPTLH/Pu1p+CdZYbFRGDrx+wLbg==
Received: (qmail 1277831 invoked from network); 10 Apr 2026 16:32:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2026 16:32:41 +0200
X-UD-Smtp-Session: l3s3148p1@U+hjARxPSUFUszZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-doc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH] Documentation: seq_file: drop 2.6 reference
Date: Fri, 10 Apr 2026 16:31:25 +0200
Message-ID: <20260410143234.43610-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-83016-lists,linux-doc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid]
X-Rspamd-Queue-Id: 208733D8BE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Even kernels after 2.6 have seq-file support.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

See, somebody still reads it :)

 Documentation/filesystems/seq_file.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/seq_file.rst b/Documentation/filesystems/seq_file.rst
index 1e1713d00010..d753d8177bcb 100644
--- a/Documentation/filesystems/seq_file.rst
+++ b/Documentation/filesystems/seq_file.rst
@@ -27,7 +27,7 @@ position within the virtual file - that position is, likely as not, in the
 middle of a line of output. The kernel has traditionally had a number of
 implementations that got this wrong.
 
-The 2.6 kernel contains a set of functions (implemented by Alexander Viro)
+The kernel now contains a set of functions (implemented by Alexander Viro)
 which are designed to make it easy for virtual file creators to get it
 right.
 
-- 
2.51.0


