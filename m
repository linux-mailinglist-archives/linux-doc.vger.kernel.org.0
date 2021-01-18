Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E282FA8A8
	for <lists+linux-doc@lfdr.de>; Mon, 18 Jan 2021 19:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393605AbhARSYC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 18 Jan 2021 13:24:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36513 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2393195AbhARSXx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jan 2021 13:23:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610994147;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Gaz99qAcLn2KYEyunJhawzMi0IY0X3LlBR6yMj2tZ8c=;
        b=DQei3QTiqhGhEGsbunih8zr75HQAA/zb4xahSFwEtQbsJ2FJ8OwyrDZ1hzKamGPZLwUhfl
        H8XHnhToyeW9qwxHHgH74FjkusY3zKeMquEARP7lbV1gEiL6RV3d+LbRCIZELSmzS6XNUm
        gEIfwjpEQrDVhkKWYyvOMLR4ps35KYw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-bADl1l3iOW-RQeoZs_-yUg-1; Mon, 18 Jan 2021 13:22:25 -0500
X-MC-Unique: bADl1l3iOW-RQeoZs_-yUg-1
Received: by mail-ej1-f70.google.com with SMTP id j14so5280011eja.15
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 10:22:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Gaz99qAcLn2KYEyunJhawzMi0IY0X3LlBR6yMj2tZ8c=;
        b=tByVeyejtFOzPFzUyEq2sob9UVtqQU8HAUcLWJn1L8KPXYWOfPNC5zvWaB+ptO/loC
         iqQY9Tv1s78+o0RtprvCOm9lgig6lfafaAmXFsmveEAgHWeinELkx0WhPRbgZsgQIv3M
         WHt87TahuPPhOVnMiugAxy04kFfyXoMsQikiBNwJ2SlbLkbdn4kdPbaXFQokMmHAiiQ6
         TmWnDjw9qTE4pdKsMrbdYm7AURBcIQub6TaCENau+3wd/idRB7Cpj4D3Z50Un4fceq6w
         busviQgHBcrO/pTuFKIvccujKVA4hc+BSYKjxKhhdwA4EewYkFNOa311LTPrGSttaJzU
         Krhg==
X-Gm-Message-State: AOAM531Ix2si6qd8TZX7h7ZYXFayhabTAvRwnhhwO3/4pln0FK8iZF0V
        lLCQd67RTzpsuLFlY6XqxabwKhDBzzHR7aqdNZ1ojXIi6fT+DMSQCf+fw3ruM+33YuSLkCa5v6R
        hNWDokoll3ZVh+X640/yI
X-Received: by 2002:a17:906:cf81:: with SMTP id um1mr662166ejb.122.1610994144015;
        Mon, 18 Jan 2021 10:22:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkSwKI9vqQ2BsCUhEi4bsNFtz33R1vt8OdDlu1u6QO4deJfvKs6HVTB6MqH0HtXPS5PIMQpg==
X-Received: by 2002:a17:906:cf81:: with SMTP id um1mr662155ejb.122.1610994143835;
        Mon, 18 Jan 2021 10:22:23 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id g25sm10664146edw.92.2021.01.18.10.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 10:22:23 -0800 (PST)
Subject: Re: [PATCH] platform/surface: aggregator: Fix kernel-doc references
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20210114150826.19109-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9ea124b5-9324-e892-859f-6b2b19b4d9d3@redhat.com>
Date:   Mon, 18 Jan 2021 19:22:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210114150826.19109-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 1/14/21 4:08 PM, Maximilian Luz wrote:
> Both, ssh_rtl_rx_start() and ssh_rtl_tx_start() functions, do not exist
> and have been consolidated into ssh_rtl_start(). Nevertheless,
> kernel-doc references the former functions. Replace those references
> with references to ssh_rtl_start().
> 
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
> 
> Note: This patch does not change the kernel doc at the ssh_rtl_start()
> itself, as there is already another patch for it:
> 
>   "platform/surface: aggregator: fix a kernel-doc markup"
>   https://lore.kernel.org/patchwork/patch/1364953/
> 
> ---
>  drivers/platform/surface/aggregator/ssh_request_layer.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/surface/aggregator/ssh_request_layer.c b/drivers/platform/surface/aggregator/ssh_request_layer.c
> index bb1c862411a2..4fbe58265e31 100644
> --- a/drivers/platform/surface/aggregator/ssh_request_layer.c
> +++ b/drivers/platform/surface/aggregator/ssh_request_layer.c
> @@ -1004,9 +1004,8 @@ int ssh_request_init(struct ssh_request *rqst, enum ssam_request_flags flags,
>   *
>   * Initializes the given request transport layer and associated packet
>   * transport layer. Transmitter and receiver threads must be started
> - * separately via ssh_rtl_tx_start() and ssh_rtl_rx_start(), after the
> - * request-layer has been initialized and the lower-level serial device layer
> - * has been set up.
> + * separately via ssh_rtl_start(), after the request-layer has been
> + * initialized and the lower-level serial device layer has been set up.
>   *
>   * Return: Returns zero on success and a nonzero error code on failure.
>   */
> 

