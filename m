Return-Path: <linux-doc+bounces-94219-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M6MBEwQRRGqXnwoAu9opvQ
	(envelope-from <linux-doc+bounces-94219-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 20:55:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 082016E7557
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 20:55:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=YHgxIvR3;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94219-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94219-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 74420302F257
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 18:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297883D9049;
	Tue, 30 Jun 2026 18:54:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4F03DC878;
	Tue, 30 Jun 2026 18:54:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782845696; cv=none; b=Ypajy8BW3+4TSSMiSYyg/uw7A/Vqp8EeBHUqk+uWl+YvbvE8qSsqNYOj88NPhZEF5l9EfQPrMNC0DLPdslHlrWaRtlOBE4yhoF9Q9igNEiRzxht+rmOGyimNMZh9ZGETDC4pm0bYMmQJTfNYeV1BQxTqLpWJHuuDPmjwWQEq3TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782845696; c=relaxed/simple;
	bh=FwNZkbJdSST8fC2ftafXVwZvCJ7fq7cSZN1CGj/QIIE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rsoIq3QnXXHnb54hX6kNhM1X0w/9xYz2JmeYGqWjBSfa2zWOlGoWr4hiZhIYzI4OjuJ0H4wtpP4MlTTYfWqW1/pAJYf+kzKCes9ZE0U0ElInEPvq1Vc3N5pfBmTusmS9q+h/DcW9PDgefI3+ryp4+40GIb+D2WhQrsgMYRGbBYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YHgxIvR3; arc=none smtp.client-ip=80.241.56.171
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gqXQ20M2xz9v04;
	Tue, 30 Jun 2026 20:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782845690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vr4HR9o4bYN/u1Xmikecvzv0kr8u0OB0yw2Vfhj17qU=;
	b=YHgxIvR3ckrJnx98eN5oTd2SluZRPvaQKPuTED3Qv4JPMCL9w+u4zGuNiFl5vyHEHnv80h
	TJviGQ+wnch5U6MjORiq/QAZ/fULi2yivlIC2alYQgra1IHELh+ISYcS0FTh2Ln6GV5mhC
	HD0gYcL/DvVuvib1Ks1DLB0WRt6lTrO3bnY+eLqP9xoTnSSyJJ3jSwXzTudYXyMHwtwxXZ
	24H6tQ8dI19qGyQqZEtaon1oRPixGNsVHRuww0I9dO3SUCFCY+1LZWvcBFZVQTi86Y2bby
	vZrS1B/4lodkJ30N6tH7RJkBK4lXDpr95WxdFbBYsBWEREdb6zcdF+HB9Pbgcg==
Message-ID: <6edf96b1cc0ead6654b23f2d2b74353cbed621f7.camel@mailbox.org>
Subject: Re: [PATCH v2 5/5] watchdog: dev: convert to kernel-doc comments
From: Manuel Ebner <manuelebner@mailbox.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	 <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, Jonathan Corbet
	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-doc@vger.kernel.org
Date: Tue, 30 Jun 2026 20:54:45 +0200
In-Reply-To: <20260529212024.2119204-6-rdunlap@infradead.org>
References: <20260529212024.2119204-1-rdunlap@infradead.org>
	 <20260529212024.2119204-6-rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: n97cy6t3qdyxsuxktwfqxt75fb9zpkay
X-MBO-RS-ID: 7fdc7aeb57fecc5718a
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94219-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:linux-kernel@vger.kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:linux-watchdog@vger.kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 082016E7557

On Fri, 2026-05-29 at 14:20 -0700, Randy Dunlap wrote:
> [...]
>=20
> @@ -659,7 +659,7 @@ __ATTRIBUTE_GROUPS(wdt);
> =C2=A0#define wdt_groups	NULL
> =C2=A0#endif
> =C2=A0
> -/*
> +/**
> =C2=A0 * watchdog_ioctl_op - call the watchdog drivers ioctl op if define=
d

Maybe this is better:
  * watchdog_ioctl_op - call the watchdog drivers ioctl operation if define=
d
=C2=A0
> [...]=C2=A0
> @@ -732,7 +732,7 @@ static ssize_t watchdog_write(struct fil
> =C2=A0	return len;
> =C2=A0}
> =C2=A0
> -/*
> +/**
> =C2=A0 * watchdog_ioctl - handle the different ioctl's for the watchdog d=
evice

I think it's plural:
  * watchdog_ioctl - handle the different ioctls for the watchdog device

> =C2=A0 * @file:	File handle to the device
> =C2=A0 * @cmd:	Watchdog command

Thanks
 Manuel

