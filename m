Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77A26511E54
	for <lists+linux-doc@lfdr.de>; Wed, 27 Apr 2022 20:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243792AbiD0RSJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 27 Apr 2022 13:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243940AbiD0RSI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Apr 2022 13:18:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D98AE42A37
        for <linux-doc@vger.kernel.org>; Wed, 27 Apr 2022 10:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651079696;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9YUznmB9P2jBcOq6DrfzVnG8uJ/Bk7HsqZZR2IcuP88=;
        b=UOpoAK7G9kAiwo+UQTwItEkM5gcIFxL7W/TWO2n4rv2Ntzw2QssMZlD9YOUSUIRuN4tiRq
        npJrCCc6TW51wMjUL9roUDXr6uzI5zHEQ5z4J+OWL67G5XM+T3hYL05VqA+JvCiN4OQEMW
        nax12ziBNigJaJ/g2FIFOyykBt+7/Cw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-v00tpUGwOtC6NcdTfUqrrQ-1; Wed, 27 Apr 2022 13:14:54 -0400
X-MC-Unique: v00tpUGwOtC6NcdTfUqrrQ-1
Received: by mail-wr1-f71.google.com with SMTP id j21-20020adfa555000000b0020adb9ac14fso965902wrb.13
        for <linux-doc@vger.kernel.org>; Wed, 27 Apr 2022 10:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9YUznmB9P2jBcOq6DrfzVnG8uJ/Bk7HsqZZR2IcuP88=;
        b=cntWq8+cSfa/WIk3ViAgT8DAVObr1oZXnc0fY/Avc+90tAYFxPuSaiPZYESxM+ypyG
         6B4i9LZso9DcSX/o16hTWITvsdFuHBZqG+93ehGlWuDMeCrdt4McXiziwSqYxcEYGmKi
         1X66787JIRmQN71T9e0i1AvoqJJs4cW8+WTq0tzI2KTkbp3heNfHvG/TKysdFfsk6XRV
         6cPLpITBhKucWN/6Pbp9C6nEkbIo+Ofhg7zkl9OY5257dIFsQBBqCHFLvV5UtVDeOOdi
         5Uwdrss8230KWtSUNXzDTYx9YAmem4LPHzADgNVH3CK7xVP5+CEfgG/2xXRjEwDhHGUT
         eMiA==
X-Gm-Message-State: AOAM532ZelUqxKlLoqK0cHApOQm7WLM5mwpRrhMnrEdhm76hzskLszDj
        VK8jbBKidkOPK0+vssOsktFME06Hf0KfCQzRJcy1dsiE3402Q8ZtZTJOdFqF9nlxjWhNdFSoayJ
        M0A09qVntqtsVwI/ZuE75
X-Received: by 2002:a5d:5311:0:b0:20a:d007:b499 with SMTP id e17-20020a5d5311000000b0020ad007b499mr18651216wrv.258.1651079693301;
        Wed, 27 Apr 2022 10:14:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9gmILqTdRAEv5fADePBJ//BGbzfu/YlqdgybewixXeP/an9YLV/CAg7PFZJIOJmkGoxatPQ==
X-Received: by 2002:a5d:5311:0:b0:20a:d007:b499 with SMTP id e17-20020a5d5311000000b0020ad007b499mr18651198wrv.258.1651079693033;
        Wed, 27 Apr 2022 10:14:53 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v11-20020a056000144b00b0020a9c02f60dsm15149131wrx.50.2022.04.27.10.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 10:14:52 -0700 (PDT)
Message-ID: <1885e110-6353-45bb-1120-c6fa4c50f63a@redhat.com>
Date:   Wed, 27 Apr 2022 19:14:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] drm/doc: Add sections about tiny drivers and external
 refs to intro page
Content-Language: en-US
To:     linux-kernel@vger.kernel.org,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20220420072411.15104-1-javierm@redhat.com>
 <YmlhS3m6se0sqhnn@phenom.ffwll.local>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YmlhS3m6se0sqhnn@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Daniel,

On 4/27/22 17:29, Daniel Vetter wrote:
> On Wed, Apr 20, 2022 at 09:24:11AM +0200, Javier Martinez Canillas wrote:
>> Learning about the DRM subsystem could be quite overwhelming for newcomers
>> but there are lots of useful talks, slides and articles available that can
>> help to understand the needed concepts and ease the learning curve.
>>
>> There are also simple DRM drivers that can be used as example about how a
>> DRM driver should look like.
>>
>> Add sections to the introduction page, that contains references to these.
>>
>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Maybe needs more acks to land?
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>

Thanks! But this landed already a few days ago in drm-misc-next:

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e41a2999f746
 
> Would be good we can hand out links to pretty htmldocs instead of lore
> links to this patch, the latter is rather hard on the eyes :-)
>

Agreed :)
 -- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

