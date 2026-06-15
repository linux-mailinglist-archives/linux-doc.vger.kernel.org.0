Return-Path: <linux-doc+bounces-92435-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MKwrF2B6MGogTgUAu9opvQ
	(envelope-from <linux-doc+bounces-92435-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 00:19:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D735C68A53C
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 00:19:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=IEAYjKHa;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92435-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92435-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A74D0305092C
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 22:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF7E3B7750;
	Mon, 15 Jun 2026 22:19:09 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E35298CAB
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 22:19:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781561949; cv=none; b=l/ECgDjp1CWe6yY3WVwALt9TH71Z0NJtdUs/dXKJy6dtXVz2ibgaINKeYDhOJA1U0BZC6GN6nP5nTwk1xYY1tEJsR3q4TbT9K6YE2QIG2Qj+Ad952AHjT64SGd2EKVhYn7tetiQjyUntJB5t0s7U3bZnD+8VQYEdg0qp2yzlILE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781561949; c=relaxed/simple;
	bh=s3n8+3CSDVllms7r+qhZajny3rakZGtg6ZtOuwjCe+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzn0Yzf+hncsaohWHBFnDa2iiFyeGXHkv7Ar+4D4X/lFdF7XWUq38KQJAfVH2yYUus5ArKcM8yMzmZFQ6FxZTB62QyoR5cRy0EeoCXqfB4w1v+hnfKuZCQeFOAsqLM/Iz0UhtaTXUJqBtVCrHu53sdlp/Y48ewC8BBVfjJg4KTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IEAYjKHa; arc=none smtp.client-ip=209.85.210.169
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8423f1d8902so1814603b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 15:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781561947; x=1782166747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XHiAwX7OKZgj8s+7kUMrC2Agg+yOPIiQF0+UWU7tqUg=;
        b=IEAYjKHaPbgvhLzgjkl4BQnEaPbojaXWzY+3BadcaWTNuwUwFXQ8J4/xDGaThm4drO
         b2aYzmgCHf0x9hjwS3ingT1gxXFAr7kKJ3IOa3BNDOcAmj2J1/Jk3+nPDFPUsKrJHbP/
         jLy+3Fbau7Kbar9/T93vIvaKnE9m+kwD2Vlb1DYcG53A/Fmv7hSKharGeqFu9K7GPMaM
         jr2aF3dgRMCl9/FSSaHWz1Budsc0hPmy+PykxtR/IEn80r/kMCyJsMKA+2yBcEE5IuGC
         xNwO/QHnFDub3JvZB8gbip3/eeGrB6aefGt8xBs8Tr5nVOGzX94a5gTe7ckt0iTxTXEU
         5h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781561947; x=1782166747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHiAwX7OKZgj8s+7kUMrC2Agg+yOPIiQF0+UWU7tqUg=;
        b=Ss/73lcxnSDZiIUhWh6haZVfoYtWrAwVEtzfPMLi0v5BpHhIljZZiaVpkBKVEm/piR
         dfz6ac8QHPvFDKq6GtwWEImPDRk3GWOwNQQEa3cQBW0Lomy7esgstSGmScQzS5eP9KJP
         xjDYgc/opc75sQVgNYquKm6J4irUO1qE0NHcZkgBuOeBHKDio4sELEFGsDuK5lxtbx5V
         p1OMMVM4+ieVckhqpw3T4pUhgBN+pYjxUeOhLoE2waSkYhIEeVWO2rCTPTZOUdWL+U6S
         w4WjVGSAqiRU6bP9sheRTXlhHV2NUUaRgG6tMyxKr43UygCOa52tdgBNvaFEurSfa9d4
         HnKA==
X-Forwarded-Encrypted: i=1; AFNElJ99eds7q2zmiCkknV6ldOwN/nPW4hAAt0i9t+KHWJnGcgwfzv6k8JmnQFBeXFWmKj04KaKo4wi59cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YygnyDXs52w9ZwwFoXyPLrUiTpbFr0L0v0d896htd8JjoFb+kbn
	7t9kjJth9q68VdCchzN/v2fpU/gzH0Xs/z4jr3Z/RZl7vAjymLQddOuboxI54MW2XNTOeyLyVS6
	bzMBmOE9a
X-Gm-Gg: Acq92OGuVhyeoWCqh//RZ62OfB3IkdnSZ+zLm0eoX0OD+Qbr2TSOj/caRgdTRWPZ5oj
	BD0JrMrSsSoo1S/Zk5C6jlRG/4tqXAnf2Gcjx4Bmg4BZqfvVIipjX3w+4dSp77Ja3WtMdqhyoJH
	bIrw7sKtC4W9+RHC7VdYc2wVrvFsT3kvpLq4Qf9Y2Wj6F99WLQWRKm37meh8nCEoPNM90N2WY1T
	55BYC/Atdjn+GNedVdHVok6lxFZ9YVksaaCatyDxJZCoTt7Hykvn3s1jbUJdwLPePT949D9MVuT
	kP8qq1GRQ92tscb9LEVr9Z26W+gF2UJe2DIsEhRO98+0pavshx2KLar3T0ebxlnwQB673VwE/b3
	now9VI8vNDz4w9/EcvpLLsEwo3IbC4XJdvf0qYJdC5MOdG8YwHGOmfNwDceIC2BLnK2vKFFTPy+
	aXIhJlK5tIP+qnMvY1lczjXrgb6y0Jyed+SRI9vnGKBwMKxLyHJPRmh9+mPXjYtA==
X-Received: by 2002:a05:6a00:3e02:b0:841:dc7d:306a with SMTP id d2e1a72fcca58-844e1a3d7c7mr13260407b3a.25.1781561946731;
        Mon, 15 Jun 2026 15:19:06 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accac96sm11985798b3a.14.2026.06.15.15.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:19:06 -0700 (PDT)
Date: Mon, 15 Jun 2026 22:19:03 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Parav Pandit <parav@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 01/12] PCI: liveupdate: Set up FLB handler for the PCI
 core
Message-ID: <ajB6V6yBHOjgK5ew@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-2-dmatlack@google.com>
 <178124130274.908199.14827357870284807134.b4-review@b4>
 <aiutNINqxhtlm2Dt@kernel.org>
 <178126123047.908199.12042730612990730743.b4-reply@b4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178126123047.908199.12042730612990730743.b4-reply@b4>
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
	TAGGED_FROM(0.00)[bounces-92435-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmatlack@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:pasha.tatashin@soleen.com,m:rppt@kernel.org,m:kexec@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pci@vger.kernel.org,m:ajayachandra@nvidia.com,m:graf@amazon.com,m:alex@shazbot.org,m:bhelgaas@google.com,m:chrisl@kernel.org,m:rientjes@google.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:corbet@lwn.net,m:jrhilke@google.com,m:leonro@nvidia.com,m:lukas@wunner.de,m:parav@nvidia.com,m:praan@google.com,m:pratyush@kernel.org,m:saeedm@nvidia.com,m:skhawaja@google.com,m:skhan@linuxfoundation.org,m:vipinsh@google.com,m:witu@nvidia.com,m:yi.l.liu@intel.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: D735C68A53C

On 2026-06-12 10:47 AM, Pasha Tatashin wrote:
> On 2026-06-12 09:54:44+03:00, Mike Rapoport wrote:
> > On Fri, Jun 12, 2026 at 05:15:02AM +0000, Pasha Tatashin wrote:
> > 
> > > On Fri, 22 May 2026 20:23:59 +0000, David Matlack <dmatlack@google.com> wrote:
> > > 
> > > Please add Pratyush, Mike, and myself so we are notified directly of 
> > > incoming patches, the same as with other areas where the liveupdate/ 
> > > tree is specified.
> > 
> > Or we can add PCI liveupdate files to LIVEUPDATE entry.
> 
> That will not work, as we cannot serve as maintainers for 
> PCI/VFIO/IOMMU/KVM, etc. David Matlack will be the maintainer for the 
> PCI components, and we will accept patches once they have been approved 
> by him.
> 
> The simplification we could do is to create an email alias 
> for the live-update tree maintainers. This would allow us to use a 
> single entry instead of listing all three of us individually.

We could create a Live Update mailing list for all code that can be CCed
on all patches that must be merged through the Live Update tree. I would
also be interested in subscribing to that list.

But if you want to create a LUO maintainers-only list that would work
fine too.

For now, I'll plan to add you as Reviewers under PCI LIVE UPDATE in v7.

