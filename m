Return-Path: <linux-doc+bounces-92090-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UqjOJrS9K2qZEAQAu9opvQ
	(envelope-from <linux-doc+bounces-92090-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 10:05:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7666779FE
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 10:05:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=wrgXHzpr;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92090-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92090-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 271463040B07
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 08:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24BA37B3F7;
	Fri, 12 Jun 2026 08:02:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F313364022;
	Fri, 12 Jun 2026 08:02:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251324; cv=none; b=Nli6cQQ7JbmZgL+yTCTII9z3mwNcqVHRS2xAr3OiBQCpIJmqoZDDmMEZPXDQrO/9bdHuqp4rQ0O6ANRivIFdCmrpUAnxT4vEemruQc5xrSFpLVr18b1HzdPXxLKzuD1M0I0Uwepdt5QChDKsDoDYQ7c25bKOHdBcty0aQZ1R6us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251324; c=relaxed/simple;
	bh=7K+SFK0rNv6JEv5dpyKf14EK1+G+pfIxfEdilNG4JAs=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=u2iqn+L2wt0OeabJcxU5twNasE3q+0xMRnXDgrkFkccFXodI6zBxMVsf3Z/FJMti9koLpPPhBbLCdYzfzF30wLjz2pCjy/ZS7ddAxaiBp0EJ5VlzVJWcFLIp4Dd2OHHZT+fKT5dMp6A4rKBWoY2KpXHczsy7oZ7Lmwfwsrq9+5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wrgXHzpr; arc=none smtp.client-ip=80.241.56.171
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gcBn103G9z9txS;
	Fri, 12 Jun 2026 10:01:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781251317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7K+SFK0rNv6JEv5dpyKf14EK1+G+pfIxfEdilNG4JAs=;
	b=wrgXHzprT1shr1tO/OmObdZlMrIZSexNBS1EbU7K49RE8HriZ0lwR/C9zHzZu9KVgu9Qb3
	T6u2dnhnBOl82eQUo4A3lKeprJFW/KiAaarKih1ZpAbpq/dCXKKZkIxsqvq8kB7gqBOQqG
	Jmrd+4v6c2Fhu030eObLX8GVBBqlyYcNlt4ETB5zSyvcYaaJnxowolJjXQZrzkTPI6Y+wA
	HSI+qjsDTBVfvaaadp74Ko8A60/vi00Y2yDQBUOjf8ski2Ygy27gYnujZGhm7AMwoXw5FB
	nG96VKLF+jQYXvaUE88fiYTWHSSX48LoxG9uapRXyq4k35tw3r+sMMbhW2Eb0A==
Message-ID: <f55eb34b92a01159e0224611296fc51fcfb5ec5d.camel@mailbox.org>
Subject: [Question] 5.posting.rst use To: or Cc:
From: Manuel Ebner <manuelebner@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  "open list:DOCUMENTATION PROCESS"	
 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"	
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Date: Fri, 12 Jun 2026 10:01:53 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: d59b68e2dddb2ec413e
X-MBO-RS-META: r5kkcr87msn8tmj6n3nm4ouacy3kp11f
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-92090-lists,linux-doc=lfdr.de];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[mailbox.org:query timed out,vger.kernel.org:query timed out];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[mailbox.org:query timed out,vger.kernel.org:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c09:e001:a7::12fc:5321:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D7666779FE

Hi,

so every time I send a mail to lists or maintainers I have to choose: To:
or Cc:. I did look for an answer in the Documentation but couldn't find
one.
I think if there is an answer then it could be added to 5.posting.rst .


Thanks
 Manuel

