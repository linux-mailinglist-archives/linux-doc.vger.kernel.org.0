Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 687D4780E77
	for <lists+linux-doc@lfdr.de>; Fri, 18 Aug 2023 17:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377963AbjHRPAi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Aug 2023 11:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377928AbjHRPAG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 11:00:06 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71651CD
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 08:00:03 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so14816831fa.3
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 08:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692370802; x=1692975602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=llsZvzD6cRnuvxnQcKZycup/elJHks9TtS96HYlYIQ0=;
        b=TVOHuc3nS2Wx+VsFLUx0qrq/rLRoKpK4snA7rB8Z9PmzmwrcYSBzANyrfPAsIwQknt
         dRRZRzCWbR8lTPZlF0xR62Ei4aa0U1i3naGcxGza+4rlS4j0uKIiE0pgVWI/kgTOXDD6
         klSp3fcm5DMjpWhPswzirIXigg4bWnv0JxyfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692370802; x=1692975602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llsZvzD6cRnuvxnQcKZycup/elJHks9TtS96HYlYIQ0=;
        b=Ej3p3EN6eHwYhY6tLbHjPQqXqpQbRGwcrbzdKMJ+fiJ9ThVrNsApXI3eWAGVEra88U
         bSr4bxnqainncnTemki2EnZDuvdUqQPUEksBQXtiJqL4I9D9RMnOmjFp/ACxtxjAJt8P
         u1QKRnGUxCYIJoZmlVC6KH55LAWxue/i9bZcKQbInqlTmUfmO/9wXu2byGugAbtnFIKO
         aFnycFSAVZxSUHeMfBjKORt+GYgto+mTa97Vqnk3b/uYzjmWpkSMgnY8h08jcdMzTIuF
         xL+3xnIrkNB2VevLupz3oM7M6SxCMtTXdIHqowBPJ/2GD08cFDyBwq8ao0aixpvbWAky
         3EQw==
X-Gm-Message-State: AOJu0YxFovoaUOEKT9IYGXT0OX2XPfTsPEyG5duIraE+g4Wsv4MlknOy
        JHA1XbdAS5/jG5j7Z2RQoma2P4aGtbOWQQWHCMyXlAhHK2SteXqNXD8=
X-Google-Smtp-Source: AGHT+IHsh1bLojCUOomU6vuGrkxQgmqFeKkYOIjnKbvpxH7S5hTc/89W3jtTqDC2sN5WVB9mUI5R7Gh/5j1sb55EZQ4=
X-Received: by 2002:a05:6512:2215:b0:4fb:745e:dd01 with SMTP id
 h21-20020a056512221500b004fb745edd01mr2607971lfu.45.1692370801446; Fri, 18
 Aug 2023 08:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAPnjgZ0vPwd9v+V8Pg5Bo87OELD-vokB7ZrvU3Bv5dQ_O9z6Sg@mail.gmail.com>
 <877cpusybz.fsf@meer.lwn.net> <CAPnjgZ3Lo4Na7YeKPFaY30bwsv_gBGapN_DXeab+k7yhCF3uww@mail.gmail.com>
 <dfac4932-7cbc-3a4e-bde7-c2048516ddf1@gmx.de>
In-Reply-To: <dfac4932-7cbc-3a4e-bde7-c2048516ddf1@gmx.de>
From:   Simon Glass <sjg@chromium.org>
Date:   Fri, 18 Aug 2023 08:59:50 -0600
Message-ID: <CAPnjgZ07G=+QZU9+qT23x+aZw4VES0jNkXUTu4Axm400NF-hzQ@mail.gmail.com>
Subject: Re: Doc style for method functions
To:     Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc:     linux-doc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        U-Boot Mailing List <u-boot@lists.denx.de>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Heinrich,

On Thu, 17 Aug 2023 at 10:36, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> On 16.08.23 19:47, Simon Glass wrote:
> > Hi Jonathan,
> >
> > On Wed, 16 Aug 2023 at 11:15, Jonathan Corbet <corbet@lwn.net> wrote:
> >>
> >> Simon Glass <sjg@chromium.org> writes:
> >>
> >>> Hi Jonathan,
> >>>
> >>> I would like to do something like this:
> >>>
> >>> struct part_driver {
> >>>     /**
> >>>      * get_info() - Get information about a partition
> >>>
> >>>                ^ causes error
> >>>
> >>>      *
> >>>      * @desc: Block device descriptor
> >>>      * @part: Partition number (1 = first)
> >>>      * @info: Returns partition information
> >>>      */
> >>>     int (*get_info)(struct blk_desc *desc, int part, struct
> >>> disk_partition *info);
> >>> ...
> >>> };
> >>>
> >>> But this gives:
> >>>
> >>> scripts/kernel-doc:292:
> >>>     print STDERR "Incorrect use of kernel-doc format: $_";
> >>>
> >>> Without the brackets on get_info() it works OK. What is the purpose of
> >>> that check, please?
> >>
> >> That's how the kerneldoc syntax was defined, well before my time as the
> >> maintainer.  This could be relaxed, I guess, but one would have to look
> >> at the parsing code to be sure that the right thing happens all the way
> >> through the process.  I'm not entirely sure it's worth it...
> >
> > I see. It is inconsistent, since we use () after normal functions.
> >
> > I think I can fix it just by removing that check.
> >
> > Regards,
> > Simon
>
> If the structure element in not a function pointer, we probably still
> want to forbid adding parentheses. Just dropping the check might not be
> the solution.

Is that the purpose of this check? Is it likely that someone would add
a bracket immediately after a variable?

Regards,
Simon
