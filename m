Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23F01D17B4
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2020 16:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389009AbgEMOfz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 May 2020 10:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388800AbgEMOfy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 May 2020 10:35:54 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC2FC061A0E
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2020 07:35:54 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id s21so6284992ejd.2
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2020 07:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AlqVC8u4P9PNkoT8l8vMpZfu06Dmj3nts225WoeRAJA=;
        b=ZLQrV0nneosBHj+7xCc5egcsUtP65O31+mSG+ARmurEXovdMccDV3mFX15VNW2ByBl
         QO4llNH+5o4bhlXHKGm0KbtQIJ3+Z1GRZSWSE/M5qV65RflL1tf78xgJe7A4rE8M2qJW
         ntHk1Z/Jd+55anPZ9E0wqcCyq8rnGIdyrGqTGORajq8YkayNJ1XuO7h7NgQSoAkFP2kL
         53h0HrwXoZrsg4DB33/bqlCSIQpB1aGOnaVpTfwGrZn5FWoDCoYsCyy0fvL07HZwXNkI
         zWPvp6MiCgszDsuRdhpk8HEMAcRwTIKiMTPgV4iJvA0Jsw7VqEDejipUKNQjiekb3m9P
         cGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AlqVC8u4P9PNkoT8l8vMpZfu06Dmj3nts225WoeRAJA=;
        b=abFt9rNe11heFcZaCatCODAn9PeH9aLAfxbBm61TXn7wmofAQSHf6fKj1YZVGhCcwc
         4+0FDMiMwurx0jMzGv3/h/4OxJjTkYa+aTI+/w1E1SIidZskDg59hkcdDralVG8iKEnd
         MjEJE/V0gH3nvhOxMPHr1FwW6e+YY0FJuKD/34MdIFiyhHwcJ0Rnz6+RgdD7/bg4DVIh
         dlkKIgnTMLzAeWXxS0f3NrPF0ea4fUE+MDXruLRbbWRoIBq9cfZEJhYg4MwHQAIjJ8dV
         fIsjf2QSI+qmpo/d2AJmupvf+svQkdl8LyvJhbGNGbbpUA8PooHgstPjM8VCmx5SORmy
         Aa6A==
X-Gm-Message-State: AGi0PuZlXpwhqs2ZdaFAGcmHdkcDQkdbrNHe5BU361ltleYQRCxCPrGx
        uy4VaTg/wFwmxcgB2Sg+Gw+PWcGTz4wb+WzFNM2xHA==
X-Google-Smtp-Source: APiQypKK6WVF7jNOMbzOYGstLdxFuP03Og914DSw6UgaUl3VURf6RhYpE2KLwj09JfmwrN8oLKW+BCRRSdYt8gBuuKw=
X-Received: by 2002:a17:906:404d:: with SMTP id y13mr23435201ejj.43.1589380552850;
 Wed, 13 May 2020 07:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200506211523.15077-1-keescook@chromium.org> <20200512131655.GE17734@linux-b0ei>
 <CA+CK2bBMUxxuTBicQ7ihKpN3jK94mMjcNCXhnAXUaODce09Wmw@mail.gmail.com>
 <20200512155207.GF17734@linux-b0ei> <202005121111.6BECC45@keescook>
 <20200513073448.GG7340@linux-b0ei> <202005130045.EF013D12E@keescook>
In-Reply-To: <202005130045.EF013D12E@keescook>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Wed, 13 May 2020 10:35:16 -0400
Message-ID: <CA+CK2bAPv5u1ih5y9t5FUnTyximtFCtDYXJCpuyjOyHNOkRdqw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] allow ramoops to collect all kmesg_dump events
To:     Kees Cook <keescook@chromium.org>
Cc:     Petr Mladek <pmladek@suse.com>, Anton Vorontsov <anton@enomsg.org>,
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

> >   + reason: panic, oops, emergency, shutdown    (ordered by severity)
> >   + handling: restart, halt, poweroff
> >
> > Or we might just replace KMSG_DUMP_RESTART, KMSG_DUMP_HALT,
> > KMSG_DUMP_POWEROFF with a single KMSG_DUMP_SHUTDOWN.
> >
> > Then the max reason variable would make sense.
>
> That would work for me, yeah. Pavel, is that enough granularity for you?
>

Yes, I like the second approach: where we combine all shutdown type
events into a single type.
max_reason will have 4 levels:

   KMSG_DUMP_PANIC,
   KMSG_DUMP_OOPS,
   KMSG_DUMP_EMERG,
   KMSG_DUMP_SHUTDOWN,

If needed it is possible to determine from dmesg logs what kind of
shutdown was taken, because there is a message logged right before
every kmsg_dump() for these events:

249   if (!cmd)
250   pr_emerg("Restarting system\n");
251   else
252   pr_emerg("Restarting system with command '%s'\n", cmd);
253   kmsg_dump(KMSG_DUMP_RESTART);

276   pr_emerg("System halted\n");
277   kmsg_dump(KMSG_DUMP_HALT);

294   pr_emerg("Power down\n");
295   kmsg_dump(KMSG_DUMP_POWEROFF);

Kees, I will submit a new series with these changes soon.

Thank you,
Pasha
