Return-Path: <linux-doc+bounces-86020-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LYnHTP/+mkOVQMAu9opvQ
	(envelope-from <linux-doc+bounces-86020-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 06 May 2026 10:43:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7764D7FEB
	for <lists+linux-doc@lfdr.de>; Wed, 06 May 2026 10:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9200F303CE90
	for <lists+linux-doc@lfdr.de>; Wed,  6 May 2026 08:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23BD3E5576;
	Wed,  6 May 2026 08:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KbeZ/GIZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7593D544;
	Wed,  6 May 2026 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778056938; cv=none; b=aYozeBo82W+6Je+WArd+nP5X+qfotV7xTI+iDH6wPIW9jS8AnKMMhldJo+zPvpa9JIfbWJAb4Uhm5yUJNIJurC9BMaY+T+f5Q34k7LieykCCSuMMaJNTALKUr+SgFROxpbS8gEqO8soInZyLWzvMAleMYHhm7fDkxXYJhcMIL0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778056938; c=relaxed/simple;
	bh=TIoyrMnS4oSXlE6EAVhU+0X3JX0jXWgbNsyj86j4a9Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k6FJKmtBKoY/4VT6cYgweX88ngBMMPidDZUWKaJue1QAuKZbetwlvptQ7e4OVBqe7BPfH05SJfxN4EKrIESkt3660RUCzK/ejsUmPDseOPbRyptswSy/C5gBtD0Vip9VxnQUXlsoXhSMTlRRJRAfNJt4F/SeHsscol5mUFuFM4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KbeZ/GIZ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5B25FC5DC46;
	Wed,  6 May 2026 08:43:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B9136053C;
	Wed,  6 May 2026 08:42:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79AE8102F225A;
	Wed,  6 May 2026 10:42:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778056934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1j2OwQNIlx64QT21MfQW28rM8o9wlhGOk4TyUaj1rlY=;
	b=KbeZ/GIZRqwuNT2eZoXLP/denZ7bkA/a4/2d+eU2HPVKUPU71N8KIXF1Uttslj1QZVnfSJ
	LMTrzvFZ3rrqXIlgCbLjsOALeA02bxqPsxB29/em+WgSXwWhFI0NKAM7opZGvxHh8xkv8k
	arEK5t1hGehf5WVoRVHufFNx8/De1SbWQqsYDYT8CKRYC9WoGR3HpYFZqw1ercd3z002q9
	qoBAYmwFHp8Iohrs8VCgNJOkn24KxO7Bbzii1eGgCz0eWnI4bjKH7KWyqg4I37SMjS5L5+
	iV9ISQuNH5s6EFcXYxTubTDczqwchuSrZDqsFrF+CPM/kkSmvYRWtoogh0B1Ww==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,
  Sean Anderson <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 07/27] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
In-Reply-To: <2vxzfr4527bx.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	05 May 2026 17:40:18 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-7-833dab5e7288@bootlin.com>
	<2vxzfr4527bx.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 06 May 2026 10:42:09 +0200
Message-ID: <87zf2dlyji.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: CD7764D7FEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86020-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid]


>> +/*
>> + * These ioctls behave according to the following rules:
>> + * ->lock(): Never locks more than what is requested, ie. may lock less
>> + * ->unlock(): Never unlocks more than what is requested, ie. may unloc=
k less
>> + * -is_locked(): Checks if the region is *fully* locked, returns false =
otherwise.
>> + *               This feeback may be misleading because users may get a=
n "unlocked"
>> + *               status even though a subpart of the region is effectiv=
ely locked.
>> + */
>
> We already have some text where struct spi_nor_locking_ops is defined.
> Can we move this information there?

Ok, I will udpate the position of the comment.

Thanks,
Miqu=C3=A8l

