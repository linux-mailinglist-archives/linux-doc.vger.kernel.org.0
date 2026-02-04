Return-Path: <linux-doc+bounces-75230-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP4zLPhAg2kPkQMAu9opvQ
	(envelope-from <linux-doc+bounces-75230-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 04 Feb 2026 13:52:08 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 162F9E606A
	for <lists+linux-doc@lfdr.de>; Wed, 04 Feb 2026 13:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DC62301B704
	for <lists+linux-doc@lfdr.de>; Wed,  4 Feb 2026 12:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4392A3E9F88;
	Wed,  4 Feb 2026 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="GW4VHNlj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE981FECBA
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 12:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770209238; cv=none; b=TJuXy6jatDKpOFb+d24i+CRqMH9bsiL9KIFtSRn045Sw0xvNTzh8GJHpqzhGXPAUnJpNQPPOuWOksMsoRSxSULOXDddShWwI/SLgPntEFdpBtL/kWSgdZ7E53CqiHLhSR8hbIGdX94uD+KKA3FbmnbDOpDTxr9T/guayPA0sQhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770209238; c=relaxed/simple;
	bh=sIl8zPvTMavW7op27NWntwAoYxbkYCvD1OGJGO1W/G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbPXcnjC4mpGnCKawrTA43gl2his5GWbscKvWap2zNYqSLRX65Vn/dkA5HtPY6kT9EhqkrH3hCAR67qs743CWa9lJn13k4zmxNuGmIPF61n29X2aZieSXHtWAq1wb8UGOSiApXUmghNCWoZTtVrLwjfzZGUMcwtufi4MH4thhvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=GW4VHNlj; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8887ac841e2so62221096d6.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 04:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1770209237; x=1770814037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+U8LpVemtW+m+yu1KTxoehmwVgUgV8X5ud3ORfVCCrA=;
        b=GW4VHNljJYFgI4mruLbg7vYCpHKew/dRjvlqzTeNn86+wrDMfx4zpIj/dioyccLJXP
         XACl0ggJFwCgkw29MoP/25q6//IrEkYd5b1PaWKqIt2jogVrM5cjO4x8m4SXMm5gCTeq
         7+sRa7wqOIMHi2uMMWQ4hgsHW3KpXETuwQdLYmSxbznzYiFF/OpfJ5wYd2+ZEE/Uq1FI
         Y4nSEVvDEDY7SKTbbuouPMPgd9Kb81K7EZt/IwblUTd+zVebhGIivCskRSb47BFJPge9
         pAIPD6qNA+nYIkrf2Ayi8x0N4WX83p8Cy9t0L1BJVFY9mZOU1Aekk1WQ1812YLGIQSQW
         a64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770209237; x=1770814037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+U8LpVemtW+m+yu1KTxoehmwVgUgV8X5ud3ORfVCCrA=;
        b=uHp+YE0Zup0H2DJxd5AL+aigovs8YlvZThOn6oI1PUwy2rUdm8Mxuvj9bOddv0L3Al
         XqpKTBblxbGjbF1r1f1BGsG8yuOo8wmYQrDkjFi+Dk13u5hTmsViIN/AAOkivjDbbAer
         ogN2HVIDGsI6yR4dQtWEU5vBktEseo2IgL2TxiO+Ys5vKieas9nz3Tg+H6v47ttFu9fZ
         MYwi7ccXaqQ7WouGe5soR6v3ursZ+/5ynBg/NZxQO2VR7YbKInAxzEQk2j4e9nAIfU8g
         qGCJbdh3ljCNxtSHC23fVDr1ozTywGipTCWXwXpCWM9JRk7NhATjxyFVn27WhBNHlsU/
         gDuw==
X-Forwarded-Encrypted: i=1; AJvYcCXIwcrOLYpDltGPzqJjkmxeQo0Y8voK+GD0+pbL2GBaf6zpHxC+pvZq63ZEIT4Cr/4i6wdem0HGi5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRM2obyGSbEDsSzH42kAxybvh9i1yQgA8bjIFD/iJwUEJmC19P
	U0fU7HM+tPCog+ZE16hT3+U9+FVIQKSoZA6gFWszL8nGYUE+sVW6r6Px0IW1uuNKexw=
X-Gm-Gg: AZuq6aJHaPcEKbbrKEu57HxqBwXbfcCk6ts0IM/bXbL0+rlaiB9BF3jtaJX1eQ5dF2k
	tF5b6kESfTiT0I222F6G7swpkE367UzTQ5BBm9+jTy4m0c7q8ccuWkFVeSkdjsXud1oZ6FlLgdh
	+mwjfunW6HnrYVA3DTaMp6P2sxR3AbvnCbIXMzegx40DsHHrWtZeLJLlESDF2alj+r6w8H9j/b8
	IZ6wSg41FTnJcrnnuOuzGQL8iIHGpURZgvK67irvZj13aGLySJ3RfLsUs4EMd7c11DNXbX7CuGB
	d3H8TtRiAGJGVPurCZon4S+de6YRnzPtXAkSu/x3OheiUFYiz5wJUHyXzglXqtSMHsdVEedOUkJ
	C4NgRfS4j2TXLd5D5Sv3VS3ofJlk/bjJdmsChEpT66WtXDG5pQf0xgJId7g4XRaZAmD6sLg0B2R
	AFQsnpthnOXfv3u3OrNJ1o9kJL6diq+rSZJD81jEu98DUXMtiW9OKGGDxqfK09VGeL+BU=
X-Received: by 2002:ac8:7f4d:0:b0:4ee:5fc:43d9 with SMTP id d75a77b69052e-5061c0d57d6mr32950401cf.16.1770209236488;
        Wed, 04 Feb 2026 04:47:16 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5061c14815asm18573661cf.6.2026.02.04.04.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 04:47:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vncHr-0000000Gzio-1QmV;
	Wed, 04 Feb 2026 08:47:15 -0400
Date: Wed, 4 Feb 2026 08:47:15 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Alexey Kardashevskiy <aik@amd.com>, cgroups@vger.kernel.org,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org, x86@kernel.org,
	akpm@linux-foundation.org, binbin.wu@linux.intel.com, bp@alien8.de,
	brauner@kernel.org, chao.p.peng@intel.com, chenhuacai@kernel.org,
	corbet@lwn.net, dave.hansen@intel.com, dave.hansen@linux.intel.com,
	david@redhat.com, dmatlack@google.com, erdemaktas@google.com,
	fan.du@intel.com, fvdl@google.com, haibo1.xu@intel.com,
	hannes@cmpxchg.org, hch@infradead.org, hpa@zytor.com,
	hughd@google.com, ira.weiny@intel.com, isaku.yamahata@intel.com,
	jack@suse.cz, james.morse@arm.com, jarkko@kernel.org,
	jgowans@amazon.com, jhubbard@nvidia.com, jroedel@suse.de,
	jthoughton@google.com, jun.miao@intel.com, kai.huang@intel.com,
	keirf@google.com, kent.overstreet@linux.dev,
	liam.merwick@oracle.com, maciej.wieczor-retman@intel.com,
	mail@maciej.szmigiero.name, maobibo@loongson.cn,
	mathieu.desnoyers@efficios.com, maz@kernel.org, mhiramat@kernel.org,
	mhocko@kernel.org, mic@digikod.net, michael.roth@amd.com,
	mingo@redhat.com, mlevitsk@redhat.com, mpe@ellerman.id.au,
	muchun.song@linux.dev, nikunj@amd.com, nsaenz@amazon.es,
	oliver.upton@linux.dev, palmer@dabbelt.com, pankaj.gupta@amd.com,
	paul.walmsley@sifive.com, pbonzini@redhat.com, peterx@redhat.com,
	pgonda@google.com, prsampat@amd.com, pvorel@suse.cz,
	qperret@google.com, richard.weiyang@gmail.com,
	rick.p.edgecombe@intel.com, rientjes@google.com,
	rostedt@goodmis.org, roypat@amazon.co.uk, rppt@kernel.org,
	shakeel.butt@linux.dev, shuah@kernel.org, steven.price@arm.com,
	steven.sistare@oracle.com, suzuki.poulose@arm.com, tabba@google.com,
	tglx@linutronix.de, thomas.lendacky@amd.com, vannapurve@google.com,
	vbabka@suse.cz, viro@zeniv.linux.org.uk, vkuznets@redhat.com,
	wei.w.wang@intel.com, will@kernel.org, willy@infradead.org,
	wyihan@google.com, xiaoyao.li@intel.com, yan.y.zhao@intel.com,
	yilun.xu@intel.com, yuzenghui@huawei.com, zhiquan1.li@intel.com
Subject: Re: [RFC PATCH v1 05/37] KVM: guest_memfd: Wire up
 kvm_get_memory_attributes() to per-gmem attributes
Message-ID: <20260204124715.GA2328995@ziepe.ca>
References: <cover.1760731772.git.ackerleytng@google.com>
 <071a3c6603809186e914fe5fed939edee4e11988.1760731772.git.ackerleytng@google.com>
 <07836b1d-d0d8-40f2-8f7b-7805beca31d0@amd.com>
 <CAEvNRgEuez=JbArRf2SApLAL0usv5-Q6q=nBPOFMHrHGaKAtMw@mail.gmail.com>
 <20260129003753.GZ1641016@ziepe.ca>
 <aXqx3_eE0rNh6nP0@google.com>
 <aYHGVQTF6RUs7r3g@yilunxu-OptiPlex-7050>
 <20260203181618.GY2328995@ziepe.ca>
 <aYLOZIZU0nwk+0UN@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYLOZIZU0nwk+0UN@yilunxu-OptiPlex-7050>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	FREEMAIL_CC(0.00)[google.com,amd.com,vger.kernel.org,kvack.org,kernel.org,linux-foundation.org,linux.intel.com,alien8.de,intel.com,lwn.net,redhat.com,cmpxchg.org,infradead.org,zytor.com,suse.cz,arm.com,amazon.com,nvidia.com,suse.de,linux.dev,oracle.com,maciej.szmigiero.name,loongson.cn,efficios.com,digikod.net,ellerman.id.au,amazon.es,dabbelt.com,sifive.com,gmail.com,goodmis.org,amazon.co.uk,linutronix.de,zeniv.linux.org.uk,huawei.com];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75230-lists,linux-doc=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[98];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 162F9E606A
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 12:43:16PM +0800, Xu Yilun wrote:
> > Which means we need VFIO to know what they are, and hopefully it is
> > just static based on the TDISP reports..
> 
> I don't think VMM need to check TDISP report. The only special thing is
> the MSI-X mixed pages which can be figured out by standard PCI
> discovery.

Either that or follow along with the guests's choices on
shared/private.

We can't let VFIO mmap a private MMIO page, so it has to know which
pages are private at any moment, and it can't guess.

Jason

