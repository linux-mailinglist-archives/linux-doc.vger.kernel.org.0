Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1161EC425
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2020 23:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgFBVGj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Jun 2020 17:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgFBVGj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Jun 2020 17:06:39 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C5C7C08C5C0
        for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2020 14:06:39 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id q19so8905800eja.7
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2020 14:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QGf11SbLkxX4fJOwT9kGUgWEGfA4VGBgNO6kWFPFsRk=;
        b=XM3q8pho/PiowJ76NeZ46OC8b/u0qzNDKNLp7cEGV3nGiBc2PGReStjvx1Vz8tUMND
         4apoBJ3u14oElCS0buaQvzQDvSszTwAsZ6Yhd5EN54LStE+ICJI6tZsQZF7P75x4vh38
         Hlaj5tBKyfVXGXv4gKJiwm0zV3L6emG1YczkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QGf11SbLkxX4fJOwT9kGUgWEGfA4VGBgNO6kWFPFsRk=;
        b=gUb4RmW8Nw638YARE62zXS7Ozw9RPY67l1rnpDTUkBHzJvHHtYysud4vWzubh3XBH5
         96/suW3/MRL9x6Mg43d90GuL9BAH/8WxgFx+6EFissf83UjCOeqHpCsZB9FzL47YGnP0
         Rel21nKIyGN6c2cmW+AmDiv7Hrzm1fRdQRrPiBivnUfvs2mhNu5TOIMUXkUPw8ctvxkU
         /1Hk3nljcDlqVhYzAbfafI4ZrkReNcvt0+pry9FHgA6cgIHRRC3tGaUPG9SfL0fy0KEJ
         8Q0y+rV3db7qIIIt7nNow9DGGOQrmrqL9kFccTk0k1qXyT8L7i0KVXN0uSvShgk2eJSQ
         QP6A==
X-Gm-Message-State: AOAM530/q8GLPdeNwI1QsclLWjb8cnpyHdHvJ++lJmQkVOxrv5cESLpV
        fzSTIszD1C+8u92LE1kK1znrrOBsozHFMA==
X-Google-Smtp-Source: ABdhPJw612UMv9d2bKPQrsuVwX0r47OElzWmlVQBGlvF14HZFEetCzSzakhLwKqTvoPR4SilsX5whg==
X-Received: by 2002:a17:906:4944:: with SMTP id f4mr24950012ejt.3.1591131997481;
        Tue, 02 Jun 2020 14:06:37 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id e4sm2068431edy.17.2020.06.02.14.06.37
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 14:06:37 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id c3so65411wru.12
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2020 14:06:37 -0700 (PDT)
X-Received: by 2002:a2e:7f02:: with SMTP id a2mr429268ljd.138.1591131684280;
 Tue, 02 Jun 2020 14:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200526145815.6415-1-mcgrof@kernel.org> <20200526145815.6415-6-mcgrof@kernel.org>
In-Reply-To: <20200526145815.6415-6-mcgrof@kernel.org>
From:   Brian Norris <briannorris@chromium.org>
Date:   Tue, 2 Jun 2020 14:01:12 -0700
X-Gmail-Original-Message-ID: <CA+ASDXMR-Aa9322QjUTxiD2zwXDUig1eyG7GAAJJDvuUg1AXdA@mail.gmail.com>
Message-ID: <CA+ASDXMR-Aa9322QjUTxiD2zwXDUig1eyG7GAAJJDvuUg1AXdA@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] ath10k: use new taint_firmware_crashed()
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     jeyu@kernel.org, "David S. Miller" <davem@davemloft.net>,
        kuba@kernel.org, linux-wireless <linux-wireless@vger.kernel.org>,
        aquini@redhat.com, linux-doc@vger.kernel.org, peterz@infradead.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux@dominikbrodowski.net,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        glider@google.com, GR-everest-linux-l2@marvell.com,
        mchehab+samsung@kernel.org, will@kernel.org,
        michael.chan@broadcom.com, Rob Herring <robh@kernel.org>,
        paulmck@kernel.org, bhe@redhat.com, corbet@lwn.net,
        mchehab+huawei@kernel.org, ath10k <ath10k@lists.infradead.org>,
        derosier@gmail.com, Takashi Iwai <tiwai@suse.de>, mingo@redhat.com,
        Dmitry Vyukov <dvyukov@google.com>,
        Sami Tolvanen <samitolvanen@google.com>, yzaikin@google.com,
        dyoung@redhat.com, pmladek@suse.com, elver@google.com,
        sburla@marvell.com, aelior@marvell.com,
        Kees Cook <keescook@chromium.org>,
        Arnd Bergmann <arnd@arndb.de>, sfr@canb.auug.org.au,
        gpiccoli@canonical.com, Steven Rostedt <rostedt@goodmis.org>,
        fmanlunas@marvell.com, cai@lca.pw, tglx@linutronix.de,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Kalle Valo <kvalo@codeaurora.org>,
        "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>,
        rdunlap@infradead.org, schlad@suse.de,
        Doug Anderson <dianders@chromium.org>, vkoul@kernel.org,
        mhiramat@kernel.org, Andrew Morton <akpm@linux-foundation.org>,
        dchickles@marvell.com, bauerman@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 26, 2020 at 7:58 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> This makes use of the new taint_firmware_crashed() to help
> annotate when firmware for device drivers crash. When firmware
> crashes devices can sometimes become unresponsive, and recovery
> sometimes requires a driver unload / reload and in the worst cases
> a reboot.

Just for the record, the underlying problem you seem to be complaining
about does not appear to be a firmware crash at all. It does happen to
result in a firmware crash report much later on (because when the PCIe
endpoint is this hosed, sooner or later the driver thinks the firmware
is dead), but it's not likely the root cause. More below.

> Using a taint flag allows us to annotate when this happens clearly.
>
> I have run into this situation with this driver with the latest
> firmware as of today, May 21, 2020 using v5.6.0, leaving me at
> a state at which my only option is to reboot. Driver removal and
> addition does not fix the situation. This is reported on kernel.org
> bugzilla korg#207851 [0].

I took a look, and replied there:
https://bugzilla.kernel.org/show_bug.cgi?id=207851#c2

Per the above, it seems more likely you have a PCI or power management
problem, not an ath10k or ath10k-firmware problem.

> But this isn't the first firmware crash reported,
> others have been filed before and none of these bugs have yet been
> addressed [1] [2] [3].  Including my own I see these firmware crash
> reports:

Yes, firmware does crash. Sometimes repeatedly. It also happens to be
closed source, so it's nearly impossible for the average Linux dev to
debug. But FWIW, those 3 all appear to be recoverable -- and then they
crash again a few minutes later. So just as claimed on prior
iterations of this patchset, ath10k is doing fine at recovery [*] --
it's "only" the firmware that's a problem. (And, if a WiFi firmware
doesn't like something in the RF environment...it's totally
understandable that the crash will happen more than once. Of course
that sucks, but it's not unexpected.) Crucially, rebooting won't
really do anything to help these people, AIUI.

Maybe what you really want is to taint the kernel every time a
non-free firmware is loaded ;)

I'd also note that those 3 reports are 3 years old. There have been
many ath10k-firmware updates since then, so it's not necessarily fair
to dig those back up. Also, bugzilla.kernel.org is totally ignored by
many linux-wireless@ folks. But I digress...

All in all, I have no interest in this proposal, for many of the
reasons already mentioned on previous iterations. It's way too coarse
and won't be useful in understanding what's going on in a system, IMO,
at least for ath10k. But it's also easy enough to ignore, so if it
makes somebody happy to claim a taint, then so be it.

Regards,
Brian

[*] Although, at least one of those doesn't appear to be as "clean" of
a recovery attempt as typical. Maybe there are some lurking driver
bugs in there too.


>   * korg#207851 [0]
>   * korg#197013 [1]
>   * korg#201237 [2]
>   * korg#195987 [3]
>
> [0] https://bugzilla.kernel.org/show_bug.cgi?id=207851
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=197013
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=201237
> [3] https://bugzilla.kernel.org/show_bug.cgi?id=195987
