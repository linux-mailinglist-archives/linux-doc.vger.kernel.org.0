Return-Path: <linux-doc+bounces-75760-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLFnJ4H9imlyPAAAu9opvQ
	(envelope-from <linux-doc+bounces-75760-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 10 Feb 2026 10:42:25 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C0A119028
	for <lists+linux-doc@lfdr.de>; Tue, 10 Feb 2026 10:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1921301E7F6
	for <lists+linux-doc@lfdr.de>; Tue, 10 Feb 2026 09:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1316336EDA;
	Tue, 10 Feb 2026 09:42:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC00F341649;
	Tue, 10 Feb 2026 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716542; cv=none; b=Ye9liGKTITTCMLx6LeXlrPKe31G4dQm0p1XxEc7GVxwNiA+ugWorO43anMCuqw3w663gEbR/Iz5H67WW/tVdqydbr8irRZzdveYeoHk1UA2hnJzn1WKUK2C3yX8FwhGtzY1An1s9rMWaUBzitScsBJo1SS/z2a/TyJoH/56NXJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716542; c=relaxed/simple;
	bh=/T8KUPbygjbky3/+PtIfPTmcPBNJYsI/O2945eSuSzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=om2avrVVZ9Qg2ReUaJEMv1P3e5ZoeirDPorP5zWfL1jkcqLw8x8N90K6z/NwhIDmaMh8g3Pb7X3ixLKpRrdaN6Ieje8nZe1VWX5EAMqu71mgsWnZCncmkLFYGGJhFo5JVYAi3AtcrGZW+S8wPchhxw6xwBUZ5K5nUlRggOp+y8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 7ACCEF43B79; Tue, 10 Feb 2026 10:42:11 +0100 (CET)
Date: Tue, 10 Feb 2026 10:42:11 +0100
From: Link Mauve <linkmauve@linkmauve.fr>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, peterz@infradead.org,
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org,
	ardb@kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
Message-ID: <aYr9c90CWAXZ3AVl@luna>
References: <20260209105456.1551677-1-mkchauras@gmail.com>
 <20260209105456.1551677-3-mkchauras@gmail.com>
 <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com>
 <b07f1bc6-c63e-4b97-95d6-c639186a89dd@kernel.org>
 <CANiq72nkVmE_91yz82e1cRuJK8F9SPP5GpD1mT=NYLBbRTL8OQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nkVmE_91yz82e1cRuJK8F9SPP5GpD1mT=NYLBbRTL8OQ@mail.gmail.com>
Jabber-ID: linkmauve@linkmauve.fr
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linkmauve.fr];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-75760-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linkmauve@linkmauve.fr,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linkmauve.fr,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 19C0A119028
X-Rspamd-Action: no action

Hi,

On Mon, Feb 09, 2026 at 01:48:01PM +0100, Miguel Ojeda wrote:
> On Mon, Feb 9, 2026 at 1:29 PM Christophe Leroy (CS GROUP)
> <chleroy@kernel.org> wrote:
> >
> > As far as I understand the patch is complete, the problem is outside the
> > kernel, it is in the libcore provided by rust or the rust compiler.
> >
> > That libcore seems to call __udivdi3() and __umoddi3() which are not
> > provided by the kernel. Instead if should call the functions do_div()
> > and friends provided by include/asm-generic/div64.h, or provide
> > __udivdi3() and __umoddi3() on its own.
> 
> Yeah, but what I mean is, should we add this if it doesn't link,
> especially without a note or comment of some kind? (Perhaps to your
> tracking issue in GitHub?)
> 
> i.e. if I understand correctly, you prefer to not add the panicking
> intrinsics to `rust/compiler_builtins.rs`, which I agree isn't ideal.
> By the way, it would be nice if IBM could join one of the meetings
> with have with upstream Rust to raise this topic again with them.

I’m just an unemployed contributor, with no ties to any of that but
sheer interest, would it be ok for me to join that call as well?  I am
interested in resolving that issue in core, only three types have that
issue and only in their formatting code so far.

> 
> In any case, it is up to you, of course. My only concern on the Rust
> bits is on the docs side, the rest looks fine.
> 
> Thanks!
> 
> Cheers,
> Miguel
> 

-- 
Link Mauve

