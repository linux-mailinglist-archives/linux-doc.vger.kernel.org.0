Return-Path: <linux-doc+bounces-86010-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIN8OVnP+mn6SwMAu9opvQ
	(envelope-from <linux-doc+bounces-86010-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 06 May 2026 07:19:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 488284D6433
	for <lists+linux-doc@lfdr.de>; Wed, 06 May 2026 07:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5BB6301600F
	for <lists+linux-doc@lfdr.de>; Wed,  6 May 2026 05:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301C7234973;
	Wed,  6 May 2026 05:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LPoIOdmJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0AB25776;
	Wed,  6 May 2026 05:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778044759; cv=none; b=UOTynifL9N5bqsgNYh7dEMrf4J2JroMRKqAXwxMcSYnji/V5zi2pwqnluA31mWYkItwAxHSPj414pWX69yak1mtLqJjZSBd+C+mzRgdRR7qcNncOb2QFXX/9RwMkeaV7IIf3VQt8s+v5zpKfCco+IFNHlb+cVfJOfaB148y8AhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778044759; c=relaxed/simple;
	bh=/6HzevzmWkZ3iBt8WgOrKRUQugWcdSRwD40U8bGrsrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSACsQDUnevI9AAhflkttPYljjIZKLLH07lrtNAxWb2QcFuFI2NOsvVStIapJ9+VSxol6Lt6tHSd+AAY8EelXoYrh6AZ1to6VJ2p07YsnVdjYv89mJby52LyjLdUWtTPJGWiKjMQsiovuqxCip0Gnmu/4oNqXlTlGF9JO2kLTEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LPoIOdmJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12986C2BCB8;
	Wed,  6 May 2026 05:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778044758;
	bh=/6HzevzmWkZ3iBt8WgOrKRUQugWcdSRwD40U8bGrsrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPoIOdmJtYJK4r0AWKzFkG1cxOm5QYDdlWxCB6KtOTbbLe1HV8u9l6G4+0uMUqJcp
	 SKM44I1yhqsf0dp5hiB6YHTaINVOIC3iL/c0wu7/93qG/z/X/isQKGc6j1VQ3qgPfy
	 HFwtvRWVECdgzkEQomnWDKS98ZcmH/HVNeC1YNUA=
Date: Wed, 6 May 2026 07:18:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Raymond Newman <raymondcharlesnewman@gmail.com>
Cc: linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun@kernel.org,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] lib/gcd: Convert to Rust
Message-ID: <2026050647-eternity-either-08bb@gregkh>
References: <CAC5penpL_yet9HHqC=BNV_EP2wDe3zpsjFw77T8356veNV0rsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC5penpL_yet9HHqC=BNV_EP2wDe3zpsjFw77T8356veNV0rsw@mail.gmail.com>
X-Rspamd-Queue-Id: 488284D6433
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86010-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]

On Tue, May 05, 2026 at 09:37:26PM -0400, Raymond Newman wrote:
> >From 96902ad2caf167ca0377e0b2063973e2183465b4 Mon Sep 17 00:00:00 2001
> From: Raymond Newman <raymondcharlesnewman@gmail.com>
> Date: Tue, 5 May 2026 21:29:29 -0400
> Subject: [PATCH] lib/gcd: Convert to Rust
> 
> Convert lib/math/gcd.c to Rust. The binary GCD algorithm is preserved
> exactly, including both the efficient-ffs fast path and the even/odd
> fallback for CONFIG_CPU_NO_EFFICIENT_FFS targets.

This says what you are doing, but not why.  Why make this change?

> -static unsigned long binary_gcd(unsigned long a, unsigned long b)
> -{
> - unsigned long r = a | b;
> -

<snip>

whitespace is damaged and this does not apply.

thanks,

greg k-h

