Return-Path: <linux-doc+bounces-11464-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3278722D5
	for <lists+linux-doc@lfdr.de>; Tue,  5 Mar 2024 16:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD2EBB21D05
	for <lists+linux-doc@lfdr.de>; Tue,  5 Mar 2024 15:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A9E1272D6;
	Tue,  5 Mar 2024 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xLwI3aAA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AA01272C4
	for <linux-doc@vger.kernel.org>; Tue,  5 Mar 2024 15:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709652666; cv=none; b=cqGN7Gb0HsMzNRJvogjG7J1RjDVh+qP7j5DxEozsYAt/DDTJ62rzhg/i9DkBOjx61PKQCEvaF+CH5828bfNqopJdMXtdDpw07mulsUnwHpo0JTxdtHhEMzLQA2qNE7ppPJEgjiGMZMw++8uxxY6PB9mssiht2ZzFf32s7+ZA4Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709652666; c=relaxed/simple;
	bh=MWZtdpDzT5uBPJyCi2jictePKr8MSUwQEsy7awmiRSk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gikwTriGdpKS9TrFi8PDIt6QK1F2OJeFnV+p+7hDP8p/Mzg6pvOa05ttCzXL8vGsB4leZkBgdHTpm03tMXLnACNqqe2Wtcu+8MJa7GZtAAWVrAUraipVYaXFr5GDXOJmm+yAmlphbXNrMiKHuwSsg+rTz6idvayeVOjwrOrmysI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xLwI3aAA; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a44d084bfe1so429090566b.1
        for <linux-doc@vger.kernel.org>; Tue, 05 Mar 2024 07:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709652663; x=1710257463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jFBfmrcURu1fWMu57pWuFBzvegWbvE+xd+YhP2c5sxY=;
        b=xLwI3aAASQ/kN2EtnsfQLg2xlGzdpC5Uc70sST2xDkI7u+SAr/txIwyCaRifaZoWIP
         k+C1ChlT0PYX9yz5eImu2g4FIH22Ko6mbUFBPtrkUXXTwDw7ibNJuPZrnr+bU/YjcLQk
         vPlIH6tW6Hiyx10fBWwU5wleUVHT0mRAwYaIbnwfE61WkE2XenKUwxloU/S4Gp1AP7B/
         UxOFpiKPi2Qdfg3/C5ZAMmyDJ7O5ylKPpqMetNFvC6Ja2ZhAmJ8x2MvmDnjtauPIhRdh
         DZt2/7QPQP3Kz0PfH0Xlcr2LEZ2bgEJUZfcjPHOdU/yerwyJbw4ctpTKF1DzJWcoHEMT
         ziCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709652663; x=1710257463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFBfmrcURu1fWMu57pWuFBzvegWbvE+xd+YhP2c5sxY=;
        b=rmfxmJu83BAL446Zu9lEPxq3l0e7Ggu1r+dDcPSXNgNoaqYWVMXtIsPCCpWkInfH7j
         k/9D4LvS6bw9a2JEu0K2xQ13JFXYgFfCazKFKlYco7plDkG+H74/UKTuUKVfqlIikrA3
         q88XcUb6ZHqQQ1IXQhuwBigmA1+WzdVq2lkjMBJxRgTnIaN1fK/oRiL6qvePDZ5WBiR/
         N0TFOPEDgyMX0HekixCd2C8Po0R26kKxatXpFO09aU+aSRVUe4bOWD3iOh0odAe1CTeF
         VKz5phR6lYFKR1jliNQdvIQjdPdI1dlxwXCX07uHzmk2c1R6xEjHNdpmxKrkxx6U5QL/
         M+aQ==
X-Forwarded-Encrypted: i=1; AJvYcCViOP+2U37kNuBNLR61TWzSBOVS8XfbWMl/FuZMANKTrbWGMQFICB9fkvTQdq74njmfMxKC6uCkZ60vYliplnfRWQTGmgupuShz
X-Gm-Message-State: AOJu0Ywqgv6GW5eCKd66O4xOf/Rl2wfbhlnHipqxMBJalALAUWaXXaRJ
	l/3ApQrQNOyAM0T6FAvteg1yz+S10wECGchQ3CfYIFvi7SM0p+aSSTwU5jLzGA==
X-Google-Smtp-Source: AGHT+IG865qowYD6hypu+joiq3mkfJptCDN2wk6XWC4gZD4eKgj4/V+czQN2m8CgWrMksvV0eTX+4A==
X-Received: by 2002:a17:906:4148:b0:a44:f89:a04e with SMTP id l8-20020a170906414800b00a440f89a04emr9475926ejk.35.1709652663164;
        Tue, 05 Mar 2024 07:31:03 -0800 (PST)
Received: from google.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id bw16-20020a170906c1d000b00a3fb9f1f10csm6146724ejb.161.2024.03.05.07.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 07:31:02 -0800 (PST)
Date: Tue, 5 Mar 2024 15:30:58 +0000
From: Quentin Perret <qperret@google.com>
To: Christoph Hellwig <hch@infradead.org>, Will Deacon <will@kernel.org>,
	Chris Goldsworthy <quic_cgoldswo@quicinc.com>,
	Android KVM <android-kvm@google.com>,
	Patrick Daly <quic_pdaly@quicinc.com>,
	Alex Elder <elder@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Murali Nalajal <quic_mnalajal@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Carl van Schaik <quic_cvanscha@quicinc.com>,
	Philip Derrin <quic_pderrin@quicinc.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: Re: Re: [PATCH v17 19/35] arch/mm: Export direct {un,}map
 functions
Message-ID: <Zec6shyjblcZvTG0@google.com>
References: <20240222-gunyah-v17-0-1e9da6763d38@quicinc.com>
 <20240222-gunyah-v17-19-1e9da6763d38@quicinc.com>
 <ZdhEtH7xzbzdhS2j@infradead.org>
 <20240223071006483-0800.eberman@hu-eberman-lv.qualcomm.com>
 <ZeXIWBLVWzVycm0r@google.com>
 <20240304094828133-0800.eberman@hu-eberman-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304094828133-0800.eberman@hu-eberman-lv.qualcomm.com>

On Monday 04 Mar 2024 at 15:37:41 (-0800), Elliot Berman wrote:
> On Mon, Mar 04, 2024 at 01:10:48PM +0000, Quentin Perret wrote:
> > On Friday 23 Feb 2024 at 16:37:23 (-0800), Elliot Berman wrote:
> > > On Thu, Feb 22, 2024 at 11:09:40PM -0800, Christoph Hellwig wrote:
> > > > On Thu, Feb 22, 2024 at 03:16:42PM -0800, Elliot Berman wrote:
> > > > > Firmware and hypervisor drivers can donate system heap memory to their
> > > > > respective firmware/hypervisor entities. Those drivers should unmap the
> > > > > pages from the kernel's logical map before doing so.
> > > > > 
> > > > > Export can_set_direct_map, set_direct_map_invalid_noflush, and
> > > > > set_direct_map_default_noflush.
> > > > 
> > > > Err, not they should not.  And not using such super low-level interfaces
> > > > from modular code.
> > > 
> > > Hi Cristoph,
> > >  
> > > We've observed a few times that Linux can unintentionally access a page
> > > we've unmapped from host's stage 2 page table via an unaligned load from
> > > an adjacent page. The stage 2 is managed by Gunyah. There are few
> > > scenarios where even though we allocate and own a page from buddy,
> > > someone else could try to access the page without going through the
> > > hypervisor driver. One such instance we know about is
> > > load_unaligned_zeropad() via pathlookup_at() [1].
> > >  
> > > load_unaligned_zeropad() could be called near the end of a page. If the
> > > next page isn't mapped by the kernel in the stage one page tables, then
> > > the access from to the unmapped page from load_unaligned_zeropad() will
> > > land in __do_kernel_fault(), call fixup_exception(), and fill the
> > > remainder of the load with zeroes. If the page in question is mapped in
> > > stage 1 but was unmapped from stage 2, then the access lands back in
> > > Linux in do_sea(), leading to a panic().
> > >  
> > > Our preference would be to add fixup_exception() to S2 PTW errors for
> > > two reasons:
> > > 1. It's cheaper to do performance wise: we've already manipulated S2
> > >    page table and prevent intentional access to the page because
> > >    pKVM/Gunyah drivers know that access to the page has been lost.
> > > 2. Page-granular S1 mappings only happen on arm64 with rodata=full.
> > >  
> > > In an off-list discussion with the Android pkvm folks, their preference
> > > was to have the pages unmapped from stage 1. I've gone with that
> > > approach to get started but welcome discussion on the best approach.
> > >  
> > > The Android (downstream) implementation of arm64 pkvm is currently
> > > implementing a hack where s2 ptw faults are given back to the host as s1
> > > ptw faults (i.e. __do_kernel_fault() gets called and not do_sea()) --
> > > allowing the kernel to fixup the exception.
> > >  
> > > arm64 pKVM will also face this issue when implementing guest_memfd or
> > > when donating more memory to the hyp for s2 page tables, etc. As far as
> > > I can tell, this isn't an issue for arm64 pKVM today because memory
> > > isn't being dynamically donated to the hypervisor.
> > 
> > FWIW pKVM already donates memory dynamically to the hypervisor, to store
> > e.g. guest VM metadata and page-tables, and we've never seen that
> > problem as far as I can recall.
> > 
> > A key difference is that pKVM injects a data abort back into the kernel
> > in case of a stage-2 fault, so the whole EXTABLE trick/hack in
> > load_unaligned_zeropad() should work fine out of the box.
> > 
> > As discussed offline, Gunyah injecting an SEA into the kernel is
> > questionable, but I understand that the architecture is a bit lacking in
> > this department, and that's probably the next best thing.
> >
> > Could the Gunyah driver allocate from a CMA region instead? That would
> > surely simplify unmapping from EL1 stage-1 (similar to how drivers
> > usually donate memory to TZ).
> 
> In my opinion, CMA is overly restrictive because we'd have to define the
> region up front and we don't know how much memory the virtual machines
> the user will want to launch.

I was thinking of using CMA to allocate pages needed to store guest
metadata and such at EL2, but not to back the actual guest pages
themselves. That still means overallocating somehow, but that should
hopefully be much smaller and be less of a problem?

For the actual guest pages, the gunyah variant of guestmem will have to
unmap the pages from the direct map itself, but I'd be personally happy
with making that part non-modular to avoid the issue Christoph and
others have raised.

Thanks,
Quentin

