Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB6A1CF664
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2020 16:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729637AbgELOEW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 May 2020 10:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729229AbgELOEV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 May 2020 10:04:21 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C690C061A0C
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2020 07:04:21 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id r7so11193800edo.11
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2020 07:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ikZPDK7XBn7eFKeGkIZXS4/10/P6XjlDj25+b+s0OwY=;
        b=bFYBorqFH+N/xag4HXQG3Xhs6FfcPgBOaT2DkefxRQLmXc4eRjxZGpw8zoVFr3Eu6W
         fxhmGhNaddsasSNRtSwjH3ys4skHQcc5eRf6g6A/lvbuK/BpA9zRvS73WGSMZzCwnr7f
         MIZ/lu59RDnwLyv4wQnVDYKqEAXhAszGHgS8NI81JCyZlRmxxzWTzh6swwFQUCNbp+F5
         ++BR6Lz++mlkOgoQRzxyTo4gRG4K6LtusFOWcZUtD2nUvUFP7mu2MMX7pAZ4F1rXE/Ur
         a6aq4DIbDc/10bXvUEqhQ3/Up7m33EF7ll7XMmKKzA1EP64c1b2R1mdBqWQvZe9HkoX3
         EcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ikZPDK7XBn7eFKeGkIZXS4/10/P6XjlDj25+b+s0OwY=;
        b=ds4TJO7ceCI3OEH6Y+IRV2An5uNMydVHum4JFe2bW06QjTqg6swIEiffPiUDRhrOTH
         xgbtre6OaWOtykkYxV9wOcj3T1xmUeO/nDHuHVoK8TNbPWco/QSf6nOTJ+M+yahEa9XA
         2S+aS77gzb1yY7SZ14ZBmUveRfs0BFJ/GwLQNaKAvm4Yp2GgibqlyEyQ1lLR/6/FVqIn
         AUbWG2QjzS7nzCQ1JmMfF9EY19SJEW50IwEvnUCp4yF+KQFdsXe5MS3i6RForX/taNGe
         CAZ925wgi/Yw638WnJT8KdhE3mLxLv2E5DZJ6OuZk4BAtDFaTtis4rdrGHKGSoE8ZVMS
         Cukw==
X-Gm-Message-State: AOAM530/xrpRa2repxnVsVoNvShi38KjqZar/IXN9l/7T9BVgxixdkIZ
        SC3WlBlTWGjIPSBsopkNjlgZsKyDjy6A7ifu8I82lw==
X-Google-Smtp-Source: ABdhPJw21yX98EkZo0YMg5kI0+/UAXdggsUiHgj1VF3wDW/b41YkePhJMmMQboVKc9cHI7ZwHQp6/7sjMY2o7QTFH7U=
X-Received: by 2002:a05:6402:3044:: with SMTP id bu4mr2696109edb.342.1589292260160;
 Tue, 12 May 2020 07:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200506211523.15077-1-keescook@chromium.org> <20200512131655.GE17734@linux-b0ei>
In-Reply-To: <20200512131655.GE17734@linux-b0ei>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 12 May 2020 10:03:44 -0400
Message-ID: <CA+CK2bBMUxxuTBicQ7ihKpN3jK94mMjcNCXhnAXUaODce09Wmw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] allow ramoops to collect all kmesg_dump events
To:     Petr Mladek <pmladek@suse.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        James Morris <jmorris@namei.org>,
        Sasha Levin <sashal@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Petr,

> Alternative solution is to dump all messages using ramoops. The
> problem is that it currently works only during Oops and panic
> situation. This is solved by this patchset.
>
>
> OK, I personally see this as two separate problems:
>
>    1. Missing support to set loglevel per console.
>    2. Missing support to dump messages for other reasons.
>
> I would remove the paragraph about console log levels completely.

OK, I see your point, this paragraph can be removed, however, I think
it makes it clear to understand the rationale for this change. As I
understand, the per console loglevel has been proposed but were never
accepted.

> It is your reason to use ramoops. But it is not reason to modify
> the logic about max_reason.
>
>
> Now, the max_reason logic makes sense only when all the values
> have some ordering. Is this the case?
>
> I see it as two distinct sets:
>
>    + panic, oops, emerg: describe how critical is an error situation
>    + restart, halt, poweroff: describe behavior when the system goes down
>
> Let's say that panic is more critical than oops. Is restart more
> critical than halt?
>
> If you want the dump during restart. Does it mean that you want it
> also during emergency situation?
>
> My fear is that this patchset is going to introduce user interface
> (max_reason) with a weird logic. IMHO, max_reason is confusing even
> in the code and we should not spread this to users.
>
> Is there any reason why the existing printk.always_kmsg_dump option
> is not enough for you?

printk.always_kmsg_dump is not working for me because ramoops has its
own filtering based on dump_oops boolean, and ignores everything but
panics and conditionally oops.
max_reason makes the ramoops internal logic cleaner compared to using dump_oops.

I agree, the reasons in kmsg_dump_reason do not order well  (I
actually want to add another reason for kexec type reboots, and where
do I put it?), so how about if we change the ordering list to
bitfield/flags, and instead of max_reason provide: "reasons" bitset?

Thank you,
Pasha
