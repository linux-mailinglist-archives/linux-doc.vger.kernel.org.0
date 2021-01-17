Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134ED2F9628
	for <lists+linux-doc@lfdr.de>; Mon, 18 Jan 2021 00:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730614AbhAQXMc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 17 Jan 2021 18:12:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730611AbhAQXM2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 17 Jan 2021 18:12:28 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242D5C061574
        for <linux-doc@vger.kernel.org>; Sun, 17 Jan 2021 15:11:48 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id h11so481922ioh.11
        for <linux-doc@vger.kernel.org>; Sun, 17 Jan 2021 15:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uTqt3F9dJWVoKfgiU08aMV4ph64qri2rvxrWXMrueJ8=;
        b=VmgB4MeXmKYCfSDG0OnMYF6kzplkIUK97A0DQREH7C8uBsLFpXXvdyvlHy6adeD0pN
         6Hrc3z621KauS64dIAVVadY7l45FghhFd34+JbNQgnvEOnua+2rnShOCypBHIi7SjvAQ
         xmD8WSDPn8HdgmXMy+D7EpFON/TGiSBprawNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uTqt3F9dJWVoKfgiU08aMV4ph64qri2rvxrWXMrueJ8=;
        b=cZJ6PdDc4WhJPNlfQX4SthL4z39RBVuJ2wK8xGMamOz+tMdA1QCoNg/HW+OohObJBK
         zjAcbinUPWW36wW1zfC9V6bNmAanNreJlPT+JWEt9OmEt3XSyTkdRO1MiIl6ZAb/f2qQ
         XnpdgnScaFjif3n6VOqBIQD0zRwB1zJZlj1J7qKllFXmppeZFAEpFkQg+4zmm3ff6Qqw
         tbJdlTQGU25cOdHXiSlOIq348+7VpIsMyaXYlZSklP8nu097H94/jhoWYPBmNoR6CTlv
         cob6MAJvLKyS9jV8sPYqn4+oryuv4neeaXgjAMgmC5VsE4p+K/X3pTe7d5e1wqVjIU4T
         QkOQ==
X-Gm-Message-State: AOAM533gNjPJRBSx4HPmTOnS+X1HxLv0CUhWqRr/tVK3jK23sNNfPo+3
        m6v1Z7mDguEp4Te3mj3O/BjtsddT0WG7msi3wZDIG1Qg60LsbQ==
X-Google-Smtp-Source: ABdhPJypC0MXLqJr4lQt0LFOgpZVXwyPSFsKqUlFgxl+kV83MrCHlwI0zZBFRtkhym33miMWYZFkWgD8wct+uW4+1XI=
X-Received: by 2002:a92:c567:: with SMTP id b7mr2375120ilj.25.1610925107444;
 Sun, 17 Jan 2021 15:11:47 -0800 (PST)
MIME-Version: 1.0
References: <20210117153816.696693-1-jic23@kernel.org> <20210117153816.696693-7-jic23@kernel.org>
In-Reply-To: <20210117153816.696693-7-jic23@kernel.org>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Sun, 17 Jan 2021 15:11:35 -0800
Message-ID: <CAJCx=g=aAqFf7ZUG+2rhq6hiq0kift5RO3pzpj5R46P=k8dMew@mail.gmail.com>
Subject: Re: [RFC PATCH 6/7] iio:ABI docs: Combine the two instances of docs
 for sensor_sensitivity
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jan 17, 2021 at 7:40 AM Jonathan Cameron <jic23@kernel.org> wrote:
>
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> This control on the gain of a measurement used for time of flight sensing
> is standard but the expected values for different enviroments may not be.
> As we cannot have the same ABI element documented in two files, add a
> generic version to sysfs-bus-iio-proximity and a note on the expected
> value vs measuring environment for the as3935.
>
> Fixes:
> $ scripts/get_abi.pl validate
> Warning: /sys/bus/iio/devices/iio:deviceX/sensor_sensitivity is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-distance-srf08:0  ./Documentation/ABI/testing/sysfs-bus-iio-proximity-as3935:8
>
> Cc: Matt Ranostay <matt.ranostay@konsulko.com>
> Reported-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Matt Ranostay <matt.ranostay@konsulko.com>

> ---
>  .../ABI/testing/sysfs-bus-iio-distance-srf08       |  8 --------
>  Documentation/ABI/testing/sysfs-bus-iio-proximity  | 14 ++++++++++++++
>  .../ABI/testing/sysfs-bus-iio-proximity-as3935     |  9 ---------
>  3 files changed, 14 insertions(+), 17 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-distance-srf08 b/Documentation/ABI/testing/sysfs-bus-iio-distance-srf08
> index 40df5c9fef99..9dae94aa880b 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio-distance-srf08
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-distance-srf08
> @@ -1,11 +1,3 @@
> -What:          /sys/bus/iio/devices/iio:deviceX/sensor_sensitivity
> -Date:          January 2017
> -KernelVersion: 4.11
> -Contact:       linux-iio@vger.kernel.org
> -Description:
> -               Show or set the gain boost of the amp, from 0-31 range.
> -               default 31
> -
>  What:          /sys/bus/iio/devices/iio:deviceX/sensor_max_range
>  Date:          January 2017
>  KernelVersion: 4.11
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-proximity b/Documentation/ABI/testing/sysfs-bus-iio-proximity
> index 2172f3bb9c64..3aac6dab8775 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio-proximity
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-proximity
> @@ -8,3 +8,17 @@ Description:
>                 considered close to the device. If the value read from the
>                 sensor is above or equal to the value in this file an object
>                 should typically be considered near.
> +
> +What:          /sys/bus/iio/devices/iio:deviceX/sensor_sensitivity
> +Date:          March 2014
> +KernelVersion: 3.15
> +Contact:       linux-iio@vger.kernel.org
> +Description:
> +               Proximity sensors sometimes have a controllable amplifier
> +               on the signal from which time of flight measurements are
> +               taken.
> +               The appropriate values to take is dependent on both the
> +               sensor and it's operating environment:
> +               * as3935 (0-31 range)
> +               18 = indoors (default)
> +               14 = outdoors
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio-proximity-as3935 b/Documentation/ABI/testing/sysfs-bus-iio-proximity-as3935
> index c59d95346341..1e5c40775a6c 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio-proximity-as3935
> +++ b/Documentation/ABI/testing/sysfs-bus-iio-proximity-as3935
> @@ -6,15 +6,6 @@ Description:
>                 Get the current distance in meters of storm (1km steps)
>                 1000-40000 = distance in meters
>
> -What:          /sys/bus/iio/devices/iio:deviceX/sensor_sensitivity
> -Date:          March 2014
> -KernelVersion: 3.15
> -Contact:       Matt Ranostay <matt.ranostay@konsulko.com>
> -Description:
> -               Show or set the gain boost of the amp, from 0-31 range.
> -               18 = indoors (default)
> -               14 = outdoors
> -
>  What           /sys/bus/iio/devices/iio:deviceX/noise_level_tripped
>  Date:          May 2017
>  KernelVersion: 4.13
> --
> 2.30.0
>
