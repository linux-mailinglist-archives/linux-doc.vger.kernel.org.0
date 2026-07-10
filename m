Return-Path: <linux-doc+bounces-96296-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fae6DYAgUWqy/gIAu9opvQ
	(envelope-from <linux-doc+bounces-96296-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 18:40:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 303CB73CA34
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 18:40:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ziepe.ca header.s=google header.b=V44Ncneu;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96296-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96296-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D0543004C67
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 16:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032E042EEC9;
	Fri, 10 Jul 2026 16:39:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA77438024
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 16:39:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701551; cv=none; b=XEUcEMxQCnMqsVjjEjed4qA1Rx3li+0SAOcY49k8+5Rj3VoFVudrY0dCdtlLKRTV6t4rWb5FsTrRXQ/n5M/grZZ9fmbPeJao85+XXerNIXyU8+9B0cK6Tkr1mS1cpgkLZMk2atN+fEiRKHzN6NhzRg9ZY+kR+zawEYOK7VFMJzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701551; c=relaxed/simple;
	bh=PXWpFGDjo49ebvD3J1EZhbbcBn9lhFalPM090sNNP24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VE4zDH0bGnueIpFYsS6Cb/VMHojx0pJ9uKWQMJVx8NOdzN9aVTjWHOIP8ApBWn1rHeY9GeopdL+QZlAmn4blv9VY6AsGAp2IcfdaNcQYU9a26DTfdPMQ0taYdlSLjwrXqDVh/lc1u7UX0MWiM07n9n45nhbmhWVXSwEgnpyxPhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=V44Ncneu; arc=none smtp.client-ip=209.85.222.175
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e7632b193so69667485a.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 09:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783701549; x=1784306349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pz9Az2A5A+eQsiowkEP3oUH5xkba/HyvmJjmLQ4f6yE=;
        b=V44NcneuBmSKEBchN78CSp+SaMfBLy1//YCpr9I1tT1XRDcFXG5+tSyEJHEeaYeVfz
         NIrEue9qNfNKDSL2SyQc22uCFfZIccdEKlzTvZiVjxSs7yW8ymKPTbjh3h5fCx8J6VRE
         ruw7a7Zb4wsfuusky6aj8N5Zh51FpvSSoGJh81s9qefwupZ1P5l5cIhrHg0UWBRhHCZF
         uNQncP6VKhKSu8y8EbYfIk2ibfq5mUb/raxQxKixeDH/8G6mZA13O+UEHcgJY563IsTS
         5NsI1Y3ojGWLdbyGmeRkfxWy2e+I5uI8lgN5cqIFUUap3X2wvZlttOnhG3/sjVeBLu5G
         WuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701549; x=1784306349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pz9Az2A5A+eQsiowkEP3oUH5xkba/HyvmJjmLQ4f6yE=;
        b=UniOqdQB3zc+wh6M4zy22lzoeX7YAtx9fzyq2uy5FlbZu+W9nLQr/b6Gpl2d9LKy2i
         Q8uzzZ3mQwohu89gIVdqh/nVFQpJkM9OpCufYPyt/W5aJGy4spP4J/HLvKLLZsNXXhrP
         aCNIrDqBVw6OFTWssLrPV5l9c50FjSp411IOVuzX7CCvM6BUDGyot3VrSGh9RWDkRkmg
         6U3/0OyuEX+VjZawXCDkxB+8kB0DeXuCct8qe5YZpS3uBrLfutRHn41d8zwnsuc3suuX
         o7L4A+J7ZSW8+GRC1JfVCs4of1HuaK15rnhp+JBJ6ZQFxSWZgWj1n7hVUWKA011ynjgF
         505g==
X-Forwarded-Encrypted: i=1; AHgh+RoN64kmlpKgjF7S/CraQIOXZffNaoXKeiJFU3Sv4saN4Owjgp3l/lzdw5HRNihgE336R1y518Lru0w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx20C5sza8ZdGYtWBBtocEw0ZJdcewUY0ztaPHsSvyD5LC63u5d
	lhk001TKbvhpnLemqoErwY4SgMogG+u0iwdYsfSfBL29fRgkNnPxKSTRyYYXUfpzOPo=
X-Gm-Gg: AfdE7ckQ8wEwS+Ilo85PKJuKM/CGRqiyB6JH3xwqyfR5iDsa2vdT4Fj3ts5SBn2AATP
	H4SBWQIB1GvZo7zPCb5I0ue6HY/5ngWuWi+EJXpPIjxrkjGzGT08zGLm1hAcP36Nh25tFZlVJzo
	3nqR+/rMiwWjN7BK6R/5ywYT/6DtioKB0SdE335/LpBR6xk3/R0E8xsK0Im9mrhoAlrafD7/+w1
	QHaOwCS2zhVFAMNq7xqKuaU2AbMcUYnzj+5q161UGafWjFg1Y11jKpxL7vUBkkXWnIymsq3CWVv
	crHcJD4EZwqUtJBU3yJqCbw3whgpM1fDVnNTMivftRvyT84Lzjgovm5yQNlyhIEQ8+Dh/wNxVCA
	YxytfXsqHrK/qZNeNtYXx3GdnwnVBP6xUMI9l+G9/E4WE2P2EqGFp95A9idle
X-Received: by 2002:a05:620a:2842:b0:92e:44eb:1e7a with SMTP id af79cd13be357-92ecf5f0e37mr1356630085a.29.1783701549520;
        Fri, 10 Jul 2026 09:39:09 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5bcb074sm235123285a.21.2026.07.10.09.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:39:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEFo-00000007YRj-1Qzt;
	Fri, 10 Jul 2026 13:39:08 -0300
Date: Fri, 10 Jul 2026 13:39:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
	corbet@lwn.net, dakr@kernel.org, david@kernel.org,
	decui@microsoft.com, haiyangz@microsoft.com, kees@kernel.org,
	kys@microsoft.com, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, wei.liu@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v7 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
Message-ID: <20260710163908.GS118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345363584.660027.14063544694872741718.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345363584.660027.14063544694872741718.stgit@skinsburskii>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:skinsburskii@gmail.com,m:airlied@gmail.com,m:akhilesh@ee.iitb.ac.in,m:akpm@linux-foundation.org,m:corbet@lwn.net,m:dakr@kernel.org,m:david@kernel.org,m:decui@microsoft.com,m:haiyangz@microsoft.com,m:kees@kernel.org,m:kys@microsoft.com,m:leon@kernel.org,m:liam@infradead.org,m:lizhi.hou@amd.com,m:ljs@kernel.org,m:longli@microsoft.com,m:lyude@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mamin506@gmail.com,m:mhocko@suse.com,m:mripard@kernel.org,m:nouveau@lists.freedesktop.org,m:ogabbay@kernel.org,m:oleg@redhat.com,m:rppt@kernel.org,m:shuah@kernel.org,m:simona@ffwll.ch,m:skhan@linuxfoundation.org,m:surenb@google.com,m:tzimmermann@suse.de,m:vbabka@kernel.org,m:wei.liu@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-rdma@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-96296-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_CC(0.00)[gmail.com,ee.iitb.ac.in,linux-foundation.org,lwn.net,kernel.org,microsoft.com,infradead.org,amd.com,redhat.com,linux.intel.com,suse.com,lists.freedesktop.org,ffwll.ch,linuxfoundation.org,google.com,suse.de,kvack.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:from_mime,ziepe.ca:dkim,ziepe.ca:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 303CB73CA34

On Tue, Jul 07, 2026 at 12:47:15PM -0700, Stanislav Kinsburskii wrote:
> MSHV currently faults movable memory regions by taking mmap_read_lock()
> around hmm_range_fault(). That prevents the fault path from handling VMAs
> whose fault handlers need to drop mmap_lock, such as userfaultfd-backed
> mappings.
> 
> Use hmm_range_fault_unlocked_timeout() instead. Passing a timeout of 0
> preserves MSHV's existing unbounded retry behavior while letting the HMM
> helper own mmap_lock acquisition and refresh range->notifier_seq internally
> before walking the range. After the fault succeeds, MSHV still takes
> mreg_mutex and checks mmu_interval_read_retry() before installing the pages
> into the region, so the existing invalidation synchronization is preserved.
> 
> Fold the small fault-and-lock helper into mshv_region_range_fault(), since
> the remaining retry path is just the standard "fault, take the driver lock,
> check the interval notifier sequence" pattern.
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  drivers/hv/mshv_regions.c |   54 ++++++++-------------------------------------
>  1 file changed, 10 insertions(+), 44 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

