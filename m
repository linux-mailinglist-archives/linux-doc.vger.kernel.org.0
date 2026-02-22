Return-Path: <linux-doc+bounces-76499-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLzwKnBVm2kVyQMAu9opvQ
	(envelope-from <linux-doc+bounces-76499-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 22 Feb 2026 20:13:52 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1165D170280
	for <lists+linux-doc@lfdr.de>; Sun, 22 Feb 2026 20:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DF44300E3BA
	for <lists+linux-doc@lfdr.de>; Sun, 22 Feb 2026 19:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED7E350D7F;
	Sun, 22 Feb 2026 19:13:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855D734F498;
	Sun, 22 Feb 2026 19:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771787617; cv=none; b=gXAUyARKtUhpdrqnkJCdVql7yRKUgy/9bTyNmIg2OgK+/enUrGnGNw57qmTjNZ9R/JEE0yBOXxQKnKE8VBSsynRgg4yZtexbauROwtSg2347hz+PJycdoFmzkHEQ8R9Oe4II8CIHPIhYK1ctGQvXbI8xklU9uCk3URxDIY6WQt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771787617; c=relaxed/simple;
	bh=uUFMoLDis6u/NZE5MeSypX6314mYSet1o12NT2+cjM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbKZzmNaRNDQK2TUPEOk3cgxghQIPBcUiKIP4gsl+mDjspK3q9s+wJYLUWgdSm+KC+f2enKPGdfiEnV8uc86reYxn68+jlcWWBCFvk5iBL//8+o2g2qzDuBbPhQJPCV8qetz0SBnSsfPMOoI+1thi1ndBKq+LIOswpADD76u4Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 322BAF43C7E; Sun, 22 Feb 2026 20:07:13 +0100 (CET)
Date: Sun, 22 Feb 2026 20:07:12 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org,
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org,
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org,
	ardb@kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
Message-ID: <aZtT4MH0Q8Ic9ZiM@luna>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
 <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
Jabber-ID: linkmauve@linkmauve.fr
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linkmauve.fr];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76499-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linkmauve@linkmauve.fr,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linkmauve.fr,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linkmauve.fr:email]
X-Rspamd-Queue-Id: 1165D170280
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 07:09:38PM +0100, Alice Ryhl wrote:
> On Tue, Feb 10, 2026 at 10:00 AM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > From: Link Mauve <linkmauve@linkmauve.fr>
> >
> > For now only Big Endian 32-bit PowerPC is supported, as that is the only
> > hardware I have.  This has been tested on the Nintendo Wii so far, but I
> > plan on also using it on the GameCube, Wii U and Apple G4.
> >
> > These changes aren’t the only ones required to get the kernel to compile
> > and link on PowerPC, libcore will also have to be changed to not use
> > integer division to format u64, u128 and core::time::Duration, otherwise
> > __udivdi3() and __umoddi3() will have to be added.  I have tested this
> > change by replacing the three implementations with unimplemented!() and
> > it linked just fine.
> >
> > Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> 
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index a58b1029592c..9fd82c75dcbd 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -61,6 +61,8 @@ else
> >  KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
> >  endif
> >
> > +KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
> 
> This needs to be a softfloat target.

Should we come back to describing the target like I did in my first
patch[1] in scripts/generate_rust_target.rs, or should I bring that to
Rust to create a powerpc-unknown-unknown-softfloat target upstream?  Or
is there a better third solution I’m not thinking of?

> 
> Alice
> 

[1] https://lore.kernel.org/rust-for-linux/20260204030507.8203-1-linkmauve@linkmauve.fr/

-- 
Link Mauve

