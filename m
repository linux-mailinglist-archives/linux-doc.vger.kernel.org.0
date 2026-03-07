Return-Path: <linux-doc+bounces-78318-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iA6SDoMerGkRlAEAu9opvQ
	(envelope-from <linux-doc+bounces-78318-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 07 Mar 2026 13:48:03 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BB122BC2B
	for <lists+linux-doc@lfdr.de>; Sat, 07 Mar 2026 13:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 453E93017269
	for <lists+linux-doc@lfdr.de>; Sat,  7 Mar 2026 12:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C1F39B4BB;
	Sat,  7 Mar 2026 12:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ekw83ayY"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A5B1E531;
	Sat,  7 Mar 2026 12:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772887680; cv=none; b=ng/pPGyt7fpkCLinYhq/04eQpQML+qnwKsox44Rz7XXlKrmHl64hF6JrIiNrjLxbgf1+4Ec1fIeENJR0JeTlQ/oX6PHnm31+Qfy/1jovZa2R39XRVMG3dRcsQWSCt4FGenW9y+olQ+nj3yQ8VA+uy3taUFQUm3HsQiqP1lEAAgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772887680; c=relaxed/simple;
	bh=gdOzsll0PyVLUeZdfjfQ7QedKHwZdtPOZjIKYALKDr0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t4hqnKZ3+1vtlAQWlF0mlf71hmWhy//OLkQ+c+1kNhEKMG+f37kFk7IvMFH4AFCycNU88JnNHYU+pTHzNKIMhrsAYqqVfTJ8c0nZqaie14fSAjt35Jlib7I76AfbguOnPIixBAl7W66b8eY1H/VOxxGOvPzNAL8NtyMpE3rDKvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ekw83ayY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ECC1C19422;
	Sat,  7 Mar 2026 12:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772887679;
	bh=gdOzsll0PyVLUeZdfjfQ7QedKHwZdtPOZjIKYALKDr0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ekw83ayYTKCQSXW/EBLkk4WkryfK6/pAOdev+Y8aiFzdqb3VlBH64jF94MeztZ3PG
	 0pxGutS7cD5SATw0I6XyyuV8IAVfEg8dfdIXXhdz2RaPNAUmlU8qSQ8j8xF6eSoqPa
	 +Eu0pSL4sGQqipwkyyynz0cj2GkjTR5qmXQ18qSpweMPuUJafOwTPU4+LArOfNOTDY
	 4s1gCEc0h5Xep9/u+gPLLOqoVXsGsKy5G1WaMCKOWJbj6RILmlFg1CivYkKco64jxY
	 sDHtq/fjCeH8Cg01NVwh9PE+cT2A9vDZL/Fjeua3wO+J06XuXtAXIy+2DA3nEEjkxA
	 csDV8H9zPfZEQ==
Date: Sat, 7 Mar 2026 12:47:50 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Francesco Lavra <flavra@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org
Subject: Re: [PATCH v7 2/6] iio: Replace 'sign' field with union in struct
 iio_scan_type
Message-ID: <20260307124750.29e7577a@jic23-huawei>
In-Reply-To: <2110d3be-b55d-4b39-a8f4-ebf1312ada96@baylibre.com>
References: <20260304080519.2844101-1-flavra@baylibre.com>
	<20260304080640.2844366-1-flavra@baylibre.com>
	<2110d3be-b55d-4b39-a8f4-ebf1312ada96@baylibre.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 95BB122BC2B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78318-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.944];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 16:55:42 -0600
David Lechner <dlechner@baylibre.com> wrote:

> On 3/4/26 2:06 AM, Francesco Lavra wrote:
> > This field is used to differentiate between signed and unsigned integers.
> > A following commit will extend its use in order to add support for non-
> > integer scan elements; therefore, replace it with a union that contains a
> > more generic 'format' field. This union will be dropped when all drivers
> > are changed to use the format field.
> > 
> > Signed-off-by: Francesco Lavra <flavra@baylibre.com>
> > ---
> >  Documentation/driver-api/iio/buffers.rst | 4 ++--
> >  include/linux/iio/iio.h                  | 7 +++++--
> >  2 files changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/iio/buffers.rst b/Documentation/driver-api/iio/buffers.rst
> > index 63f364e862d1..f36e6d00173f 100644
> > --- a/Documentation/driver-api/iio/buffers.rst
> > +++ b/Documentation/driver-api/iio/buffers.rst
> > @@ -78,7 +78,7 @@ fields in iio_chan_spec definition::
> >     /* other members */
> >             int scan_index
> >             struct {
> > -                   char sign;
> > +                   char format;
> >                     u8 realbits;
> >                     u8 storagebits;
> >                     u8 shift;
> > @@ -98,7 +98,7 @@ following channel definition::
> >  		   /* other stuff here */
> >  		   .scan_index = 0,
> >  		   .scan_type = {
> > -		           .sign = 's',
> > +		           .format = 's',
> >  			   .realbits = 12,
> >  			   .storagebits = 16,
> >  			   .shift = 4,
> > diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> > index a9ecff191bd9..61f1dfc14e02 100644
> > --- a/include/linux/iio/iio.h
> > +++ b/include/linux/iio/iio.h
> > @@ -178,7 +178,7 @@ struct iio_event_spec {
> >  
> >  /**
> >   * struct iio_scan_type - specification for channel data format in buffer
> > - * @sign:		's' or 'u' to specify signed or unsigned

I think this is going to trigger kernel-doc warnings.  So I'd keep the docs
but mention it's deprecated in favour of format.

> > + * @format:		(signed or unsigned) integer, or floating point  
> 
> We should keep the list of valid values here.
> 
> >   * @realbits:		Number of valid bits of data
> >   * @storagebits:	Realbits + padding
> >   * @shift:		Shift right by this before masking out realbits.
> > @@ -189,7 +189,10 @@ struct iio_event_spec {
> >   * @endianness:		little or big endian
> >   */
> >  struct iio_scan_type {
> > -	char	sign;
> > +	union {
> > +		char sign;
> > +		char format;  
> 
> Could add some comments here to say that format should be used
> in new code and sign will be removed eventually.
> 
> > +	};
> >  	u8	realbits;
> >  	u8	storagebits;
> >  	u8	shift;  
> 


