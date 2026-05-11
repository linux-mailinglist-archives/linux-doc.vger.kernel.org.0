Return-Path: <linux-doc+bounces-86913-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMkKJQApAmpNogEAu9opvQ
	(envelope-from <linux-doc+bounces-86913-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 21:07:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A66D514D90
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 21:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19AE5301FF85
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 19:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87934BC02E;
	Mon, 11 May 2026 19:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0DgK+rS"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B525B33F589;
	Mon, 11 May 2026 19:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778526459; cv=none; b=u823U3lG9vhmwlSGFwX9f3avMuns8NGnHhJAdox455idq4EEiWtk55w65OP6srwpyFrUYrbFoYv1Y5ShI1I4o09tBE+cojQJ2EGUEB8FUgORZfs3QCdusXu7jKQY0cob7VrRTTXlv/OsUZ/X5Lk0BW4BBJFQrdDRDRjGGpmq/vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778526459; c=relaxed/simple;
	bh=oxPWgek8r4UxkLZxM42lUbrH31NIfQUyuyqQNVAYhXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnBsiYVpW3HvGEJx+mdSaupYNjDjfhnXxjAaAwRIMxW+LC/1LbqNjBSV9FhPPYCFv5zG8IF6/OS1svX5j0zxpZQoWp1raldvarAa4/MQlVNSw9mXdN23Cz32IeaOy4dMRsyLLxjzgpKTyn2sE+/WQwbwENhv+oeP2coYcpaMkWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0DgK+rS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C77C2BCB0;
	Mon, 11 May 2026 19:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778526459;
	bh=oxPWgek8r4UxkLZxM42lUbrH31NIfQUyuyqQNVAYhXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X0DgK+rSgrEhF9VdYXEyTaGodwl8qonNniFbn305WuBca5BVNDdjTwYWhie0jBpgQ
	 NQOO+Ctg0EK2fMwXZY3opqblRoMyBN0scLR0sA+XZsDHu8Bh5iO0CuBhlXQGJxVRgK
	 YAK+Vrk35u+MhDhpEBgDQ+j9titvAPZQg+LQ8YnSpiuFQck91hv0Fm//nr6mAWZ729
	 BLTc7wFCXB+aB8D3Gk3DP60SL1bXT81AmFsLovg2A9ZQBG1nTeuupwL8uAse7ArzdC
	 5TalVXqdVXjKEmIk5dJq1hM2j61Rz46fgGPJmed5DdtCTZ8b0BPNQEUbsMNVazIMP/
	 6ntbxg2aYti+w==
Date: Mon, 11 May 2026 12:07:38 -0700
From: Kees Cook <kees@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Manuel Ebner <manuelebner@mailbox.org>, andy.shevchenko@gmail.com,
	apw@canonical.com, corbet@lwn.net, dwaipayanray1@gmail.com,
	joe@perches.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com,
	skhan@linuxfoundation.org, workflows@vger.kernel.org
Subject: Re: [PATCH 1/2] [PATCH 1/2] Doc: deprecated.rst: add strlcat()
Message-ID: <202605111206.ECA86141@keescook>
References: <20260510164907.57176-2-manuelebner@mailbox.org>
 <20260510165159.57457-2-manuelebner@mailbox.org>
 <CAMuHMdWchXXcMyShiMZrhFTrHoB-TcKQEBcRoCTJFpwJsxxdhg@mail.gmail.com>
 <20260511142649.463c3ea5@pumpkin>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511142649.463c3ea5@pumpkin>
X-Rspamd-Queue-Id: 1A66D514D90
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86913-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux-m68k.org,mailbox.org,gmail.com,canonical.com,lwn.net,perches.com,vger.kernel.org,linuxfoundation.org];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 02:26:49PM +0100, David Laight wrote:
> On Mon, 11 May 2026 13:40:55 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
> > Hi Manuel,
> > 
> > On Sun, 10 May 2026 at 18:52, Manuel Ebner <manuelebner@mailbox.org> wrote:
> > > add strlcat and alternatives  
> > 
> > Thanks for your patch!
> > 
> > > --- a/Documentation/process/deprecated.rst
> > > +++ b/Documentation/process/deprecated.rst
> > > @@ -162,6 +162,12 @@ if a source string is not NUL-terminated. The safe replacement is strscpy(),
> > >  though care must be given to any cases where the return value of strlcpy()
> > >  is used, since strscpy() will return negative errno values when it truncates.
> > >
> > > +strlcat()
> > > +---------
> > > +strlcat() must re-scan the destination string from the beginning on each
> > > +call (O(n^2) behavior). Alternatives are seq_buf_puts(), seq_buf_printf(),
> > > +snprintf() and scnprintf()  
> > 
> > The last two not only require the caller to keep track of the offset
> > in the buffer, but also using "%s" when storing passed strings.
> 
> Which also means they are significantly slower.
> Mind you, some code has:
> 	strlcat(buf, "\n", SIZE);
> 	return strlen(buf);
> which carefully scans the string twice.
> Since the '\0' isn't always needed (eg 'show' functions), this can be:
> 	len = strlen(buf);
> 	buf[len] ='\n';
> 	return len + 1;
> Of course, the code could often easily get the length by other means.

I think I'd prefer to only recommend using seq_buf API. Or for sysfs,
sysfs_emit() as seq_buf hasn't been extended there yet.

-Kees

-- 
Kees Cook

