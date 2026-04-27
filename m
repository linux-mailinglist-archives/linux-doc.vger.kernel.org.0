Return-Path: <linux-doc+bounces-84772-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKLXL0hx72n6BQEAu9opvQ
	(envelope-from <linux-doc+bounces-84772-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 16:23:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4DC47443B
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 16:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD11F30164AB
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 14:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5843D3D1D;
	Mon, 27 Apr 2026 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g63i3v69"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73773D3CEE;
	Mon, 27 Apr 2026 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299755; cv=none; b=qIdUn+eyJ/wEEUHr+RSUllXcB/n3jwDeVAfBNnhjxKccyAFdSPN1CyeGv26+f4OWMBv+CcIUPDkyUNtn0GhBGGjcArvj56NBUrR/Qr4C5BUCC3bFVw/SOFkHEpkG+t/IjgVr4meb1maZ/uXZKc08j6OWZYePxH1c2P7ObxEWJNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299755; c=relaxed/simple;
	bh=oCSFDjePyMaj2tf0ATqd8TtAxNzPuU0qXsi2GNKPtg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GQcMDcONBqj5IhD8tP7AmLey8A2vc+GkvRHDxEX07scZi6yK5Sp6PP8kWgSlzJcddZmy82FJD98iSgtpHkhThLplgDMjX7ZsJFLihmko8D8sEzF1iML0UjuGgaghjGtN4JaR9RkcOb3tqYrm5/MDSCmPAE9FZ3pSLgYuXg066Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g63i3v69; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7540AC19425;
	Mon, 27 Apr 2026 14:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299755;
	bh=oCSFDjePyMaj2tf0ATqd8TtAxNzPuU0qXsi2GNKPtg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g63i3v69KbfKbKetN4/ng4W39CIC+KAcr2DVio5NMr0E4SOYq9KFSx6bxPcZXi/dm
	 eu3upyCETiw70SWV0kJsDEGoc1xqBhfbEnbCbhbKHYFKEQX2oHwU+U5x1qul9KM1+I
	 9Km8AIqYJHLu7LLFoaFgv1aqzUhraX8hzDVOxGWmiAq/tPxGkBRdM8jX6qqTmKBRAj
	 eX0LcvhKbRkyUCkDyPkIl7VjT4rgxvDBbJ4ktlNsaM5/LLeEmSaMxhuOjmIKY1gVHK
	 Cz3UqTfIuTrn7Tz4VC6/YN3zuhVn1lNAc58kVAdgPO5eM9DIhzJxWSOWWSbQqzIq3G
	 04gotTEtDGwWg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr3-0000000C8Q5-2cjW;
	Mon, 27 Apr 2026 16:22:33 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v4 01/10] docs: maintainers: add SPDX license to the file
Date: Mon, 27 Apr 2026 16:22:19 +0200
Message-ID: <d27d60d72c7b2a07535d612444dc1024366ed5d0.1777295258.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777295258.git.mchehab+huawei@kernel.org>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: 5A4DC47443B
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
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84772-lists,linux-doc=lfdr.de,huawei];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

While this file is really trivial, add a SPDX license line on it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/process/maintainers.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/process/maintainers.rst b/Documentation/process/maintainers.rst
index 6174cfb4138f..5d1b1464c3ae 100644
--- a/Documentation/process/maintainers.rst
+++ b/Documentation/process/maintainers.rst
@@ -1 +1,3 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 .. maintainers-include::
-- 
2.53.0


