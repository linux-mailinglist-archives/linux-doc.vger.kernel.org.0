Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E07D133F767
	for <lists+linux-doc@lfdr.de>; Wed, 17 Mar 2021 18:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbhCQRrI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 17 Mar 2021 13:47:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31932 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232767AbhCQRqj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Mar 2021 13:46:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616003198;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CCabCEQRGnAeS704us1uXD1jP2HpK0cYd8RXwLYid7A=;
        b=e7RBC5Hv1R9IG1stFttfig1zoBigwOtNKHW49Ble5hRRlbl4GbeNJvQAV8Vbhps5M/zW0H
        6dlFbudd0RahGgLnDiTe9LPys9C17nerA7PIUVOinwyfoXGJN1BPBm9elELg6h6DCoZTvN
        XfURJ/NxbDkM55Hrf2VrRs75dssSbuU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-u1y9riKyO-iJG5fc5YRFLg-1; Wed, 17 Mar 2021 13:46:34 -0400
X-MC-Unique: u1y9riKyO-iJG5fc5YRFLg-1
Received: by mail-ed1-f69.google.com with SMTP id r19so19357042edv.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Mar 2021 10:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CCabCEQRGnAeS704us1uXD1jP2HpK0cYd8RXwLYid7A=;
        b=AtdkW0tbltVYY7Qg9aiMMLMyt8kHFhn4n6AiZF9g8QtPwHjOTJnAqBO4nHIxnDokNe
         +6FeVOIW/GADK3qhQ2D/A2GIty4jBhWgMrwKcV0wbqQJ1nduRFpSa/YN9G+N0V0j0E6x
         zP0MePaZCeTyt47C0e5yEVK4667mCbY9BohmA1cV+eUwNKeNIKL/YT+k3XIMU+YJaVs5
         SWa5gmwsKXifAg0zYKndTsn4cD+pGNMuymSrgAdeieIDWoFWaRBmNrW4SfzzN7GD0CQw
         fOo8hwu+DjkxzNWURfimJgwisyvFXEm2TN5IU31MqTgcqvh3Dgv8y1a7fuHCVbevB2IN
         EOKg==
X-Gm-Message-State: AOAM530nYPJzA0wMOsSoEhp+y6ON1CGmsEEv6MyU5yPH4kxXEQoC91uy
        EgC/orBy7MEi/RkL9ntCUch0yVTwZvXVJXraxD0rIoskswH6WqjYp1j8JEukEsPNBdqyOfhLynK
        hjhtg/CSArNZBeoUJNbuk
X-Received: by 2002:aa7:d74d:: with SMTP id a13mr45305574eds.199.1616003193604;
        Wed, 17 Mar 2021 10:46:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp4yZL5VrLC7bAoOuQZjKzl5EnsmLDm5qQ7XMulkiUdoT/Ubg/stLn9EqfZZid0vw42GVFbQ==
X-Received: by 2002:aa7:d74d:: with SMTP id a13mr45305562eds.199.1616003193469;
        Wed, 17 Mar 2021 10:46:33 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f9sm13450007eds.41.2021.03.17.10.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 10:46:33 -0700 (PDT)
Subject: Re: [PATCH 0/3] platform/surface: Add DTX detachment system driver
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-api@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210308184819.437438-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <600b5161-e754-f363-b774-0cb020b7e439@redhat.com>
Date:   Wed, 17 Mar 2021 18:46:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308184819.437438-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 3/8/21 7:48 PM, Maximilian Luz wrote:
> The Microsoft Surface Book series devices consist of a so-called
> clipboard part (containing the CPU, touchscreen, and primary battery)
> and a base part (containing keyboard, secondary battery, and optional
> discrete GPU). These parts can be separated, i.e. the clipboard can be
> detached and used as tablet.
> 
> This detachment process is managed by a subsystem of the Surface System
> Aggregator Module (SSAM). As that process is a bit more complex, i.e.
> can involve user interaction, it seems the best way to implement this is
> to provide a somewhat cleaned-up version of this interface to userspace.
> 
> This series adds a driver (and documentation) for the detachment system
> which provides such an interface. See the commit message of the first
> patch for more details and a link to a user-space daemon using this
> interface. Support for the Surface Book 3 is added in patch 2,
> user-space API documentation in patch 3.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> 
> Regards,
> Max
> 
> Maximilian Luz (3):
>   platform/surface: Add DTX driver
>   platform/surface: dtx: Add support for native SSAM devices
>   docs: driver-api: Add Surface DTX driver documentation
> 
>  .../surface_aggregator/clients/dtx.rst        |  718 +++++++++
>  .../surface_aggregator/clients/index.rst      |    1 +
>  .../userspace-api/ioctl/ioctl-number.rst      |    2 +
>  MAINTAINERS                                   |    8 +
>  drivers/platform/surface/Kconfig              |   20 +
>  drivers/platform/surface/Makefile             |    1 +
>  drivers/platform/surface/surface_dtx.c        | 1289 +++++++++++++++++
>  include/uapi/linux/surface_aggregator/dtx.h   |  146 ++
>  8 files changed, 2185 insertions(+)
>  create mode 100644 Documentation/driver-api/surface_aggregator/clients/dtx.rst
>  create mode 100644 drivers/platform/surface/surface_dtx.c
>  create mode 100644 include/uapi/linux/surface_aggregator/dtx.h
> 

