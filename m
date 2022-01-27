Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00DC49DFAD
	for <lists+linux-doc@lfdr.de>; Thu, 27 Jan 2022 11:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239583AbiA0Kqt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jan 2022 05:46:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52346 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239294AbiA0Kqt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jan 2022 05:46:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643280408;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BvyN8Tqs1ZiebaPCuEHERBQi90N1F99BnzB1Q++zaso=;
        b=IjVgoIku830+cN0Yiz10aUKVh/pt5UquUDBD+Qzl1RUlIBn1C8cYpBlNgCcrvcv082NBo/
        fL0v+9/1xiXyg+eL128YJOyDuI4/ed1JgFDpjAVUe3aP2wnp3ZnLXQhF16dSrlfDtR16Ja
        sJ7xjvaX/sznrbp3dVbvJdjzBR8/QKs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-zX1rKkkJMpuvi70xUdwQMg-1; Thu, 27 Jan 2022 05:46:47 -0500
X-MC-Unique: zX1rKkkJMpuvi70xUdwQMg-1
Received: by mail-wr1-f70.google.com with SMTP id h12-20020adfa4cc000000b001d474912698so927073wrb.2
        for <linux-doc@vger.kernel.org>; Thu, 27 Jan 2022 02:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BvyN8Tqs1ZiebaPCuEHERBQi90N1F99BnzB1Q++zaso=;
        b=Gu0upmHxH/jumCahCaEKFWEOYH91TLMP/B5aTRlvfQ6BLBf103PGQnvdMRizsf2/ms
         hN6m8C5k0htfJ/67rspUnFHozvZBbAk+zkMpgNvxp09IjnqPzC3n9k3qo7iaoyDZTRWE
         idNuRbpqZriw1HY8QLXuw+0iCBnQEZlYRfe+1/Mz+FHAyCl8wA3d1x7LnHZHXkBA0/kI
         gNF/MYr8PBQjbUrw82m015BCl8aB/NV+ev5cTuozh3b7mx67k6KrAyrqbbKq13I2xR/W
         Drd3lTc7TPGO/Il4upKxm5lDw3c1sPcNnNj5CuU9rZo1Fdb+KOZ00k2ULdgut65/j445
         7k2w==
X-Gm-Message-State: AOAM533ZUVxrsVMlCVuLW8R3dO0ruodf1iilM63OSAFSPyoqaNEhzt8F
        ZCnUTb32aRlmfiuyyxeLh0PcFijhiNkOJnU2bfTF6w5VbNcNVSbElXq1r/HT7pnkGtrgkcXviQ5
        ohu200TmRpl2fC/0FH1qQ
X-Received: by 2002:adf:f006:: with SMTP id j6mr2487878wro.444.1643280406022;
        Thu, 27 Jan 2022 02:46:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxb4ZuK8sGDz/teSbQCYNZjD8WwVwAno0rW/jGdduGtJM0UzScVWzrLTybOMUPWFpN71MYwvA==
X-Received: by 2002:adf:f006:: with SMTP id j6mr2487858wro.444.1643280405691;
        Thu, 27 Jan 2022 02:46:45 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id j19sm6433308wmq.17.2022.01.27.02.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 02:46:45 -0800 (PST)
Message-ID: <d03e4a81-de8b-ca4e-f2c4-51faeb3786fd@redhat.com>
Date:   Thu, 27 Jan 2022 11:46:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/doc: Add section in the introduction page about
 learning material
Content-Language: en-US
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220127082058.434421-1-javierm@redhat.com>
 <20220127110528.20604049@eldfell>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220127110528.20604049@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Pekka,

Thanks a lot for your feedback.

On 1/27/22 10:05, Pekka Paalanen wrote:
> On Thu, 27 Jan 2022 09:20:58 +0100
> Javier Martinez Canillas <javierm@redhat.com> wrote:
> 
>> The Linux DRM subsystem supports complex graphics devices and it could be
>> quite overwhelming for newcomers to learn about the subsystem's internals.
>>
>> There are lots of useful talks, slides and articles available that can be
>> used to get familiar with the needed concepts and ease the learning curve.
>>
>> Add a section to the intro that contains these DRM introductory materials.
>>
>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>>  Documentation/gpu/introduction.rst | 36 ++++++++++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
>> index 25a56e9c0cfd..35986784f916 100644
>> --- a/Documentation/gpu/introduction.rst
>> +++ b/Documentation/gpu/introduction.rst
>> @@ -112,3 +112,39 @@ Please conduct yourself in a respectful and civilised manner when
>>  interacting with community members on mailing lists, IRC, or bug
>>  trackers. The community represents the project as a whole, and abusive
>>  or bullying behaviour is not tolerated by the project.
>> +
>> +Learning material
>> +=================
>> +
>> +Since the Linux DRM layer supports complex graphics devices, it can be quite
>> +overwhelming for newcomers to get familiar with all the needed concepts and
>> +learn the subsystem's internals.
> 
> Hi,
> 
> this seems to say that DRM is going to be complicated no matter what
> hardware one wants to drive, but is that true?
> 
> Is there no way to say that if your display hardware is simple (no
> GPU), then the driver can be simple to write too?
>

I do wonder how much one could abstract of the uAPI when writing a simpler driver.

In other words, writing the driver should be simple but I believe that grasping
all the needed details about DRM may not be.
 
>> +
>> +To shallow the learning curve, this section contains a list of presentations
>> +and documents that can be used to learn about DRM/KMS and graphics in general.
>> +
>> +The list is sorted in reverse chronological order, to keep the most up-to-date
>> +material at the top. But all of them contain useful information, and it can be
>> +valuable to go through older material to understand the rationale and context
>> +in which the recent changes to the DRM subsystem were made.
>> +
>> +Talks
>> +-----
>> +
>> +* `An Overview of the Linux and Userspace Graphics Stack <https://www.youtube.com/watch?v=wjAJmqwg47k>`_ - Paul Kocialkowski (2020)
>> +* `Getting pixels on screen on Linux: introduction to Kernel Mode Setting <https://www.youtube.com/watch?v=haes4_Xnc5Q>`_ - Simon Ser (2020)
>> +* `An introduction to the Linux DRM subsystem <https://www.youtube.com/watch?v=LbDOCJcDRoo>`_ - Maxime Ripard (2017)
>> +* `Embrace the Atomic (Display) Age <https://www.youtube.com/watch?v=LjiB_JeDn2M>`_ - Daniel Vetter (2016)
>> +* `Anatomy of an Atomic KMS Driver <https://www.youtube.com/watch?v=lihqR9sENpc>`_ - Laurent Pinchart (2015)
>> +* `Atomic Modesetting for Drivers <https://www.youtube.com/watch?v=kl9suFgbTc8>`_ - Daniel Vetter (2015)
>> +* `Anatomy of an Embedded KMS Driver <https://www.youtube.com/watch?v=Ja8fM7rTae4>`_ - Laurent Pinchart (2013
>> +
>> +Slides and articles
>> +-------------------
>> +
>> +* `Understanding the Linux Graphics Stack <https://bootlin.com/doc/training/graphics/graphics-slides.pdf>`_ - Bootlin (2022)
>> +* `DRM KMS overview <https://wiki.st.com/stm32mpu/wiki/DRM_KMS_overview>`_ - STMicroelectronics (2021)
>> +* `Linux graphic stack <https://studiopixl.com/2017-05-13/linux-graphic-stack-an-overview>`_ - Nathan Gauër (2017)
>> +* `The DRM/KMS subsystem from a newbie’s point of view <https://bootlin.com/pub/conferences/2014/elce/brezillon-drm-kms/brezillon-drm-kms.pdf>`_ - Boris Brezillon (2014)
>> +* `A brief introduction to the Linux graphics stack <https://blogs.igalia.com/itoral/2014/07/29/a-brief-introduction-to-the-linux-graphics-stack/>`_ - Iago Toral (2014)
>> +* `The Linux Graphics Stack <https://blog.mecheye.net/2012/06/the-linux-graphics-stack/>`_ - Jasper St. Pierre (2012)
> 
> That's an impressive list of links!
> 
> However, given the discussions that prompted this doc, I think the gist
> is missing. The reader is just flooded with stuff to read and learn
> which can be discouraging.
> 
> Your audience are developers who know nothing about DRM. They may have
> been writing fb drivers instead. The display hardware they want to
> drive has no GPU. Where should they get started? Which presentations to
> read/watch first? Which driver to look at for a simple example?
> 
> Maybe add one more section targeting that specific audience?
>

Yes, I did not ignore your suggestions made over IRC but it's just that I
didn't know to write such section. Maybe we can land this section and then
as a follow-up think how a "Getting started" one should look like ?

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

