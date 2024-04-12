Return-Path: <linux-doc+bounces-14047-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE31C8A373F
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 22:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CCDA282256
	for <lists+linux-doc@lfdr.de>; Fri, 12 Apr 2024 20:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434F9249E8;
	Fri, 12 Apr 2024 20:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="J8bIf7s4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70E6405CF
	for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 20:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712954931; cv=none; b=LSIoWqvY1tYwxZiOfPXRMcGZ003YlC6vEG91V9cyx59RsUZjko2yt8gB+49bKmEbrmtaCxL5kpvuCCHRWsnDQ2YaEMXZdt+QAsd9Z27ezUp0+ziDIDjnSaaxzwdlbkyPXXKAtKpAvb1m7jZGRHhEVpBTtFFbwFyUWVPr0vafH/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712954931; c=relaxed/simple;
	bh=KzTQ615Mv6vx3Pd26LD1yrwtq3aAn4qXYzo6CfQ2EVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcSQp95xPR5v1fZYiIeeRHdgzpUzUPFpai+lexICzqW4Lmu+vd1jnbogd40eLP4+jxXvRC1Csh326D7yGgZVk0gz5CgePQGyCmbQbtwjWe5BI2ifS8gTSiy1pS0yzCsrLbs/O6K1gZkVLB4z59RbTNhL7dlVJiJkfc1yejQMLRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=J8bIf7s4; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ecf05fd12fso1247602b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2024 13:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712954929; x=1713559729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=527J/UVq95aFiyhIuaQGyZZWXZ7DJpQjeKIDhjey1CQ=;
        b=J8bIf7s4lvzgmuzcNdVo0pREZ3JZTySbXJInXCaPpEJEtiji8ieWThzpdPJCM1HhXl
         GD7mYWXXhGYCbgf+zwtxCqrnM8carmyyby5J2UsFW3u/PG+mhtrITThCgh5ZLzQysrtx
         xk2LBw4+W5dSjlc6AGEeYDIej3h5P09kJxzYvDxGIUNULgPzjlHxySDGnMwlJgg5+9lH
         awVcu9+jAHr4xKWt1f1hVQRW6Bno+ZENsryA0c9Yw/dhZGaOnLKaC7FadViXvPl30ueA
         jpN5IEEZjPY2VizM46QxHR3wZoFi5TWwr3+U1Pu8StQdEPWGo0HKtdEzMVXd+6VSO4Wo
         nnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712954929; x=1713559729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=527J/UVq95aFiyhIuaQGyZZWXZ7DJpQjeKIDhjey1CQ=;
        b=YF7a4R/Dsd+an/qr9upbOyMUgNFErO1dU1QRIqK9Fw6OM40IbSmhuaFA6vAikyZ6+Z
         cxXw0Sppw3YR4iq89Sh1Ed+o76jrlHofsFvRtBeDei9Bu97iRb1cRi44eeCztN1HZhu/
         vuehEWfZf/WJ0O3B5NOgwRvZU830f/qf0M42mmW5ybXvTUlzcaNLM+0yowjDtcxBByMj
         TCVFqXoymfH03TeMCcONHLQTGKdwjp9snnZAftiAGxQANio15i1a/nN2CUpsmc/PTyhi
         MBeW1mL2k1FWaAYVSZckcKaG/Uj781cobZsBmvdx2LJnIkpKG+QxlVViBy51g+S1DRLy
         +faw==
X-Forwarded-Encrypted: i=1; AJvYcCU0f6D4RfMK0GZt10Km4yI/n9VWFKK9rKfPJyPxKIdV9OvV0UA4jgrQ0d8PA+6xwuGdzcOThEh+9t6KKKmMuKTMVKooE2WQzsG7
X-Gm-Message-State: AOJu0YzwiLFDwkLVPBOyjiGWJS6AhQsncmzPBD7+GH0f3OVpJYVVWwzc
	+HvkBmJnqxTE4eoJXnaaw37GDard1pFy8dlaC9d6atEVCYDtCGvg2XbHmLSiYHE=
X-Google-Smtp-Source: AGHT+IHExcx+PpY1vNf1/BTSjm7xk9HHHkwj+AuQJzMGgY3j/gTBgIIjVbVwL17X10Ibh91JU+hVeg==
X-Received: by 2002:a05:6a21:8802:b0:1a7:2924:7317 with SMTP id ta2-20020a056a21880200b001a729247317mr4794308pzc.49.1712954928983;
        Fri, 12 Apr 2024 13:48:48 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id e15-20020a17090301cf00b001e2a4499352sm3399440plh.262.2024.04.12.13.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 13:48:48 -0700 (PDT)
Date: Fri, 12 Apr 2024 13:48:46 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <ZhmeLoPS+tsfqv1T@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
 <20240412-tuesday-resident-d9d07e75463c@wendy>
 <ZhlrdGXfSushUNTp@ghost>
 <20240412-eastcoast-disparity-9c9e7d178df5@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412-eastcoast-disparity-9c9e7d178df5@spud>

On Fri, Apr 12, 2024 at 07:47:48PM +0100, Conor Dooley wrote:
> On Fri, Apr 12, 2024 at 10:12:20AM -0700, Charlie Jenkins wrote:
> > On Fri, Apr 12, 2024 at 11:25:47AM +0100, Conor Dooley wrote:
> > > On Thu, Apr 11, 2024 at 09:11:08PM -0700, Charlie Jenkins wrote:
> > > > The riscv_cpuinfo struct that contains mvendorid and marchid is not
> > > > populated until all harts are booted which happens after the DT parsing.
> > > > Use the vendorid/archid values from the DT if available or assume all
> > > > harts have the same values as the boot hart as a fallback.
> > > > 
> > > > Fixes: d82f32202e0d ("RISC-V: Ignore V from the riscv,isa DT property on older T-Head CPUs")
> > > 
> > > If this is our only use case for getting the mvendorid/marchid stuff
> > > from dt, then I don't think we should add it. None of the devicetrees
> > > that the commit you're fixing here addresses will have these properties
> > > and if they did have them, they'd then also be new enough to hopefully
> > > not have "v" either - the issue is they're using whatever crap the
> > > vendor shipped.
> > 
> > Yes, the DT those shipped with will not have the property in the DT so
> > will fall back on the boot hart. The addition of the DT properties allow
> > future heterogenous systems to be able to function.
> 
> I think you've kinda missed the point about what the original code was
> actually doing here. Really the kernel should not be doing validation of
> the devicetree at all, but I was trying to avoid people shooting
> themselves in the foot by doing something simple that would work for
> their (incorrect) vendor dtbs.
> Future heterogenous systems should be using riscv,isa-extensions, which
> is totally unaffected by this codepath (and setting actual values for
> mimpid/marchid too ideally!).
> 

I am on the same page with you about that. 

> > > If we're gonna get the information from DT, we already have something
> > > that we can look at to perform the disable as the cpu compatibles give
> > > us enough information to make the decision.
> > > 
> > > I also think that we could just cache the boot CPU's marchid/mvendorid,
> > > since we already have to look at it in riscv_fill_cpu_mfr_info(), avoid
> > > repeating these ecalls on all systems.
> > 
> > Yeah that is a minor optimization that can I can apply.
> > 
> > > 
> > > Perhaps for now we could just look at the boot CPU alone? To my
> > > knowledge the systems that this targets all have homogeneous
> > > marchid/mvendorid values of 0x0.
> > 
> > They have an mvendorid of 0x5b7.
> 
> That was a braino, clearly I should have typed "mimpid".
> 
> > This is already falling back on the boot CPU, but that is not a solution
> > that scales. Even though all systems currently have homogenous
> > marchid/mvendorid I am hesitant to assert that all systems are
> > homogenous without providing an option to override this.
> 
> There are already is an option. Use the non-deprecated property in your
> new system for describing what extesions you support. We don't need to
> add any more properties (for now at least).

The issue is that it is not possible to know which vendor extensions are
associated with a vendor. That requires a global namespace where each
extension can be looked up in a table. I have opted to have a
vendor-specific namespace so that vendors don't have to worry about
stepping on other vendor's toes (or the other way around). In order to
support that, the vendorid of the hart needs to be known prior.

I know a rebuttal here is that this is taking away from the point of
the original patch. I can split this patch up if so. The goal here is to
allow vendor extensions to play nicely with the rest of the system.
There are two uses of the mvendorid DT value, this fix, and the patch
that adds vendor extension support. I felt that it was applicable to
wrap the mvendorid DT value into this patch, but if you would prefer
that to live separate of this fix then that is fine too.

- Charlie

> 
> > The overhead is
> > looking for a field in the DT which does not seem to be impactful enough
> > to prevent the addition of this option.
> > 
> > > 
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > 
> > > > @@ -514,12 +521,23 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
> > > >  				pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> > > >  				continue;
> > > >  			}
> > > > +			if (of_property_read_u64(node, "riscv,vendorid", &this_vendorid) < 0) {
> > > > +				pr_warn("Unable to find \"riscv,vendorid\" devicetree entry, using boot hart mvendorid instead\n");
> > > 
> > > This should 100% not be a warning, it's not a required property in the
> > > binding.
> > 
> > Yes definitely, thank you.
> > 
> > - Charlie
> > 
> > > 
> > > Cheers,
> > > Conor.
> > > 
> > > > +				this_vendorid = boot_vendorid;
> > > > +			}
> > > 
> > 
> > 



