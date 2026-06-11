Return-Path: <linux-doc+bounces-91954-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ta41OtDAKmrwwAMAu9opvQ
	(envelope-from <linux-doc+bounces-91954-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 16:06:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0526728FD
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 16:06:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=fesk3KIa;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91954-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91954-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DE1931672E9
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 14:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0073C4028E2;
	Thu, 11 Jun 2026 14:04:07 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BB43BE63F
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 14:04:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186646; cv=none; b=ba4+uG/83ZYQ5OOp1Ly5SZOR9XFWyqUSXqjjEKF5wedSFJbCknJSb7AfaQYAkQWtVgpXB0TsGDpabOUVFHu0OHAfae8EeHSVv4rr0cQCwScQzOFyAyRXk24kgo0A2QfSiNUu/oT2kozwWbROznWwmHk4Qk26JigYJYUSuTJRO/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186646; c=relaxed/simple;
	bh=t6vDzwAQf6m71cw7ZAaMH7giGD8b6mi1NLg41KRjFFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnq9ej2HazVszYeojYmQ2U32TTPc+qIRPXQfhmJcU9/WN62MudH7KXypT87AIuNgJNqndzxooExYL7nwBIbnMWfOv+CYolSHasOii/fSfSa9DwlpRAEJLKLa2Cf6WdeG07qbwuB883TqDG9rvObRSWdOSG+cxkzMq3gHdCckCM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=fesk3KIa; arc=none smtp.client-ip=209.85.222.179
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9155183b42cso145720885a.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 07:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1781186644; x=1781791444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ENvnRZyJjnEps3yiVgsX7HBb3e0UX6vr9hqD2coNcvo=;
        b=fesk3KIa2WZaCF+S33hAhBQlzcwgCxoS72qeS4zMaDv1u8hLG2+dxR+gahznY+1fk6
         DdxjwFARz8yW5Ys721g364lxZLjkhn6xTd6ikbmtvEiJBmWJoTRWhSN5AJ6r0KX1QV+b
         9nUwHhJ75yfxTKwMb0WCC6TNjkN4iYr5RLiy3c9Akgaldc+OKrH3bIohcOWiui0OEAML
         NrA6Z9JidbKHkAOQGGXGBujsPYodSd+xmp2K22NFQBCc/R3uYeSQyTeqBUndoWVTRpMi
         jnz1vMzfj+9asJSZuj/UjynhNATlXabH9DaZ3zXsXXDedUucxRS5U5RCtc0UQZSJLtnm
         /Njg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186644; x=1781791444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENvnRZyJjnEps3yiVgsX7HBb3e0UX6vr9hqD2coNcvo=;
        b=L2uATufkVsLdOEpQsvS7J4c9D6KoSnV5ooUjShMGc+hz35ZoLj60k378dOleHeiz3T
         ZyrBLhhZwbi2v7pOWUGGpipQ8oL7c8qn3j9e0ydG17k2h70uXwuKZ7ScO9CCcfqdx6m0
         cuH5/44FTW6/UMhNCJk//PATcj+S2vOtLeg/GFYRkeyLAEhVdnUJ/AMTYTzb4gEw/den
         b1wq8eJ/hEK983/8HKhoEugd6teSa4nYVDy5Sk9NTz+mDP1tHJb6+fa8InuPfR8xRV0W
         MFQxxwk6LlHABHeJbNCN6BVGVMiy9MSiHW28Z28WQV+T9uEdlQCAEI5xGSStJIZlBbzv
         KcaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HPsbFq4fVVsxRiJmKTrtGt2z3fOsN+NHJqzCsfbkQKDTTTqeDuL2HkpCb565LooU8bBnfFfer+2U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh71yjdtGLwnZ0aV9yn3EOFkxk+yK3UpAqTYNoihGCVw763mmc
	ZNIEc8TWPMxxoR1tUN5lX2GGKoG/E897sdxCby6PNUNgDsJYl2RWICr0R39fPdTaCqw=
X-Gm-Gg: Acq92OEa0VdI4qMfqz3K93BUePN+3LCez46G5aVkIL+YwUyHn0shoPCilE3q/yiM42w
	2XYhnueHGfCVjfRLFbCGt6AQ22E+9DG74JrCujM7DTk+GqCTNplgyi4eMlTtzRlJeRq2Jx20m8D
	+eQClYNjoqJPWc+a7ih6rAv/p/vjlNJMsN8SN32cj3e4C6MXHMCm7FmxMWreaYZNI94cq39maBR
	4KqVO4gtrV93yKdCA/lBLjppgWhAL8AVZa4RzigYMav3ivY/Qmuh7s1BbcOKHItX2gxiBhNynfD
	hcndbQyERegcx4yV8hMtdWUJM2nMrGGtCq1uoGH7salUQxxsBcY5Fm7yfUvr0OW8zkmin1c2bc1
	SUBHnhKLpmBMm8VffrWDMcl2ObRKpKReky+JhxhAmJYy1u2qmZzVJh5RFROPy6qgAbyeaVsTpjL
	6ltgUjeQf/QaqDj2039R0s5D3wHVQhd12jtjl+ox+ZwbGzAcZXsIGF920q1CvSg6WFFA+urAKXW
	ffAxUhwLc52UCGFcA==
X-Received: by 2002:a05:620a:2728:b0:915:9fde:9da3 with SMTP id af79cd13be357-9160ade2a98mr334272485a.27.1781186644129;
        Thu, 11 Jun 2026 07:04:04 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9160aca4293sm196905585a.14.2026.06.11.07.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 07:04:03 -0700 (PDT)
Date: Thu, 11 Jun 2026 10:04:01 -0400
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
Message-ID: <airAUSrNjbSEwuti@gourry-fedora-PF4VCD3F>
References: <20260610014517.253609-1-gourry@gourry.net>
 <20260610014517.253609-2-gourry@gourry.net>
 <aip5IWmxg9CWg8hQ@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aip5IWmxg9CWg8hQ@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-91954-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gourry.net:dkim,gourry.net:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,gourry-fedora-PF4VCD3F:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F0526728FD

On Thu, Jun 11, 2026 at 12:00:17PM +0300, Mike Rapoport wrote:
> > 1) Can we do dynamic addition of nodes?
> > 
> >    Not Trivially
> > 
> >    Some services utilize num_possible_nodes() as a static value to
> >    calculate the amount of resources to use at runtime (bpf, md/raid5).
> > 
> >    Example: futex_init uses num_possible_nodes() as part of its
> >             hashsize calculation during __init.
> 
> AFAIU, we don't add the additional nodes for generic hotplug memory but
> rather for exclusive use of by drivers/applications that are aware of these
> nodes.

The intent is to use for "non-generic" hotplug (see the whole private
node series [1]), which would eventually still use the hotplug mechanism
just not for generic memory.

[1] https://lore.kernel.org/linux-mm/20260222084842.1824063-1-gourry@gourry.net/

> Wouldn't adding them to possible nodes actually skew the calculation of the
> resources by the services utilizing num_possible_nodes()?
> 
> With the futex_init() example, won't be hashsize scaled down two much
> because we've added these special nodes to the possible mask?
>

The result is the same as BIOS reserving nodes with PXM entries that
don't get used.  The CXL ACPI Tables do this for CXL Fixed Memory
Windows that may never be hotplugged.

So really i think you're pointing out that futex_init() here probably
shouldn't be using num_possible_nodes?

~Gregory

