Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6A742042B
	for <lists+linux-doc@lfdr.de>; Sun,  3 Oct 2021 23:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbhJCWBQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 3 Oct 2021 18:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231785AbhJCWBP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Oct 2021 18:01:15 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA6F0C061781
        for <linux-doc@vger.kernel.org>; Sun,  3 Oct 2021 14:59:20 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x27so62994847lfa.9
        for <linux-doc@vger.kernel.org>; Sun, 03 Oct 2021 14:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bbZ8owU4QzLAqnCanW0nVCBDjaAKFcd+haR1u53mZxo=;
        b=oFaTwE5zeVG0+n6KGHulHMvwJzZ3781+WF2XtvkhlepwAM5J5wUMTTQiSFugBdL70q
         d8XK6BO+dlbewNQwEAKa21QiEpFWi6coUT/5fOXHCo3VoD26bp11NUzTNovETNjQlNvI
         YTK2D9Tu5qj6oR1RROuHR4I3Cu+6YB8eHnvoOWINbvsTWtpAhH9GcPd4u53CyGdcOfuV
         mCnlKZ7Npq98YgLDMJ99Dt7PVAY0o5YXQ7z5V+/NlnAZwMT4kUkavSzX4OgrAEa+KHJy
         /wPm0ZMN8h3JxUZR4bhxm5djIk8uGlQE77AjOmQAAaYqQyOC+SOA7H8AR0mpHtnubzfQ
         jYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bbZ8owU4QzLAqnCanW0nVCBDjaAKFcd+haR1u53mZxo=;
        b=labr9FQzwEmOxRrSWEyC4UwtxcSaP1H3u3uyhv9uwtdYX34Uzr0D7fUH9TEuEb/Jyu
         YbmymtiHPK7NwLZmxCgq4VgpcsF22+pKXPWdkByK+fmyAcxIF0o/iQV5fNpC1ZUfRzMB
         o74r5lLiABBnA1MVak3IBSJTIdPmQoOm/xSZftyxx9oyimuPGa66q9xNw8W+3/xkvtns
         TBQUUVVbGrajLG1/kVAbgin1EfsTZ3EEE8ghDxcjOrUuK1QGEtg2KhdtMuPWucQENwGj
         AvYr4pF81iuhDNOgkz7rDPQND81E9tTyzrlLc35LGHXjxgQAEiUMeooXQWdyHmOz6e5b
         Qd2w==
X-Gm-Message-State: AOAM530Xv7hztl4iv+DsCOBF8UVF5hkiwRh72GY91p29V3vwYUwhTWFT
        xBpF2JAqLFGs32mgUZhkQ+bKCFBTayVeGsGLaHiKqg==
X-Google-Smtp-Source: ABdhPJwq2rCDKkckKnqGQIQgPlkVHUV2j+E4mP2OxxdKrVv9rwlmy+s2Io9q0Bq5Ud9YzKo5KaJXq0leO/5Ce32JG9M=
X-Received: by 2002:a2e:4e11:: with SMTP id c17mr11617702ljb.19.1633298358986;
 Sun, 03 Oct 2021 14:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210930232617.6396-1-dipenp@nvidia.com> <20210930232617.6396-9-dipenp@nvidia.com>
In-Reply-To: <20210930232617.6396-9-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 3 Oct 2021 23:59:08 +0200
Message-ID: <CACRpkdYvevVHLe112ZHDzPTfzs_FWRtkk+1dD+8OT-nB66XuSg@mail.gmail.com>
Subject: Re: [RFC v2 08/11] gpiolib: cdev: Add hardware timestamp clock type
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 1, 2021 at 1:26 AM Dipen Patel <dipenp@nvidia.com> wrote:

> This patch adds new clock type for the GPIO controller which can
> timestamp gpio lines in realtime using hardware means. To expose such
> functionalities to the userspace, code has been added in this patch
> where during line create call, it checks for new clock type and if
> requested, calls hardware timestamp related API from gpiolib.c.
> During line change event, the HTE subsystem pushes timestamp data
> through callbacks.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
> Changes in v2:
> - Added hte_dir and static structure hte_ts_desc.
> - Added callbacks which get invoked by HTE when new data is available.
> - Better use of hte_dir and seq from hte_ts_desc.
> - Modified sw debounce function to accommodate hardware timestamping.

This looks pretty much like I imagined it would, good work!
I am a bit busy now and unable to do an in-depth review
(brain parse the code and make sure all is sane) but it looks
really good, so at least I can say:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
