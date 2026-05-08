Return-Path: <linux-doc+bounces-86376-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCyeAOuN/WnWfgAAu9opvQ
	(envelope-from <linux-doc+bounces-86376-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 09:16:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DE94F2E4B
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 09:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E068C301D692
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2026 07:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E18037BE88;
	Fri,  8 May 2026 07:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wmt1FzUK"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3849D3590A9;
	Fri,  8 May 2026 07:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778224613; cv=none; b=diCbYHeGa30Ux6YWaXiEdbvV2mcsEOdtUrZ8SsjbcMUhXskYHwW7JroPvePTorSrue3LhV077SdXoEvr+kQUn2w6ic9VsSNuTvv+HUQdXPSgZOpgCh7XIoyqP1my7Vp065gtb3UTYFdr/P6EzbgFL08eGxb/WcXZUoForE5seac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778224613; c=relaxed/simple;
	bh=ITvO/Wnnta7yKqzqzQ7Cj00XdBxl6lmGHadV6xLlKHE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NU+1eYAg1IAcsbLYbHgKiQ5E9K9XMXbxEuuzuZNJ6udRt2b5lbwu8SvmX+pz6dMz0lXUjOa+THXnoqN7sWtYikNIqrOFTg2PfFzTTICujeV/VP7iTsmuT1ciPztlcWG/E9Mm5BuClJKmL/ChFszlRe8OMyctkyEaT976EPW4PLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wmt1FzUK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29D7C2BCB0;
	Fri,  8 May 2026 07:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778224610;
	bh=ITvO/Wnnta7yKqzqzQ7Cj00XdBxl6lmGHadV6xLlKHE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Wmt1FzUKrEAA1b4PfFOHOybT2shX0upZMutoo6lZcBTp33KH9LQJ7Z8x99jekJkmw
	 O+gQhia36/J6hej27zdNqN8vRP9EPEbSNge5P60YEJwddn8ODYyLVy7YYvj8QB6qgh
	 c0atxTx58daztgC98Hi8wfxtDFlaPUoAM0+lx/FyqXIk+xTod5OENaSUhUUgXsO6RJ
	 TpMk+bMIPx7fHtzsryri3BMZoWZCnZO5PvcX/glHpdXu3SfUw3ntIkMLKLB0OmACvI
	 fW4vnn1cefl16QIrUMkr/Pof1po3wbIRLoHkkxxdegKG8rcgKHcXSPNY99/Nf4oOzP
	 IhqgWPxFHFKjg==
Date: Fri, 8 May 2026 09:16:44 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, Danilo
 Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Trevor Gross
 <tmgross@umich.edu>
Subject: Re: [PATCH v2 11/11] MAINTAINERS: use a URL for pin-init
 maintainer's profile entry
Message-ID: <20260508091644.420bd440@foz.lan>
In-Reply-To: <CANiq72kN=2RsE0Wm_489Sc-VKO40A0uYinCj1McT=YMu=cM4aQ@mail.gmail.com>
References: <cover.1777987027.git.mchehab+huawei@kernel.org>
	<1bceee886b9027d66bbb48d9d6c8d1250ce8dbcb.1777987028.git.mchehab+huawei@kernel.org>
	<DIASHBBEIHQW.3EQSDUML6G3SB@garyguo.net>
	<20260506084935.1cd4b794@foz.lan>
	<CANiq72kN=2RsE0Wm_489Sc-VKO40A0uYinCj1McT=YMu=cM4aQ@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 58DE94F2E4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86376-lists,linux-doc=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,lwn.net,vger.kernel.org,protonmail.com,google.com,umich.edu];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, 6 May 2026 10:38:07 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Wed, May 6, 2026 at 8:49=E2=80=AFAM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Maybe it is just me, but placing doc files in the crowd together with c=
ode
> > on a project where documentation has its own directory sounds weird(*).
> >
> > (*) except for userspace tools and staging drivers where we want
> >     everything, including documentation, contained on a single place. =
=20
>=20
> It is a similar case -- they are vendored libraries developed and used
> elsewhere (e.g. in userspace too).

I see.

> > As you're already using some scripting to do a bidirectional sync,
> > you could add there some logic to convert rust pin-init documentation
> > to rst and place it at Documentation/rust/. =20
>=20
> Most of the pin-init documentation is elsewhere (embedded in the Rust
> source code) and already rendered at rust.docs.kernel.org.
>=20
> (Using Sphinx for Rust has been discussed in the list a few times in
> the past too, and that has its own set of constraints).
>=20
> > Btw, on a quick check, only Rust has markdown files:
> >
> >         $ git ls-files|grep ".md$"|grep -v tools/
> >         rust/pin-init/CONTRIBUTING.md
> >         rust/pin-init/README.md
> >         rust/proc-macro2/README.md
> >         rust/quote/README.md
> >         rust/syn/README.md
> >
> > As one of the people who spent years helping improving the Kernel
> > documentation and doing lots of conversions from markdown
> > and other non-structured text formats to RST, I have to say that I'm
> > concerned with any trends that would add doc files that aren't
> > properly integrated with the Kernel documentation system like those. =20
>=20
> All those are vendored libraries, and most of those `README.md` files
> are about clarifying where they are taken from and their licensing,
> e.g.
>=20
>     # `quote`
>=20
>     These source files come from the Rust `quote` crate, version 1.0.40
>     (released 2025-03-12), hosted in the <https://github.com/dtolnay/quot=
e>
>     repository, licensed under "Apache-2.0 OR MIT" and only modified to a=
dd
>     the SPDX license identifiers.
>=20
>     For copyright details, please see:
>=20
>         https://github.com/dtolnay/quote/blob/1.0.40/README.md#license
>         https://github.com/dtolnay/quote/blob/1.0.40/LICENSE-APACHE
>         https://github.com/dtolnay/quote/blob/1.0.40/LICENSE-MIT

Just my two cents, but all license files that are applies to the Kernel
are already under LICENSES/ directory, and there is a document defining
how SPDX and LICENSES should be used:

	Documentation/process/license-rules.rst.

IMO it would make more sense to point to the corresponding LICENSES/ files.

>=20
> i.e. they are not intended to be kernel documentation, and moving them
> away from the source files doesn't sound like an improvement,
> especially since we were explicitly requested to make the provenance
> very clear.

In this case, this sounds OK.

> We could perhaps have a list of vendored libraries in
> Documentation/rust/vendored-libraries.rst` -- that could perhaps be
> useful for some folks.

Makes sense to me.

> In any case, I understand your desire to keep things integrated in the
> kernel documentation, and I appreciate that (I also like to have
> everything neatly integrated), but please do not assume we have been
> randomly adding Markdown for no reason or that we are not trying to
> keep things properly integrated... :(

I didn't intend to imply that tose aren't properly integrated. It is
just that it raised my eyebrows seeing more doc-like files over there.

---

With regards to patch 11/11, I'll send a new version just changing
the "P" tag without dropping the .md file.

Thanks,
Mauro

