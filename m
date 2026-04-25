Return-Path: <linux-doc+bounces-84574-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OF5FDrT7GnEcwAAu9opvQ
	(envelope-from <linux-doc+bounces-84574-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 25 Apr 2026 16:44:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B80466A07
	for <lists+linux-doc@lfdr.de>; Sat, 25 Apr 2026 16:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E144F300B9F5
	for <lists+linux-doc@lfdr.de>; Sat, 25 Apr 2026 14:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4158B35F5FB;
	Sat, 25 Apr 2026 14:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="iTHgw08s"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6191F35A397;
	Sat, 25 Apr 2026 14:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777128245; cv=none; b=kXIdWfLiCRTarGzPPk0JWUnJkrN/hg9t9uOmf4TjLE3Qbe4Fuy8lrD7Llqs7K4pGfo2trsey1lehLWVEMuGAEZ46634c2Hhd66/B6FyD/xmUXX3ypHHyQhdAQRYLTMlPE8DAI1oHJqPoIA+A6gXRF0GAbCAym3UwJrOI6+QOl6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777128245; c=relaxed/simple;
	bh=XxpyuH34L/g6jFDYrU7ONEJXOQhqQEH8WufEiSeHD2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q/x4d5mSzMfzT2eNIUy5BL0fG7k/a9bqAZZRxCN9WdXBA9vyvh18MXOQDP8DjXE+20wVlDr79j8UvgFG/o1IBkkq2KxLkLYLJxaGosdry6kEWFDuNURFXMHpEhHdZ2038Hol5fmSkg+ebsl+8lTw4UWWbrKnh+e37mc0Bg6ft1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=iTHgw08s; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=1w
	4loge87pESWbWbdSL3qELjprlRSOEQ/QtZ6iGpfiA=; b=iTHgw08stS6O1mORYF
	iBFjc3rpAxiJJVxqHn5rN0Mxki2nC0jJeAZaAeibk4TsB8eDNWMmpiODtkQNIPc9
	0PYz0mo2PSdxYhO0hVbpQUwODBXBKt32CB3VaQ61ud9UyC/XwDy3gByzZIUfqNtS
	8Ggcs99pP2OhM9G8hT7S5RJCM=
Received: from zhang.. (unknown [])
	by gzsmtp3 (Coremail) with UTF8SMTPSA id M88vCgD33wn4z+xpU1T5AQ--.33097S4;
	Sat, 25 Apr 2026 22:30:18 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: Jan Kara <jack@suse.cz>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ziran Zhang <zhangcoder@yeah.net>
Subject: [PATCH] docs: isofs: replace dead ECMA-119 FTP link
Date: Sat, 25 Apr 2026 22:29:43 +0800
Message-ID: <20260425142943.6809-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD33wn4z+xpU1T5AQ--.33097S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF45uF4DXrW5CrWDuw4xCrg_yoWDZrX_ur
	yfXFsYvrsFyrWIqa1kCF45uF1fu3yfKa1Fvw1kAr15A342yrWkGFykJ34Yv3yrXr4xury3
	Aa95WrsIyFsrJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUZa93UUUUU==
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiIBzIiWnsz-zF0AAA3e
X-Rspamd-Queue-Id: 14B80466A07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[yeah.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[yeah.net:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,vger.kernel.org,yeah.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84574-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhangcoder@yeah.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[yeah.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_WP_URI(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[yeah.net];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,y-adagio.com:url,yeah.net:email,yeah.net:dkim,yeah.net:mid,ecma-international.org:url]

The original link is no longer valid. Replace it with the official
PDF of the 2nd edition. The new link points to the exact 2nd edition
that the existing comment in isofs.rst refers to.

Signed-off-by: Ziran Zhang <zhangcoder@yeah.net>
---
 Documentation/filesystems/isofs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/isofs.rst b/Documentation/filesystems/isofs.rst
index 08fd46909..2a30999b0 100644
--- a/Documentation/filesystems/isofs.rst
+++ b/Documentation/filesystems/isofs.rst
@@ -57,7 +57,7 @@ Mount options unique to the isofs filesystem.
 Recommended documents about ISO 9660 standard are located at:
 
 - http://www.y-adagio.com/
-- ftp://ftp.ecma.ch/ecma-st/Ecma-119.pdf
+- https://ecma-international.org/wp-content/uploads/ECMA-119_2nd_edition_december_1987.pdf
 
 Quoting from the PDF "This 2nd Edition of Standard ECMA-119 is technically
 identical with ISO 9660.", so it is a valid and gratis substitute of the
-- 
2.43.0


