Return-Path: <linux-doc+bounces-37796-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6762A31052
	for <lists+linux-doc@lfdr.de>; Tue, 11 Feb 2025 16:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A2DD162897
	for <lists+linux-doc@lfdr.de>; Tue, 11 Feb 2025 15:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DD4230D0E;
	Tue, 11 Feb 2025 15:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="D1V3Wsks"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF3DA936
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 15:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289231; cv=none; b=IhtMy2t1C3GO421FfE5ShZCmybhDRQMhGb7vgMVVgwJ0PsmiqiS3AjnteDsygJf5Wj7aglPkImxN8BuwiHiZYnpwl90BweeryWBd9WbyZ+zSZHxr+zRY5kUXfPI6zJHXwWLxz+X8RSYiA/EFtw8RSbKbnBKxOJ0+J8aDqyeJp64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289231; c=relaxed/simple;
	bh=EE9vJtpX2ATYq7P/iLIv2EffeX8mXF0GLCkxSw8mNPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRaFKVf4PRP6W1ZoPqxT8OdrnLj5kruGc2oXC1ksFG+dsUCZQzmJYZxcQBy+M1cAAhvuQSBgvQPXkKm7Jg4caZvhK1oQFwON0uy8Mdp+DEumjQhO5eIX7v36pkMeQYStaHXkXX0YOnONIWPJswjfbMFfim/tsM0KZOgpBTlfI7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=D1V3Wsks; arc=none smtp.client-ip=185.125.25.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4YsmFj3wGMzx79;
	Tue, 11 Feb 2025 16:53:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1739289225;
	bh=5dB7dfUt9R+xnA5SyptKswlOeTlbGATlu2wrqdeEMAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1V3WsksWC1wV2rg8K0P41e/r1chTlmz+22427sCrc/jpgkZ5x6gDzVSAuYSNjMOm
	 /8ROun5lPSbe5S1Ibm4ORSzL/qDQTJP4ikVKvLqGnmWWDReJfCQWhfSpvA7DzD1AXp
	 6rOihGuy2fVpDmog2BCqNCCg6mTml/1wRMtWS56Y=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4YsmFh6mfHz16Vp;
	Tue, 11 Feb 2025 16:53:44 +0100 (CET)
Date: Tue, 11 Feb 2025 16:53:44 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Alejandro Colomar <alx@kernel.org>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	linux-security-module@vger.kernel.org, Tahera Fahimi <fahimitahera@gmail.com>, 
	Tanya Agarwal <tanyaagarwal25699@gmail.com>, Daniel Burgener <dburgener@linux.microsoft.com>, 
	tools@kernel.org, linux-doc@vger.kernel.org, linux-man@vger.kernel.org
Subject: Re: [PATCH 1/2] landlock: Minor typo and grammar fixes in IPC
 scoping documentation
Message-ID: <20250211.ieSoo7Phe5oh@digikod.net>
References: <20250124154445.162841-1-gnoack@google.com>
 <20250211.Ree5bu6Eph2p@digikod.net>
 <22olfm76rcgjfs4vrr3adtbznsnz47kaehlr3ljn6e5jkc6waq@ue7azstxlwfv>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22olfm76rcgjfs4vrr3adtbznsnz47kaehlr3ljn6e5jkc6waq@ue7azstxlwfv>
X-Infomaniak-Routing: alpha

On Tue, Feb 11, 2025 at 04:27:04PM +0100, Alejandro Colomar wrote:
> Hey Mickaël!

Hey!

> 
> On Tue, Feb 11, 2025 at 04:17:30PM +0100, Mickaël Salaün wrote:
> > On Fri, Jan 24, 2025 at 03:44:44PM +0000, Günther Noack wrote:
> > > * Fix some whitespace, punctuation and minor grammar
> > > * Add a missing sentence about the minimum ABI version,
> > >   to stay in line with the section next to it
> > > 
> > > Cc: Mickaël Salaün <mic@digikod.net>
> > > Cc: Tahera Fahimi <fahimitahera@gmail.com>
> > > Cc: Tanya Agarwal <tanyaagarwal25699@gmail.com>
> > > Signed-off-by: Günther Noack <gnoack@google.com>
> > 
> > Looks good, thanks!
> > 
> > I'm going to take this patch in my tree with the changes explained
> > below. You can send a v2 with the second patch according to the reviews.
> > 
> > As a side note, applying the patch series from this thread with b4
> > doesn't work because they apply to different repositories.
> > 
> > Dealing with duplicated doc in two repositories is not practical and
> > adds work to everyone...  Could we move the non-libc syscall man pages
> > to the kernel repository?
> 
> Let me suggest the opposite: Could we move the kernel docs to manual
> pages in man9?  (As is the historic place for kernel docs.)
> (You could keep man9 in the kernel tree if you want, or could handle it
>  to the Linux man-pages project, if you want.)  That would help have a
> more clear separation between the two sets of documentation, and prevent
> duplication.

I didn't know about man9 but it's not clear to me what would be the
content.  Because I want new kernel features to come with proper tests
and documentation, it would be much easier to apply all these patches to
the same repository, at the same time.  Using the same repository should
also help to synchronize documentation with code changes.

One remaining issue would be that some generated documentation come from
the kernel source files, especially the UAPI headers, which also helps
maintaining the documentation in sync with the code.  What would you
suggest to improve the current workflow?

> 
> I personally don't like the idea of having man2 in the kernel tree.
> Michael Kerrisk already mentioned several reasons for why it's a bad
> idea in the past.  On top of them, I'd add that the build system of the
> Linux man-pages project is quite more powerful than the kernel one, and
> it would be an important regression to have to adapt to the kernel
> Makefiles in the manual pages.

For the Landlock syscalls case, could we move the syscall documentation
to man9?

> 
> 
> Have a lovely day!
> Alex
> 
> -- 
> <https://www.alejandro-colomar.es/>



