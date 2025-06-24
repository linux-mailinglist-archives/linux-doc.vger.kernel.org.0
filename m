Return-Path: <linux-doc+bounces-50418-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F198AE704E
	for <lists+linux-doc@lfdr.de>; Tue, 24 Jun 2025 22:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01EEC5A1D24
	for <lists+linux-doc@lfdr.de>; Tue, 24 Jun 2025 20:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3DE2E8899;
	Tue, 24 Jun 2025 20:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NLSoZDyw"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C9A2EACE9
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 20:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750795509; cv=none; b=E4o8hc/LEmhQZnDCnifpXhcwPCrui4t9R9aQyCyH2vq69VFXCrpstyFI91dq7XS4zgwCfkM6TZeQDm2hU8FaSUFIWvDdqQJgftGNe9DcTtbcDzFYyQ+Oto+00TTjeR4NVEcf5FJbvgFXhdUkUZHQqcnqODVQPv8OZm2vpFxAbAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750795509; c=relaxed/simple;
	bh=RPF3bPV+itVK+0pJ7f0TUuUy5/dRgnn4yOTV9q1YTkM=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=HMW/jFDj6p1ILBGlTs6Fq/rQ+pkkFZH+zyNVl25pRIpqyV8G5X3Y4gQAYTFWbtJRHik01eWQGanV37+9qq05b6t/CPpW98qZZ6fa437C31f/mxuD3vkhLGFLzmIqDyPez/0jin52vc5/BcAqHMTEdT1WIRUzweKYY4vc23/pIq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NLSoZDyw; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-3ddd03db21cso13079035ab.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 13:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750795507; x=1751400307; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O0o3enCtFoZv08yCvYAb3ahMkA4aWNe6wCokY+DYhpY=;
        b=NLSoZDyw7DU09ROp+724llRroynWGN8DNiA1bqDRaLUpNI+YTdBZulAUpZEVKWfwrv
         7FCKv/6bJTDl/Wjpo9vhKLtO5sNX5GbZvmmnYv08TbFACjidJS95F72RJQa+fkVBiqLD
         SD+WuPeMhz39AF/sy2Sf35XbaCNjdUrYAq98jWOI8lzw98mvx1LaXRGlGv1x/tpgfI0a
         /WbtdMP8KbVrQxlf6hF/THcEMHBlmbrEBEVUdF0u2CxJhWx8HvQf3kfC9e/rHhSCS8kA
         obsvMICygLXLcknOC0aBEgzWGNHLTM1gfpdAoyKS6W0Wr0QQmaAESbzX5qCK3J6wAaRg
         ZwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750795507; x=1751400307;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O0o3enCtFoZv08yCvYAb3ahMkA4aWNe6wCokY+DYhpY=;
        b=eip5Dw0Ze4YlitiHBWa6CP2Ly5fWS3xfR7hm1eUQHALLfuDephkjahXjeaPMBx2Nl7
         KhxY8ev9G1UJf1FU19dgNvxYhqsbd6WDCqr7De7P+3Lkj+3UHwcKPPxSka8fSk4FopjK
         /KLjnxTGVJbzi0RyKjFNiWQYR9SVBZHpjr+W8nc4zyZyp1v85rKE1ZlgZLlrppe0Fqv2
         4xeAktRBsXrfuqbOm1LPyyrKtwRT8rky/y3f6aObHEJF7pHQru/Y8FKQWZvXaecbQYSK
         iekS+gJRE9ZNQr2Jq7eQjRv4UthlyEVKrEWBoJ63XB7JCfWpkLLT/pm0AdlqMpCsUEUo
         QsUg==
X-Forwarded-Encrypted: i=1; AJvYcCVt7zFlbnuZvNlg6/xWxWN8EAo0IqwDc/VzOloC6Qv8HTALK0XX0HIFZZJkqZAEpt36mlzI+gawnc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoLJqkbGc040z06U1rxI5ujDL8V7wHBhM4wdCPV43cEf1R1Qxb
	5H1xjRJlx2ySn3WUNxQFrJFltBdZTxxenO6AqSLSgYzUpI+ao19ZXwbOCUBcdIkc6wf3OX/Xh94
	0nDRuXI6OqB54P/H0GkYJ/U2SBQ==
X-Google-Smtp-Source: AGHT+IFRBaniVPLdqgtBiY+RRt9A60KwZhLUhr0WNUCFuq3s9GR9zjSj1vgrB9faZftbsD7qku7K0VwW+GoO4k+cFw==
X-Received: from ilbbr10.prod.google.com ([2002:a05:6e02:23ca:b0:3dd:7629:ec3a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:2163:b0:3dd:c04e:49af with SMTP id e9e14a558f8ab-3df327eeacfmr6647305ab.3.1750795506770;
 Tue, 24 Jun 2025 13:05:06 -0700 (PDT)
Date: Tue, 24 Jun 2025 20:05:05 +0000
In-Reply-To: <aFpThZIE2PxjVAVw@linux.dev> (message from Oliver Upton on Tue,
 24 Jun 2025 00:28:05 -0700)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntcyasaosu.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v2 01/23] arm64: cpufeature: Add cpucap for HPMN0
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Oliver Upton <oliver.upton@linux.dev> writes:

> On Mon, Jun 23, 2025 at 06:25:38PM +0000, Colton Lewis wrote:
>> Oliver Upton <oliver.upton@linux.dev> writes:

>> > On Fri, Jun 20, 2025 at 10:13:01PM +0000, Colton Lewis wrote:
>> > > Add a capability for FEAT_HPMN0, whether MDCR_EL2.HPMN can specify 0
>> > > counters reserved for the guest.

>> > > This required changing HPMN0 to an UnsignedEnum in tools/sysreg
>> > > because otherwise not all the appropriate macros are generated to add
>> > > it to arm64_cpu_capabilities_arm64_features.

>> > > Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> > > ---
>> > >   arch/arm64/kernel/cpufeature.c | 8 ++++++++
>> > >   arch/arm64/tools/cpucaps       | 1 +
>> > >   arch/arm64/tools/sysreg        | 6 +++---
>> > >   3 files changed, 12 insertions(+), 3 deletions(-)

>> > > diff --git a/arch/arm64/kernel/cpufeature.c
>> > > b/arch/arm64/kernel/cpufeature.c
>> > > index b34044e20128..278294fdc97d 100644
>> > > --- a/arch/arm64/kernel/cpufeature.c
>> > > +++ b/arch/arm64/kernel/cpufeature.c
>> > > @@ -548,6 +548,7 @@ static const struct arm64_ftr_bits  
>> ftr_id_mmfr0[] = {
>> > >   };

>> > >   static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
>> > > +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,
>> > > ID_AA64DFR0_EL1_HPMN0_SHIFT, 4, 0),
>> > >   	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,
>> > > ID_AA64DFR0_EL1_DoubleLock_SHIFT, 4, 0),
>> > >   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE,
>> > > ID_AA64DFR0_EL1_PMSVer_SHIFT, 4, 0),
>> > >   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE,
>> > > ID_AA64DFR0_EL1_CTX_CMPs_SHIFT, 4, 0),
>> > > @@ -2896,6 +2897,13 @@ static const struct arm64_cpu_capabilities
>> > > arm64_features[] = {
>> > >   		.matches = has_cpuid_feature,
>> > >   		ARM64_CPUID_FIELDS(ID_AA64MMFR0_EL1, FGT, FGT2)
>> > >   	},
>> > > +	{
>> > > +		.desc = "Allow MDCR_EL2.HPMN = 0",

>> > This feedback still stands...

>> > 		.desc = "HPMN0",

>> > [*] https://lore.kernel.org/kvm/aD4ijUaSGm9b2g5H@linux.dev/

>> Sorry for ignoring your previous feedback. I looked at the other .desc
>> fields and they had more descriptive English, so I think this one should
>> be more than "FEAT_HPMN0" for consistency.

>> If you insist I'll change it.

> I'm not exactly sold on the merits of using descriptive names for the
> capabilities, as the architecture extension names are exact terms that
> can be related back to documentation.

I'll change it.

