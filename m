Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD86C573F65
	for <lists+linux-doc@lfdr.de>; Thu, 14 Jul 2022 00:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237060AbiGMWHU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 Jul 2022 18:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236925AbiGMWHT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jul 2022 18:07:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DCA424506B
        for <linux-doc@vger.kernel.org>; Wed, 13 Jul 2022 15:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657750038;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GNtNspQ7ufX/7l3qNBxVep1F3AGBAOu1ulHpdR7LRfc=;
        b=eMH3fzrwLZvUtjEn+nUJCk5GQN3A2gsS2iZpt63Xlq3U2PqF70BeniCEWYGH1EAh0935j0
        hJvVpXQ81ENa58uHv6/MQddOzsACnKO8Q01rIZltsT/yON7Wvb9Y06THLdGWK9FgOgzK+T
        mF9fUnjqKSBstShar5GVHihUENM7q5U=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-ESamlApEOnil9ojRrP3wWQ-1; Wed, 13 Jul 2022 18:07:16 -0400
X-MC-Unique: ESamlApEOnil9ojRrP3wWQ-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-10c3654c19bso130221fac.1
        for <linux-doc@vger.kernel.org>; Wed, 13 Jul 2022 15:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=GNtNspQ7ufX/7l3qNBxVep1F3AGBAOu1ulHpdR7LRfc=;
        b=vDrF99fftYXMRBRxXVJM4OO3H9qbwWI8M7m3sJ1r4PsDJqWYJJqmL7BGktyDlpM1U3
         UmdweU8i/xZ/NP2I0Ylb8weQNs3lN7s2G7UtaaZFgmn6AiNBTT0xq90+EQQq2HB5YK7G
         sFq6usseVTupY5g0zWRqg2QPj7HdplilFCaE1IahMhtt7cmLoKRQfHxgE+Pfq9FDFqD/
         1k5eAjar69buWgR3FK3hW2AaXzD5+yz0D6J1jIoB49Apnt7vqXiKwQDzkUtrPkv5q3rI
         HKrv/8eOMePBEyIX7tXmLr2mIk1JUxjHJxlQ1F0uea2PiEMKMJd57EIvyqlSPXGHlx0N
         iQ3A==
X-Gm-Message-State: AJIora+nOu346FBoKhrgexFTvAetPXDJBI16l0vLqWr5/JYtE3vv3i/x
        FsO7ekKjg+pPyhWRpCTAaO/DZ1opVVj5LoARDei/j6D84WNR2K7QfIX/bgjlj5fh/bENu+4rd8P
        nKkNvjJ6nfJBeyvJlnXc2
X-Received: by 2002:a05:6808:140d:b0:339:e00e:afb1 with SMTP id w13-20020a056808140d00b00339e00eafb1mr2825669oiv.81.1657750036213;
        Wed, 13 Jul 2022 15:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uEvFxl9rP9NFV64gFM86/GXbJZARS8v3Lv8M/gTEDUsgw0YivueIDmJYq2iS+M92gnYHJu7A==
X-Received: by 2002:a05:6808:140d:b0:339:e00e:afb1 with SMTP id w13-20020a056808140d00b00339e00eafb1mr2825658oiv.81.1657750036026;
        Wed, 13 Jul 2022 15:07:16 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id bu27-20020a0568300d1b00b0061b8653b0c9sm34031otb.22.2022.07.13.15.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 15:07:15 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] Documentation: fpga: dfl: add PCI Identification
 documentation
To:     matthew.gerlach@linux.intel.com, hao.wu@intel.com,
        yilun.xu@intel.com, russell.h.weight@intel.com,
        basheer.ahmed.muddebihal@intel.com, mdf@kernel.org, corbet@lwn.net,
        linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tianfei.zhang@intel.com
References: <20220707150549.265621-1-matthew.gerlach@linux.intel.com>
 <20220707150549.265621-2-matthew.gerlach@linux.intel.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <8180679b-1d71-a527-74f2-d77460ea9902@redhat.com>
Date:   Wed, 13 Jul 2022 15:07:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220707150549.265621-2-matthew.gerlach@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 7/7/22 8:05 AM, matthew.gerlach@linux.intel.com wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>
> Add documentation on identifying FPGA based PCI cards prompted
> by discussion on the linux-fpga@vger.kernel.org mailing list.
>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> ---
> v3: Add url to page tracking PCI ID information for DFL based cards.
>
> v2: Introduced in v2.
> ---
>   Documentation/fpga/dfl.rst | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/Documentation/fpga/dfl.rst b/Documentation/fpga/dfl.rst
> index 15b670926084..5144775b860a 100644
> --- a/Documentation/fpga/dfl.rst
> +++ b/Documentation/fpga/dfl.rst
> @@ -507,6 +507,27 @@ ids application.
>   https://github.com/OPAE/dfl-feature-id
>   
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
> +Vendor ID values. Further PCI Product, Vendor, and Subsystem id tracking
> +can be found at https://github.com/OPAE/dfl-feature-id/blob/main/dfl-pci-ids.rst.

This link looks good.

It may be good to be explicit and say which device(s) needs to be 
specified by the quadruple.

Reviewed-by: Tom Rix <trix@redhat.com>

> +
> +
>   Location of DFLs on a PCI Device
>   ================================
>   The original method for finding a DFL on a PCI device assumed the start of the

