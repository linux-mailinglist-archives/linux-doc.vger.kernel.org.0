Return-Path: <linux-doc+bounces-93809-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xU+KCC+TP2qGUgkAu9opvQ
	(envelope-from <linux-doc+bounces-93809-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 11:09:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF9B6D1872
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 11:09:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=LZfLlsau;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=jWKvmbTb;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93809-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93809-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 281F6302418A
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 09:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B3435DA40;
	Sat, 27 Jun 2026 09:08:58 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1643B81ACD;
	Sat, 27 Jun 2026 09:08:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782551338; cv=none; b=e6E61cX8ZFPFVfcB4pR72TP2bWhNDIIsrHdaGY9ZJNgPffVjuzxy5tUOlvZNgxasfWTt1/cfmrIdy605ATdyRppV77MwPIKDo6SbMPVJIrLPQj4umjggFGBy6BGOYyTTa/vGtuHnTaKOfJJX9xbnD3A/AGrPrUGi8UGYMPISuds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782551338; c=relaxed/simple;
	bh=IAiTq5vQRKdRUcJS9OWfQSm8Xuq84AwPxoZsWsY5clk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QfWwpFMghzUW65giBPFPhhOuTCQaZt9/BrRuzXtH1MXlUBIlacXBVK3RpGA+VPnvNIAkukeUDfZgsJm2n6Osvnccpo1D31Lw4WoqiqNwOERin0MxsqyGuHOhxf5Xd6dR/SCsoQTW6edRQ4GPZsN++1bjGlu8B3/ziBgSER4eOYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LZfLlsau; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jWKvmbTb; arc=none smtp.client-ip=80.241.56.172
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gnRYC4g76z9tvB;
	Sat, 27 Jun 2026 11:08:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782551327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/y7B5JvdYRXwDHLgBnHY1/dWi4rAUck+xQmzYFmTSFI=;
	b=LZfLlsauISaGcxnntIUN8iSooJpm5i0GyBEjXc3/eVaXjDxS09PriYhLBkKdJQeyBqaJYc
	NpD5PMzitsNiGb5tCQTXs+64vRTSIBGkOO8B6mSEszYPBaos0vha7EDefMoCVllhyGacit
	BIIxz2tNCgO/WFOMVnW49N8zPghVfwxAqWBnd7GoDIDXjumyA7mW9UgJuXbab3rsrCQOlm
	RjTzktOphChMcCHkO+rfa1WKUBVMnbYUhry7hsC044dvenlobpvP4obNS6TL6S0HPL+o0M
	rlB1c63hsCFSXkcHb7NiEgpl06ETYIBGDDi7NYyLIKGYYDbLjR7kyLqXdQyoVQ==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782551326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/y7B5JvdYRXwDHLgBnHY1/dWi4rAUck+xQmzYFmTSFI=;
	b=jWKvmbTb9HAsKagyJc0Diw7XPpPgVzPXhnBbQzYlR1wragAK5tT/6bEXuTGkN5aJ67Jgqc
	KEm9CFpv9PAPjiDWhAk2DDtL2dkrTfxWuagMbjP1qqjhlEWnfZHSKsC1bt0TbOtbfKBsQV
	STO8JwiltdoOpbLbQdL3RZ7dkGag/U8j5HfI3Q4xc7YxvRLbDp/iJNjjnCwqeWoIvcjGPv
	WngJsXrWAn2tsLd8fg/wxIJTSxi3fFvIlbXBrSK5e3TzDuCRmEmmLpvDILoPt3KRw/9dM4
	XHfdWowvUh1W43bO2dORAZDI7ulUED1rAHNWKAwIskyyNwcT9CdI29QzBuDesQ==
To: "Paul E . McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	Kees Cook <kees@kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] Documentation: RCU: adopt new coding style of type-aware kmalloc-family - part 2/2
Date: Sat, 27 Jun 2026 11:06:06 +0200
Message-ID: <20260627090605.28955-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: toms16ezruedieimsoq8tumxnnaxn4th
X-MBO-RS-ID: a345aeb498d2b7c5200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93809-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:boqun@kernel.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kees@kernel.org,m:manuelebner@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,lwn.net,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,mailbox.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FF9B6D1872

Update Documentation/RCU/* to reflect new type-aware kmalloc-family
as suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj()
and family")

p = kmalloc(...);
 -> p = kmalloc_obj(...);

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
A similar patch sent by me has been applied. Back then I wasn't familiar
enough to convert all *alloc(*. That's why this is " - part 2/2".
Part 1: f61bf5fdf77d ("Documentation: RCU: adopt new coding style of
                       type-aware kmalloc-family")
---
 Documentation/RCU/rcu_dereference.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/RCU/rcu_dereference.rst b/Documentation/RCU/rcu_dereference.rst
index 2524dcdadde2..5bc3785ebfc2 100644
--- a/Documentation/RCU/rcu_dereference.rst
+++ b/Documentation/RCU/rcu_dereference.rst
@@ -236,7 +236,7 @@ precautions.  To see this, consider the following code fragment::
 	{
 		struct foo *p;
 
-		p = kmalloc(...);
+		p = kmalloc_obj(*p);
 		if (p == NULL)
 			deal_with_it();
 		p->a = 42;  /* Each field in its own cache line. */
@@ -293,7 +293,7 @@ Then one approach is to use locking, for example, as follows::
 	{
 		struct foo *p;
 
-		p = kmalloc(...);
+		p = kmalloc_obj(*p);
 		if (p == NULL)
 			deal_with_it();
 		spin_lock(&p->lock);
-- 
2.54.0


