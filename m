Return-Path: <linux-doc+bounces-35038-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABE5A0B934
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jan 2025 15:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 230F1161047
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jan 2025 14:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8114223ED73;
	Mon, 13 Jan 2025 14:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="hSOIfovK"
X-Original-To: linux-doc@vger.kernel.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF6F23ED68
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 14:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736777709; cv=none; b=FsyCE6nujnj/LR4zqHYHtxZ2wu4rgH9A0Wo36UcfQdyRsTHY3XNPnzNGBzf3nu6dQNPjm9tCtWptwikjVZ36NDCagQ6a7rUJpXtF3m9G/+fQwPqTlpNQF0qib+Ke3BDXJ45341a6BD/vPrZa0tjv23L8CrzkDqWrpgKKAc7T8GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736777709; c=relaxed/simple;
	bh=gniWYhXWfG/kTIEpG2o605h1qixBRejJa9c4NLSlU58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXPPIBYkhV5+o4MfxC14AmUUYqW19daywtUcwDKwSrVZ1HQgNLJbHTtOw7CRA5UAAhdRJiRJ/NTjENQbYctzWlif5NgorywAcl2h4yLfKNBAh3r1Vz+ErfSQNiT7bgym8qOyeohUQOzLRZPoLytCQOHvZHh0db8wPqdPoyhOPKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=hSOIfovK; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from cwcc.thunk.org (pool-173-48-82-229.bstnma.fios.verizon.net [173.48.82.229])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 50DEDxax009455
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 09:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1736777643; bh=cstIT/Ge3hyyls2hAQtO81zaohHddliLPg+dh7uODCk=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=hSOIfovKFPLX72TdZC02j1laOT/1OIZdi+DpTQM8UDL5DTU0pM92n0WB+nQRJ5I5Y
	 y6kGFbVAMY6xM9LIIQ9OUeSKm+WQ+Jh5sJlUGCwGgyt0LC+GL42u3IAL+hrpFsvXaA
	 AiExrhGB8awNEgIQ3MVzP5UQKrZqS+oFYp5Zs8H3CzfuXXsk/FVJvg5ohhT8OyHF5/
	 f+n3MCGpywCVmD5uEpoA9lhPK4LssNFhh//W5+bemeo418sV/A6JRTCDbu38CKrTrf
	 Kl7JWNHd6IKC5youmtspCyAemnGQHyywA6R8tnYFXM3y+S9wR4UmVSBxMfJpM0SyTI
	 p2eLQR8JgBlRg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 6A20F15C0135; Mon, 13 Jan 2025 09:13:59 -0500 (EST)
Date: Mon, 13 Jan 2025 09:13:59 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Neal Gompa <neal@gompa.dev>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Sami Tolvanen <samitolvanen@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        tech-board@groups.linuxfoundation.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Dan Williams <dan.j.williams@intel.com>,
        "Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [PATCH 2/3] docs: submitting-patches: clarify difference between
 Acked-by and Reviewed-by
Message-ID: <20250113141359.GD1514771@mit.edu>
References: <20250112152946.761150-1-ojeda@kernel.org>
 <20250112152946.761150-3-ojeda@kernel.org>
 <CAEg-Je81VAYecajUjYVJKBJUT+YqKemWsWEoWFgOcF=vtfPRPw@mail.gmail.com>
 <CANiq72kQOrvi5=1RUScEpov79RNzA3vna9KW6MoYmj8XJZhpQQ@mail.gmail.com>
 <CAEg-Je9Cs54SkvhzbSq=2v2QYMo=mwUuGqFcs6cvi7nFgw6+Ug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEg-Je9Cs54SkvhzbSq=2v2QYMo=mwUuGqFcs6cvi7nFgw6+Ug@mail.gmail.com>

On Sun, Jan 12, 2025 at 11:35:29AM -0500, Neal Gompa wrote:
> I've had my Reviewed-by tags silently ignored or deliberately stripped
> because even though I've done a technical review, the maintainer does
> not believe that I did. Therefore, what I am saying is that
> maintainers seem to speciously decide whether an Acked-by or
> Reviewed-by tag is appropriate or not *after* someone has sent it.
> 
> This is the fundamental problem I have right now. This decision is not
> the maintainer's to make, it is the submitter's.

Nope, it's is *absolutely* the maintainer's to make.  If I don't trust
the reviewer, or reviewer is known to be someone who is only giving
English grammer or policy nit-picking, I am absolutely going to ignore
the reviewer, and in some cases, tell the patch submitter that should
feel to ignore the reviewer or feel that they should be obliged to pay
attention to certain reviewers.

Note also that a submitter is not obliged to resend a patch if someone
sends an Acked-by or Reviewed-by.  There are tools like b4 or
patchwork that will blindly add all tags, and then it's up to the
maintainer to remove any b.s. tags that maintainer doesn't feel up to
the subsystem's standards.

						- Ted

