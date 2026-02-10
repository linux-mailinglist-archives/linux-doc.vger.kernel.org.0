Return-Path: <linux-doc+bounces-75741-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFNVAF/CimkeNgAAu9opvQ
	(envelope-from <linux-doc+bounces-75741-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 10 Feb 2026 06:30:07 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 591001171BB
	for <lists+linux-doc@lfdr.de>; Tue, 10 Feb 2026 06:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E26A53001B43
	for <lists+linux-doc@lfdr.de>; Tue, 10 Feb 2026 05:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F50E32B989;
	Tue, 10 Feb 2026 05:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdLrkmj7"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39DD329E6B
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 05:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770701403; cv=none; b=SOAGkdgiyNZx9rwh7PpXuEyUh69wIYPeJg3lxH6hG8tIjboOc79YR/L1TBrZski1oyuvO47+YQHyOF0chMP2r45C9EaLhp1jMgAuLSthvthTL+0m9BgINr/LmusjrxeO0j7KDUDQhQGSRsAfraHsJklrg1VT6yEFGopX0cS92Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770701403; c=relaxed/simple;
	bh=R1TJuxsI503WfcCrotW5cXAfKLO0OybYlEBIncV0Swg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ztv9G2L+hFCQyJV3ulTWhQfb+8FP154uCl5nZ52eUb10tjeLdslQ3M6luB40Th9gWyV86cXPmU4l8WVZxCTK+L2UQWyEEa0yFoW5Teinknwm5VqjOWE8vICPsaLzNo04bK/4UDcCeO+G9jjYofVpO2+wPVx8aPkSL3wSyUM1G+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdLrkmj7; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35640ad94d3so428913a91.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 21:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770701402; x=1771306202; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fT9Mbpxo4W8Zi0n9UfpqQos4iWb4u6iEFbRZ4NRj4C0=;
        b=IdLrkmj7shgAWJUiu1p70jpifZGt4yu9WMiyjsCgR3YeP22FzWxlMpWWwIKedO/8u0
         /PoPRMgxcp625XMDxkx+wpNlpgifIYWlp16buj9U8BPGXFWxVtceQsMkk7yM8uMiMr2a
         ZOpHfiZXRtkkoYuKoxLFgtpsbd1YDf38Idp2jFI2LNz2cU/oiLBCs+ZONkMG7XZqYsAy
         sRydi5q5LEBCWJaZWMIWmDPmZIvdyHcJXXhcYwP5cWY6vyId7rpLS5I7Mg98OP3NNtXw
         2w6qUnpIPzFY6lEnUIZhlIangJLaBhN5LfhmeZCiiiY8MiGh92XvOgPHdozFT3JR5bva
         49ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770701402; x=1771306202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fT9Mbpxo4W8Zi0n9UfpqQos4iWb4u6iEFbRZ4NRj4C0=;
        b=OFxhF9rlCf0gCR1Ec3HQYe4O65rf2xRLo6UEai1IeROQvnsxyVfGbg/PXYC+SeAGuB
         182IBzkdee8rf6Ru9TDD8PSb/Rd1rM7CV2gxVCREePm7LQQXIiFeg2VlSn4Xg5+2865x
         4DOrXEYzAYQliZxwmVqeIfCSb4NDIGfOpJj6htr3n0jVfc4Nlazt734mDCwa6mVnVTYp
         s5hH5aPf/m5m5XXT18WzncoCLd6jj1scVwFfeRYAABgzV0C7H9nxbz8BXQ532SHTQHXO
         Nkm3pfPV9avnLh9PBCPErAo9oTH64jm3zJ5l6d7iNDslR5AVZOHKRvO4+mHmTMaCKHB6
         HtKg==
X-Forwarded-Encrypted: i=1; AJvYcCX7buVBh/VNzS32BCtegsvcM9bfeILVvjyGvCacV3x8+YSGM2oBwPfdBklE4MGYx+aqJbJdTlWd8UU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzChsit2Q/kSS0PCMxJheX2mdtk/J/Tq6uL7ctcAVHQuZwNPE7t
	WIhO5c7g/thC2Es/zz1NXlcYmoGGQr3qBHXcEGVjJIzzFogdxzyr+J68
X-Gm-Gg: AZuq6aIVsuiujXJg0MzPlCO+9BAus905noft32SWWEGw+AClsCQr6MJNWvF3vYYIcuD
	UAvBcBbJSK4wFjpLImsYmzcjerwENS8kmCKVPuApg6zjyKM0XPlDoUDdId0efYU3je43lQ+GSwh
	TSkiQNTiWgpLLRxhSOe0VlBQZSOUZzxHY6XghCePqTDZCze245xIuJtm1M4HSuPvMi4XhJlQhTV
	mSlm4Ksu0X9BD5vp6k/2Xl6viM5ebo0O4lxzlDqGFOwAQYHgNfAzjUoaqM4gy83FDhpucdts2AM
	lo4wqvfH4znMaJ8iyvsAUljTSDoDjYSJ23xHqM+6e2o6jxrlw9tJZp2QXffNqZOL568e+FUXA33
	QNu4OrzYy+5RuSsePLogtgtZ4VC2RSxR0Gq3wxh/MnRzowtk2BT2Kz3jNd9LYbCCDh4ilQAnWCN
	qvqnULVz5KGWbHM02wQSG0gikypzVuO//SqibHkWOCGwt7UHA/HX5RBo+jmmZ50VoHt9o=
X-Received: by 2002:a17:90b:3fc8:b0:355:35b0:8b88 with SMTP id 98e67ed59e1d1-35535b08f56mr8262973a91.32.1770701402185;
        Mon, 09 Feb 2026 21:30:02 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b465df46sm5168250a91.7.2026.02.09.21.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:30:01 -0800 (PST)
Date: Tue, 10 Feb 2026 10:59:53 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V4 3/3] powerpc: Enable Rust for ppc64le
Message-ID: <aYrCFCg2yEpCMPS9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260209105456.1551677-1-mkchauras@gmail.com>
 <20260209105456.1551677-4-mkchauras@gmail.com>
 <CANiq72=V4yyOwsxvWzGkXQAcMhoTaFZ8aNAe15Aa4BU9JtDGhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=V4yyOwsxvWzGkXQAcMhoTaFZ8aNAe15Aa4BU9JtDGhA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75741-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 591001171BB
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 12:52:26PM +0100, Miguel Ojeda wrote:
> On Mon, Feb 9, 2026 at 11:55 AM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > diff --git a/rust/Makefile b/rust/Makefile
> > index ae22f2c5f0b3..14febe9c7643 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -392,7 +392,15 @@ BINDGEN_TARGET_x86 := x86_64-linux-gnu
> >  BINDGEN_TARGET_arm64   := aarch64-linux-gnu
> >  BINDGEN_TARGET_arm     := arm-linux-gnueabi
> >  BINDGEN_TARGET_loongarch       := loongarch64-linux-gnusf
> > +
> > +ifdef CONFIG_PPC64
> > +ifdef CONFIG_CPU_LITTLE_ENDIAN
> > +BINDGEN_TARGET_powerpc := powerpc64le-linux-gnu
> > +endif
> > +else
> >  BINDGEN_TARGET_powerpc := powerpc-linux-gnu
> > +endif
> > +
> >  BINDGEN_TARGET_um      := $(BINDGEN_TARGET_$(SUBARCH))
> >  BINDGEN_TARGET         := $(BINDGEN_TARGET_$(SRCARCH))
> 
> This looks reasonable.
> 
> My only nit is that we could trigger an error in the nested if since
> you wrote the if already. Otherwise, we could remove the nested one
> until ppc64 is supported, or am I missing something?
> 
I will remove the nested if till we have support for the ppc64 big
endian.

Regards,
Mukesh
> Either way, for the Rust bits if powerpc maintainers are taking this:
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Thanks!
> 
> Cheers,
> Miguel

