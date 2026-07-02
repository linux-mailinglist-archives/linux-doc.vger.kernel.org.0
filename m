Return-Path: <linux-doc+bounces-94616-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jgGkMcB6RmpzXAsAu9opvQ
	(envelope-from <linux-doc+bounces-94616-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 16:50:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7FB6F9131
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 16:50:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=ayunlWRd;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94616-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94616-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC191300B9E6
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 14:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0214E377F;
	Thu,  2 Jul 2026 14:43:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B059B4E3764
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 14:43:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003422; cv=none; b=dj1pIhA9x94EWzCRUIcMzuxoNM3nOChLuxscoyZrVEvQSANXPVJk8auWsY0YXnZdPZq3S1A8QR2gC0Ib7uxyDf8k2UZHmWWo1wfTBxWdB85I7XCyr4KWiu8oAvAA5Z95gVxXhxAK8pCp4I4qzCS7cYVpIQyzIalnLUM8pWVjblI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003422; c=relaxed/simple;
	bh=UOPiJT8T7uTyFa7QTYmnZ8k0B56Jo1xH8oEC173P8GA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iixS6GbbDiZXBpaKswAeKuQcc0irYWeAuldcWt4hU1AEIVK0Obm9GcCym9/Qqorw5c+QCHuNPwkN7r3UuDV66/aQRZ4vYCqkfD/f8vjuYdOpUdfIJ6kN0zayXcaU7qcqqiyjebYOXoCmx3jbuMj9Q/5Viq/FLpsTQ6IpHuDNl8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ayunlWRd; arc=none smtp.client-ip=209.85.222.169
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e6c4a867cso108605185a.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783003420; x=1783608220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zMKSwJv9NceXHRupMFvzinKFBnJD1eW/sagn2nvHuck=;
        b=ayunlWRdwo1ZKRVKw16NsgB+qTK+qFJAAEUTf5SM+0iGWp5pN8hLxcrEW/OdWGbiJ6
         /BjubPu9ZidIRzJqdXnXSO0cZ9k63jSeRiaqz5dpoTh+2Cu27tueCfoNGXjTj7J6nQSo
         2SHx2cIUyUMYsE27PaOXA8QgJQsj2m2lDE9Hn94Ktpyl6wyZfaDu+yjQx75vg9X+7XNp
         Prg2agPlyT+dDdB6DZmKba6RNXvkYoaGNzWOadSidvzX1Xkg00ZQvotNLmoW0hebJ09w
         qQLt79Mo6QA+M6+YJh+lgGKjBwU4wUvrQ44VUDgxAUXm6fiwr9qw/Fq6nSuPlv1pBvWW
         zlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783003420; x=1783608220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMKSwJv9NceXHRupMFvzinKFBnJD1eW/sagn2nvHuck=;
        b=W5M6kr/KwY0j0agJLQKCRJNqJ4FVKLzzy/cUAUfxLsv6y2EllZ9tWwBIILDRGJ4so7
         dsH6chY8ONv4iq7O9Wjxp3dObOC317iRfmvXlmJ42HKA/Uh252dgADZRq0vASCZ3DUlz
         K9jUmx35uintGHoC6FL9twv/PkvYq/R7+aA889jdR2dMcXH0tciuIk4T+QtPaBuwfEER
         BH7SK0kzAHebx7U2Ipe65MESHEALfZoTGarM/CZms5L8RiPDMKAwImd1tmShHL3tjX/H
         IpD1y+5p5a2mroEve3hBnivW6Ly+zurPY6b5A3Gr30QkZZb/1g3M+W7q4d6BQJwruNSv
         w0lg==
X-Forwarded-Encrypted: i=1; AFNElJ/BhGN8cxeY62XCW2wDG1X/9jpzMTmKiSkalRw6Dw0jpLBJEZzkYp9zVHu8LcXci+Q7OTfys0EWVBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRuYwcoA3yfxxkARNvXFMGgHe4rD7u46Xe9TWsMOPKw/9DuwHm
	Q9wEiZyaR9W8X8dMmH4H+t9S0Rx2xuqVZJkvIP9RDEk4aEc36bYhF0ktoDdZimv8aj8=
X-Gm-Gg: AfdE7cmk0uftqX5WiflIHpZsZawAB3gmLH3eRESYLJ9TB20NqAoPRao+aqna9+Z80uX
	MRrEGBLExHtijO+9cq93FwEiyWc4D1NEeUaFYghfyq629BmC/GfBB9kbe0YHpt7bVs82LmZtS8O
	9pJ6XUYnhqwGpnWJPIR+IvK4MApbUOHkx8TOBHc7b1lmqb04PbBiQHznxs3Lt9fcefUinWeIS8m
	/lunEsP3+rPt9mEqVa8EEOKXER32P/kH4R/Lcm5Tv/cqKdDdTmULgS4J+kqYuy8zxRmMaVdaMaN
	mR3MIc0UaUpCgijQ3oaJkSLRl3T6jSxl9iNtcCFEmKbZ9VWC5ES9ZMaZcjmONNMlBPk1PxEDKjz
	tw/pym6kG8s1fyhb/7Azon4G5yyBrzxEr/jccY5Pg8eld2c7HRkQQYXRnXBW8CorT/CShJI+r2m
	JsiUtodEAd2ZN2C+ZBvTNxWyiI4IVzQrjnB6gw+U5AyYQIqUjJLuttbxQUfMY9tEnuB0CV
X-Received: by 2002:a05:620a:4708:b0:92b:774:da66 with SMTP id af79cd13be357-92e7b42debcmr706158085a.56.1783003419654;
        Thu, 02 Jul 2026 07:43:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e801bbec0sm236826085a.45.2026.07.02.07.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:43:39 -0700 (PDT)
Date: Thu, 2 Jul 2026 10:43:34 -0400
From: Gregory Price <gourry@gourry.net>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, kernel-team@meta.com, corbet@lwn.net,
	skhan@linuxfoundation.org, dave.hansen@linux.intel.com,
	luto@kernel.org, peterz@infradead.org, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, hpa@zytor.com, rafael@kernel.org,
	lenb@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
	akpm@linux-foundation.org, rdunlap@infradead.org,
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
	elver@google.com, kuba@kernel.org, ebiggers@kernel.org,
	lirongqing@baidu.com, paulmck@kernel.org, dave.jiang@intel.com,
	jic23@kernel.org, xueshuai@linux.alibaba.com, kai.huang@intel.com
Subject: Re: [RFC PATCH 1/3] mm/numa: add exclusive node pool and
 numa=standby boot parameter
Message-ID: <akZ5Fs5aSO89KqKE@gourry-fedora-PF4VCD3F>
References: <20260610014517.253609-1-gourry@gourry.net>
 <20260610014517.253609-2-gourry@gourry.net>
 <aip5IWmxg9CWg8hQ@kernel.org>
 <airAUSrNjbSEwuti@gourry-fedora-PF4VCD3F>
 <ai5vj_RjSxl_FLu-@kernel.org>
 <ajq2A9GUOBWjzYM6@gourry-fedora-PF4VCD3F>
 <akZG0sb1pXFZQQqA@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akZG0sb1pXFZQQqA@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gourry.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:linux-mm@kvack.org,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:driver-core@lists.linux.dev,m:kernel-team@meta.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:rafael@kernel.org,m:lenb@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:akpm@linux-foundation.org,m:rdunlap@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:paulmck@kernel.org,m:dave.jiang@intel.com,m:jic23@kernel.org,m:xueshuai@linux.alibaba.com,m:kai.huang@intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[gourry.net];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gourry@gourry.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	TAGGED_FROM(0.00)[bounces-94616-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gourry.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gourry@gourry.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,gourry.net:dkim,gourry.net:from_mime,gourry-fedora-PF4VCD3F:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C7FB6F9131

On Thu, Jul 02, 2026 at 02:09:06PM +0300, Mike Rapoport wrote:
> On Tue, Jun 23, 2026 at 12:36:19PM -0400, Gregory Price wrote:
> > On Sun, Jun 14, 2026 at 12:08:31PM +0300, Mike Rapoport wrote:
> > > On Thu, Jun 11, 2026 at 10:04:01AM -0400, Gregory Price wrote:
> > > > On Thu, Jun 11, 2026 at 12:00:17PM +0300, Mike Rapoport wrote:
> > >  
> > > > So really i think you're pointing out that futex_init() here probably
> > > > shouldn't be using num_possible_nodes?
> > > 
> > > I'd rather say that num_possible_nodes() with and without CXL (or other
> > > differentiated memory) has different semantics.
> > > Maybe we need to add a new primitive for possible differentiated nodes and
> > > keep num_possible_nodes() to mean "number of possible nodes with normal
> > > memory".
> > >  
> > 
> > We'd have to define "normal" here a little more discretely.
> > 
> > Normal = N_MEMORY at __init?
> > Normal = N_MEMORY in the future?
> 
> Normal = not differentiated, no matter at __init or in the future.
> I.e. memory that kernel will use with existing allocation primitives.
> 
> > We also use the possible_nodes() mask to allocate per-node pgdat, so
> > the futex example is largely just another "hey look at this thing,
> > I wonder what other stuff is out there".
> 
> Right, futex is only one example. My point is that with multiplication of
> possible and not populated nodes the possible_nodes() mask may not reflect
> adequately the limits its callers look for.
> 
> And that maybe it's time to audit possible_nodes() callers.
>  

Totally reasonable, I have been thinking the same thing.

~Gregory

