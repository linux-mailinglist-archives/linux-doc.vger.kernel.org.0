Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAD65426E9
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jun 2022 08:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233612AbiFHGy5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 8 Jun 2022 02:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237284AbiFHGSK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jun 2022 02:18:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C84C65F8C
        for <linux-doc@vger.kernel.org>; Tue,  7 Jun 2022 23:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654668128;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UsmRmrmyC0YlUnFIqRRJkIZ3ojsOtC4OxRQHrbODTWU=;
        b=d9KP3C87EiNwC8875uafmzStpUSq/6l6Lm1olGg2cjxHqMv45Nbm4oWiDZFzw+zm3PSABj
        vWWZtt04d1FQWcvLdYRaBPD0r8CI+Z7OQkfGhFAV2AzY0FpGFyuju/dDmS2Ru6PnU1jBRw
        +UMuEQsmbs2XzpugWN46z5zAHECW1r8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-FAb8pEkkMzKL2Aw8zXRexg-1; Wed, 08 Jun 2022 02:02:06 -0400
X-MC-Unique: FAb8pEkkMzKL2Aw8zXRexg-1
Received: by mail-wm1-f72.google.com with SMTP id k16-20020a7bc310000000b0038e6cf00439so9507254wmj.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jun 2022 23:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UsmRmrmyC0YlUnFIqRRJkIZ3ojsOtC4OxRQHrbODTWU=;
        b=K9yVrisC80VGvvV9HZH1o9U7sxb6kPhhPvatD/VJj9uj6vUWSje9+4mLrRdtpx1Xp/
         iVBNzctZjkXMsM4l0EkcWSXAXXc8LTcC2XI90oDVKu/5VhA1GxSzFIXLaYrsk18mAji8
         fk3owRKjcGR8x8Y2ogx1uznQAwr2GMUkHnnTobbo7PVvCVhqOW87nSETm+yNQRj/FvZJ
         kZsIdZ6kMxEVf9fRIHSyin3EP8FXC97L9KDc/2FZkwiTMWxJl1X4ix3qtmkOSBrHku0B
         mpn66aVV0zU34bahVd9PuwQwwqzXHsQ8sr5aybmOqFNY84ypukCxj8oQaucEHI295+JS
         +KdQ==
X-Gm-Message-State: AOAM53231yQuydIskWIpyQ1hQEsSUpi95KOKw5898YP1QBHQ5HsvDHBv
        R1qgka7aLz4eFlS+KIbskngMrIoKowxG21eH4RxIblTwQ1Pe0TBksb74XolzheTs2HK1Ha6oXPr
        c2J5fDUv7jK+ep+g4Ap+J
X-Received: by 2002:a05:6000:147:b0:214:7d6e:cb1d with SMTP id r7-20020a056000014700b002147d6ecb1dmr24578624wrx.650.1654668125346;
        Tue, 07 Jun 2022 23:02:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHgUMf0DiGTalylNFpQjB5EiBfIrRc71DZVAGtXhPU6EUyeZBdyPoZS/71mmMYC1pA8jBi1g==
X-Received: by 2002:a05:6000:147:b0:214:7d6e:cb1d with SMTP id r7-20020a056000014700b002147d6ecb1dmr24578561wrx.650.1654668124893;
        Tue, 07 Jun 2022 23:02:04 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-114-66.web.vodafone.de. [109.42.114.66])
        by smtp.gmail.com with ESMTPSA id x14-20020adff0ce000000b00210396b2eaesm24124187wro.45.2022.06.07.23.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 23:02:04 -0700 (PDT)
Message-ID: <1bdd501e-01f6-a0fb-86f3-49ec19ec5bcf@redhat.com>
Date:   Wed, 8 Jun 2022 08:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v9 21/21] MAINTAINERS: additional files related kvm s390
 pci passthrough
Content-Language: en-US
To:     Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org
Cc:     alex.williamson@redhat.com, cohuck@redhat.com,
        schnelle@linux.ibm.com, farman@linux.ibm.com, pmorel@linux.ibm.com,
        borntraeger@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
        gerald.schaefer@linux.ibm.com, agordeev@linux.ibm.com,
        svens@linux.ibm.com, frankja@linux.ibm.com, david@redhat.com,
        imbrenda@linux.ibm.com, vneethv@linux.ibm.com,
        oberpar@linux.ibm.com, freude@linux.ibm.com, pasic@linux.ibm.com,
        pbonzini@redhat.com, corbet@lwn.net, jgg@nvidia.com,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20220606203325.110625-1-mjrosato@linux.ibm.com>
 <20220606203325.110625-22-mjrosato@linux.ibm.com>
From:   Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220606203325.110625-22-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/06/2022 22.33, Matthew Rosato wrote:
> Add entries from the s390 kvm subdirectory related to pci passthrough.
> 
> Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a6d3bd9d2a8d..3dd8657f5482 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17454,6 +17454,7 @@ M:	Eric Farman <farman@linux.ibm.com>
>   L:	linux-s390@vger.kernel.org
>   L:	kvm@vger.kernel.org
>   S:	Supported
> +F:	arch/s390/kvm/pci*
>   F:	drivers/vfio/pci/vfio_pci_zdev.c
>   F:	include/uapi/linux/vfio_zdev.h
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>

