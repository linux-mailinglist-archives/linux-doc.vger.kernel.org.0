Return-Path: <linux-doc+bounces-85864-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLvVKRzs+WkLFQMAu9opvQ
	(envelope-from <linux-doc+bounces-85864-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 15:09:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DB04CE307
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 15:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE9D330055AF
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2026 13:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B817439005;
	Tue,  5 May 2026 13:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBTE0ksp"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18652392C32;
	Tue,  5 May 2026 13:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986584; cv=none; b=QCvuGBt8p6OQ1IA6lk67iWJ6R80sYyS0axvtdWLzZ8PEi+uxhyKwEHzoYMEivLeDQsqwlc+SMRu/b+ebIpqOw3WRevESxE++aMiU6yqVFYjM8ECJFzDyhAPuYG6qqj0NMyjLHo0t8XvJE2Yh9gIe4DfjgCapbpjebYvtVDWcwiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986584; c=relaxed/simple;
	bh=AOFVX8O3HfW/3n4USzBl6Mj+4f+nfaJOupsLrF1kc4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZJDouycNWDLvH9XcniTUqpxcIvPL7hBbKL+vuwGAOCj10mKkhE6WZCStH8DQ4zYWdN8F+WK0eYqTIQGbWgjIugC6eSefhg2xC7tctT8ILBTOOEnOxcudQ+/X58bO5rQdluaK28vEzt4soYu0fqxVqjZLCtBPDglqtDjXjXfPXkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBTE0ksp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB37C2BCB9;
	Tue,  5 May 2026 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777986583;
	bh=AOFVX8O3HfW/3n4USzBl6Mj+4f+nfaJOupsLrF1kc4Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JBTE0kspyniU7qfCbLm63s0jI+UEHKpED3wgUmFGzF0y1rTUQWny8DvZxOOCPTDig
	 kUZpT4AUM7mtBybeiNMWcWqnvX+sCPVlVcYpNqwqs6Ht2Ids0ce452CT9cskDl+vMz
	 jK6JNBN5LsW9w5IZvh1Pj3hRBpHA2PLigHPm3A5orLW1UNUrFffITorDNDxvFHq8ql
	 zpCN5A68dXtIxJcLsXhW1llh8Lj3ZYRqaEEJ5ThPq5cAd6QsJ5i5jiAkgSMA1sRBCM
	 10ofMSG1AajVn+L1lzoHKdgf5D35QNXl/knbBeiu6raxDKDa3pJiQdLfqdZJf9e81z
	 Qh8cFIca93yCA==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wKFWv-00000004gHx-369N;
	Tue, 05 May 2026 15:09:41 +0200
Date: Tue, 5 May 2026 15:09:40 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Linux Doc Mailing List" <linux-doc@vger.kernel.org>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno
 Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH 8/9] docs: maintainers_include: don't ignore invalid
 profile entries
Message-ID: <20260505150940.1169820f@localhost>
In-Reply-To: <DIAP83C37D9N.1US9NOU3ME7YI@garyguo.net>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
	<fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org>
	<CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com>
	<20260504222637.176edc7c@foz.lan>
	<CANiq72mk=gyGcQCL_DU4tKXN4U0rqH3wD7S04AuT4UGRFjCQaA@mail.gmail.com>
	<20260505020831.698650ec@foz.lan>
	<CANiq72=2cB_bDa0c1FA4aOMx8d=RyuNs_O+_72EiUurMAY+0mw@mail.gmail.com>
	<20260505074534.5fefbed0@foz.lan>
	<DIAP83C37D9N.1US9NOU3ME7YI@garyguo.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 46DB04CE307
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85864-lists,linux-doc=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,lwn.net,vger.kernel.org,kernel.org,protonmail.com,google.com,linuxfoundation.org,umich.edu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,garyguo.net:email]

On Tue, 05 May 2026 12:16:03 +0100
"Gary Guo" <gary@garyguo.net> wrote:

> On Tue May 5, 2026 at 6:45 AM BST, Mauro Carvalho Chehab wrote:
> > On Tue, 5 May 2026 02:20:45 +0200
> > Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> > =20
> >> On Tue, May 5, 2026 at 2:08=E2=80=AFAM Mauro Carvalho Chehab
> >> <mchehab+huawei@kernel.org> wrote: =20
> >> >
> >> > Also, with time, maintainers may change their employers while still
> >> > keeping their maintainership status.
> >> >
> >> > So, I'd say that whatever is there at the "P" entry, or where it is
> >> > located (either on a ReST file at the Kernel or on some external URL=
),
> >> > it should reflect the model that a maintainer or subsystem community
> >> > that actively participate at the Kernel development agrees with.
> >> > This should be vendor-agnostic.   =20
> >>=20
> >> I am not sure what you mean. By "vendored" I don't mean
> >> companies/employers, I mean that the file comes from an upstream
> >> repository:
> >>=20
> >>   https://github.com/Rust-for-Linux/pin-init/blob/main/CONTRIBUTING.md
> >>=20
> >> Nevertheless, it is true that this really is a special case, in that
> >> the upstream project decided to provide something that could then be
> >> fit into the `P:` field.
> >>=20
> >> One could say "let's ask them to do rst upstream", but to be honest,
> >> it is simpler to just put a hyperlink to GitHub's rendered file.
> >> Markdown is anyway a better fit for their file. =20
> >
> > Ok. Then it P entry could be:
> >
> > 	P: https://github.com/Rust-for-Linux/pin-init/blob/main/CONTRIBUTING.m=
d =20
>=20
> If you send a patch I can queue it up for 7.2. Or would you want this to =
be
> taken via docs tree instead?

It doesn't matter much but placing it at the documentation series
will keep this change together with the other patches, so I guess
it would be a little better.

I'll be sending the new patch series soon with this change there
as well.

--=20
Thanks,
Mauro

