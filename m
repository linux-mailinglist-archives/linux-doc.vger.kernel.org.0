Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 341C73B1446
	for <lists+linux-doc@lfdr.de>; Wed, 23 Jun 2021 08:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhFWG62 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 23 Jun 2021 02:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbhFWG62 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Jun 2021 02:58:28 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1094C061574
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 23:56:09 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id y4so1552391pfi.9
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 23:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=t2pWY37sQS7wYmTZFWeBBAVB8lvXIPkxw14DD6JgFyw=;
        b=i/0NPDjzGLbE4LBA80Uu7k//DWQ1Wq/Nxeco/bkPsBwFX9NoqdaNYW0UDh00crxFEu
         iI09uAZ5j9N/sYzrfBKkJ7gxuW0f1N5rs/KbhmonH06zT0Vymn7OwzIKayU4i9Uo7j36
         rYdsiH9bXq/aOqiYNs0DwBDpzP7OG2Z8uwKmnX/huUPh1DWE/SrkPGpv/kUfnEN0fKnG
         HI5QBp6EsjJ0G0woKTmwVlmkEF+IDCrXTidlTNqlJQvbiXr5Yfpx2PS2xmnX8yL1IQE/
         59gSycl8xySsOcTgB8zvz79sg0QRagUAvcgEfWieWBAwIU7mpOw5NYvs0iIju/vBP/xG
         rsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t2pWY37sQS7wYmTZFWeBBAVB8lvXIPkxw14DD6JgFyw=;
        b=Tb7S5YaMTUF+GzPeQOL7MfphmiafQEkf9YnVqpr+DnMK+i9tjGfMfd+aKXimciDk7C
         snbACGUmvRQLE5JA9yF6d5RnLrpJRHrTqr0ddlyvpwty1eoqBD5YtSw7oAypzMeRGkqZ
         4ejvfVYtdgobLaP1CuQ8aeEnolcJH4laQXaBARR0iiqM6tYCBfjgOmiQ78Yx0aOWShlP
         Md/HyhrSSaLm1DoRsa2RevBhfW3zZOuqKgwYlHo1HUOcFYB7YhGuqT9MVTHcRXPao2iM
         hWrVnp22mkGn0+RlTWajOMnRJtbQzDwgmsnBLskZEXuAyTutna6HUk7YwKDaGgMMGsaK
         A8kQ==
X-Gm-Message-State: AOAM5309uBuH6jvOdT78ta1oAM+PcOgZzmxHbJYQi3CE8OSfghVcK8fy
        lOVxrewQhxgToQVdOznrHs3F3w==
X-Google-Smtp-Source: ABdhPJxuCyhd1JeMWCXAj2NaviXdgvZBzY0G06KEl//E3ieHfTlplnQbfOEvqSdIRXIZ33PF2clRNg==
X-Received: by 2002:a62:1782:0:b029:2f7:dcbe:c292 with SMTP id 124-20020a6217820000b02902f7dcbec292mr7593771pfx.63.1624431369445;
        Tue, 22 Jun 2021 23:56:09 -0700 (PDT)
Received: from ?IPv6:240b:10:c9a0:ca00:1102:c007:eee:4478? ([240b:10:c9a0:ca00:1102:c007:eee:4478])
        by smtp.gmail.com with ESMTPSA id v69sm1507491pfc.18.2021.06.22.23.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 23:56:08 -0700 (PDT)
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Damian Hobson-Garcia <dhobsong@igel.co.jp>
References: <20210621062742.26073-1-etom@igel.co.jp>
 <7cde82a9-c60c-e527-eeac-eaad0c5842a1@metux.net>
 <1cfab5f9-f275-aa53-00de-5da3fcea71c5@igel.co.jp>
 <20210622111239.73aa87aa@eldfell>
From:   Esaki Tomohito <etom@igel.co.jp>
Message-ID: <ee0161b5-c88b-40ce-c02f-86e0927b70bb@igel.co.jp>
Date:   Wed, 23 Jun 2021 15:56:05 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622111239.73aa87aa@eldfell>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,
Thank you all for your comments.

On 2021/06/22 17:12, Pekka Paalanen wrote:
> On Tue, 22 Jun 2021 13:03:39 +0900
> Esaki Tomohito <etom@igel.co.jp> wrote:
> 
>> Hi, Enrico Weigelt
>> Thank you for reply.
>>
>> On 2021/06/22 1:05, Enrico Weigelt, metux IT consult wrote:
>>> On 21.06.21 08:27, Tomohito Esaki wrote:
>>>
>>> Hi,
>>>   
>>>> Virtual DRM splits the overlay planes of a display controller into multiple
>>>> virtual devices to allow each plane to be accessed by each process.
>>>>
>>>> This makes it possible to overlay images output from multiple processes on a
>>>> display. For example, one process displays the camera image without compositor
>>>> while another process overlays the UI.  
>>>
>>> Are you attempting to create an simple in-kernel compositor ?  
>>
>> I think the basic idea is the same as DRMlease.
> 
> Hi,
> 
> indeed. Why not use DRM leases instead?
> 

In this use case, I understand that this is not possible with DRM lease,
am I wrong?
I understand that it�s not possible to lease a plane and update planes
on the same output independently from different processes in current DRM
lease.

If this is correct, what do you think of adding support for plane leases
to the DRM lease to handle this case?

Thanks,
Tomohito Esaki
