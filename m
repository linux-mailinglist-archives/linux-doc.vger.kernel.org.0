Return-Path: <linux-doc+bounces-77837-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOfPLS5EqGkfsAAAu9opvQ
	(envelope-from <linux-doc+bounces-77837-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 04 Mar 2026 15:39:42 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B87BD201B73
	for <lists+linux-doc@lfdr.de>; Wed, 04 Mar 2026 15:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 53041309650D
	for <lists+linux-doc@lfdr.de>; Wed,  4 Mar 2026 14:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464123AE189;
	Wed,  4 Mar 2026 14:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="iwL4lwEp"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E011F3A453C
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633936; cv=none; b=fu7iktvO3RRQtnL4Q7osrFtgBcTWfFl+zdCwxCvh3ul8skjOhypAZRujla2t2sp7/XqNN9Av0Y3NjoWQk5FX+DfdpES0+F6e3J6UUrqXvp3TBzELexTrzifET+A003MB8dmG6a28xsPTv88RY5L79RpGt9+h/A1qmqoh+x8h9QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633936; c=relaxed/simple;
	bh=ICcHAv5R0LkVRgx1sRn/PLrNOjP1Y8guvnLI6zDoVjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuKfga5zPiagzJhdfQvCqDQxzGY81y3+Q4RkzqnT34v5wy0lHAsFe5pyUDS1LXGxpr95bP9mKOG+adksR0Ye+Sxs13+YNUmCTNsLJmyMl8TzsL5irnMvrmwMo6afhPI6Hjx8kpiLOGqz0iDQD7ta2Jtbp7QHNepCNcGU3FZaP+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=iwL4lwEp; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-503347e8715so83396051cf.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 06:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772633934; x=1773238734; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VJb/uIHrYqSTg+GB6V2BLb5y0MXgSCVKzM/ARVauTlU=;
        b=iwL4lwEpCvPFTLKVYRUJqmDywzHksr4krRU+dweyR/1V3/x4lCcclEwfELn5hpEMsh
         ul3itfgjvGFUK6uiNkdkKr6yrwZAvVqHWdjOqGmZxXBBZ9IDxc/OilKKpdCqOhuZbvy2
         eyOEWGbGmHt00JbZKH7t4jx3JF/HWOxbioYRrn22qamI3Mp54zZi/HnsquREdDyjJzlo
         22xcK2mmHgrlqiA9cNKTxCuflpF3l6iiP/T6YJ9lS2DdSERR+PYP8hrCLrrsxZnUuSr3
         dBNjpEHfPJlBdxyZc91Fwe7oYMyjNlXPiY8NB4qv74ax/ZtCwKTtoqcgwR4HoqFhiQV8
         l2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633934; x=1773238734;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VJb/uIHrYqSTg+GB6V2BLb5y0MXgSCVKzM/ARVauTlU=;
        b=KqgTXpYGMdY3ZNFhjoYJQyEz+ShpJlqSwFLiWKIi8OSP5wGjyNN6EsawtN9Vq5oAOX
         I5K882S3aWN1/BW/eZmk/JXH5qQP1ETYh6vcFeqOTq5YULOEq1fb/hGcukmMlMgV9ylZ
         OalLcfCA3NoeXeR7OsHdrP315MrNyfwed0rR1s9CCGXHqpYtbGRj2rIg97m6vypYBfqw
         fpp5MaqZijC49YmKsAfVqblVKYd4EtJXOxHylUXvIUt1TzJje7asY58q8CO9XT6y9bXg
         u1+fVJueqv06GIxdo0XJY0TCY0JXwfzkxl2MjklwxxR3+hv6JJHEeEkv3X6c58fJ0Flc
         CjWw==
X-Forwarded-Encrypted: i=1; AJvYcCVR0AfBHpNizVTCavC5YUd1pS63a+Ang+px/UDDkh5QyyluGRd1/gGb5/drnLqBsI1Ign+YMWFD+wk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzonnqR2fEaI+aBfOHNjtb3SKgK/6xP5mZB3OiIyoDSt1tGmoy8
	KMHSsWc2DUBp56NUN5SmABoHKTooX9zemLn9AfcdODE8toY5QlAPlNatXP2Z6Kpgl38=
X-Gm-Gg: ATEYQzxIU8+xf2nTfvqQQAQ3hCphB6icrnWGqem8QFfGR39JEZ7cI8Is7eLjlAdcuN2
	lO89VhAbK38I9G/crtt71VG7MpD5vcjpdUELlVQbUCtDxH/Hvw3aPLirqiGlmXbVxrwOmq+/0NS
	wxyA7v1oth6VUERuE+HMrkSoecsd8jshJT2Y/FfDCmJaE5Zk3cbVjgvgzaF2uBTvrweeSx9OM6N
	ouZ/w4DY8PuYoM0wQSPa+JDKKySlDa0CRVvojdPxCdk3mvyjQ7UhC7sGPQvFrN07doq/b7QFQFR
	FztkS7fcTFZkq2F0ZJ7q6o92/+mqTQ/ZIgefjrcMtL0zCOudOEbqIxbeakrnnM1KD9wPbPa3FSX
	KDwx9QfyQ1tV63S3Tqmp4w9QJL+WDk4XZcHx31fa6+WKzv0JqIsV7nMfeMFQzVjMyAQjrraC0rE
	tE1atDsFnYq48BsSNx6uYNDKE9PXeLqGE3eA4qI4MiGftR6HZdhd88CojLGs8RIr6J4Q77i4HS9
	hto4bT9Ryx8F00mqa8=
X-Received: by 2002:a05:622a:1899:b0:4f4:e15e:528f with SMTP id d75a77b69052e-508db3773fbmr27695511cf.62.1772633933669;
        Wed, 04 Mar 2026 06:18:53 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744ad885bsm152669541cf.28.2026.03.04.06.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:18:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vxn3s-000000056cr-144y;
	Wed, 04 Mar 2026 10:18:52 -0400
Date: Wed, 4 Mar 2026 10:18:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Peter Colberg <pcolberg@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
	Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
	Moritz Fischer <mdf@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Boqun Feng <boqun@kernel.org>, linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-fpga@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV
 capability
Message-ID: <20260304141852.GF964116@ziepe.ca>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304084750.GW12611@unreal>
X-Rspamd-Queue-Id: B87BD201B73
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-77837-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,linuxfoundation.org,intel.com,ffwll.ch,lwn.net,vger.kernel.org,nvidia.com,lists.freedesktop.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ziepe.ca:dkim,ziepe.ca:mid]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 10:47:50AM +0200, Leon Romanovsky wrote:
> On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
> > Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> > capability of a PCI device. Provide a minimal set of wrappers for the
> > SR-IOV C API to enable and disable SR-IOV for a device, and query if
> > a PCI device is a Physical Function (PF) or Virtual Function (VF).
> 
> <...>
> 
> > For PF drivers written in C, disabling SR-IOV on remove() may be opted
> > into by setting the flag managed_sriov in the pci_driver structure. For
> > PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.
> 
> Why? Could you explain the rationale behind this difference between C and
> Rust? Let me remind you that SR‑IOV devices which do not disable VFs do so
> for a practical and well‑established reason: maximizing hardware
> utilization.

Personally I think drivers doing this are wrong. That such a driver
bug was allowed to become UAPI is pretty bad. The rust approach is
better.

Jason

