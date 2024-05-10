Return-Path: <linux-doc+bounces-16178-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 642D38C223F
	for <lists+linux-doc@lfdr.de>; Fri, 10 May 2024 12:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 856DC1C20D06
	for <lists+linux-doc@lfdr.de>; Fri, 10 May 2024 10:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB67B12A179;
	Fri, 10 May 2024 10:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="I/sCuI9s"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9A984FC8
	for <linux-doc@vger.kernel.org>; Fri, 10 May 2024 10:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715337409; cv=none; b=AhRvNInUmBIfGj3738JBOluX4xzgVxx47sp2NzkgOvkLZYfBmTqFfXycE9jo95dCkeThVA/41Idx1iVJG9kIJclGI5UmU0GZnx+lxmpHcMH5ddbS5i/1yjvnAsVXu6BsNfsB2RGHGLunQ5KgvZfU2xcsVdTo0GQVzOtmJJ1E7PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715337409; c=relaxed/simple;
	bh=b885mkoaowBayYp5fXXjWypVmC7CJmpFTZem7E8ZEVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bR5Fiq5V/49MQgNB0IP7QTHiCy0fPoDcu28e7x6P79EoG/JXYCinVat4SyAnkLbTff9ObZqq7e9zWzPi35Muw6qIXk0G5X04znllNPgZsvCrtAxpx7h9wc5+9b8HcUEw/qHBAqobEVzYxMjQvcdJaRW2PF1NqrjkWm4FSEszw8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=I/sCuI9s; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <4c6a8b86-6544-4c99-a0f2-030e2ec4e98f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1715337405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQwv+B8JLCi8Nn/Gx8F39vcswEdPMaokUDHh8iKT79Y=;
	b=I/sCuI9sQDx4Co7JyiG2pdbHMCMyGy4yI7TvmiREuzpzE7qoGCge3LFgO9BnTOnSTUZ+kJ
	ZSbYWyCnSjOd5Yj1aNceTWE1y4k00r+xEoYT5oZk//coZ3Rh2B8lcLLYx6UuEt61JMH0B2
	/07Wp///4OoECJ+hdsXPZo98NqjAh5I=
Date: Fri, 10 May 2024 11:35:35 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH V1 8/9] bnxt_en: Add TPH support in BNXT driver
Content-Language: en-US
To: Ajit Khaparde <ajit.khaparde@broadcom.com>
Cc: Wei Huang <wei.huang2@amd.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, bhelgaas@google.com, corbet@lwn.net,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, alex.williamson@redhat.com, gospo@broadcom.com,
 michael.chan@broadcom.com, manoj.panicker2@amd.com, Eric.VanTassell@amd.com
References: <20240509162741.1937586-1-wei.huang2@amd.com>
 <20240509162741.1937586-9-wei.huang2@amd.com>
 <868a4758-2873-4ede-83e5-65f42cb12b81@linux.dev>
 <CACZ4nhuBMOX8s1ODcJOvvCKp-VsOPHShEUHAsPvB75Yv2823qA@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <CACZ4nhuBMOX8s1ODcJOvvCKp-VsOPHShEUHAsPvB75Yv2823qA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 10.05.2024 04:55, Ajit Khaparde wrote:
> On Thu, May 9, 2024 at 2:50 PM Vadim Fedorenko
> <vadim.fedorenko@linux.dev> wrote:
>>
>> On 09/05/2024 17:27, Wei Huang wrote:
>>> From: Manoj Panicker <manoj.panicker2@amd.com>
>>>
>>> As a usage example, this patch implements TPH support in Broadcom BNXT
>>> device driver by invoking pcie_tph_set_st() function when interrupt
>>> affinity is changed.
>>>
>>> Reviewed-by: Ajit Khaparde <ajit.khaparde@broadcom.com>
>>> Reviewed-by: Andy Gospodarek <andrew.gospodarek@broadcom.com>
>>> Reviewed-by: Wei Huang <wei.huang2@amd.com>
>>> Signed-off-by: Manoj Panicker <manoj.panicker2@amd.com>
>>> ---
>>>    drivers/net/ethernet/broadcom/bnxt/bnxt.c | 51 +++++++++++++++++++++++
>>>    drivers/net/ethernet/broadcom/bnxt/bnxt.h |  4 ++
>>>    2 files changed, 55 insertions(+)
>>>
>>> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>>> index 2c2ee79c4d77..be9c17566fb4 100644
>>> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>>> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>>> @@ -55,6 +55,7 @@
>>>    #include <net/page_pool/helpers.h>
>>>    #include <linux/align.h>
>>>    #include <net/netdev_queues.h>
>>> +#include <linux/pci-tph.h>
>>>
>>>    #include "bnxt_hsi.h"
>>>    #include "bnxt.h"
>>> @@ -10491,6 +10492,7 @@ static void bnxt_free_irq(struct bnxt *bp)
>>>                                free_cpumask_var(irq->cpu_mask);
>>>                                irq->have_cpumask = 0;
>>>                        }
>>> +                     irq_set_affinity_notifier(irq->vector, NULL);
>>>                        free_irq(irq->vector, bp->bnapi[i]);
>>>                }
>>>
>>> @@ -10498,6 +10500,45 @@ static void bnxt_free_irq(struct bnxt *bp)
>>>        }
>>>    }
>>>
>>> +static void bnxt_rtnl_lock_sp(struct bnxt *bp);
>>> +static void bnxt_rtnl_unlock_sp(struct bnxt *bp);
>>> +static void bnxt_irq_affinity_notify(struct irq_affinity_notify *notify,
>>> +                                  const cpumask_t *mask)
>>> +{
>>> +     struct bnxt_irq *irq;
>>> +
>>> +     irq = container_of(notify, struct bnxt_irq, affinity_notify);
>>> +     cpumask_copy(irq->cpu_mask, mask);
>>> +
>>> +     if (!pcie_tph_set_st(irq->bp->pdev, irq->msix_nr,
>>> +                          cpumask_first(irq->cpu_mask),
>>> +                          TPH_MEM_TYPE_VM, PCI_TPH_REQ_TPH_ONLY))
>>> +             pr_err("error in configuring steering tag\n");
>>> +
>>> +     if (netif_running(irq->bp->dev)) {
>>> +             rtnl_lock();
>>> +             bnxt_close_nic(irq->bp, false, false);
>>> +             bnxt_open_nic(irq->bp, false, false);
>>> +             rtnl_unlock();
>>> +     }
>>
>> Is it really needed? It will cause link flap and pause in the traffic
>> service for the device. Why the device needs full restart in this case?
> 
> In that sequence only the rings are recreated for the hardware to sync
> up the tags.
> 
> Actually its not a full restart. There is no link reinit or other
> heavy lifting in this sequence.
> The pause in traffic may be momentary. Do IRQ/CPU affinities change frequently?
> Probably not?

 From what I can see in bnxt_en, proper validation of link_re_init parameter is
not (yet?) implemented, __bnxt_open_nic will unconditionally call 
netif_carrier_off() which will be treated as loss of carrier with counters
increment and proper events posted. Changes to CPU affinities were 
non-distruptive before the patch, but now it may break user-space assumptions.

Does FW need full rings re-init to update target value, which is one u32 write?
It looks like overkill TBH.

And yes, affinities can be change on fly according to the changes of the
workload on the host.

>>
>>
>>> +}
>>> +
>>> +static void bnxt_irq_affinity_release(struct kref __always_unused *ref)
>>> +{
>>> +}
>>> +
>>> +static inline void __bnxt_register_notify_irqchanges(struct bnxt_irq *irq)
>>
>> No inlines in .c files, please. Let compiler decide what to inline.
>>
>>> +{
>>> +     struct irq_affinity_notify *notify;
>>> +
>>> +     notify = &irq->affinity_notify;
>>> +     notify->irq = irq->vector;
>>> +     notify->notify = bnxt_irq_affinity_notify;
>>> +     notify->release = bnxt_irq_affinity_release;
>>> +
>>> +     irq_set_affinity_notifier(irq->vector, notify);
>>> +}
>>> +
>>>    static int bnxt_request_irq(struct bnxt *bp)
>>>    {
>>>        int i, j, rc = 0;
>>> @@ -10543,6 +10584,7 @@ static int bnxt_request_irq(struct bnxt *bp)
>>>                        int numa_node = dev_to_node(&bp->pdev->dev);
>>>
>>>                        irq->have_cpumask = 1;
>>> +                     irq->msix_nr = map_idx;
>>>                        cpumask_set_cpu(cpumask_local_spread(i, numa_node),
>>>                                        irq->cpu_mask);
>>>                        rc = irq_set_affinity_hint(irq->vector, irq->cpu_mask);
>>> @@ -10552,6 +10594,15 @@ static int bnxt_request_irq(struct bnxt *bp)
>>>                                            irq->vector);
>>>                                break;
>>>                        }
>>> +
>>> +                     if (!pcie_tph_set_st(bp->pdev, i,
>>> +                                          cpumask_first(irq->cpu_mask),
>>> +                                          TPH_MEM_TYPE_VM, PCI_TPH_REQ_TPH_ONLY)) {
>>> +                             netdev_err(bp->dev, "error in setting steering tag\n");
>>> +                     } else {
>>> +                             irq->bp = bp;
>>> +                             __bnxt_register_notify_irqchanges(irq);
>>> +                     }
>>>                }
>>>        }
>>>        return rc;
>>> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
>>> index dd849e715c9b..0d3442590bb4 100644
>>> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
>>> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
>>> @@ -1195,6 +1195,10 @@ struct bnxt_irq {
>>>        u8              have_cpumask:1;
>>>        char            name[IFNAMSIZ + 2];
>>>        cpumask_var_t   cpu_mask;
>>> +
>>> +     int             msix_nr;
>>> +     struct bnxt     *bp;
>>> +     struct irq_affinity_notify affinity_notify;
>>>    };
>>>
>>>    #define HWRM_RING_ALLOC_TX  0x1
>>


