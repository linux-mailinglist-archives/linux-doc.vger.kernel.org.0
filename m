Return-Path: <linux-doc+bounces-75340-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGLEJC+nhGmI3wMAu9opvQ
	(envelope-from <linux-doc+bounces-75340-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 15:20:31 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5B9F3E1C
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 15:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63AA43018BDE
	for <lists+linux-doc@lfdr.de>; Thu,  5 Feb 2026 14:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6A1212B2F;
	Thu,  5 Feb 2026 14:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b="l4GTal8p"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail98.out.titan.email (mail98.out.titan.email [54.147.227.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A6A34F27B
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 14:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.147.227.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770301186; cv=none; b=d8096NKQt3CC9xxFk0fWJex5RKv2iuIXY1bxhqSzp+Wl9A9ectVav/rhiV8Zs6C7tloCsJWe8H1TZgtCH0/iHIjybDmux2ISCb7A7tOPhVW881zBBzbrDHUb6jK2WCUdUm/DmX7vhBgpuGCjkmgdiOCbWD0e+WyG/+yblzoPkx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770301186; c=relaxed/simple;
	bh=FFkpM42UXIxkI5Nwmv9y+uhPbRXJWnNl3wRPQnm452o=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=KCBrqC1+FmY8QkYD2JlmxXt/3jF7uRnayQe4qT6q1XBGHocxBlTh+/yBj+sGE2cyn41xI7gs69Q0z53Blrwlfbps1iFkmji2krNI0BazwsXz536XAQr/gmgxuESLdauUXTYncNdH7LYsjTnyPXzhTtByZvzKx6Ebege6Jq45K+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com; spf=pass smtp.mailfrom=amidevlab.com; dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b=l4GTal8p; arc=none smtp.client-ip=54.147.227.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amidevlab.com
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4f6K3K2hcGz9s24;
	Thu,  5 Feb 2026 14:14:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=JUtYKuQE1F5FBDB9QgY0zbKHLcBV6ijN7dYr4Dbvhio=;
	c=relaxed/relaxed; d=amidevlab.com;
	h=mime-version:subject:in-reply-to:message-id:references:to:from:date:cc:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1770300861; v=1;
	b=l4GTal8pS1vguX7e6DnmAsHavGrlXjYXNmEqHBjjOpFhN685x/MNmC6itha/bvyPDxoDvDaI
	3DX/2gRmcx0Rsall98THRTWLgixDEgi5GQN5EiZfgX0ozFc4urNgO3cjAC/QfM8K/CIa5tD5erA
	fUroBOHYjI5OuVzgWuDJ+rKU=
Received: from smtpclient.apple (unknown [122.172.85.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp-out.flockmail.com (Postfix) with ESMTPSA id 4f6K3H2Mtpz9rxY;
	Thu,  5 Feb 2026 14:14:18 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v3] docs: process: maintainer-pgp-guide: update kernel.org
 docs link
Feedback-ID: :amitabh@amidevlab.com:amidevlab.com:flockmailId
From: Amitabh <amitabh@amidevlab.com>
In-Reply-To: <CAMuHMdVdBoXKg-7wDshMRGi05LiCOi62ETYzyV5HFbQXLinK6A@mail.gmail.com>
Date: Thu, 5 Feb 2026 19:44:05 +0530
Cc: corbet@lwn.net,
 workflows@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <208E3D71-B2A9-4428-958F-915E6FC95D4F@amidevlab.com>
References: <20260205115554.7795-1-amitabh@amidevlab.com>
 <CAMuHMdVdBoXKg-7wDshMRGi05LiCOi62ETYzyV5HFbQXLinK6A@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1770300861187473581.13754.8931835535389347760@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=aI4Kqa9m c=1 sm=1 tr=0 ts=6984a5bd
	a=txo+5pS2dMFdB056rU3bsA==:117 a=txo+5pS2dMFdB056rU3bsA==:17
	a=VwQbUJbxAAAA:8 a=IkcTkHD0fZMA:10 a=CEWIc4RMnpUA:10 a=tBb2bbeoAAAA:8
	a=4yxl8aT0AAAA:8 a=i4OmGAD0xVQIe_X6LU4A:9 a=QEXdDO2ut3YA:10
	a=4a-YG245BeQA:10 a=Oj-tNtZlA1e06AYgeCfH:22 a=oCAeEeOuyiZLRzIZmmpZ:22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[amidevlab.com:s=titan1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-75340-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[amidevlab.com];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amidevlab.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitabh@amidevlab.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amidevlab.com:email,amidevlab.com:dkim,amidevlab.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: EF5B9F3E1C
X-Rspamd-Action: no action

Hi Geert,

Hope this clarifies.

> On 5 Feb 2026, at 6:53=E2=80=AFPM, Geert Uytterhoeven =
<geert@linux-m68k.org> wrote:
>=20
> Hi Amitabh,
>=20
> Thanks for your patch!
>=20
> On Thu, 5 Feb 2026 at 13:09, Amitabh Srivastava =
<amitabh@amidevlab.com> wrote:
>> Update http link to the documentation about how to add a kernel.org =
UID to
>> the maintainer's key. Add missing SPDX-License-Identifier to fix a
>> checkpatch warning.
>=20
> > The first sentence states the obvious, but does not explain the
> > rationale behind this change.  Why should it be changed?  Both the
> > old and the new URL work.

> The old URL no longer points to the correct page having mentioned =
information.
> [Old URL]: Simply redirects to 'https://korg.docs.kernel.org/', which =
doesn't have any information on how to add the kernel.org UID to your =
PGP key.
> [New URL]: Precisely opens the respective page at the anchor for the =
respective section 'Adding a kernel.org UID to your PGP key'.

>> Signed-off-by: Amitabh Srivastava <amitabh@amidevlab.com>
>=20
>> --- a/Documentation/process/maintainer-pgp-guide.rst
>> +++ b/Documentation/process/maintainer-pgp-guide.rst
>> @@ -1,3 +1,5 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> .. _pgpguide:
>>=20
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>> @@ -864,7 +866,7 @@ don't already have them)::
>> If you have a kernel.org account, then you should `add the kernel.org
>> UID to your key`_ to make WKD more useful to other kernel developers.
>>=20
>> -.. _`add the kernel.org UID to your key`: =
https://korg.wiki.kernel.org/userdoc/mail#adding_a_kernelorg_uid_to_your_p=
gp_key
>> +.. _`add the kernel.org UID to your key`: =
https://korg.docs.kernel.org/mail.html#adding-a-kernel-org-uid-to-your-pgp=
-key
>>=20
>> Web of Trust (WOT) vs. Trust on First Use (TOFU)
>> ------------------------------------------------
>=20
> Gr{oetje,eeting}s,
>=20
>                        Geert
>=20
> --=20
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- =
geert@linux-m68k.org
>=20
> In personal conversations with technical people, I call myself a =
hacker. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
>                                -- Linus TorvaldsThanks

> Regards

> Amitabh

