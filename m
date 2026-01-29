Return-Path: <linux-doc+bounces-74540-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPl/M7WBe2mvFAIAu9opvQ
	(envelope-from <linux-doc+bounces-74540-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 16:50:13 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4223EB1A0D
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 16:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED35C300F5C4
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 15:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67672218E91;
	Thu, 29 Jan 2026 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pnuUZCAZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E742032D;
	Thu, 29 Jan 2026 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769701787; cv=none; b=rqCvTWYZqDTkwHeh+/6vZHK9Lz84uvOwuNphySla+Z03fm4boECHczZa7ndmGDJaMmwUjQyHyjbU7TTMrb+j+pnBZ1yiNbwg3+icoVfLXEdWXvDATg3quPpQ3NVd2L+CXhoD+KCBzc9tc9DJj+/ki9gqeOweUNmRd2oYhDPeofM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769701787; c=relaxed/simple;
	bh=RAM6+4iBxLl4gAleeTqb7ivnTYVSUK24jCnRkiFgT2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q0kJ53TIR+uYCby2Cf1qI1tIlAue3mH2qZdYTh/+Olqx4TzMbfvl+qfzQGoShTEbzyyxf+yWxDmPEcAxe9R7RHBOIWAyPMJBfu27BCJKlZUMmnVniRd3g6Vitv+ClwbltxSHuo/E3IMmAh40Bz4MSyIJr6a0rjBTEMgxgOA6Pl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pnuUZCAZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1FBC4CEF7;
	Thu, 29 Jan 2026 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769701786;
	bh=RAM6+4iBxLl4gAleeTqb7ivnTYVSUK24jCnRkiFgT2U=;
	h=From:To:Cc:Subject:Date:From;
	b=pnuUZCAZfS/SdbN9FfqCkPmvjILqwTyiglQDwCJAokRhe2aw4GzR/VPO5FsehXQEX
	 ZG5Z5JhErdbeers6lIuswjMQWxmipwQa3DksCqweRvsUXhnlxQ8iA0d6TDILVKJauw
	 tUllcUsJiKLfMUvAhQWr2ScEXJ4hgohYH5bXnbR8o1PGKS7pqzVSm0qbhIIORccsfT
	 WP5psADgCI6WERtn3QDFmIGAlEPchunKkN9m7xz324ytcTDZpvs4irBtNFougxy6og
	 fgr1GUgMJ38Hh0ziIQ/+xgrU8+vv9C725L41tamuksrDZdwkRvM1s7LbGiHERw/Wxt
	 2gAzj7PnqvgkA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vlUHA-0000000FNCI-3Yj8;
	Thu, 29 Jan 2026 16:49:44 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 0/1] Make easier to use kernel-doc outside Kernel tree
Date: Thu, 29 Jan 2026 16:49:36 +0100
Message-ID: <cover.1769701598.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-74540-lists,linux-doc=lfdr.de,huawei];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
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
X-Rspamd-Queue-Id: 4223EB1A0D
X-Rspamd-Action: no action

Hi Jon,

This small patch comes after this series:
	https://lore.kernel.org/linux-doc/cover.1769673038.git.mchehab+huawei@kernel.org/T/#t

It is goal is to help syncing kernel-doc with QEMU, as we're using
it there as well for documentations. Yet, QEMU needs to have their
own set of function macros. This change makes easy to override it
at the caller script.

Mauro Carvalho Chehab (1):
  docs: kdoc_files: allows the caller to use a different xforms class

 tools/lib/python/kdoc/kdoc_files.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.52.0


