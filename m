Return-Path: <linux-doc+bounces-9850-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFFE858832
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 22:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44B8E286C27
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 21:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9ED1474C0;
	Fri, 16 Feb 2024 21:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="Z0huVsDe"
X-Original-To: linux-doc@vger.kernel.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0C3145B03
	for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 21:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708119965; cv=none; b=PDTu2yiUjRK4P3SV892un3azxg3JQfd9Lba8IC3aZzS9OpPd3i9bM46H0RC5YSJNM/brv1aYKBiuznlrJ86AtfjyFcmJOYdTJZdRPmB6PVvehuDmyaMIBHtdtFvilUCUMoqgkSh9oh/4G2LXVi/Ph/BdQ+NAw77/nn2N4IjF5wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708119965; c=relaxed/simple;
	bh=o0ndNCuW/LGkSeAXqoK2Hh0K+6mw4AiIuP9CZwqmqZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ha/GPHlwVLZWHxrTFTZSk2+1QZudmirAvQYSFu6T1z5vZdjQAkOKZNa+Lmc5LP5NnLl/DZ5dVM1I2oDpTDA258fiZZK6isZOgQdAB7FDfD5TTzoAgNkzH8vgnWGQbKzzxZ4v/hk05S4aN2y65aRXk1HUrSus5pWhKtQ2UmMzQxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=Z0huVsDe; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from cwcc.thunk.org (pool-173-48-116-68.bstnma.fios.verizon.net [173.48.116.68])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 41GLjLRn027258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 16:45:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1708119925; bh=qX3u18CRlr9QIqISpdJUxdSosa3u7KUTMQrg629TsYY=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=Z0huVsDeqd9GAdZu8WotBIJJhNJ7TRQBHuR0dYi51rt+y7Tb9Fr2zamV4RsUxNCDH
	 hKaQiX3bjLkgl+FruGnCLynXeZ4NtqL1fiL84OVccG7/dtMxpVVsba3to8WcwyTyGr
	 QOD/dzYfmyVqgGY7/P2iIpt0Vu3QmTQLETnqpuQLTqNUVGciJpAFwZkxjbEnqp6i4U
	 WjF11+JfB+ZBM0AL8R7/U+R3q/sUDMILBXlIf90Fr7O4sG1G1Cqza9EB3ky0Pf+074
	 odVEA7cSYStvHpU0EZkA8ECr2MkMNB2KJMk2FV5okZcb9lrAq1BCuMQu7gez9EvJvg
	 cTtqws76t9BoA==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id BD7C415C0336; Fri, 16 Feb 2024 16:45:21 -0500 (EST)
Date: Fri, 16 Feb 2024 16:45:21 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Jiri Kosina <jikos@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, corbet@lwn.net,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, security@kernel.org, linux@leemhuis.info,
        Kees Cook <keescook@chromium.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Sasha Levin <sashal@kernel.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v4] Documentation: Document the Linux Kernel CVE process
Message-ID: <20240216214521.GC549270@mit.edu>
References: <2024021500-laziness-grimace-ed80@gregkh>
 <20240216192625.o3q6m7cjgkwyfe4y@treble>
 <nycvar.YFH.7.76.2402162108370.21798@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2402162108370.21798@cbobk.fhfr.pm>

On Fri, Feb 16, 2024 at 09:27:48PM +0100, Jiri Kosina wrote:
> 
> Now that you have played the distro card (thanks!) here, let me just copy 
> my comment from LWN where someone suggested "well, it's easy, it's the job 
> of the [paid] distros to do the triage" ...
> 
> The problem is, that with this new system, paid distros are going to 
> suffer a big time (with no benefit to anybody at all). We'll have to put a 
> lot of productive and creative (upstream) work on hold in order to have 
> enough resources to sort out the havoc that LTS team is apparently going 
> to create by DoSing the world with a truckload of irrelevant CVEs.

My observation is that the old system has had pretty low-quality
CVE's, and worse, overly inflated CVE Severity Scores, which has
forced all people who are supporting distro and cloud serves which
sell into the US Government market to have to do very fast releases to
meet FedRAMP requirements.  At least once, I protested an overly
inflated CVSS score as being completely b.s., at a particular
enterprise distro bugzilla, and my opinion as the upstream developer
was completely ignored.

So quite frankly, at least one enteprise distro hasn't impressed me
with avoiding low quality CVE's and high CVSS scores, and so I'm quite
willing to give the new system a chance.  (Especially since I've been
told that the Linux Kernel CVE team isn't planning on issuing CVSS
scores, which as far as I'm concerned, is *excellent* since my
experience is that they are quite bogus, and quite arbitrary.)

	      	   	     	   	  - Ted

