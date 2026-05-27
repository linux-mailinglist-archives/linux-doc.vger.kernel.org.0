Return-Path: <linux-doc+bounces-89708-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCsNM1mjFmqBnwcAu9opvQ
	(envelope-from <linux-doc+bounces-89708-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 09:55:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6567E5E0AE4
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 09:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6005D301CFCF
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 07:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D39D3CCFCC;
	Wed, 27 May 2026 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="chTzOlaw"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10C53CD8AD
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 07:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779868502; cv=none; b=KHCzGWPkyh8H+Xd1ljAxotXfplJ+mvfFzhj/wjWrI8hvjNF2rcfGkpIPxcVprZ1yfkcJfETMZjtFJZYdaQ1qGgYTFRSTiXxqsJqEOMHndrz99WNJ0lj9aoMvVFvxP7GApxITJbPvXIjLjhhNfTF8RD51/hOyrCb+RwQWJjMggzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779868502; c=relaxed/simple;
	bh=OR5smos8oJiaURiWgzDy2/Y7pE368dndxfCk9Gx4JZU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MkrOfoTjIhCCTrQMUbMZq0HRCDsBMUqvewxJqgGQEVyHTTkVhdvxKeaHUWSsMj2yhTi4mUePWgEZx1TCn3PN5vx71vpVvu21YIjxyp9m+WiMsI3F5YrMeksPeGr/Px2H+Hycr+R+YwFxEKNA5bNtbLPwRYawCdzbMpMoVlPD5ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=chTzOlaw; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 727081A36E9;
	Wed, 27 May 2026 07:54:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46EF4601A1;
	Wed, 27 May 2026 07:54:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D59741088805F;
	Wed, 27 May 2026 09:54:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779868498; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OR5smos8oJiaURiWgzDy2/Y7pE368dndxfCk9Gx4JZU=;
	b=chTzOlawSmtPlqEOmClvdzeITUwG+nxb480dBJ+3l2z9d1LFyEuBxLm0qXwyQXGs4njbBu
	8X6PxXwbaklFswz0xhAKayScSHM0kwhCcErCbbbvC9S1O6mJZJDMvkM0sSOjlfgOji5LUj
	OSmUJTVSLTkx4OkqY2KunLT7Ry5azbnyyi4zanRMOZwL6+BqK+N650LsKK7QYIAgeBdV75
	nKDzLGBagBtx6ydzyHeTh2Iq1aQTF3QvuWBfInMITdATUqmNvt+NpvXiUn1wpPmFkaQ/jb
	elBjn8hrvt7QNl90SdTH+9p+aFhT/gF+0/kogpw8Xh7QpJr4iWxStLjSuBS7cQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,  Jonathan Corbet <corbet@lwn.net>,  Shuah
 Khan <skhan@linuxfoundation.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  linux-mtd@lists.infradead.org,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH -next] mtd: spi-nor: testing locking, fix new doc build
 warnings
In-Reply-To: <20260526172341.773398-1-rdunlap@infradead.org> (Randy Dunlap's
	message of "Tue, 26 May 2026 10:23:41 -0700")
References: <20260526172341.773398-1-rdunlap@infradead.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 27 May 2026 09:54:56 +0200
Message-ID: <87bje1l227.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TAGGED_FROM(0.00)[bounces-89708-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,infradead.org:email]
X-Rspamd-Queue-Id: 6567E5E0AE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/05/2026 at 10:23:41 -07, Randy Dunlap <rdunlap@infradead.org> wrote:

> Add a blank line to prevent documentation build warnings:
>
> Documentation/driver-api/mtd/spi-nor.rst:215: ERROR: Unexpected indentati=
on. [docutils]
> Documentation/driver-api/mtd/spi-nor.rst:216: WARNING: Block quote ends w=
ithout a blank line; unexpected unindent. [docutils]
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks!
Miqu=C3=A8l

