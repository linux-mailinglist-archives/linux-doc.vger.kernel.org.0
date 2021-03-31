Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF163498A1
	for <lists+linux-doc@lfdr.de>; Thu, 25 Mar 2021 18:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbhCYRvf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 25 Mar 2021 13:51:35 -0400
Received: from ms.lwn.net ([45.79.88.28]:44860 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229616AbhCYRvA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 25 Mar 2021 13:51:00 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A2B206A2;
        Thu, 25 Mar 2021 17:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A2B206A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1616694659; bh=t6qoeoFy8+vP/kavL6U8VxBXkrGww4IWIoFmWL1z5Cc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=L6F61nK8cPYP8jniPsfnAj4VJ4B8l9smG3EzdLstQyVkFzaXDyBWWCVURu0VX0Jtk
         OiNb3QlignIoiSAPxWHqhQCmzmRn01ADKgkU+FwVk6w3Od3Z4KeLNgVvZVAOhLWDRK
         YkcTcF3ZWVHR8STcWrqRuAdOmuLF+TBmfob5t2kSdfIxvAonkSPMwD4VIal4lJzM51
         6J5UnLDOwsNZb18u1zgdC3MTbd8Cf/R6PcA6QZFArmgt98EBfp+5bnNFZvRZKiOPYp
         zuG8XHawPTmwfsMEhQO3JVog3vrwZIKBjRONn8tNGkyFp8uujuXuQ2/oCdcJFJOp86
         0zz+PX7jHAfsA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Documentation: megaraid: fix spelling "consistend" =>
 "consistent"
In-Reply-To: <YFS5KV7ejNoZmt6H@mwanda>
References: <YFS5KV7ejNoZmt6H@mwanda>
Date:   Thu, 25 Mar 2021 11:50:59 -0600
Message-ID: <87k0pv15rw.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> Change the spelling from "consistend" to "consistent".
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  Documentation/scsi/ChangeLog.megaraid | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/scsi/ChangeLog.megaraid b/Documentation/scsi/ChangeLog.megaraid
> index d2052fdbedd2..cbb329956897 100644
> --- a/Documentation/scsi/ChangeLog.megaraid
> +++ b/Documentation/scsi/ChangeLog.megaraid
> @@ -220,7 +220,7 @@ Older Version	: 2.20.4.5 (scsi module), 2.20.2.5 (cmm module)
>  
>  4.	Use the pre defined DMA mask constants from dma-mapping.h
>  	Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
> -	pci_set_dma_mask() or pci_set_consistend_dma_mask(). See
> +	pci_set_dma_mask() or pci_set_consistent_dma_mask(). See
>  	http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for more

It's good to be consistent, so I've applied this, but I really wonder if
this file needs to continue to exist at all...?

Thanks,

jon
