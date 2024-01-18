Return-Path: <linux-doc+bounces-7049-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D884F8321C3
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jan 2024 23:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92389284783
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jan 2024 22:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1FD1DDC5;
	Thu, 18 Jan 2024 22:57:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0071D68B
	for <linux-doc@vger.kernel.org>; Thu, 18 Jan 2024 22:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.85.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705618642; cv=none; b=b8bYukTW43c3I4RsWFDeOSxVmmTwlXLp7CdsfzsIIrgGOlvu0lXC+I0cFxOegwymzlLpCkdicyOevWxTm6h5pj4hpOFxqveqmdc4kqXVELpbSl7TnF3vjT76X95ICxdKKUutIUiT3Z2rYawGc8HI6h+/ZOJbOr00DkJryv8SjR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705618642; c=relaxed/simple;
	bh=ePoebnA7cF9X5WjbtdpG44r2FPognLgyvewUM1ypAQ0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=ZAO/R5l66azVbHvxibo5hX1t0Ht4/46XZNhtQ4X1Y7i+ZQtwPCIUQU/xHluKvlqk4eHsfuDEaeaho24yM9wwtARkOsauwVMwYVGpRULMsQuVScXZfGBVpFb10rVo5likoUJFapOTY95rYhEC/NkLydRhcJ2dkP+iOUJFg9E5WbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.85.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mtapsc-8-UQGpYoAbOK6t9xx-prymvA-1; Thu, 18 Jan 2024 22:57:16 +0000
X-MC-Unique: UQGpYoAbOK6t9xx-prymvA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 18 Jan
 2024 22:56:59 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 18 Jan 2024 22:56:59 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Sreenath Vijayan' <sreenath.vijayan@sony.com>,
	"john.ogness@linutronix.de" <john.ogness@linutronix.de>, "corbet@lwn.net"
	<corbet@lwn.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"jirislaby@kernel.org" <jirislaby@kernel.org>, "rdunlap@infradead.org"
	<rdunlap@infradead.org>, "pmladek@suse.com" <pmladek@suse.com>
CC: "rostedt@goodmis.org" <rostedt@goodmis.org>, "senozhatsky@chromium.org"
	<senozhatsky@chromium.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "taichi.shimoyashiki@sony.com"
	<taichi.shimoyashiki@sony.com>, "daniel.palmer@sony.com"
	<daniel.palmer@sony.com>, "anandakumar.balasubramaniam@sony.com"
	<anandakumar.balasubramaniam@sony.com>
Subject: RE: [PATCH v3 2/2] tty/sysrq: Dump printk ring buffer messages via
 sysrq
Thread-Topic: [PATCH v3 2/2] tty/sysrq: Dump printk ring buffer messages via
 sysrq
Thread-Index: AQHaSTdPmE3VCTcFQ06mN/ozLchFlLDgL+Yw
Date: Thu, 18 Jan 2024 22:56:59 +0000
Message-ID: <57f8c1f40ccc4a4f9d29e97f50a36b4f@AcuMS.aculab.com>
References: <cover.1705331453.git.sreenath.vijayan@sony.com>
 <57daf43c5270f7532b269b9f0e90d126ca012354.1705331453.git.sreenath.vijayan@sony.com>
In-Reply-To: <57daf43c5270f7532b269b9f0e90d126ca012354.1705331453.git.sreenath.vijayan@sony.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Sreenath Vijayan
> Sent: 17 January 2024 11:14
....
>  /* Key Operations table and lock */
>  static DEFINE_SPINLOCK(sysrq_key_table_lock);
>=20
> @@ -505,7 +523,7 @@ static const struct sysrq_key_op *sysrq_key_table[62]=
 =3D {
>  =09NULL,=09=09=09=09/* A */
>  =09NULL,=09=09=09=09/* B */
>  =09NULL,=09=09=09=09/* C */
> -=09NULL,=09=09=09=09/* D */
> +=09&sysrq_dmesg_dump_op,=09=09/* D */
>  =09NULL,=09=09=09=09/* E */
>  =09NULL,=09=09=09=09/* F */
>  =09NULL,=09=09=09=09/* G */

That looks like it ought to use C99 initialisers:
=09['D' - 'A'] =3D &sysrq_dmesg_dump_op,

Possible with a #define to hide the offset.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


