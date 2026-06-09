Return-Path: <linux-doc+bounces-91728-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QZY/Nb1rKGovEAMAu9opvQ
	(envelope-from <linux-doc+bounces-91728-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 21:38:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EE5663CF0
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 21:38:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=MntNxBDX;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91728-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-91728-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A788131EAC1E
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 19:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBDE3E44F3;
	Tue,  9 Jun 2026 19:26:10 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF333E44F1
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 19:26:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781033170; cv=none; b=DFxN5W6J1LqyALLitRKqKGky2xbKer+/7rtkBR2Yp8dhXZwo+qQOW3CnZoTnXjd2+7A8BTfn/IoxXW57EcZsUcjqBDDqVA0JGkUf2qM8TsDbiymqroq5Z+n+2T2rt1QINm6YhZW3ySTep7Ij62gjB5+hT/3b4J1/7ARCJAlbin8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781033170; c=relaxed/simple;
	bh=hUdS7/5D3n0KgikjBBkEhD+OHIyfzqMZYiz35QP0l64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1hCNL8svxzeu2nTzrNQkfGY1JTho2XDXb8jyCdUJG/1vB5ckl5E2BTgMl25lg7tzsrEgzplLZWOBiUeBUj5R1vitBKiYN8dOBQ/EpOkQJVC23bJUBEhxlV5+epR8/qGtt9vfptJCEezrhr0TmVV5jrzAGjBE59loz4NY6e7vwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MntNxBDX; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf2d865383so505695ad.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 12:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781033167; x=1781637967; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vpDQMG3B/X+zmrU+8qfo8gbz7yy+2Hc3r+dRrwN0wsk=;
        b=MntNxBDXMVKekIS6eA+gJxuEbidNrNKIfeshL0WnIVq5rS2yhDIcvT+SnQU9QbT301
         25q0Dt0El9GPLb/JtdqVPITJSTvDpKTXWZmncNKIb1ESKZr3bRebipXoc3zSaZLq/ixs
         XZjDxnRN9jmOFwd9mUskz1/lin0W/aJ+TDuJuMC7xKTipZUeBswzFm0V0EfiDkR0h2/T
         NLiL67Lctvgm2O57L+fZG11XKsj1XvZvLvvftbBcj0Wsn86uJrnGaEjbst8GtoFJUY6M
         DF9ZiUVrU/O+kAl5c8Lk59DQcwdlVy4y5E6N5tIOgbt10NpmWxziHdhIpDAjpiQJew3Z
         I/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781033167; x=1781637967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vpDQMG3B/X+zmrU+8qfo8gbz7yy+2Hc3r+dRrwN0wsk=;
        b=OmKnarhFSyUlrFhIUUEKQTIIj7MAxce961HXVse7/TnnDXD0zUVhJvnCbFbZ8O8Rww
         W0du/XyLX6ngdg8gltL3BPX9eJ5hlDwi+gzJohbWp3uhOpJx8xX45N048+1fJtUjxngK
         rnliAM+JFmkfBb0IABEnAW3Uzv1UNa7q8IJ+LxWloFcnA6HJGGvbdizFCUetf1QAuvgL
         yqF/1YIt/ykM8R3sqUsSPBOFGmE9ryZrkveLdPWnRl5WnaPQa9YGsviSKuxcUWC9hJH3
         w6MYQUbSAGTYt7S0X5Xh5gNsbmZFr+dCK1EmejAHsLAYG9SYrqWtProm0gGEiIqoccef
         HPzw==
X-Forwarded-Encrypted: i=1; AFNElJ+aDoidjFbt5Yb73+8UqGPliMKodofyf8oxX7VvDnDG7PHFoWjHM4fgIh4d/P389AmpaCwGadKbplo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTDTGhh1PyvYLSJmAgRfDKGmhN2F0IEXBBzezh4mz8BF+tFtOM
	IguKbrPTzqz+2JwvHglTCMwWWRp9tkuA8iSU8i9VzyliOqvbuajGhgVzPS4lIUzb2g==
X-Gm-Gg: Acq92OFQtl5sBzcLXyNuMhHcR/jcY3xWy0WufOPQb09eQJ3G34ady+DeDL0tn5q+uv3
	LhT2GWvMaSZSb8XGu5B3y0WSvd+F5Mkgv/iWXTwQiaVWiJzuusFO1z+qQg1+X1N2O7FYUPvMxNQ
	mCo3LDJ7rF+XcOHV8v9EqoZ8fxkECrNo6PGsGBZ7G8szekqgBOpLphSEdN3twh9NC6exlsKxa6W
	sQ+RxEaBq6RElDeZCgU+0IA5yMa0NHiVoEk4Kb9qkrUbAwKhlZgUk29/LrzSKJipM/JHmnVkfRz
	ZwHTqPJjRd3y6cL1ZjzTFPUT6gme8mbSlfhPmQjvQ8OwBWti3t1vka56plBYELxMGN6F6FMaRDr
	P9p4+j5vP8VjHtvi2y9yssvFeYbAsOSRda+/dKJHyfoH9Gk7wGRWvrbpoHDQXNyY+vVWdOPx871
	TttB2k+yXQtsDFYVU/oBuyIeuKqwyorMzD4KGvCq3oaj1lk9PE3weikzu+KkZszTMA1IBgl38=
X-Received: by 2002:a17:903:19ed:b0:2bf:3579:cdaa with SMTP id d9443c01a7336-2c1eb942782mr8088245ad.10.1781033166370;
        Tue, 09 Jun 2026 12:26:06 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428237430esm20445672b3a.21.2026.06.09.12.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:26:05 -0700 (PDT)
Date: Tue, 9 Jun 2026 19:25:56 +0000
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
Subject: Re: [PATCH v6 08/12] PCI: liveupdate: Inherit ACS flags in incoming
 preserved devices
Message-ID: <aihoxGlb-ruwAaWC@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-9-dmatlack@google.com>
 <aiXWmR-ettxin4LC@google.com>
 <aic6mdiZ0qUJpFca@google.com>
 <aihLTgs1Y49OXQaV@google.com>
 <CALzav=dagHvcS8kbTti5rmMoks9DXuCpO3AjptkQ8z_PdG9JyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzav=dagHvcS8kbTti5rmMoks9DXuCpO3AjptkQ8z_PdG9JyQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91728-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64EE5663CF0

On Tue, Jun 09, 2026 at 11:40:39AM -0700, David Matlack wrote:
> On Tue, Jun 9, 2026 at 10:20 AM Pranjal Shrivastava <praan@google.com> wrote:
> >
> > On Mon, Jun 08, 2026 at 09:56:41PM +0000, David Matlack wrote:
> > > On 2026-06-07 08:37 PM, Pranjal Shrivastava wrote:
> > > > On Fri, May 22, 2026 at 08:24:06PM +0000, David Matlack wrote:
> > > > > Inherit Access Control Services (ACS) flags on all incoming preserved
> > > > > devices (endpoints and upstream bridges) during a Live Update.
> > > > >
> > > > > Inheriting ACS flags avoids changing routing rules while memory
> > > > > transactions are in flight from preserved devices. This is also strictly
> > > > > necessary to ensure that IOMMU group assignments do not change across
> > > > > a Live Update for preserved devices, as changing ACS configurations can
> > > > > split or merge IOMMU groups.
> > > > >
> > > > > Cache the inherited ACS controls established by the previous kernel in
> > > > > struct pci_dev so that ACS controls do not change after a reset
> > > > > (pci_restore_state() calls pci_enable_acs()).
> > > > >
> > > > > To simplify ACS inheritance, reject preserving any devices that require
> > > > > quirks to enable ACS as those quirks would also have to take Live Update
> > > > > into account.
> > > > >
> > > > > Signed-off-by: David Matlack <dmatlack@google.com>
> > > > > ---
> > > > >  drivers/pci/liveupdate.c       | 68 ++++++++++++++++++++++++++++++++++
> > > > >  drivers/pci/liveupdate.h       | 11 ++++++
> > > > >  drivers/pci/pci.c              |  5 +++
> > > > >  drivers/pci/pci.h              |  5 +++
> > > > >  drivers/pci/quirks.c           |  7 ++++
> > > > >  include/linux/pci_liveupdate.h |  6 +++
> > > > >  6 files changed, 102 insertions(+)
> > > > >
> > > >
> > > > [...]
> > > >
> > > > >
> > > > > +void pci_liveupdate_init_acs(struct pci_dev *dev)
> > > > > +{
> > > > > + guard(rwsem_read)(&pci_liveupdate.rwsem);
> > > > > +
> > > > > + if (!dev->acs_cap || !dev->liveupdate.incoming)
> > > > > +         return;
> > > > > +
> > > > > + pci_read_config_word(dev, dev->acs_cap + PCI_ACS_CTRL, &dev->liveupdate.acs_ctrl);
> > > >
> > > > I might be thinking out loud here, but as an attacker, this motivates me
> > > > to somehow hack the EP FW to mis-report the PCI_ACS_CTRL register across
> > > > a liveupdate to fool the incoming kernel. If the FW feeds a 0, it silently
> > > > strips ACS protections.
> > > >
> > > > Should we also serialize ACS state in ser somehow to ensure we aren't
> > > > fooled by something like this?
> > >
> > > What does "EP FW" mean?
> >
> > I was referring to the Endpoint Firmware (basically any SW running on
> > a downstream device)
> >
> > >
> > > Does such an attacker even need Live Update to attack the system? It
> > > seems like such an attacker could route TLPs in whatever malicious way
> > > they want regardless of Live Update.
> > >
> >
> > I agree that compromised PCIe devices are a menace anyway. But I was
> > talking about the potential window opened up by Live Update here,
> > suppose we have Device A & B assigned to 2 different VMs (implying they
> > are in separate IOMMU groups because the switch set ACS_RR = 1).
> >
> > Now, the attacker has an opportunity with Liveupdate, since the devices
> > are already assigned, if *somehow* it flips a bit like ACS_RR, the
> > incoming kernel might see both the devices in the same IOMMU group.
> > Who detects this case and what happens if this happens if the devices
> > are kept assigned to these VMs?
> 
> I suspect that would be caught during the restore of the iommufds to
> which those devices are attached.
> 
> The kernel would attempt to restore each device into a separate domain
> (since that's how they were preserved before the Live Update) but that
> will fail because they are in the same group now. Even if one of the
> devices was not preserved, that will still cause a failure when a user
> tries to start using that device (e.g. to try to attach it to a
> different VM).

Yes, IOMMU would eventually catch-up but what about the DMAs that were
done already? Say to an NVMe disk? We'll have to wipe the entire disk in
such a case? Also, we wouldn't know the offending device..

If such situations aren't a problem, then I guess it's fine.

Thanks,
Praan


