Return-Path: <linux-doc+bounces-92557-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3tsjAVrMMWrjqAUAu9opvQ
	(envelope-from <linux-doc+bounces-92557-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 00:21:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7456958E9
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 00:21:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=WaSnrYEs;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92557-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92557-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 763463165807
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 22:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183C63A8722;
	Tue, 16 Jun 2026 22:21:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121A0391E72
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 22:21:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781648464; cv=pass; b=QcYh/vXEII0ItHoMxmEDNVTgPcuHqUC8U/hpIN/dwQJVilc9u/gCh21qJ3BUvWbHnGF+3IjxDgtsHT8k7ImVu5WHiTWoDJ5KS3BelTRyzmNOUTbgtLrEnap71M2aR3BggnC0yP7KGUmL5VMp1l25R5W6WCa+w8JIxlyuRCWjzjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781648464; c=relaxed/simple;
	bh=qme9hMeTybbvHWlc65qwT/wsA705F7QW3wsJxaveMyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wk9JKd41t40lQssN4/qX6YqUZz5n0T2lnIa24eDuherPjP+oANbyInjdFi0I2F2hUhxpW3RHtr1Z6arwci1vvWcVb1YCh01mHxKmevXh3Xy2P8y6FLRMn5YXCC7TuA0tjJ5uQioIRF6bVdfPLhQgRF9DNRA4A0ruC22y2J+Htss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WaSnrYEs; arc=pass smtp.client-ip=74.125.82.53
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1390f75d8bbso225074c88.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 15:21:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781648461; cv=none;
        d=google.com; s=arc-20240605;
        b=URkB35I2vOpQi8wlzqesJ6MXP19293U5o0Q3Gxtq1SnYZdx4kyc7eMhOhSvKSlPBmk
         cfAzO4kMhyuEjJhX3yM3ssdflR3ZSAxblbk8GxzKK69UKsUq2vQ26higMC3/HvhkgmEZ
         AxZosMfpCD8T/DX0b/9myr6meNAmkACsVKmVesb14KDYtt3fXqHIhLzrA+Avl11mcq83
         EmehwJl+dTbbNuVenhNUPjREmtisVDm4/sMXPQxhKJGS+zdzzS/BFrSuAq+lmCCeGlyP
         20BXH7Gigl5m+Lnr1vNwR7p+QrlfH2oRTqYynftgR3E8oOykdSNY/S8+ACswEEhMB+5z
         SZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5hm1HVaCy9nZT8d+x5IZzYgyaULXvQNG2Dw2s8INhX4=;
        fh=EyWfbJrrZ2QCfdqoumSxqlZcaYRyXJa8SpoAuTl0rrQ=;
        b=W7W4pLhzjl332UOIfJr7u6daKnP+z1eMoINzVT/Xz5L2on1AHZyCirRvC02+7SnTNw
         Jveg2udLL7GVD0pLi1l1tbLvaH6WcLWQTxmkrgMAyJjWTMJPfswUo4mYiXEeYFQgKTn1
         bC+t/xde5DhpzyHpb6GUj2HZ11U98TMEnWvokHynumrybInBFEUI8A53A/gE4G70l/mF
         5GCFZsYjbQDbfVD4THX0s147OoWkx0necM+CF7VlYg4XLhIlLRQNMswGCSlLEAoDoJI1
         o5RboPL7Ai+zhGaBcpUoKjSl17+Sn36yIU0kyDMdDeQdmTAl63YTZ+/BsPrlmKcvc5Wb
         4vvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781648461; x=1782253261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hm1HVaCy9nZT8d+x5IZzYgyaULXvQNG2Dw2s8INhX4=;
        b=WaSnrYEslwMKTZ1E4L/bXRbsZUJBd3u1ey5KCjQyJcXHmlFiKCXDWkQSdY7WuihHc/
         PPql6fvqNUNyZ6m/xVA4RG3pRHqmCL99OmscMJkledKET3Q6WA5hq8Q94y6K/FJDucbF
         x2AKkA2y0oYjnsGSbCKwNe6s1QoGRPJ2IjWfU80HLl1rosF5wlWMWSgz3uCfvS5fbLB7
         o6YEpilC2wGv7uqWKV0WQqSWSEaAsXrKXkN1HSyIOfextoTptgjxbetLhC0pDXfPDUGx
         3YbAd7r+MdVQLSyJTXp1ksxDcvsTFMBoeeUEG7JwTgxa8RNbqtPOYP3HrSxAcY8NTC9Z
         AFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781648461; x=1782253261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5hm1HVaCy9nZT8d+x5IZzYgyaULXvQNG2Dw2s8INhX4=;
        b=E82j2OByw6jmw+EzUqngBga37llerEE3kjcGrxwvL1WDprYSmMaZNPHitYv/UjBSHs
         kMYpPDkqM/ITgHZDRVuhDPLt1bdRUtgGy6XCxKvs0pmBiqYMCCljsjZNXn8OJPt9HaOd
         XV11fQQXxVuZvCg+gpLtTPbyEckWar+8mquRA5g5EuWL4y5XVTA8ClCODH5MhGzfU2kN
         To8OArlcZvSX8Fhxbj5VveKjQ/1Hv5ViM2B+ZA3Ow/93oG44lI4yuhm4C7WupfB+DTaU
         N7FPQ0i0BasH3hT3Cae8GOH9FpllVh5GJPIFSMJNO/BdG/eaGqc03ZKeI+o4ehJb1OTK
         SjEw==
X-Forwarded-Encrypted: i=1; AFNElJ/xHmk5j+BFY+ThsY+C5g6uEj8kStSoP4KJaUVBFVnjV8kUESEczISWWgzh2q5eDsCh2dtQwEy9miE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF4Z0tW7JgBDCs+yVBkeqVO3+k8wWqgQsu9ET071Pvhzs7iCLO
	y8POHR7Jss+kt2nsTIm7xSL42/Dq/ENqo/AFso9EWVHKaqe4mOhzB4iC7vEjMI9o1Vs9B0/uiJY
	GVS0cFT0IKqKRqkuzK3XqNLY/JlD0uCzlUp5Hh4Mb
X-Gm-Gg: Acq92OE8JGcMbnKd45Uqf/xN2uCpoZipLNRsk+cAAJnS97sJPhaGC748L8fzAXLS+xm
	t0ZhJRR2/AdGyn0zpvPL4ZRju0PsnmffGmVRAxQFuUtn4Qrih1xoeteSioRTHtuUXaNa5WnJmVA
	qxP0XzDAwxKDGa9moGn4nZvinzP8GCFZckgzkcWQVdgOnNBo5mGHKXIIUNyZmCvaYwQM3SuAB1l
	+Hx+w2dZpNbbNA33QAZeoJ0tjTcb7mdUSNIb+NUKR++x7QpCvmuGlB5BMvbgwpsGFzXxCbDTi3m
	pVcrUog=
X-Received: by 2002:a05:7022:6ba8:b0:136:ac69:b0f7 with SMTP id
 a92af1059eb24-1398f680985mr453889c88.16.1781648460211; Tue, 16 Jun 2026
 15:21:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522202410.3104264-1-dmatlack@google.com> <20260522202410.3104264-4-dmatlack@google.com>
 <ajGpxMXk9iyXLzC4@google.com>
In-Reply-To: <ajGpxMXk9iyXLzC4@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 16 Jun 2026 15:20:33 -0700
X-Gm-Features: AVVi8CfxK4mMKiv0sputj5dz4geA42BjbfG1FN5Obs96hOQRjIUk8-dblh_dgDE
Message-ID: <CALzav=eo=UwoTNTYM8Z7uKoihxfB7NtVP701qidVgoqyBKhUig@mail.gmail.com>
Subject: Re: [PATCH v6 03/12] PCI: liveupdate: Track incoming preserved PCI devices
To: Samiullah Khawaja <skhawaja@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:skhawaja@google.com,m:kexec@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pci@vger.kernel.org,m:ajayachandra@nvidia.com,m:graf@amazon.com,m:alex@shazbot.org,m:bhelgaas@google.com,m:chrisl@kernel.org,m:rientjes@google.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:corbet@lwn.net,m:jrhilke@google.com,m:leonro@nvidia.com,m:lukas@wunner.de,m:rppt@kernel.org,m:parav@nvidia.com,m:pasha.tatashin@soleen.com,m:praan@google.com,m:pratyush@kernel.org,m:saeedm@nvidia.com,m:skhan@linuxfoundation.org,m:vipinsh@google.com,m:witu@nvidia.com,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmatlack@google.com,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-92557-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmatlack@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F7456958E9

On Tue, Jun 16, 2026 at 1:09=E2=80=AFPM Samiullah Khawaja <skhawaja@google.=
com> wrote:
>
> On Fri, May 22, 2026 at 08:24:01PM +0000, David Matlack wrote:
> >During PCI enumeration, the previous kernel might have passed state abou=
t
> >devices that were preserved across kexec. The PCI core needs to fetch
> >this state to identify which devices are "incoming" and require special
> >handling.
> >
> >Add pci_liveupdate_setup_device() which is called during device setup
> >to fetch the serialized state (struct pci_ser) from the Live Update
> >Orchestrator. The first time this happens, pci_flb_retrieve() will run
> >and convert the array of pci_dev_ser structs into an xarray so that it
> >can be looked up efficiently.
> >
> >If a device is found in the xarray, the PCI core stores a pointer to its
> >state in dev->liveupdate_incoming and holds a reference to the incoming
> >FLB until pci_liveupdate_finish() is called by the driver.
> >
> >This ensures proper lifecycle management for incoming preserved devices
> >and allows the PCI core and drivers to apply specific Live Update
> >logic to them in subsequent commits.
> >
> >Drivers can check if a device is an incoming preserved device (e.g.
> >during probe) by calling pci_liveupdate_is_incoming().
> >
> >CONFIG_64BIT is now required to enable CONFIG_PCI_LIVEUPDATE so that the
> >domain and bdf can be guaranteed to fit in an unsigned long and be used
> >as the xarray key.
> >
> >Signed-off-by: David Matlack <dmatlack@google.com>
> >---
> > MAINTAINERS                    |   1 +
> > drivers/pci/Kconfig            |   2 +-
> > drivers/pci/liveupdate.c       | 230 ++++++++++++++++++++++++++++++++-
> > drivers/pci/liveupdate.h       |   5 +
> > drivers/pci/probe.c            |   3 +
> > include/linux/pci_liveupdate.h |  13 ++
> > 6 files changed, 251 insertions(+), 3 deletions(-)
> >
>
> [snip]
> >
> > static int pci_flb_retrieve(struct liveupdate_flb_op_args *args)
> > {
> >-      args->obj =3D phys_to_virt(args->data);
> >+      struct pci_ser *ser =3D phys_to_virt(args->data);
> >+      struct pci_flb_incoming *incoming;
> >+      int ret =3D -ENOMEM;
> >+      u32 i;
> >+
> >+      incoming =3D kmalloc_obj(*incoming);
> >+      if (!incoming)
> >+              goto err_restore_free;
> >+
> >+      incoming->ser =3D ser;
> >+      xa_init(&incoming->xa);
> >+
> >+      for (i =3D 0; i < incoming->ser->max_nr_devices; i++) {
> >+              struct pci_dev_ser *dev_ser =3D &incoming->ser->devices[i=
];
> >+              unsigned long key;
> >+
> >+              if (!dev_ser->refcount)
> >+                      continue;
> >+
> >+              key =3D pci_ser_xa_key(dev_ser->domain, dev_ser->bdf);
> >+              ret =3D xa_insert(&incoming->xa, key, dev_ser, GFP_KERNEL=
);
> >+              if (ret)
> >+                      goto err_xa_destroy;
> >+      }
> >+
> >+      args->obj =3D incoming;
> >       return 0;
> >+
> >+err_xa_destroy:
> >+      xa_destroy(&incoming->xa);
> >+      kfree(incoming);
> >+err_restore_free:
> >+      kho_restore_free(ser);
> >+      return ret;
>
> Hmm.. This is interesting, so the KHO state is freed and it cannot be
> reused. I see you already pointed out that we are putting an LUO policy
> to say that the retry is not allowed.
>
> But what should be the behaviour of liveupdate in this regard? Let the
> system boot in a normal way? This might break other subsystems as they
> might depend on PCIe restoring state properly. Also I think some of the
> PCIe state, like device-id, BAR addresses, ACLs etc, might be used as
> source of truth by other components.
>
> For example, lets say FLB retrieve() of PCIe fails, but succeeds for
> VFIO/IOMMU, now VFIO/IOMMU are restoring state of a device that is not
> restored/preserved?
>
> Should this be considered fatal?

If PCI FLB retrieve fails then there are certain things that cannot be
guaranteed, such as BDF (B specifically) remaining constant. This
could lead to memory corruption as the IOMMU may have live
translations in place for those specific RequesterIDs. And, in the
future, preserved devices may be doing P2P which depends on BARs not
moving. If the PCI core cannot retrieve the FLB saved by the previous
kernel, it cannot make these guarantees.

So yeah I think you're right that PCI core should treat FLB retrieve
as fatal and just panic.

> > }
> >
> > static void pci_flb_finish(struct liveupdate_flb_op_args *args)
> > {
> >-      kho_restore_free(args->obj);
> >+      struct pci_flb_incoming *incoming =3D args->obj;
> >+
> >+      xa_destroy(&incoming->xa);
> >+      kho_restore_free(incoming->ser);
> >+      kfree(incoming);
> > }
> >
> > static struct liveupdate_flb_ops pci_liveupdate_flb_ops =3D {
> >@@ -270,6 +335,91 @@ void pci_liveupdate_unpreserve(struct pci_dev *dev)
> > }
> > EXPORT_SYMBOL_GPL(pci_liveupdate_unpreserve);
> >
> >+static struct pci_flb_incoming *pci_liveupdate_flb_get_incoming(void)
> >+{
> >+      struct pci_flb_incoming *incoming =3D NULL;
> >+      int ret;
> >+
> >+      ret =3D liveupdate_flb_get_incoming(&pci_liveupdate_flb, (void **=
)&incoming);
> >+
> >+      /* Live Update is not enabled. */
> >+      if (ret =3D=3D -EOPNOTSUPP)
> >+              return NULL;
> >+
> >+      /* Live Update is enabled, but there is no incoming FLB data. */
> >+      if (ret =3D=3D -ENODATA)
> >+              return NULL;
> >+
> >+      /*
> >+       * Live Update is enabled and there is incoming FLB data, but non=
e of it
> >+       * matches pci_liveupdate_flb.compatible.
> >+       *
> >+       * This could mean that no PCI FLB data was passed by the previou=
s
> >+       * kernel, but it could also mean the previous kernel used a diff=
erent
> >+       * compatibility string (i.e. a different ABI).
> >+       */
> >+      if (ret =3D=3D -ENOENT) {
> >+              pr_info_once("No incoming FLB matched %s\n", pci_liveupda=
te_flb.compatible);
> >+              return NULL;
> >+      }
> >+
> >+      /*
> >+       * There is incoming FLB data that matches pci_liveupdate_flb.com=
patible
> >+       * but it cannot be retrieved.
> >+       */
> >+      if (ret) {
> >+              WARN_ONCE(ret, "Failed to retrieve incoming FLB data\n");
>
> I think this should probably be considered fatal as mentioned above or
> the caller of this function should get an error so it can fail. I think
> retrievel of preserved state should generally not fail unless there is
> memory corruption or ABI is incompatible.

Yeah. I think I will just call panic() here to cover all cases.

> >+              return NULL;
> >+      }
> >+
> >+      return incoming;
> >+}
> >+
>
> [snip]
> >+
> >+static inline bool pci_liveupdate_is_incoming(struct pci_dev *dev)
> >+{
> >+      return false;
> >+}
> > #endif
> >
> > #endif /* LINUX_PCI_LIVEUPDATE_H */
> >--
> >2.54.0.746.g67dd491aae-goog
> >
>
> Sami

