Return-Path: <linux-doc+bounces-3375-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0147FBEBC
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 16:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B3961C20BE3
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 15:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F2735289;
	Tue, 28 Nov 2023 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3utn8bT"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA13F3526C
	for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 15:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311AEC433C8;
	Tue, 28 Nov 2023 15:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701187010;
	bh=ErOez7LtTIIlU6uCAGYZae93iSfxpHNPOaxqhC3H1FM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J3utn8bTcJ1cmN7Bvm3YfgFjGz08H29IA5GdCAsIqol/Dwe2eltl2dwCjTlyI8JsH
	 FFTXmB+EDNxEmtYPUmOdCKEfDyQrmcj7oBdr7zc+G4QmeAl/oZz8BERw2mDhr70Vhm
	 nGtJE5HFDnb5CbJ/jXjkxuQEOAeMeDH8JiVtftrkrNHaL3T2G32LzuOjGIQPMoq8VM
	 BOOkZEhNjlH8YVLKLHvJkmNruZ/xDga3NWglGHFPpZmiF0IuCfXEmiuE5SZPocz0JI
	 GwD3fnHOY54fJ56pLltUsxsiXWifjER3mQfEWXMjhrvsMUZ19nxiPPpZHpk+JWDPvf
	 wa4Q88tbBf6pw==
Date: Tue, 28 Nov 2023 16:56:45 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH] docs: Raise the minimum Sphinx requirement to 2.4.4
Message-ID: <20231128165645.2dbe416c@coco.lan>
In-Reply-To: <877cm2uegr.fsf@meer.lwn.net>
References: <87sf4qvkmc.fsf@meer.lwn.net>
	<20231128023015.0e446a06@coco.lan>
	<877cm2uegr.fsf@meer.lwn.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 28 Nov 2023 07:42:12 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab@kernel.org> writes:
> 
> > Em Mon, 27 Nov 2023 16:31:39 -0700
> > Jonathan Corbet <corbet@lwn.net> escreveu:  
> 
> >> diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
> >> index 1fb88fdceec3..db75b1b86086 100755
> >> --- a/scripts/sphinx-pre-install
> >> +++ b/scripts/sphinx-pre-install
> >> @@ -32,8 +32,7 @@ my $python_cmd = "";
> >>  my $activate_cmd;
> >>  my $min_version;
> >>  my $cur_version;
> >> -my $rec_version = "1.7.9";	# PDF won't build here
> >> -my $min_pdf_version = "2.4.4";	# Min version where pdf builds
> >> +my $rec_version = "3.0";  
> >
> > Please don't. 3.0 version has a broken C domain, not properly supported.
> > The fixes arrived only starting at 3.1 (I guess some went to 3.2, but
> > 3.1 is usable, as far as I remember).  
> 
> So you're asking for 3.1 or 3.2 instead of 3.0?

Yes. 

> 
> Honestly, I just picked 3.0 out of the air in the hopes of eventually
> deprecating 2.x.  Not lots of thought has gone into that
> number...perhaps we should recommend higher yet?

Well, we could recommend a higher version, but I can't see much
differences between 3.2 and the latest version: for what we use,
both will work on a similar way. Ok, layout may be different, there
were some improvements on PDF output, etc. but they will all produce
a decent documentation.

Yet, while most C domain bugs introduced on 3.0 were solved in 3.1
and 3.2, there's one still pending issue[1].

Once C domain finally gets rid from this long term bug that having:

	.. c:struct:: foo

	.. c:function:: void foo(void)

Produce warnings that "foo" id duplicated, then we'll have, IMO,
our next recommended version :-)

While Sphinx developers don't fix such bug, it doesn't really matter 
what version user will pick, so I would just pick the fastest one
as a recommendation, starting from 3.1 or 3.2 as our currently
recommended version.

[1] https://github.com/sphinx-doc/sphinx/pull/8313

While I didn't make any benchmarks, I remember people reported
poor performance with newer versions, so, without thinking to
much, 3.1 or 3.2 seems a good candidate for the recommended
version.

Regards,
Mauro

