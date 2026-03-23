Return-Path: <linux-doc+bounces-80624-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F4sE4kEwWlUPgQAu9opvQ
	(envelope-from <linux-doc+bounces-80624-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 10:14:49 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE7D2EECE9
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 10:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16756303B5F9
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 09:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2358B386541;
	Mon, 23 Mar 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lw6Jvsy9"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C2438644F;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257059; cv=none; b=gW1YmF27QG2fYiw21k5xHFV9M9vcg/ngiCwSWqPryBmbmojg3GgETQsRmVU11OZeIVSOXSLyzkJN9XbLSjdPUrJRuhuUpBpcBZhiEUl6g6TDvcJbL6yjBKMvkps4l1FAACIUeF0d1tL/EaDspWLY6RLtVfgOBBKmaPBkWHd8/Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257059; c=relaxed/simple;
	bh=aqYdN+DcUv3ujKrgqqFAwZYM7QbeYhyVHwsYgAW9BR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DA6z9gCKmvG2sJwbdq/HbJvitw4dwJAey3R+S8X9ZkXH48sYMUbmNwAwHPIDivo69NTwD9htNavYTn2eu+MBGs8rS0TgL0aIjKfDLpxuqHr+Va/XF2YHq8v3XtBtE4v5aVMW3GBztPE+5V5mJxJurRftke+rUATzEfkCR92yKXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lw6Jvsy9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93DEC2BCB0;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774257058;
	bh=aqYdN+DcUv3ujKrgqqFAwZYM7QbeYhyVHwsYgAW9BR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lw6Jvsy9BhRr9YbH1YGe78gBsCnA6tGi5cWGpAMuSUMu0U4n2ggsFd+0bws3m8FDR
	 ve8XzuDjZnML8yu6YdbRSF9SE3w5QgG8JCKcIpT73oFNBbBXE3RFPTXibkZGkVHN7Z
	 59uY9FN+anYgGjOCzWpDnK8tv4xV2uLvg5Yericx06TaEGJJy44qJaQoygNIKbRNB6
	 2lytEY6cR49KZMdZXGJDHpx5gZBE4qmjjGjRS15ZcCwjfrX+xBxO/q5dKimKxS+8Op
	 AMXbP3YPcYFIV1iCe5zYruU0a+36cGJVcb1jgLJ6xIlw4Dx6lzr532wBGGZG0W7Zzi
	 PbIthqgVZsinA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w4bJI-00000002yWI-1bpu;
	Mon, 23 Mar 2026 10:10:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 01/10] MAINTAINERS: update documentation scripts to add unittests
Date: Mon, 23 Mar 2026 10:10:44 +0100
Message-ID: <6be396b8423372dd006484351ca2dbc54220587e.1774256269.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774256269.git.mchehab+huawei@kernel.org>
References: <cover.1774256269.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-80624-lists,linux-doc=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.105.105.114:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vaga.pv.it:email]
X-Rspamd-Queue-Id: BDE7D2EECE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ensure that we'll receive e-mails for attempts to touch
tools/unittests.

While here, place entries alphabetically sorted.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c05a72245049..f0b106a4dd96 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7679,8 +7679,9 @@ M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-doc@vger.kernel.org
 S:	Maintained
 F:	Documentation/sphinx/
-F:	tools/lib/python/*
 F:	tools/docs/
+F:	tools/lib/python/*
+F:	tools/unittests/*
 
 DOCUMENTATION/ITALIAN
 M:	Federico Vaga <federico.vaga@vaga.pv.it>
-- 
2.53.0


