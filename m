Return-Path: <linux-doc+bounces-81247-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD/6H2pExGm1xwQAu9opvQ
	(envelope-from <linux-doc+bounces-81247-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 21:24:10 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E442732BC32
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 21:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BB5F300B57F
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 20:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AC940DFB7;
	Wed, 25 Mar 2026 20:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Me96fmCK"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DB6308F38
	for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 20:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774470236; cv=none; b=HTQ1TlidqTyub5QdjO6WXqGyliNMhJcXZZ/Zy6HTUQbCcO+de4o+bxJG5POLscYD2FNZdnoSqLdUwKvSW9jQUYOA9DoBXqSsukm2IH/8X4zQQTXPCBSm06PkavuWU+H7S22fhYfNLmKOQfnT+G9joov7Edh2mOCd0s5W3hzsUQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774470236; c=relaxed/simple;
	bh=gyZIZccWJd1+RoPkBEpdblxcP/K2Wyaw0OsXDDGeef0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i6rwaYTWNylF/y2YA/oW0yg+HVw/ib8+gFSRYfxrMo/Ln1lI/zMjlsnfZVQFvCs5iDK4XFz8/NXLZEmxDeRwF+pBUV8gfbG4rtXWKEQzVrq7KjFyXLMLvpdVypQchDQJFH3LFIz7j4CtHj2L297N9oOrv7h00t0fOOY/LZKILTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Me96fmCK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net ADB2740C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774470234; bh=bxZXftWEtQm5fbCg6/jjJHTKniH3z3qxAtdIC32b2Ys=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Me96fmCKavc7BjCrca0QayhdceyLSTP7YBS7pCOoy1XuW6DuKEJYcYSge/ROSHmeV
	 vhJi8zr+Tmh7jioa8faWFS5Pg3C9KzwgYylVOjoaakVPHxmHBd4IL0UVqw5bW0unhG
	 j8QMBTL5qzDIL/LhLbE23XYJpmKfxTNVCGrkICZxlzdXlGwTe4RFyYtb0HCLn8cs+f
	 e/4QcpYW5k/0Ivy7ouhHlDHM+MVM2T5khftceM6pKHosQuSAGZhz/vG2uPWdvM7uiK
	 Rx1655AEy1joobYKiNa0lcH7G3JXIfjWPZWjiEYIWKEp8Nj2FShs8J6azc4fLhmqqh
	 c93fnUhxfwoqQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id ADB2740C6F;
	Wed, 25 Mar 2026 20:23:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, Konstantin Ryabitsev
 <mricon@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Invalid link generation for equations
In-Reply-To: <9b320e77-9acf-4f0d-8c52-6e1fc3a8cf53@arm.com>
References: <9b320e77-9acf-4f0d-8c52-6e1fc3a8cf53@arm.com>
Date: Wed, 25 Mar 2026 14:23:53 -0600
Message-ID: <87se9nejza.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81247-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid,arm.com:email]
X-Rspamd-Queue-Id: E442732BC32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[Adding Konstantin and Mauro, in case anybody has any thoughts...]

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> Hi,
>
> I have noticed that links to equation images are not generated correctly
> on docs.kernel.org. For instance, Documentation/mm/memory-model.rst has:
>
> =C2=A0 =C2=A0 .. math::
> =C2=A0 =C2=A0=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0NR\_MEM\_SECTIONS =3D 2 ^ {(MAX\_PHYSMEM\_BITS=
 - SECTION\_SIZE\_BITS)}
>
> The generated HTML [1] shows the source code instead of the rendered
> equation because the link to the image [2] is broken. [3] does however
> exist. The issue seems to be that the link is relative to the root, even
> though we are in a subfolder (mm/ here).
>
> Given my non-existent knowledge of Sphinx I have no idea what the fix
> might be, but I thought I'd report this at least :)
>
> - Kevin
>
> [1] https://docs.kernel.org/mm/memory-model.html#sparsemem
> [2]
> https://docs.kernel.org/mm/_images/math/d99368220bfdedf1a888b1c09eb7236a8=
c87d079.png
> [3]
> https://docs.kernel.org/_images/math/d99368220bfdedf1a888b1c09eb7236a8c87=
d079.png

OK, so this is more than passing strange...I can't reproduce that
problem locally.  The HTML I get is:

  <img src=3D"../_images/math/d9936822[...]

On docs.kernel.org, instead:

  <img src=3D"_images/math/d9936822[...]

Note the missing "../".

I will confess that I don't have a great understanding of how imgmath
works and how that link gets set.  We could "fix" the problem generally
by setting imgmath_embed=3DTrue, but it would be good to understand what's
actually happening here.

Thanks,

jon

