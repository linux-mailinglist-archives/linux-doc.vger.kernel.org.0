Return-Path: <linux-doc+bounces-76054-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKmQAlC0kmmtwgEAu9opvQ
	(envelope-from <linux-doc+bounces-76054-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 16 Feb 2026 07:08:16 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6311A14110B
	for <lists+linux-doc@lfdr.de>; Mon, 16 Feb 2026 07:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF0163017C00
	for <lists+linux-doc@lfdr.de>; Mon, 16 Feb 2026 06:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1D32D949C;
	Mon, 16 Feb 2026 06:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IRU1xdvB"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AFB2ECEAC;
	Mon, 16 Feb 2026 06:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771222062; cv=none; b=DEpoSDXysKD1zxH9YdC184ata+MPE0jETUGONoYH8+w18+p6l8ZjZ3QSiLijXnTIvA8qLvpiURWzSYC35TlJs3ajTLLDHBVdu2acneQY0tcsoBaLMU9SUQatjC/YlkhcDG4WCQjVcdxZinwUCyTZZVJKSghc6D7tqCc1UsSzTMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771222062; c=relaxed/simple;
	bh=fVhqriy7oD2fxsLnildZNf0upge6DB1yH7yA+AQc7fU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NA9m0MbXEuEBe2tQQnRmJ4zO0vW1wLV6eaEb7TTsNvDZk4zz7dp+OXQwiQULef3zRxCBfYoVfmXimtrbvc78n03b9LQCVdi3+CnkIoGjV9618IccirhYk8YoHWqffSy0f48AqtBeW2yjUia5ZYRzFxqc5N6yd0yIP2VHZ2sHwtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IRU1xdvB; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=VacMt1CMOibezwUMmM/iNXVEh3MyDR4UboRRmFE4KHs=; b=IRU1xdvBrpNblyZoEtr+CZKvSF
	x9mxMESz0oGgDKiUq6Q8kJE/4dsCvliuT8WvZudBz/F1Qw7IwoYD36znkl3s0kDMP2vpWc+nr/GBC
	fOeCZehOFYH33rqDfXlYzD9hJYMSMppCodzZ/cmx2+JO8Q+44jb31VjHLmDxnQuTpjD/QqKyQC08J
	bvuxoirIsWd/6+nGlLeZZq9qF5aFzDPhDMcF30LYei5yKQahcO6h0WLb/xrWnvX5yZQgo1qIz09xW
	I504UeFDdZhzwC4IHmLhfW09VI9Jnmf45+chEslF8lyDMm0LghEEGW7iBLlOL3tpisLYHqAz/Yhox
	Si48A9DQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrrlk-000000060cd-07X9;
	Mon, 16 Feb 2026 06:07:40 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Mark Brown <broonie@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] linux-next: update maintainer info.
Date: Sun, 15 Feb 2026 22:07:39 -0800
Message-ID: <20260216060739.2791462-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-76054-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email,lwn.net:email,auug.org.au:email,infradead.org:mid,infradead.org:dkim,infradead.org:email]
X-Rspamd-Queue-Id: 6311A14110B
X-Rspamd-Action: no action

Update the MAINTAINERS file and Documentation/process/2.Process.rst
with the current linux-next maintainer information.

Translations of 2.Process.rst should also be updated.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org
Cc: linux-doc@vger.kernel.org

 Documentation/process/2.Process.rst |    2 +-
 MAINTAINERS                         |    1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

--- linux-next-20260213.orig/Documentation/process/2.Process.rst
+++ linux-next-20260213/Documentation/process/2.Process.rst
@@ -291,7 +291,7 @@ Use of the MMOTM tree is likely to be a
 there is a definite chance that it will not even compile.
 
 The primary tree for next-cycle patch merging is linux-next, maintained by
-Stephen Rothwell.  The linux-next tree is, by design, a snapshot of what
+Mark Brown.  The linux-next tree is, by design, a snapshot of what
 the mainline is expected to look like after the next merge window closes.
 Linux-next trees are announced on the linux-kernel and linux-next mailing
 lists when they are assembled; they can be downloaded from:
--- linux-next-20260213.orig/MAINTAINERS
+++ linux-next-20260213/MAINTAINERS
@@ -14749,7 +14749,6 @@ F:	Documentation/memory-barriers.txt
 F:	tools/memory-model/
 
 LINUX-NEXT TREE
-M:	Stephen Rothwell <sfr@canb.auug.org.au>
 M:	Mark Brown <broonie@kernel.org>
 L:	linux-next@vger.kernel.org
 S:	Supported

