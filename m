Return-Path: <linux-doc+bounces-39714-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E34DA49A1F
	for <lists+linux-doc@lfdr.de>; Fri, 28 Feb 2025 14:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAB211889689
	for <lists+linux-doc@lfdr.de>; Fri, 28 Feb 2025 13:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28D82F41;
	Fri, 28 Feb 2025 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b="fAkcIc5t"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp16.bhosted.nl (smtp16.bhosted.nl [94.124.121.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E742F268C69
	for <linux-doc@vger.kernel.org>; Fri, 28 Feb 2025 13:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.124.121.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740747741; cv=none; b=NfDeVP6hS4SeMQ7YV3bSXxHlxfqlo7FpJmcOH/lPhtZblI24bga6I3bHIVbGfnd98CB9ez2RAQGjizm7mXRT2fHJ1Z9IPHPO4ljNOmJmE5DA0JWSZqNa7mxCRrj9DOLJmTBYLSbCvEfm7qjywXFbnYUGJTwnTNMX89pSrrCS/jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740747741; c=relaxed/simple;
	bh=zf81NPKIH4q2oCtgtvaE5ZhKwhc6nbCpsTWJjhHAUH0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fuv18B0R6HJp5Pnf+YQeKWtlJSToSDM49AuuP4PJMn9TL96+zEG+8gqCUj6ldJDxDVVz/UJWIed8drBmrOkWouF8aunlF4kBNyW++1MCj0KeRGpjkieEtutT5g5WKE717fbv7SYHF190SWhi/8UZ3NxlGvom26nJhwWhftvhoak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl; spf=pass smtp.mailfrom=protonic.nl; dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b=fAkcIc5t; arc=none smtp.client-ip=94.124.121.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonic.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=protonic.nl; s=202111;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:subject:cc:to:from:date:from;
	bh=chxcQATVwuTPr9w77idqSmrD3wyjmpuH70l6e//dc0o=;
	b=fAkcIc5tn2PTvmw49kT6gb5r6bPQlxdhTqDJfyf6jMDJeHta2IaKmQoYkpx/gwQju6y+CxLSbiPgu
	 SfISW/jdY4+L452ufALvHUAfboOmHEI3gxPTAQzXTFneJJQJ619+2BIdCwY3i3Rj/hrpBJumWYWoUd
	 YqepAsU1jQfUJFvI7zKfb6BNNja0cWE9A3LliTBUedHPY0PY9JtTwENo0Vf+nCxq5FhPvFLJZzIJ3F
	 rC5gHVI5+JdbnrF1rs5PCPWXXx42i5x2svdcm07jnFp7ZCT/TC3+UlGyiJ+VZ7cEeahCd06Vw7VCnq
	 431SnbOXLNmhU6BxVWNlTZmu+hLXNow==
X-MSG-ID: 3a76f441-f5d4-11ef-8b43-005056817704
Date: Fri, 28 Feb 2025 14:02:12 +0100
From: David Jander <david@protonic.nl>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Nuno Sa <nuno.sa@analog.com>, Jonathan Cameron
 <jic23@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [RFC PATCH 4/7] Documentation: Add Linux Motion Control
 documentation
Message-ID: <20250228140212.346c4ef5@erd003.prtnl>
In-Reply-To: <87y0xrpcnn.fsf@trenco.lwn.net>
References: <20250227162823.3585810-1-david@protonic.nl>
	<20250227162823.3585810-5-david@protonic.nl>
	<87y0xrpcnn.fsf@trenco.lwn.net>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Dear Jonathan,

Thanks for reviewing...

On Thu, 27 Feb 2025 09:37:00 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> David Jander <david@protonic.nl> writes:
> 
> > Add general- and UAPI documentation for the Linux Motion Control
> > subsystem.
> >
> > Signed-off-by: David Jander <david@protonic.nl>
> > ---
> >  Documentation/motion/index.rst       |  18 +
> >  Documentation/motion/motion-uapi.rst | 555 +++++++++++++++++++++++++++
> >  Documentation/subsystem-apis.rst     |   1 +
> >  3 files changed, 574 insertions(+)
> >  create mode 100644 Documentation/motion/index.rst
> >  create mode 100644 Documentation/motion/motion-uapi.rst  
> 
> I am glad to see this feature coming with documentation!  Please,
> though, do not create a top-level "motion" directory for it - that is
> just the kind of organization I've been trying to get us away from for a
> while.  This document is clearly aimed at user-space developers, and
> thus should be part of the userspace-api book ... please?

Ok, I understood UAPI documentation should go in
Documentation/userspace-api/motion.rst. Will fix that.

What I am unsure of is the rest of the documentation (which arguably still
needs to be written). I initially selected this place because of
Documentation/subsystem-apis.rst. LMC being a new "subsystem", made me think it
was the right thing to follow the structure of the contents there.
What I mean to put there is documentation of the driver API for motion
control drivers. I understand that while it doesn't really exist yet, I should
leave it out of this patch set, but when I am going to write it, should it
still go there, or is there now a better place?

Best regards,

-- 
David Jander

