Return-Path: <linux-doc+bounces-79791-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI3rGx6MuWnkJwIAu9opvQ
	(envelope-from <linux-doc+bounces-79791-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 18:15:10 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E232AF2EF
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 18:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 696ED3028A0E
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 17:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9F63F87ED;
	Tue, 17 Mar 2026 17:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="iyelnXym"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103C53F7E7A
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 17:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773766832; cv=none; b=pAmyegXbfFADRDJEqM2sPDsa/JKe+qcqr4zZ9YL0Ab6O8dScUBjoSgwUiHo+XU73yNntHDQMh8dpKykyaD7tszuJgMeLdDLz63d6LlhTKL6m4oaIo3TUTcYPDxxqBeBvZkLjdYEP8XREEP23VawTIhsWF2ICw/v/SvLTHLBxlWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773766832; c=relaxed/simple;
	bh=8CnX75WivjUzvwaUyCEHIQ6nrLCchXaZd4CnI186CL4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S8uZfP+tUcNF2PyGxImE3Zj24tPAWfoUEQ6i3q1UMXqgsog3pLfjtyByuaL2hj8tGclugQlsvH9yGXnFDhK3/DhfL+8PjMAkegO5NrVg8E59v6hGDWlfacUzWQRLtAfGPOsUh3ay34Xp+PXLYnNo4lf0bFDctHouQzBGaTRihTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=iyelnXym; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3302940C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773766830; bh=omgO+KHZUco5Y83s94riYkYUz/KySieY710Gv+iJa/U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iyelnXym7GBfKF5Be6HH2v5YMMqySjbqOiu2WdOmGwt4dczEdK0nTXf3n3R8pGuxq
	 fY4KWXofjbDIOAtEHN2SC7kswD9dhunVIOOTdt01d+WwwI/11xeK6SIlO+eykeREKy
	 l6q3MzogEwZRDERno6/35WGhRnOOyxKj5zTcaRP82DKBYcTDYwNRoZseVizc2Zwj/J
	 LN6wa8az7POvVv6+q/zp64aLURSRiMhYpXbYDQ0VRlzdhqfxMvLarTAj4HsSSBdp4t
	 A290Pq/LmJ2Y0Y2kK0YlsXUh+Er12/GC2jW1HMQj2wfTdlhnLHQiqmNLcVOw/3LSG+
	 kvT1EE0fTLB0Q==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3302940C7C;
	Tue, 17 Mar 2026 17:00:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>, Daniel Castro
 <arantescastro@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs: pt_BR: translate process/1.Intro.rst
In-Reply-To: <CAMAsx6c_oq5-cuf-N-+RTo-Hym-K+PF-=BOBZySWMN4E7O1s4A@mail.gmail.com>
References: <20260316212435.19303-1-arantescastro@gmail.com>
 <20260317140136.29256-1-arantescastro@gmail.com>
 <CAMAsx6c_oq5-cuf-N-+RTo-Hym-K+PF-=BOBZySWMN4E7O1s4A@mail.gmail.com>
Date: Tue, 17 Mar 2026 11:00:29 -0600
Message-ID: <875x6ubdci.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79791-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 74E232AF2EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Daniel Pereira <danielmaraboo@gmail.com> writes:

> On Tue, Mar 17, 2026 at 11:02=E2=80=AFAM Daniel Castro <arantescastro@gma=
il.com> wrote:
>>
> Thank you for sending the new version. Please review the following
> crucial points before submitting v3:
>
> New Email for Each Version: Always send patches in a new email,
> including the version number in the subject (e.g., [PATCH v3] docs:
> pt_BR: translate process/1.Intro.rst). This is vital for community
> tracking.

Daniel did mark v2 correctly.  A new version definitely should be sent
as the start of a new thread, though, rather than as a reply to the
previous.

> Subheading Formatting: The misalignment in the subheading separators
> persists (e.g., +Cr=C3=A9ditos/+--------). Please correct this.

Looking at the patch:

> +
> +Cr=C3=A9ditos
> +--------
> +
>=20

...I don't see the problem you are describing here?

And again, please put comments like that inline, as I am doing here;
that makes it far easier for everybody to follow what's going on.

> Use checkpatch.pl: Always run the checkpatch.pl tool before
> submitting. This is mandatory and will catch these style errors,
> helping to prevent rejections.

Good advice, but checkpatch doesn't emit any actionable suggestions for
this patch...?

All told, I don't see a reason not to apply this version, is there
something I'm missing?

Thanks,

jon

