Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB7E4CC879
	for <lists+linux-doc@lfdr.de>; Thu,  3 Mar 2022 23:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236684AbiCCWEy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 3 Mar 2022 17:04:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbiCCWEy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Mar 2022 17:04:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9138D1480DF
        for <linux-doc@vger.kernel.org>; Thu,  3 Mar 2022 14:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646345045;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6wGROgyYuQGjMhOFoWGJ+5bmZEJUNDacGYc0J6ktUME=;
        b=PHqjG93MTG5SsDMSdyN2ObYDI8HPlLXViIBH592oGzbLoGwH5PKowmJk1o/9RaWGCxT1fu
        KTiaW5drI3JbZFl5BaE4UArQEcAZv5IEdk7Rc4WVMoybTa40H3O8pE8v/y9Yoeh8KhdYQ8
        u15XherdZkw4VHpruMmEUf4MsTbvp9U=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-OpIOsZY4ObSjIGOVQhNYMg-1; Thu, 03 Mar 2022 17:04:04 -0500
X-MC-Unique: OpIOsZY4ObSjIGOVQhNYMg-1
Received: by mail-oo1-f70.google.com with SMTP id d21-20020a4a3c15000000b003191ee182f0so4422275ooa.13
        for <linux-doc@vger.kernel.org>; Thu, 03 Mar 2022 14:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6wGROgyYuQGjMhOFoWGJ+5bmZEJUNDacGYc0J6ktUME=;
        b=pWO8kICiCsbF3ZRVUkwHsUPZj3hjCPMqZVg9AHVRf7thhxlFPa85x/uXFFiFFt6md4
         K8hhYzbNfWsUxBuoIENDtI3fgmDn0kwlj0eaDhsQFGKMyWv6026NBxrba99InL0wDO0m
         +I9jr2dNeJ0t8C9t8Gm+KseIYnC2npgtjf6sI/wmJCuqzQf6ODbl6yLWPXIp6q0SrAPa
         7EY3AYIjs0PRmomrpBAVcceKbGu2pXRv3ZwMRK5U8px6jniJyxgG0HuDWPhtUi22uteY
         SRuVBAEdNb19q9dmKqMVA7Uefb3OWGQpSRUPykr9IJvGRaqZffhKAt0SrfakIAPGoOH8
         236A==
X-Gm-Message-State: AOAM532jbBYVxCRdk5IkXWYkWPqpz3ce9xVDjbUPl72vhmnPDGp3IoNF
        dXpx8Z22uZMtZg8AAwycjWTYqQBbZnJXm0j+w9C2RYyuEGBPHDzpKBgkO7sk0tUfHUYUt5f1VKW
        CzE3UtpfFlOCL5VhwCjze
X-Received: by 2002:aca:1a04:0:b0:2d4:f855:aad1 with SMTP id a4-20020aca1a04000000b002d4f855aad1mr6496529oia.63.1646345043694;
        Thu, 03 Mar 2022 14:04:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKYRe1JYF3+Y9OgmsQmqUokJoxxr0aKd4vk81gnA67Q062qAtgyawzk9SpEORQGWaOqANqfA==
X-Received: by 2002:aca:1a04:0:b0:2d4:f855:aad1 with SMTP id a4-20020aca1a04000000b002d4f855aad1mr6496506oia.63.1646345043499;
        Thu, 03 Mar 2022 14:04:03 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id q7-20020a9d6647000000b005af185bf273sm1582024otm.25.2022.03.03.14.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 14:04:02 -0800 (PST)
Subject: Re: [PATCH v2 1/2] Documentation: fpga: dfl: add PCI Identification
 documentation
To:     matthew.gerlach@linux.intel.com, hao.wu@intel.com,
        yilun.xu@intel.com, russell.h.weight@intel.com,
        basheer.ahmed.muddebihal@intel.com, mdf@kernel.org, corbet@lwn.net,
        linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dan.j.williams@intel.com,
        ashok.raj@intel.com, tianfei.zhang@intel.com
References: <20220303003534.3307971-1-matthew.gerlach@linux.intel.com>
 <20220303003534.3307971-2-matthew.gerlach@linux.intel.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <6448f21f-7ce1-d9ce-1048-29aca14f9d3d@redhat.com>
Date:   Thu, 3 Mar 2022 14:04:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220303003534.3307971-2-matthew.gerlach@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 3/2/22 4:35 PM, matthew.gerlach@linux.intel.com wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>
> Add documentation on identifying FPGA based PCI cards prompted
> by discussion on the linux-fpga@vger.kernel.org mailing list.
>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> ---
> v2: Introduced in v2.
> ---
>   Documentation/fpga/dfl.rst | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/fpga/dfl.rst b/Documentation/fpga/dfl.rst
> index ef9eec71f6f3..5fb2ca8e76d7 100644
> --- a/Documentation/fpga/dfl.rst
> +++ b/Documentation/fpga/dfl.rst
> @@ -502,6 +502,26 @@ Developer only needs to provide a sub feature driver with matched feature id.
>   FME Partial Reconfiguration Sub Feature driver (see drivers/fpga/dfl-fme-pr.c)
>   could be a reference.
>   
> +PCI Device Identification
> +================================
> +Since FPGA based PCI cards can be reconfigured to a perform a completely
> +new function at runtime, properly identifying such cards and binding the
> +correct driver can be challenging. In many use cases, deployed FPGA based
> +PCI cards are essentially static and the PCI Product ID and Vendor ID pair
> +is sufficient to identify the card.  The DFL framework helps with the
> +dynamic case of deployed FPGA cards changing at run time by providing
> +more detailed information about card discoverable at runtime.
> +
> +At one level, the DFL on a PCI card describes the function of the card.
> +However, the same DFL could be instantiated on different physical cards.
> +Conversely, different DFLs could be instantiated on the same physical card.
> +Practical management of a cloud containing a heterogeneous set of such cards
> +requires a PCI level of card identification. While the PCI Product ID and
> +Vendor ID may be sufficient to bind the dfl-pci driver, it is expected
> +that FPGA PCI cards would advertise suitable Subsystem ID and Subsystem
> +Vendor ID values. PCI Vital Product Data (VPD) can also be used for
> +more granular information about the board.

This describes a bit more of the problem, it should describe it wrt ofs 
dev id. The introduction of the ofs dev should be explicitly called out 
as a generic pci id.

Why couldn't one of the old pci id's be reused ?

How will the subvendor/subid be enforced ?

Is the current security manager patchset smart enough to save the board 
from being bricked when a user doesn't look beyond the pci id ?

What happens if a board uses this device id but doesn't have a max10 to 
do the update ?

Tom

> +
>   Location of DFLs on a PCI Device
>   ================================
>   The original method for finding a DFL on a PCI device assumed the start of the

