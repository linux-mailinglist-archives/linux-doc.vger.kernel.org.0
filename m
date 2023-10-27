Return-Path: <linux-doc+bounces-1315-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8F37D9CB3
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 17:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4920D1C20F34
	for <lists+linux-doc@lfdr.de>; Fri, 27 Oct 2023 15:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3BE374C9;
	Fri, 27 Oct 2023 15:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XSELZgSa"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F9F18C0D
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 15:13:05 +0000 (UTC)
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D664512A;
	Fri, 27 Oct 2023 08:13:03 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 854F340E01A3;
	Fri, 27 Oct 2023 15:13:01 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Ip93a8Nmoodq; Fri, 27 Oct 2023 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1698419578; bh=88uG8fQ/pcglnPoy8DHeNW2ecP4diw5wSZOtnv8zvoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XSELZgSa6f1ADvHItURh+thVtFnFmGRGxPfM2Av5wqVsrUR68E83P7qWjMUR46a/h
	 IBnRzllKdfadkvF9hGNWERwpl7wJsc0MYRe5T9yNbewzWxAoI63E0W228jKVLooOO+
	 9/+6LFYcLpil1H7fgHWussh9N3M4tSQIlQaqDtB3timR3pqsW8iUW9uSybVoMFTVcp
	 YiFmbK8oxvvXLL90thZU3DEj2mFRwZgPIS/760eE5YItDsHuSdI5Dh+sKFwJWFW5Ft
	 bVlHj88EgClyGLzRJgX+GPSUDFH+prTaFhxY+2ActGkgJ3jgbKUKNaDE+DSyBg5SPT
	 bVL/yiebuD7Tm2jW9kwpp6Wh8tvFBCKRzmW/VZUK9VNyDUU87AT/9srnnIEWoQtpn8
	 xhEBpdRjmDbJvllidT9uKU+3IBpYvTZLEHa9xbYs13evpd8NgbeF0lsvsRugy9Xy8H
	 v2SltTe82zy5hImh/CiMjvXQbzhE36/00I0RnL1jSztUIuBZF42uelEPSJxoU1cyhI
	 kgjrWtk6lEYV06D9EAVJ8CD3BBvS1auHKY57uSuavwglIY/TBaA5sGpG84kEt+isOP
	 uTHCktYEQiNHyIdZ9FVvwVlUydWA6UxuG3P/2fliJC95NYfgrwsdt0kwIOt4XDyMJt
	 Ta80ww8ZlZxHKPS3yuFS7wpQ=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2F9C940E0173;
	Fri, 27 Oct 2023 15:12:32 +0000 (UTC)
Date: Fri, 27 Oct 2023 17:12:26 +0200
From: Borislav Petkov <bp@alien8.de>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
	ak@linux.intel.com, tim.c.chen@linux.intel.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alyssa Milburn <alyssa.milburn@intel.com>,
	Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v4 0/6] Delay VERW
Message-ID: <20231027151226.GIZTvTWuQUXdsmt6v3@fat_crate.local>
References: <20231027-delay-verw-v4-0-9a3622d4bcf7@linux.intel.com>
 <20231027144848.GGZTvN0AtGIQ9kBtkA@fat_crate.local>
 <20231027150535.s4nlkppsvzeahm7t@desk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231027150535.s4nlkppsvzeahm7t@desk>

On Fri, Oct 27, 2023 at 08:05:35AM -0700, Pawan Gupta wrote:
> I am going on a long vacation next week, I won't be working for the rest
> of the year. So I wanted to get this in a good shape quickly. This
> patchset addresses some security issues (although theoretical). So there
> is some sense of urgency. Sorry for spamming, I'll take you off the To:
> list.

Even if you're leaving for vacation, I'm sure some colleague of yours or
dhansen will take over this for you. So there's no need to keep sending
this every day. Imagine everyone who leaves for vacation would start
doing that...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

