Return-Path: <linux-doc+bounces-92436-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 29aEEh57MGpyTgUAu9opvQ
	(envelope-from <linux-doc+bounces-92436-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 00:22:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9993F68A58D
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 00:22:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=EpaMHd8K;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92436-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92436-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 260F03059098
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 22:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBF13385A5;
	Mon, 15 Jun 2026 22:22:15 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1907A2BF3D7
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 22:22:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781562135; cv=none; b=U7pQqigqLcbowzUQKXtyqwByvjxEhid0REHY7CDmTTe9zDltZTlCLnvdHd777yOknkjOoMYPIErRYYvwbsMaqiV3xmc8LddGRryhoJFKTmmnCBvMxMfd/cnOXYCdX8EAoz8ZImfJojkGmdfe9v6HLE93mvuLmqTvjlC6KQA3zZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781562135; c=relaxed/simple;
	bh=YTsGeFHrlrNRnvh1NKy/H1LYFF1M6SsuTR9Bzd0PtOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRQ46WWE561HPG360SRQ2tYnv5247XGLHSiSgXpp/GoWTd2nay6rf76IcpLeFPHr6amrTO/J6ZJcd2Wy84fJKO/KVSBJfFCYG02S0Qi8rb0VyHscprfwYZlR1S4PBxotkfQADrTok8cQVxN/hNdC3+RIqaQLbPgNFsToK1LH5Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EpaMHd8K; arc=none smtp.client-ip=209.85.210.172
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-842288702fbso1827050b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 15:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781562132; x=1782166932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1hI+H0ca4Dm+4Rh5RqmuKXgYDTibOfqOeSOBb1qqYIE=;
        b=EpaMHd8KqLqbK2DuCr3DorDsYW8x8mpE6/JAZ3pr1udTpGbF/4i6pQnfBUlh4ANkE7
         M5WbjP0RSGumzyCroU4xQgTS6FN2/itPF2BlV0gYd9VeY9cTHA11t2LugtIw4gRRqBh0
         B+i3nw2Xz4Xk9DU+BPj4/ZAzRaU7LKiyGIVfty1ZVdrrJX/fcTGiJCEQB3KAEMQ+GKW4
         UCQwh00WxAtBoXNr+qaVUVkCRFnhVFST//Bt9aW/NuYcXFfWIHjl8ikPSd+5rzN2vPp+
         twIVQaGbvXSDT0fq596kHqDKdRGB62cCdv9g/LfCGddrfEQ2s593dvdFknVJ78EfYYGl
         2TUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781562132; x=1782166932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hI+H0ca4Dm+4Rh5RqmuKXgYDTibOfqOeSOBb1qqYIE=;
        b=aHKq5r/jELiB647beKM1im8yNIaJB2oE50sxpA10rLTwvanzew5mBfg6nBQ5mGhyS7
         euYOwceoPrS3gW+9FmPQlqMIIIWj4WdXltH7xvE7WgbmTpiYji5bnLRQRplAShk4kV+A
         pfC+FIVBWtEoyj4NZC4f+oME+WhHbi2uryd/wBDS5RmtQ5gDu+hpO4jA4A2js8B+PRtf
         AZAVCAcf2WYSSGlj0c7+w8As8q78QKs+LVOzMfDfiqLe5JwwCZ0pk8G8qyUiqsP7+rcx
         isfYV7aY8pWEYpsdeulOiXU2i2ytkRtpxGONn/6QOx9tSpm1FLGqUqUWi2ZQUom1tBp+
         69aQ==
X-Forwarded-Encrypted: i=1; AFNElJ9LtTx6FfMiubENVvm/idFjYjOLFczQJzZQ2nTVaQIWFlNfetHAWz4I0R+1HG/NhaPmcVhF7BcRYHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyADIya0m5is5tKg1s1Ziajpuyl8ztDijQYBzRegJD1ZQ9F7nNR
	QEH2iTuQFCQB3Jr3EalZ437yQgqKKorSx2axl6C9TwBDUFZ9HcJolgNvYyeFH7bvpA==
X-Gm-Gg: Acq92OG3dS1+uDZLLmEgK6/lmxehURdWSUI6FEK7QMZ+bJATcDV4No5eAc917L/jLbx
	53b03rF2xeTV8fXX9BkXPmqR5SL8tCVe2oyuaaz15Sz0+qPMrApBeodqfTZ/SM7mcoaaM/LkKrJ
	HokhsHuXssL8u6PcYDXcLAScJfd7Yg+sFQgikNnZSqxYrJnQtcGR38GXkCL+tc1Z4kNOSoiA2Je
	UNROz2G5dkNcSR9d/lhq6tvYS3oSjLwK4pLAV4HoP0kvJbg0Isl7NReO6oz9OCIT2LLdt7noGGX
	u+EhmcKIQZmKhbtKXT+gzjjRDyu4d1pbRdTfAx2bn1aXWN1xmGUzZqN/gFrkK+QTm8CBW0KgTpy
	WfpE8v6MeAgolshrNJODnaiuw+KnKBBpqirpWKxDXrZZdsVXG87mJsBRvdN2it5HCVodFLZceaP
	Tkkkd4Vwl4pz3yydw92PmjS9XnU4rM2qb+6hVXFLEpMv76gXQkK/yWp7V5UNqhqQ==
X-Received: by 2002:a05:6a00:3e20:b0:82c:7767:5bb2 with SMTP id d2e1a72fcca58-8434ce428cemr17610087b3a.21.1781562131898;
        Mon, 15 Jun 2026 15:22:11 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acca7ecsm11283741b3a.13.2026.06.15.15.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:22:11 -0700 (PDT)
Date: Mon, 15 Jun 2026 22:22:08 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
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
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 01/12] PCI: liveupdate: Set up FLB handler for the PCI
 core
Message-ID: <ajB7EA4tAKqj5XV0@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-2-dmatlack@google.com>
 <178124130274.908199.14827357870284807134.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178124130274.908199.14827357870284807134.b4-review@b4>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-92436-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmatlack@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:pasha.tatashin@soleen.com,m:kexec@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pci@vger.kernel.org,m:ajayachandra@nvidia.com,m:graf@amazon.com,m:alex@shazbot.org,m:bhelgaas@google.com,m:chrisl@kernel.org,m:rientjes@google.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:corbet@lwn.net,m:jrhilke@google.com,m:leonro@nvidia.com,m:lukas@wunner.de,m:rppt@kernel.org,m:parav@nvidia.com,m:praan@google.com,m:pratyush@kernel.org,m:saeedm@nvidia.com,m:skhawaja@google.com,m:skhan@linuxfoundation.org,m:vipinsh@google.com,m:witu@nvidia.com,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmatlack@google.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9993F68A58D

On 2026-06-12 05:15 AM, Pasha Tatashin wrote:
> On Fri, 22 May 2026 20:23:59 +0000, David Matlack <dmatlack@google.com> wrote:

> > + * PCI device preservation across Live Update is built on top of the Live Update
> > + * Orchestrator's (LUO) support for file preservation across kexec. Drivers
> 
> I prefer to just use acronyms FLB, and LUO, but have links to the actual 
> documentations about them.
> 
> So, something like this:
> 
>   * :ref:`FLB <flb>` Data
>   * =====================
>   *
>   * PCI device preservation across Live Update is built on top of the
>   * :ref:`LUO <luo>` support for file preservation across kexec. Drivers
> 
> And also add _luo and _flb to Documentation/core-api/liveupdate.rst
> 
> .. _luo:
> 
>  ========================
>  Live Update Orchestrator
>  ========================
> 
> .. _flb:

Will do.

I guess I will need to add another patch to add the link references to
liveupdate.rst?

> 
>  LUO File Lifecycle Bound Global Data
>  ====================================
> 
> > [ ... skip 17 lines ... ]
> > + *
> > + *  * ``pci_liveupdate_register_flb(driver_file_handler)``
> > + *  * ``pci_liveupdate_unregister_flb(driver_file_handler)``
> > + */
> > +
> > +#define pr_fmt(fmt) "PCI: liveupdate: " fmt
> 
> Nit, may be:

Did you have a suggestion here that got lost?

> 
> > +
> > +#include <linux/io.h>
> > +#include <linux/kexec_handover.h>
> > +#include <linux/kho/abi/pci.h>
> > +#include <linux/liveupdate.h>
> > +#include <linux/mutex.h>
> > +#include <linux/mm.h>
> 
> Please sort alphabetically.

Will do.

> 
> > [ ... skip 12 lines ... ]
> > +	 * future to increase the chances that there is enough room to preserve
> > +	 * devices that are not yet present on the system (e.g. VFs, hot-plugged
> > +	 * devices).
> > +	 */
> > +	for_each_pci_dev(dev)
> > +		max_nr_devices++;
> 
> I think, we want to use kho_block [1] (it is in liveupdate/next branch) 
> to allow number of supported devices to be dynamic.
> 
> To support this, we would redefine the ABI and tracking structures like 
> so:
> 
> /* include/linux/kho/abi/pci.h */
> struct pci_ser {
> 	u64 devices;      /* Phys address of the first block header of kho_block_set */
> 	u64 nr_devices;   /* Total count of active preserved devices */
> } __packed;
> 
> /* drivers/pci/liveupdate.c */
> struct pci_flb_outgoing {
> 	struct pci_ser *ser;            /* Points to the FDT/KHO-allocated ABI struct */
> 	struct kho_block_set block_set;  /* Controls the active blocks on the fly */
> };
> 
> In  __pci_liveupdate_preserve_device() , we would search for 
> and reuse any inactive  pci_dev_ser  slot first, and only call 
> kho_block_set_grow() to expand if no inactive slots are available.
> 
> In pci_liveupdate_unpreserve_device(), we would simply 
> mark the  pci_dev_ser as inactive.

Makes sense at a high level. I'll work on switching kho_block for v7 and
get back to you if I hit any issues.

> 
> >
> > diff --git a/include/linux/pci_liveupdate.h b/include/linux/pci_liveupdate.h
> > new file mode 100644
> > index 000000000000..8ec98beefcb4
> > --- /dev/null
> > +++ b/include/linux/pci_liveupdate.h
> > @@ -0,0 +1,30 @@
> > [ ... skip 24 lines ... ]
> > +static inline void pci_liveupdate_unregister_flb(struct liveupdate_file_handler *fh)
> > +{
> > +}
> > +#endif
> > +
> > +#endif /* LINUX_PCI_LIVEUPDATE_H */
> 
> [1] https://lore.kernel.org/all/20260603154402.468928-1-pasha.tatashin@soleen.com/
> 
> Preserving: In  __pci_liveupdate_preserve_device() , we would search for 
> Unpreserving: In  pci_liveupdate_unpreserve_device(), we would simply
> 
> Preserving: In  __pci_liveupdate_preserve_device() , we would search for 
> Unpreserving: In  pci_liveupdate_unpreserve_device(), we would simply 
> 
> -- 
> Pasha Tatashin <pasha.tatashin@soleen.com>

