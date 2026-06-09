Return-Path: <linux-doc+bounces-91723-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F86SMEleKGpMCwMAu9opvQ
	(envelope-from <linux-doc+bounces-91723-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 20:41:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6D0663614
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 20:41:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=H0L4IDFH;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91723-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-91723-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A806301601A
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 18:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD71C4968FB;
	Tue,  9 Jun 2026 18:41:09 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A13481651
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 18:41:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781030469; cv=pass; b=rheknvQNkOml/LDIG4SxQLBoGkaM6hlBCRUrKYoC9ehzn/Z0IJIMHcKwH0B0y6Ucniqk8GHgnqUk3vL9xHmehJ7uSsywTV1Vmq7bO9w4jEetMIRPR9XN1sbUdI0Vj3WNGY6kmzS29c2Ws5LmjyQfpk17O0U20Vz2mtMAyXW8YNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781030469; c=relaxed/simple;
	bh=dXGLi431l7+tBBr/wFP1O2Ys/PtUuKJInSX0D2b0rys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIVxl/WyFRhDhFAntbPSkzcjHXMPG3DgoQusLDFuUmR9V/OfMMtFdAMMCfbEQZB+dtPQCAJdQbFVSUm0e40AAH6rMwNYA0xwsgk0QmBCmKDYe01XM0vHrUgif3YdfFZlZq37QoR+POq2GZrfrphwGWhtx5DJ6h7CJ+pRTmqNAwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H0L4IDFH; arc=pass smtp.client-ip=74.125.82.42
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-137dd4cc208so3804082c88.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 11:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781030467; cv=none;
        d=google.com; s=arc-20240605;
        b=joeQLr14uoWCatAwN9wEDIXJfHM8y7RvkWJnP0mCECaONuDAbkY+EEsU941kMuqw32
         1p7qvF6ZIFld0W6a/DMTUXciJ4dsZ394V9jMR2DoL/IXnFTYaWvkOaD4rGvG+slyKk+2
         CljJODtEXLV/IetqcQutPnP8xSAcvaZ2jhX4Zt+miYNKXp7elxQaI0u2FtwiPCuJZaIY
         begYSCek99Jsys6o0SrjzzTyWFa0k4zMQCLEX/kVZIXZsMvv8n4AlwY8sfAe/+2yPfIV
         8WVD18sm0/EC4bXWH3biZx9cwLQxQwX/ZN8USpkKYyQ8RxnavpAKOILQ5J3MsDMC7D9t
         zaDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rp2AVHnvaLdz2Pq3FiqBKoQWbYzwYe73io7ef1uKgPQ=;
        fh=ok1k3ZsvS2KyyHqJm4tQmf4vvAIYwRimS41Z1zH1Br4=;
        b=VqPi/nrSie4nHXKIKRMyCSojSM6wuax0OZX1HRCDDaKiO6Ey/yaz/BzwPQ+vpJXa8e
         vWE6NsXhNyrfIu1V+j5+/cEKwavgwWt/oFsfqTRPpTEQRPyWvJ1oeljrI0O3znEle59v
         J8cU8o3PI2WMP+pJgFwcri5cTQr7RUMek1X9KfKpzhmbGElHcCKSONapFsTfIxCOHi99
         dUIF15aMtcdexLOZiSbprAwi9WyPTWNV+UtE7VxtHT7etWeDHEETmOrnqdknc4gCZK5n
         ecbEHOXzFzMaRx9BXZ8oJ+5kPiDrA9yoK51tCtGeAFk3uiXccSoqolEH0D6pTVfHCc4B
         8cLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781030467; x=1781635267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rp2AVHnvaLdz2Pq3FiqBKoQWbYzwYe73io7ef1uKgPQ=;
        b=H0L4IDFHJn7p9izEmb0m3v+xqccfgHShqsBa9rSr5Xo6VBHgKnUKM1dNtnh6x8ySP9
         5m0kgoQRXd7GpUl4u19Vwdc/McaOJ1Yn8luGzK6uHGiIhn6wvIPFrzR98HZA/77/+4ui
         fQHIFFc8YNm67IS4YSr77e0zi+kDGZtdlDeRZR3pOvFoG7JLZYydDJ7LVkzjb2ZPI56O
         9yH5PuyDsvUt4SI+zunlUaR4Q3pX4UKFoa/OSUEM2sdRUFRNh0Lvp0YZJxo5koeeRt1V
         XLxcJZrKNL3JMDsWciu3zhPpO5WjiDLgnQ+TNhiiLYYT5p0DbcT5Lvfd7/aW8opNJ2QS
         7hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781030467; x=1781635267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rp2AVHnvaLdz2Pq3FiqBKoQWbYzwYe73io7ef1uKgPQ=;
        b=bqcwvQCk5A5KdvRQrkHiYplOjQ7wSi1VVuSWBIpcpNcETTs6UWasLzDEQdezDjr4IH
         Zmo+c4xiY1r82c6/RDmg4epQtXbpyPPXrIdzsCF5HHTXIzB2TkakCSA1LASMdSJyFXuQ
         w3H5kVPqZBUJTBV8tV5D6NJPenyw7SKp3HqnmDCmkrux2K6G4JQQ6es767SN2CamL9m9
         jCCO6PahrdJMiYxqV7r3lCyAvONE9lYnzAAJX0eOvsZJ2da/7014dUVYbC4k7SwISs7o
         fjjUQPRJ2vIw4akFJz93mEXawl39Byosvc5M9S+f+fuauD8xPKicUzymNvWe6vwdQ+9/
         80jA==
X-Forwarded-Encrypted: i=1; AFNElJ+c8+pcDpC11yGloAa24pNeq3E3vX4N5q9GA+aLVuS9s561SvNDRhm50USo7VlRd0D8A44WxjKj/1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqGFjFMp1NR4ztId/eXHfojuHZXm3dIU2n02byW7ZxPfYxdAEf
	bXXe6EqOIDDPmEYn3Y1qhiNtHR2a8Q1AFOwDOUJN+P64YiyxlBNnEw2LwROMmlcSGkHDt4/9Sn/
	c1H1BM1+0D8GOVEdK1t9gAz+hU177L5OroTTyhwb5
X-Gm-Gg: Acq92OEvnLRFyjH2ESKNtuidW5IvkzmcEymTNaXpeO2SsrAp1uVGVVQsjiy3O3j7DtP
	bcLmmiWDwo0icIe37Lwwg5FvcoBSglWq3FzyS6e+tgT57S31pxs5vwV+idM7o28XSvxUrPddxRe
	TA/vip47djaAuVV62mgsXJtwOQkAIQ4aBci+lHOYQGkSJZsr5UZvpDqs0B85wl9Fq+3O+hpaE8u
	bHfHCiE0PUVX82dPDOHNCyfzHtyS5GK7SSpY9dempU6v/m2yOdAJILUeTPqltQ2MS6IOBqkPjmo
	YVk4vcJtVrLQBUoNv/WMA7yhX3j4
X-Received: by 2002:a05:7022:327:b0:133:39b9:9720 with SMTP id
 a92af1059eb24-13807d7f8a8mr10097032c88.16.1781030466370; Tue, 09 Jun 2026
 11:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522202410.3104264-1-dmatlack@google.com> <20260522202410.3104264-9-dmatlack@google.com>
 <aiXWmR-ettxin4LC@google.com> <aic6mdiZ0qUJpFca@google.com> <aihLTgs1Y49OXQaV@google.com>
In-Reply-To: <aihLTgs1Y49OXQaV@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 9 Jun 2026 11:40:39 -0700
X-Gm-Features: AVVi8CfFJIkIzWoDM1n34NzkGcY8xgKn7goqY8e0r212_RJvyRI4sWlWr6KLrxY
Message-ID: <CALzav=dagHvcS8kbTti5rmMoks9DXuCpO3AjptkQ8z_PdG9JyQ@mail.gmail.com>
Subject: Re: [PATCH v6 08/12] PCI: liveupdate: Inherit ACS flags in incoming
 preserved devices
To: Pranjal Shrivastava <praan@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:praan@google.com,m:kexec@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pci@vger.kernel.org,m:ajayachandra@nvidia.com,m:graf@amazon.com,m:alex@shazbot.org,m:bhelgaas@google.com,m:chrisl@kernel.org,m:rientjes@google.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:corbet@lwn.net,m:jrhilke@google.com,m:leonro@nvidia.com,m:lukas@wunner.de,m:rppt@kernel.org,m:parav@nvidia.com,m:pasha.tatashin@soleen.com,m:pratyush@kernel.org,m:saeedm@nvidia.com,m:skhawaja@google.com,m:skhan@linuxfoundation.org,m:vipinsh@google.com,m:witu@nvidia.com,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dmatlack@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-91723-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmatlack@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F6D0663614

On Tue, Jun 9, 2026 at 10:20=E2=80=AFAM Pranjal Shrivastava <praan@google.c=
om> wrote:
>
> On Mon, Jun 08, 2026 at 09:56:41PM +0000, David Matlack wrote:
> > On 2026-06-07 08:37 PM, Pranjal Shrivastava wrote:
> > > On Fri, May 22, 2026 at 08:24:06PM +0000, David Matlack wrote:
> > > > Inherit Access Control Services (ACS) flags on all incoming preserv=
ed
> > > > devices (endpoints and upstream bridges) during a Live Update.
> > > >
> > > > Inheriting ACS flags avoids changing routing rules while memory
> > > > transactions are in flight from preserved devices. This is also str=
ictly
> > > > necessary to ensure that IOMMU group assignments do not change acro=
ss
> > > > a Live Update for preserved devices, as changing ACS configurations=
 can
> > > > split or merge IOMMU groups.
> > > >
> > > > Cache the inherited ACS controls established by the previous kernel=
 in
> > > > struct pci_dev so that ACS controls do not change after a reset
> > > > (pci_restore_state() calls pci_enable_acs()).
> > > >
> > > > To simplify ACS inheritance, reject preserving any devices that req=
uire
> > > > quirks to enable ACS as those quirks would also have to take Live U=
pdate
> > > > into account.
> > > >
> > > > Signed-off-by: David Matlack <dmatlack@google.com>
> > > > ---
> > > >  drivers/pci/liveupdate.c       | 68 ++++++++++++++++++++++++++++++=
++++
> > > >  drivers/pci/liveupdate.h       | 11 ++++++
> > > >  drivers/pci/pci.c              |  5 +++
> > > >  drivers/pci/pci.h              |  5 +++
> > > >  drivers/pci/quirks.c           |  7 ++++
> > > >  include/linux/pci_liveupdate.h |  6 +++
> > > >  6 files changed, 102 insertions(+)
> > > >
> > >
> > > [...]
> > >
> > > >
> > > > +void pci_liveupdate_init_acs(struct pci_dev *dev)
> > > > +{
> > > > + guard(rwsem_read)(&pci_liveupdate.rwsem);
> > > > +
> > > > + if (!dev->acs_cap || !dev->liveupdate.incoming)
> > > > +         return;
> > > > +
> > > > + pci_read_config_word(dev, dev->acs_cap + PCI_ACS_CTRL, &dev->live=
update.acs_ctrl);
> > >
> > > I might be thinking out loud here, but as an attacker, this motivates=
 me
> > > to somehow hack the EP FW to mis-report the PCI_ACS_CTRL register acr=
oss
> > > a liveupdate to fool the incoming kernel. If the FW feeds a 0, it sil=
ently
> > > strips ACS protections.
> > >
> > > Should we also serialize ACS state in ser somehow to ensure we aren't
> > > fooled by something like this?
> >
> > What does "EP FW" mean?
>
> I was referring to the Endpoint Firmware (basically any SW running on
> a downstream device)
>
> >
> > Does such an attacker even need Live Update to attack the system? It
> > seems like such an attacker could route TLPs in whatever malicious way
> > they want regardless of Live Update.
> >
>
> I agree that compromised PCIe devices are a menace anyway. But I was
> talking about the potential window opened up by Live Update here,
> suppose we have Device A & B assigned to 2 different VMs (implying they
> are in separate IOMMU groups because the switch set ACS_RR =3D 1).
>
> Now, the attacker has an opportunity with Liveupdate, since the devices
> are already assigned, if *somehow* it flips a bit like ACS_RR, the
> incoming kernel might see both the devices in the same IOMMU group.
> Who detects this case and what happens if this happens if the devices
> are kept assigned to these VMs?

I suspect that would be caught during the restore of the iommufds to
which those devices are attached.

The kernel would attempt to restore each device into a separate domain
(since that's how they were preserved before the Live Update) but that
will fail because they are in the same group now. Even if one of the
devices was not preserved, that will still cause a failure when a user
tries to start using that device (e.g. to try to attach it to a
different VM).

