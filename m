Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC62441352
	for <lists+linux-doc@lfdr.de>; Mon,  1 Nov 2021 06:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhKAF6c (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 1 Nov 2021 01:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbhKAF6b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Nov 2021 01:58:31 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6762CC061764
        for <linux-doc@vger.kernel.org>; Sun, 31 Oct 2021 22:55:58 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id i6so15697392uae.6
        for <linux-doc@vger.kernel.org>; Sun, 31 Oct 2021 22:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kvDi7P1+hnhccmE+Fg1M88dx0x/Pf/SRqjD966XzXcM=;
        b=g4RZtY0usAQVaS4ZVUUvWcPXYWdJBxsuulUx759dvzewq9gXtiSytW8sX0NqCl+89b
         oJ+xAjo+PM8cEyk08s3gEKLbufhZHPmIt2vHRZ1uTLsnGpH27ISsN5W7toRo5uwZQ+mG
         AM+Xk4sCLu7Ir94uMKlAh6zywABxA0i+OhYTw4vSOExyWtwaWyiF6LFuuNdjRFSl0UBt
         WcpzBdAsIpcvjtWl0RRAFMmRtMr+iUgUEnk8KL7qsJ/3HWIy2YhASR3yF/qd5WvUtDFe
         bvyr5NrISER0H2IvCQKoxOp71jnfWFVcEuvZOnQ+BE6H9I5HL0gxi0CnuPf+FOaHgOnU
         GU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kvDi7P1+hnhccmE+Fg1M88dx0x/Pf/SRqjD966XzXcM=;
        b=5jjDpVISgOxdcpjTEsQwGQ0U4276swaPzZ79eUk29t0r2x1LsW/Mzi+ShR9v5C08M2
         5uKJVVWOPmERXRc6RqbaolGBELvUMv2GH+FHRKHMZQ1oEYIb4eDOsT54fPc8Q7NaaGhH
         F1Wi+7Vm7/G0q+k3ebLO4fuAkwv/NFNa65VGjEL5c/IRgrfJoGKQjjYsQVH+yO1Lb77k
         feBrgYiBgqBn4KHmlR2+8+D4ktTYoPS6cu5W2IJcZ0XEdt260udhGel/Yw3nTIAp/7a4
         cjkoewMNvU3QyZxzHh51Ch5Ejw9qehwT22YvHoxsgpM49iZG8+lDJFg7BDK0O/nQyOBm
         Flfw==
X-Gm-Message-State: AOAM533f1gmYYVlQYj8murLaN88G5CaK8ysSEN5du9usirl7vt33mwmR
        vVQb6ETdOmyg2bu/MBEp9MZ+pcf1SPyAWmt0G5E35A==
X-Google-Smtp-Source: ABdhPJzsP6qDzEIILYFCuQw/jMFTuXBChN6P8BBNI+raeI+ULsw/DzHpN/5wIpzgscMbZkqnzrOZvwI/w/6SLAqZgns=
X-Received: by 2002:a67:fa93:: with SMTP id f19mr26730238vsq.48.1635746157476;
 Sun, 31 Oct 2021 22:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211028081030.719265-0-nathan@nathanrossi.com>
 <20211028081030.719265-3-nathan@nathanrossi.com> <7b6764bf-4978-60ec-b1e6-8d59077c3023@roeck-us.net>
 <CA+aJhH1aGJXwYSCU8RC275G5=qGLyZRK94g9ic24wxKuRGCwEA@mail.gmail.com> <43c17bba-d4bd-1f9d-5034-1f5a9279d751@roeck-us.net>
In-Reply-To: <43c17bba-d4bd-1f9d-5034-1f5a9279d751@roeck-us.net>
From:   Nathan Rossi <nathan@nathanrossi.com>
Date:   Mon, 1 Nov 2021 15:55:46 +1000
Message-ID: <CA+aJhH0EBUjQhjQhxj-kfJzmpqGN6ZMNn_M-pAae_V9yPQhs3A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] hwmon: Driver for Texas Instruments INA238
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nathan Rossi <nathan.rossi@digi.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 1 Nov 2021 at 13:48, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/31/21 7:20 PM, Nathan Rossi wrote:
> [ ... ]
> >>> +
> >>> +     if (attr != hwmon_in_max && attr != hwmon_in_min)
> >>> +             return -EOPNOTSUPP;
> >>> +
> >>> +     /* convert decimal to register value */
> >>> +     switch (channel) {
> >>> +     case 0:
> >>> +             /* signed value, clamp to max range +/-163 mV */
> >>> +             regval = clamp_val(val, -163, 163);
> >>> +             regval = (regval * 1000L * (4 - (int)data->gain + 1)) /
> >>
> >> nit: The typecast "(int)" is not needed here.
> >
> > Due to the unsigned type of gain, it causes promotion of regval (and
> > the rest of the numerator) to unsigned long which causes issues with
> > negative numbers on the divide. It makes more sense for gain to be an
> > int to begin with, I will change it to int to avoid the need for type
> > casting.
> >
>
> Are you sure ? I initially thought that as well and wrote a little test
> program with that expression, but it didn't do the promotion to unsigned.
>

It definitely calculates incorrectly at run time (on an arm 32-bit
platform), looking at the gcc output from -fdump-tree-original reveals
some more insight. Which is that the promotion to long overrides the
unsigned (from the 1000L) on long=64 but not on long=32.

Where regval is int, and gain is unsigned int (u32).

regval = (regval * 1000L * (4 - gain + 1)) / 5;
-> armv7-a (invalid)
regval = (int) ((((long unsigned int) regval * (long unsigned int) (5
- gain)) * 1000) / 5);
-> x86-64 (valid result)
regval = (int) ((unsigned int) (gain * 4294967096 + 1000) * (unsigned
int) regval);

note: 4294967096 is -800, 1000 * (4 - gain + 1) => (-800 * gain) + 1000

Slight variation without the 1000 being long.

regval = (regval * 1000 * (4 - gain + 1)) / 5;
-> armv7-a (invalid)
regval = (int) ((((unsigned int) regval * (5 - gain)) * 1000) / 5);
-> x86-64 (invalid)
regval = (int) ((((unsigned int) regval * (5 - gain)) * 1000) / 5);

regval = (regval * 1000LL * (4 - gain + 1)) / 5;
-> armv7-a (valid)
regval = (int) ((unsigned int) (gain * 4294967096 + 1000) * (unsigned
int) regval);
-> x86-64 (valid)
regval = (int) ((unsigned int) (gain * 4294967096 + 1000) * (unsigned
int) regval);

I think it still makes sense to change gain to be int, and avoid the
unsigned type issues.

Regards,
Nathan
