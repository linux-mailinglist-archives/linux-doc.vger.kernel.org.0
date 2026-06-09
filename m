Return-Path: <linux-doc+bounces-91570-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O5rhK3nxJ2oq6AIAu9opvQ
	(envelope-from <linux-doc+bounces-91570-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 12:56:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1172E65F2FA
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 12:56:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=cQ6vg1Gz;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91570-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91570-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA752303CD15
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 10:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915563F9F3D;
	Tue,  9 Jun 2026 10:56:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6F32BEC3F
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 10:56:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002574; cv=none; b=f67fQKahPzhKWADhMnlvSQbVhldZJRHiYmnOcOTZt3xt9o1irCuTlDv74yyCufYgJf+lHqvIa6rD0xDPCAF1SU/BSOgbJ2BeQQFuTC/R/PHGeWo2lxD5gpU1ZoEDY+z9O7ewSVCuNxICwJ3U0jUfUzddGCp5Z3M95e5gi3IZWV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002574; c=relaxed/simple;
	bh=pVQ8NOIWiqEzwBktd16L0HeYTmPDW7Os+iLDh6FPSSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JU1Uyp7YitN+CVDT1d7Zt+BEKObbHsSfbqemjfzrO31UmzzKES82LFrFEfU5hNNsU0V3jUSo3b89eGoSIyco/4coisPod3VOQJmtCFh543LeWdSj28jDRUOBVt52KAcFx6Cb7oAzlk62VWyj3mLicrwstl47aknGcSEHtjElIzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cQ6vg1Gz; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf2d865383so435025ad.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 03:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781002571; x=1781607371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zdMxQIDs+l/KSPJFUNCwvqWbxtsN9baWYoGyb/P1vPg=;
        b=cQ6vg1GzVVdc3mcOeEPOPzVSfX4jZ6CZM2ya9wYX7qPg7kxQ8qK7EdAXDCJ3n4R/GX
         U7s7heGkFJJYDqOSpMP21+e6EAyucI7J3rDOTfjKdP84Z+cV+YV349HRsViR1FFMM3yf
         ZIKEci//OejBFAv/bUoHxaTOtJ8BJK+xnNS5anXuKRIZ1e0zK2jDPwEI+UNQDmPYT32J
         gNBZ5s69GRxpY3gsN9W1o5jPQa5U52cBnYkp0fYMsgohcexwn+NQGC6nQBLD+cBmiFYR
         Ua+NIsITyAaYAf7RbNzTRnuubzadI6Savqv7SAhSBpNuIYuPXdZBHDv1KiG/vvVEvnzF
         w59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002571; x=1781607371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdMxQIDs+l/KSPJFUNCwvqWbxtsN9baWYoGyb/P1vPg=;
        b=R5MW/MytLwE4vMJLh8HYXJ/x4nLvd6EZTW/4z5R1TbvCIHauGArB24oC2ymo45A5XJ
         44BZTni8R4gQUjNkWi41pVz79A/joLLkAIaSesC9B0CI53eDBPKWLsg7j5PDL2y4NuoL
         eiBR6SX/YuJuE//4Mf5QfPP8ddVjotANH7875c7eFQ0k/SFS7xoWwgcHBherIUMl0o6H
         f4m1kj9GVOIqJizRlpKSbfeyMJxozGFJKYFplJqRj3UDmFYc+3GO3R5rkOEt68sTYKZf
         G1jIJmMbr6LEl3FdkLjmUJfOhc2F9yxr28fsa9RdNy+74FS/8NqjOOexkHEO5UUMC462
         gh/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/9bKMYTm45xPG6foOVtket/FqYB/a68yTFBNP9qEezLlVZcbmr4yiBYdK32fMK9dl4drUBiBa1RHU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5WfVYauDGko3+FwHwnxi7qCMJeMXZw7cbfdDl8LAHiQyCC9RF
	VOSpQZhY/s0MQyZ3ZDtUyxOT0tNonmFpyQaILK6JZ3Tt4kvDSasrbOFDe34cTsaokQ==
X-Gm-Gg: Acq92OEha1XqGCch/Gyz7WcvTQbWer14EgJOJKObn4a9irNQAQPWook8q9Ryu6nyzpF
	TUPmD9yDs0+8QsX1aJlAGSUYQ/ETS3q1CUFqRyV+NRq6nIDiEhnKwcAHpPU9yzkACkgiRlgMV8w
	/IRU2Xud/VLy1YuAwNrVBOCL1dmLiTFYwihdhM7z/r6GE4Mht60aSNT8DdN5ocQcrJFIxHHyd8s
	6jhOFtPax0voVbQGgHNIMcLVxRZM4bwwyB5KQZvmz9N5nh6dtBvW+AzPpuLHQgymIugUJZ3JL/V
	W02v1D827ZQ2VRiHy9OYc6TFNNLWtgjn4O7meM+HbxAt/oZgVW+hEUAefIP8NKGvQULY7+B0gU+
	1cHdt/sz0Y6jRSeFhSpN1q3TupytEuA0Sf77+Ue2o9p/O0C/UBXoPO6yPuyPEr5LF1MHujE2I2n
	k/1CMJzzM5+lyeCEQ92Ez334uDYieyYiLO8yckz+pck+NnzgRmyYbs+lfenNfuNztXkGbojBs=
X-Received: by 2002:a17:902:f708:b0:2c1:ee6e:be23 with SMTP id d9443c01a7336-2c1ee6ec5ebmr6732565ad.33.1781002570788;
        Tue, 09 Jun 2026 03:56:10 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f711e52b0sm19480623a91.15.2026.06.09.03.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:56:10 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:56:01 +0000
From: Pranjal Shrivastava <praan@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 07/12] PCI: Refactor matching logic for pci_dev_acs_ops
Message-ID: <aifxQalxwM_hic6F@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-8-dmatlack@google.com>
 <aiW_M7y0fFwLN84G@google.com>
 <aic46OtIKfLhdoKy@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aic46OtIKfLhdoKy@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91570-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmatlack@google.com,m:kexec@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pci@vger.kernel.org,m:ajayachandra@nvidia.com,m:graf@amazon.com,m:alex@shazbot.org,m:bhelgaas@google.com,m:chrisl@kernel.org,m:rientjes@google.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:corbet@lwn.net,m:jrhilke@google.com,m:leonro@nvidia.com,m:lukas@wunner.de,m:rppt@kernel.org,m:parav@nvidia.com,m:pasha.tatashin@soleen.com,m:pratyush@kernel.org,m:saeedm@nvidia.com,m:skhawaja@google.com,m:skhan@linuxfoundation.org,m:vipinsh@google.com,m:witu@nvidia.com,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[praan@google.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_TRACE(0.00)[google.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1172E65F2FA

On Mon, Jun 08, 2026 at 09:49:28PM +0000, David Matlack wrote:
> On 2026-06-07 07:01 PM, Pranjal Shrivastava wrote:
> > On Fri, May 22, 2026 at 08:24:05PM +0000, David Matlack wrote:
> > > Refactor the logic to match devices to pci_dev_acs_ops by factoring out
> > > the loop and device matching into its own routine. This eliminates some
> > > duplicate code between pci_dev_specific_enable_acs() and
> > > pci_dev_specific_disable_acs_redir(), and will also be used in a
> > > subsequent commit to check if a device requires device-specific
> > > enable_acs() during a Live Update.
> > > 
> > > No functional change intended.
> > > 
> > > Signed-off-by: David Matlack <dmatlack@google.com>
> > > ---
> > >  drivers/pci/quirks.c | 50 ++++++++++++++++++--------------------------
> > >  1 file changed, 20 insertions(+), 30 deletions(-)
> > > 
> > 
> > [...]
> > 
> > >  } pci_dev_acs_ops[] = {
> > >  	{ PCI_VENDOR_ID_INTEL, PCI_ANY_ID,
> > > +	    .match = pci_quirk_intel_pch_acs_match,
> > >  	    .enable_acs = pci_quirk_enable_intel_pch_acs,
> > >  	},
> > >  	{ PCI_VENDOR_ID_INTEL, PCI_ANY_ID,
> > > +	    .match = pci_quirk_intel_spt_pch_acs_match,
> > >  	    .enable_acs = pci_quirk_enable_intel_spt_pch_acs,
> > >  	    .disable_acs_redir = pci_quirk_disable_intel_spt_pch_acs_redir,
> > >  	},
> > >  };
> > >  
> > > -int pci_dev_specific_enable_acs(struct pci_dev *dev)
> > > +static const struct pci_dev_acs_ops *pci_dev_acs_ops_get(struct pci_dev *dev)
> > >  {
> > >  	const struct pci_dev_acs_ops *p;
> > > -	int i, ret;
> > > +	int i;
> > >  
> > >  	for (i = 0; i < ARRAY_SIZE(pci_dev_acs_ops); i++) {
> > >  		p = &pci_dev_acs_ops[i];
> > > @@ -5481,33 +5475,29 @@ int pci_dev_specific_enable_acs(struct pci_dev *dev)
> > >  		     p->vendor == (u16)PCI_ANY_ID) &&
> > >  		    (p->device == dev->device ||
> > >  		     p->device == (u16)PCI_ANY_ID) &&
> > > -		    p->enable_acs) {
> > > -			ret = p->enable_acs(dev);
> > > -			if (ret >= 0)
> > > -				return ret;
> > > -		}
> > > +		    p->match(dev))
> > > +			return p;
> > 
> > Nit:
> > Should we check if (p->match != NULL) like we check for p->enable_acs &
> > p->disable_acs_redir(). 
> > 
> > Otherwise, it seems like we're mandating the existence of a match op in
> > the pci_dev_acs_ops here? Today, we just have two Intel entries in that
> > array, both of which need the match op. However, AFAICT, it shouldn't be
> > mandatory for future SoCs that might only need a simple vid + devid match
> 
> *shrug*
> 
> I would usually say those future SoCs should be the ones to make it
> optional if and when they need to.

Well.. that's fair I guess.

> 
> But making p->matc optional now isn't so bad:
> 
>         for (i = 0; i < ARRAY_SIZE(pci_dev_acs_ops); i++) {
>                 p = &pci_dev_acs_ops[i];
>                 if ((p->vendor == dev->vendor ||
>                      p->vendor == (u16)PCI_ANY_ID) &&
>                     (p->device == dev->device ||
> -                    p->device == (u16)PCI_ANY_ID) &&
> -                   p->enable_acs) {
> -                       ret = p->enable_acs(dev);
> -                       if (ret >= 0)
> -                               return ret;
> +                    p->device == (u16)PCI_ANY_ID)) {
> +                       if (!p->match || p->match(dev))
> +                               return p;
>                 }
>         }
> 
> I can include this in v7 if you would like.

I don't have a strong opinion here, this should be fine.
It's just that we have NULL checks for p->enable_acs and 
disable_acs_redir too. It'd be nice to keep the same pattern.

Thanks,
Praan

