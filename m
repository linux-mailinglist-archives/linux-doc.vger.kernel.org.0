Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46FC62F1943
	for <lists+linux-doc@lfdr.de>; Mon, 11 Jan 2021 16:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731337AbhAKPNa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 11 Jan 2021 10:13:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23117 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730894AbhAKPN3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jan 2021 10:13:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610377923;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zH2sY2KFOZF7TSs2Cj/3HvzX9baKiIPNLIu6OGwY2+M=;
        b=iTZ9Dt3UGCVQ2+XRFE/ePihDxClp91i2MsAPxbXquzHCVVMUJTQKrRybR13eezKOgDMoAv
        HYCgf1Hu3Rj18s27IdG3TsgeNJSVyPN9y+/i4BT3zI23MSiGE5XDyZgUhn1azcL3xZKaRP
        +CZV7xKAH6oAlHazgq2rqa4n3DdDDDU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-fYkpc0DMNo2n2N9Esz1cEA-1; Mon, 11 Jan 2021 10:12:02 -0500
X-MC-Unique: fYkpc0DMNo2n2N9Esz1cEA-1
Received: by mail-qv1-f69.google.com with SMTP id l3so13323898qvr.10
        for <linux-doc@vger.kernel.org>; Mon, 11 Jan 2021 07:12:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zH2sY2KFOZF7TSs2Cj/3HvzX9baKiIPNLIu6OGwY2+M=;
        b=DYgVS98TMzSMr+iVf6R08lor92pm4sO8JGak7FQCWmxPbwES0h2PuRgzCY9WUHBMMS
         ME0L5h/Pje6LYuy32AKMEYsF3N+q4MlpsYBTdzSA+5IJFinEjaBNQ7TT+oCKJmvNCB04
         hLPhNzJcdk8aveU1ZSEyC3+HJ3WTXM39PzrmsPvdI//i1gI7AtIjoqjeYnZjPgJ5oE3i
         b644nk3LgJ+KtDsMobULIAlEDNb76hvjnHj3dn3D4Q3KE9eHkFjNyWCo2wfEzfi2+bD6
         Dj/BFg7lpqXYoQxusIrpNeAKgxrlEnc7krkSFlFfConCuIFSGWKYZy1veerDS5sN+j1s
         R2zQ==
X-Gm-Message-State: AOAM532Tmz+dtGfyYnNhc0Z+Qo2r0nJ9IqPFJ+d7pUfKyYOAzzXEe12h
        RRKPa4QwKNyMfUVustXYNO0FfuhQdVxdW9kDs+OM+4oebHLT/xNKKNb9I1FmpzJ4THJ9435dh4o
        mn54pK2B19JA4OxxwDnxW
X-Received: by 2002:a0c:a789:: with SMTP id v9mr64912qva.41.1610377921838;
        Mon, 11 Jan 2021 07:12:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcAqysHBNs93WJfvR2O2qKdvrvzOgfLz+paIVyIwplHKXl+Trm6gELqe7+VJOEgIEjl7lfig==
X-Received: by 2002:a0c:a789:: with SMTP id v9mr64894qva.41.1610377921612;
        Mon, 11 Jan 2021 07:12:01 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id n31sm2516266qtn.66.2021.01.11.07.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 07:12:01 -0800 (PST)
Subject: Re: [PATCH -next] fpga: dfl-pci: rectify ReST formatting
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wu Hao <hao.wu@intel.com>, Moritz Fischer <mdf@kernel.org>,
        Matthew Gerlach <matthew.gerlach@linux.intel.com>,
        linux-fpga@vger.kernel.org
Cc:     linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210111112113.27242-1-lukas.bulwahn@gmail.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <d22ccfa1-19a1-d48c-d822-76ea289965ab@redhat.com>
Date:   Mon, 11 Jan 2021 07:11:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210111112113.27242-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 1/11/21 3:21 AM, Lukas Bulwahn wrote:
> Commit fa41d10589be ("fpga: dfl-pci: locate DFLs by PCIe vendor specific
> capability") provides documentation to the FPGA Device Feature List (DFL)
> Framework Overview, but introduced new documentation warnings:
>
>   ./Documentation/fpga/dfl.rst:
>     505: WARNING: Title underline too short.
>     523: WARNING: Unexpected indentation.
>     523: WARNING: Blank line required after table.
>     524: WARNING: Block quote ends without a blank line; unexpected unindent.
>
> Rectify ReST formatting in ./Documentation/fpga/dfl.rst.

Can you explain how to reproduce this problem ?

Tom

>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210111
>
> Moritz, Matthew, please ack.
>
> Greg, please pick this doc fixup to your fpga -next tree on top of
> the commit above.
>
>  Documentation/fpga/dfl.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/fpga/dfl.rst b/Documentation/fpga/dfl.rst
> index ea8cefc18bdb..c41ac76ffaae 100644
> --- a/Documentation/fpga/dfl.rst
> +++ b/Documentation/fpga/dfl.rst
> @@ -502,7 +502,7 @@ FME Partial Reconfiguration Sub Feature driver (see drivers/fpga/dfl-fme-pr.c)
>  could be a reference.
>  
>  Location of DFLs on a PCI Device
> -===========================
> +================================
>  The original method for finding a DFL on a PCI device assumed the start of the
>  first DFL to offset 0 of bar 0.  If the first node of the DFL is an FME,
>  then further DFLs in the port(s) are specified in FME header registers.
> @@ -514,6 +514,7 @@ data begins with a 4 byte vendor specific register for the number of DFLs follow
>  Offset/BIR vendor specific registers for each DFL. Bits 2:0 of Offset/BIR register
>  indicates the BAR, and bits 31:3 form the 8 byte aligned offset where bits 2:0 are
>  zero.
> +::
>  
>          +----------------------------+
>          |31     Number of DFLS      0|

