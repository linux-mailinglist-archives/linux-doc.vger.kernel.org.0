Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317E134D5A5
	for <lists+linux-doc@lfdr.de>; Mon, 29 Mar 2021 19:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhC2RCg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Mar 2021 13:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbhC2RCg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Mar 2021 13:02:36 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B832CC061574;
        Mon, 29 Mar 2021 10:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=RZZt36Qkr4ZGYVn/npKXJ9AEqctFyxdqSfZnmEm2DlQ=; b=e8xb70gPBqR62UWA7TtilQ6Jdx
        srXvv+EqQ/OCuTXKz/hckUsYJCkPTjS2DVedY/bAVrJVYo8zVcu6k2DJWQJA2+tRFZwAnc8ZZJ2dG
        ooTKP6HGOQVp5lnPWk/KS4+4Oy5BlMMCRKkTrCg34IF3NtL+FWg6J4wGXhpToSCRmiRaI2dkNjg3W
        K+rcAqLjxr8TM1bXhSAha11hbVaQvBtqAIperKhH71Rh+KshDKhyaQMbgEvpNNGfOXQ9TvAY0K1OQ
        lEBNZWnQ19ycxqa1pHLc+10zxHgTBkDb8m0iQurWmqjQ+/JC6QuqBdTjBT4SLWyrTfSAV0W5YpgQs
        vwkxLsCA==;
Received: from [2601:1c0:6280:3f0::4557]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lQvHY-000pWI-SZ; Mon, 29 Mar 2021 17:02:32 +0000
Subject: Re: [PATCH] usb: dwc3: imx8mp: fix incorrect kernel-doc comment
 syntax
To:     Aditya Srivastava <yashsri421@gmail.com>, balbi@kernel.org
Cc:     lukas.bulwahn@gmail.com, gregkh@linuxfoundation.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210329142604.28737-1-yashsri421@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2c4c916c-6395-9df2-7e57-40af4d5faa3b@infradead.org>
Date:   Mon, 29 Mar 2021 10:02:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210329142604.28737-1-yashsri421@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/29/21 7:26 AM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for drivers/usb/dwc3/dwc3-imx8mp.c follows this syntax, but the
> content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc:
> "warning: expecting prototype for dwc3(). Prototype was for USB_WAKEUP_CTRL() instead"
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> * Applies perfectly on next-20210326
> 
>  drivers/usb/dwc3/dwc3-imx8mp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
> index 75f0042b998b..b13cfab89d53 100644
> --- a/drivers/usb/dwc3/dwc3-imx8mp.c
> +++ b/drivers/usb/dwc3/dwc3-imx8mp.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/**
> +/*
>   * dwc3-imx8mp.c - NXP imx8mp Specific Glue layer
>   *
>   * Copyright (c) 2020 NXP.
> 


-- 
~Randy

