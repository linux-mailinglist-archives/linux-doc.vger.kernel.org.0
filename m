Return-Path: <linux-doc+bounces-16194-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 000558C279B
	for <lists+linux-doc@lfdr.de>; Fri, 10 May 2024 17:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABAF928779B
	for <lists+linux-doc@lfdr.de>; Fri, 10 May 2024 15:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B31217165E;
	Fri, 10 May 2024 15:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PDQQy5hG"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA22117109C
	for <linux-doc@vger.kernel.org>; Fri, 10 May 2024 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715354640; cv=none; b=tkjJmKrWaCl2oXIEUnP80LpQDgtjdh9719ud936mVKB/RSOqEMfsxv9BmJOQEffBUtshyUE+gNOjV37eEEGxMDSOHTujEPHwbRP2MIy/J6wUo0Pi8V8lbF7A8jSlRd/kz8chQ+v/yCig2n12614iQ9hd6rg6m59y3bWxX03heIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715354640; c=relaxed/simple;
	bh=LSok61qLtd0K7YrwozvngADJVpGHf9jEEUNeNiy5Mf8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=on6r5FFJn/x3iwQ5+pAWvaAxdeVxTHcAcCrDbCJCXjv4W55/sHx6Y9iaWMZU9ajQSjkf7LN4fTqdWVMpIcP1BeE4wdPA0FHz+jPJke+1mMdNbO2Z/dTFgknm0icDxOjqDxn/dDXK7Ig6dei3P/sQ7hVT0T7MlgyfUS/uBWaOO6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PDQQy5hG; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-43de92e234dso21869641cf.1
        for <linux-doc@vger.kernel.org>; Fri, 10 May 2024 08:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1715354637; x=1715959437; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rOmwLQZvL1ACiD5QhGHyJllYMD1IusDJxUQbTnYPrzw=;
        b=PDQQy5hG97wjAd7rU0JNmER5gsud2b5VSXJRBmjp1ckaMczHLJ1eszwI3N9cfWdk9B
         nCg4sAs11yECLleqkkKTfhm6eWBXZZ1UzVRRdCsf5Cx5/9I5wrA3hClJo5FLhV1nBn3B
         fBYBY8a5yuC/BqlDOJlXCKjuHsalOgE92vcsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715354637; x=1715959437;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOmwLQZvL1ACiD5QhGHyJllYMD1IusDJxUQbTnYPrzw=;
        b=n4jLn8ftcnTgHPD7jlknbq+XwtYcA8r9ePw/XHk+dIQq/9En6k23glmnhoy9a5MCmf
         G+eq4vVNiI38RgOMW9MLbweKo+FBr6PolrCt2BNIH6FLh7QnfojZ+7p+xn7qqjmY2ssQ
         uMFoBSVEHNinlG3DI1RyC+J582J2oIQdjRcUoMC8PRJo+JQ/JvGSsg/bCLgq0uT1QuJU
         vX71KJ1KZEVNh7yAl3NR2Ty4ExpoStzqp0dKK7yOBVtaofRo10TBkOBTKLxGF027Hpn5
         RYQV8YeLI/sHEaRariHYgVuv0pzx1lZhBsSdIo0JY8cF5FKnihrSVxBnUhug0Pjt2Kp2
         bXTg==
X-Forwarded-Encrypted: i=1; AJvYcCWuajLCeBXL757KHIrczSeAWdrp3we04AnIs1SBwL/PHMXTiT9grJh8RPPuUYEBAkQbkDS6wnXunmueaR0Ooq0Kwd4kO5ezS55D
X-Gm-Message-State: AOJu0YxxRfeeAbaUQPhJKkef3PB3sIyknWzZpcf476dN5u27NPI9L9IO
	Ht80CY0OlIRDpN7T8grzO0eYS48ge+/D6N775Q6dRpkIqUv+bPTgWbt7xnuJ5w==
X-Google-Smtp-Source: AGHT+IHV6Ws12uTBmJmAaVeILdQjt846dUrLn68L+gaVQZz+zJhIDBIPDl0YTLbkzwnx9UGaO0uIAw==
X-Received: by 2002:ac8:580c:0:b0:43a:b66d:1a67 with SMTP id d75a77b69052e-43dfce3d0camr59087601cf.29.1715354636655;
        Fri, 10 May 2024 08:23:56 -0700 (PDT)
Received: from C02YVCJELVCG.dhcp.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df54b5a3asm22254341cf.11.2024.05.10.08.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 08:23:56 -0700 (PDT)
From: Andy Gospodarek <andrew.gospodarek@broadcom.com>
X-Google-Original-From: Andy Gospodarek <gospo@broadcom.com>
Date: Fri, 10 May 2024 11:23:48 -0400
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Ajit Khaparde <ajit.khaparde@broadcom.com>,
	Wei Huang <wei.huang2@amd.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org, bhelgaas@google.com, corbet@lwn.net,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, alex.williamson@redhat.com,
	michael.chan@broadcom.com, manoj.panicker2@amd.com,
	Eric.VanTassell@amd.com
Subject: Re: [PATCH V1 8/9] bnxt_en: Add TPH support in BNXT driver
Message-ID: <Zj48BPYoFU1ISaiL@C02YVCJELVCG.dhcp.broadcom.net>
References: <20240509162741.1937586-1-wei.huang2@amd.com>
 <20240509162741.1937586-9-wei.huang2@amd.com>
 <868a4758-2873-4ede-83e5-65f42cb12b81@linux.dev>
 <CACZ4nhuBMOX8s1ODcJOvvCKp-VsOPHShEUHAsPvB75Yv2823qA@mail.gmail.com>
 <4c6a8b86-6544-4c99-a0f2-030e2ec4e98f@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c6a8b86-6544-4c99-a0f2-030e2ec4e98f@linux.dev>

On Fri, May 10, 2024 at 11:35:35AM +0100, Vadim Fedorenko wrote:
> On 10.05.2024 04:55, Ajit Khaparde wrote:
> > On Thu, May 9, 2024 at 2:50 PM Vadim Fedorenko
> > <vadim.fedorenko@linux.dev> wrote:
> > > 
> > > On 09/05/2024 17:27, Wei Huang wrote:
> > > > From: Manoj Panicker <manoj.panicker2@amd.com>
> > > > 
> > > > As a usage example, this patch implements TPH support in Broadcom BNXT
> > > > device driver by invoking pcie_tph_set_st() function when interrupt
> > > > affinity is changed.
> > > > 
> > > > Reviewed-by: Ajit Khaparde <ajit.khaparde@broadcom.com>
> > > > Reviewed-by: Andy Gospodarek <andrew.gospodarek@broadcom.com>
> > > > Reviewed-by: Wei Huang <wei.huang2@amd.com>
> > > > Signed-off-by: Manoj Panicker <manoj.panicker2@amd.com>
> > > > ---
> > > >    drivers/net/ethernet/broadcom/bnxt/bnxt.c | 51 +++++++++++++++++++++++
> > > >    drivers/net/ethernet/broadcom/bnxt/bnxt.h |  4 ++
> > > >    2 files changed, 55 insertions(+)
> > > > 
> > > > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > > > index 2c2ee79c4d77..be9c17566fb4 100644
> > > > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > > > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> > > > @@ -55,6 +55,7 @@
> > > >    #include <net/page_pool/helpers.h>
> > > >    #include <linux/align.h>
> > > >    #include <net/netdev_queues.h>
> > > > +#include <linux/pci-tph.h>
> > > > 
> > > >    #include "bnxt_hsi.h"
> > > >    #include "bnxt.h"
> > > > @@ -10491,6 +10492,7 @@ static void bnxt_free_irq(struct bnxt *bp)
> > > >                                free_cpumask_var(irq->cpu_mask);
> > > >                                irq->have_cpumask = 0;
> > > >                        }
> > > > +                     irq_set_affinity_notifier(irq->vector, NULL);
> > > >                        free_irq(irq->vector, bp->bnapi[i]);
> > > >                }
> > > > 
> > > > @@ -10498,6 +10500,45 @@ static void bnxt_free_irq(struct bnxt *bp)
> > > >        }
> > > >    }
> > > > 
> > > > +static void bnxt_rtnl_lock_sp(struct bnxt *bp);
> > > > +static void bnxt_rtnl_unlock_sp(struct bnxt *bp);
> > > > +static void bnxt_irq_affinity_notify(struct irq_affinity_notify *notify,
> > > > +                                  const cpumask_t *mask)
> > > > +{
> > > > +     struct bnxt_irq *irq;
> > > > +
> > > > +     irq = container_of(notify, struct bnxt_irq, affinity_notify);
> > > > +     cpumask_copy(irq->cpu_mask, mask);
> > > > +
> > > > +     if (!pcie_tph_set_st(irq->bp->pdev, irq->msix_nr,
> > > > +                          cpumask_first(irq->cpu_mask),
> > > > +                          TPH_MEM_TYPE_VM, PCI_TPH_REQ_TPH_ONLY))
> > > > +             pr_err("error in configuring steering tag\n");
> > > > +
> > > > +     if (netif_running(irq->bp->dev)) {
> > > > +             rtnl_lock();
> > > > +             bnxt_close_nic(irq->bp, false, false);
> > > > +             bnxt_open_nic(irq->bp, false, false);
> > > > +             rtnl_unlock();
> > > > +     }
> > > 
> > > Is it really needed? It will cause link flap and pause in the traffic
> > > service for the device. Why the device needs full restart in this case?
> > 
> > In that sequence only the rings are recreated for the hardware to sync
> > up the tags.
> > 
> > Actually its not a full restart. There is no link reinit or other
> > heavy lifting in this sequence.
> > The pause in traffic may be momentary. Do IRQ/CPU affinities change frequently?
> > Probably not?
> 
> From what I can see in bnxt_en, proper validation of link_re_init parameter is
> not (yet?) implemented, __bnxt_open_nic will unconditionally call
> netif_carrier_off() which will be treated as loss of carrier with counters
> increment and proper events posted. Changes to CPU affinities were
> non-disruptive before the patch, but now it may break user-space
> assumptions.

From my testing the link should not flap.  I just fired up a recent net-next
and confirmed the same by calling $ ethtool -G ens7f0np0 rx 1024 which does a
similar bnxt_close_nic(bp, false, false)/bnxt_open_nic(bp, false, false) as
this patch.  Link remained up -- even with a non-Broadocm link-partner.

> Does FW need full rings re-init to update target value, which is one u32 write?
> It looks like overkill TBH.

Full rings do not, but the initialization of that particular ring associated
with this irq does need to be done.  On my list of things we need to do in
bnxt_en is implement the new ndo_queue_stop/start and ndo_queue_mem_alloc/free
operations and once those are done we could make a switch as that may be less
disruptive.

> And yes, affinities can be change on fly according to the changes of the
> workload on the host.
> 
> > > 
> > > 
> > > > +}
> > > > +
> > > > +static void bnxt_irq_affinity_release(struct kref __always_unused *ref)
> > > > +{
> > > > +}
> > > > +
> > > > +static inline void __bnxt_register_notify_irqchanges(struct bnxt_irq *irq)
> > > 
> > > No inlines in .c files, please. Let compiler decide what to inline.
> > > 
> > > > +{
> > > > +     struct irq_affinity_notify *notify;
> > > > +
> > > > +     notify = &irq->affinity_notify;
> > > > +     notify->irq = irq->vector;
> > > > +     notify->notify = bnxt_irq_affinity_notify;
> > > > +     notify->release = bnxt_irq_affinity_release;
> > > > +
> > > > +     irq_set_affinity_notifier(irq->vector, notify);
> > > > +}
> > > > +
> > > >    static int bnxt_request_irq(struct bnxt *bp)
> > > >    {
> > > >        int i, j, rc = 0;
> > > > @@ -10543,6 +10584,7 @@ static int bnxt_request_irq(struct bnxt *bp)
> > > >                        int numa_node = dev_to_node(&bp->pdev->dev);
> > > > 
> > > >                        irq->have_cpumask = 1;
> > > > +                     irq->msix_nr = map_idx;
> > > >                        cpumask_set_cpu(cpumask_local_spread(i, numa_node),
> > > >                                        irq->cpu_mask);
> > > >                        rc = irq_set_affinity_hint(irq->vector, irq->cpu_mask);
> > > > @@ -10552,6 +10594,15 @@ static int bnxt_request_irq(struct bnxt *bp)
> > > >                                            irq->vector);
> > > >                                break;
> > > >                        }
> > > > +
> > > > +                     if (!pcie_tph_set_st(bp->pdev, i,
> > > > +                                          cpumask_first(irq->cpu_mask),
> > > > +                                          TPH_MEM_TYPE_VM, PCI_TPH_REQ_TPH_ONLY)) {
> > > > +                             netdev_err(bp->dev, "error in setting steering tag\n");
> > > > +                     } else {
> > > > +                             irq->bp = bp;
> > > > +                             __bnxt_register_notify_irqchanges(irq);
> > > > +                     }
> > > >                }
> > > >        }
> > > >        return rc;
> > > > diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> > > > index dd849e715c9b..0d3442590bb4 100644
> > > > --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> > > > +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> > > > @@ -1195,6 +1195,10 @@ struct bnxt_irq {
> > > >        u8              have_cpumask:1;
> > > >        char            name[IFNAMSIZ + 2];
> > > >        cpumask_var_t   cpu_mask;
> > > > +
> > > > +     int             msix_nr;
> > > > +     struct bnxt     *bp;
> > > > +     struct irq_affinity_notify affinity_notify;
> > > >    };
> > > > 
> > > >    #define HWRM_RING_ALLOC_TX  0x1
> > > 
> 

