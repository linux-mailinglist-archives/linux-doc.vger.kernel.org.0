Return-Path: <linux-doc+bounces-96457-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xVWWHJiBU2rebQMAu9opvQ
	(envelope-from <linux-doc+bounces-96457-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 13:59:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A374E744923
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 13:59:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ONlvmv2P;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ZQ4lJwf3;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96457-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96457-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 523E4301039E
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 11:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E719E3A4F4A;
	Sun, 12 Jul 2026 11:59:15 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A217E1ABEDE;
	Sun, 12 Jul 2026 11:59:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857555; cv=none; b=YJdGqeeb78r7HGJAW4wju1M4V0s72+3WOCPW9jyqCkshyHhVhVSwgPM3EWbyspIRq2R7XauQsBhEzJHIdieRmL0aL6sfqqmR3wFUTNNx6j8K7Q/+GMFWTPQhWM/uqH372a4LE0qs84WXkjy1SMQGVSo3c+q+frY8zoAF5wSqVJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857555; c=relaxed/simple;
	bh=5whW4ebTAMtdcD0xnANVI4vJXYikg9p3TwCT2n3c8SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wlr1bLFtQeozTPFyr/2PC93GBnlIrKI0XgrD4uGKDKG1lvDE5jDf6Z8F9URJLs9d32djijYmD9OyH95velmKz7vGaY1OqhGXNg7m0Mp/Ip33JuNQqePTTwCzAQ5+IDk94DcWRglMTgKPPhwKWtmWlPL+sz0TdhovJUyIyU/UVsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ONlvmv2P; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZQ4lJwf3; arc=none smtp.client-ip=80.241.56.152
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gykcw5bwVzKv6q;
	Sun, 12 Jul 2026 13:59:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783857552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5whW4ebTAMtdcD0xnANVI4vJXYikg9p3TwCT2n3c8SI=;
	b=ONlvmv2PllrE1zcxF16Q/Cx3oTH4paElVz3c47/gj/VDayFher5Ygh+mQh0QnanUUYcjrT
	JafeyP50073P0yZ3sirAvcyaGRJntu5RWXjvGVgxRfL8Q6eoXc0Dtq0txe/CTFevi2hW6S
	tUSpbP9QNBh7ANEoSBKZWSE7vV0uksae+PRfAYw90BM62hzJVj4j50CjFj4NqFJ22aq3Gy
	mmmwgB8vLsERAZUZnJPY0EBe+H2SU7UEG17shA/UkUHFuxjlVM42Rk5HgkSgQ7L/Lhe0Sw
	9isxB8XEXf2oRPJH3u2Z7rfMusaBbYn9HdFsDiegPYBB1U/f5+DAt9WPqhidTA==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783857551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5whW4ebTAMtdcD0xnANVI4vJXYikg9p3TwCT2n3c8SI=;
	b=ZQ4lJwf3FnSO0iD3TY7YrS7+f25LvWmNB4G/GSJkaJX6mzhpkXVtDxa49NiSmTecvTtL3/
	qn7pAfIRFwHNQcWgTxtF0hzvMpjjmHAlyeI5birUlqZzlz+eJE5iCBu3OTxKU4nwsJxms9
	ra9Xhv/bdH9LerZlBAoKtMGxZKCDxBs73N/JA+Crth6kCqEc/9NhgQ0qIApP3F2dRN6gRr
	89KSZi0DE//3R+9SqzIs6Sp2OuBroE6Y2r7BhfXOd1iXCOqMfYxAXDGi6jO8ZeTY//n414
	ug+MwtYdMojo4O0MJ1ZxunE3hP8wn3L/wAystqkjiKE6Sj44B6IOwGv/B74Grg==
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	manuelebner@mailbox.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	workflows@vger.kernel.org
Subject: Re: [Issue] maintainer-handbooks: html: list has duplicates
Date: Sun, 12 Jul 2026 13:58:59 +0200
Message-ID: <20260712115900.481835-1-manuelebner@mailbox.org>
In-Reply-To: <98a558a87a07ab641f47c66c372ee7ed0735f4f5.camel@mailbox.org>
References: <98a558a87a07ab641f47c66c372ee7ed0735f4f5.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0aa40160079857c896a
X-MBO-RS-META: dn4fq1yyari1ngof1a3ofetjo1tqf13y
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96457-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab+huawei@kernel.org,m:manuelebner@mailbox.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:workflows@vger.kernel.org,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A374E744923

There are only two patches which can cause that:

commit 8eae6da5f56c ("docs: auto-generate maintainer entry profile links")
commit bda185c30593 ("docs: maintainers_include: Only show main entry for profiles")

Therefore adding Mauro to recipients.

