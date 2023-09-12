Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2279379C9CC
	for <lists+linux-doc@lfdr.de>; Tue, 12 Sep 2023 10:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232571AbjILIYN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 Sep 2023 04:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232637AbjILIYJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Sep 2023 04:24:09 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBC210CA
        for <linux-doc@vger.kernel.org>; Tue, 12 Sep 2023 01:24:05 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d7eed15ad69so5020527276.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Sep 2023 01:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694507044; x=1695111844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTDlvFYbsx79XjnXV/v1eS2oK868sA5+g3OCAFf6938=;
        b=FBhB4z6HcF6EizL+/lwxRnvBPsnUBCZNCJdmUZqMhF2t8tNtnTGFF+JCUzlHUG9Exo
         EggToZqBJppvlFyjEBigx34yWBARuEWqMz4yka52D9EM9UM1QrISxBRPtWDZ29WUYe9q
         d2krkdkVjxK27mY+IVp4h5OuRfx8EOC24+q01oOZ9zVKap5Gn+pmjs1tgIAXdxIMWl2s
         hlUypNi+ZXFlGreD6ZHACbQH+jnwcETJOh0eM2WKZkO86QxIoS8ndf9uFvCult8qmb5z
         WmJNShM2s+Z914AefMurd58mLEBMQpCYyRNyQgzLfOJXMC6Jyztx8eDTmu+++2h4nbhP
         glxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694507044; x=1695111844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTDlvFYbsx79XjnXV/v1eS2oK868sA5+g3OCAFf6938=;
        b=Q4+gYov8qrHWzYDMmJZ8CQPIx0qjIJb4apneWCYMP5OoeK7+0CiZBbl9xos3jbsdHX
         uJcC2/UjdED0zu7QXDISlL0mL47oEBnbiYK1iA4U656b9TnXQ6M7U7nXB2qmyPFzt2qb
         6EExiLXamGQgYnbpycVgHthBZzcuDDOSqi3cRv8bcMEdnSliZvn7nv5+jntxjNvEqAUI
         15LHOYGR2NjOEycCrBZ4w7O6B/IencMeKLqfd6Q3eWysXwKCxoJv98uu7bZWkEuR1WbT
         nzbmjY2wFDIPbnsyBsZnJLRhiITuY7anD1Qutyv/BDWz8eE38++ZB4RYtBVxgG+OMz6C
         T5JA==
X-Gm-Message-State: AOJu0YwOSPYsyExeJWhisHOu2AGImo7NfKu+fqjOWqR2BeGbq2l8LypV
        h/5fCfEx8kLwKOfHVybv9/9+qT09H+3cZBMEHvDRdQ==
X-Google-Smtp-Source: AGHT+IFd+7FzVpzIXwF6eF0XM98eCqwGR8vQyKfh9Y2GKm2qYYnTSN7eR9A+5PvS2Qu/0xw3IHJQEnNJumvhS4CTpxY=
X-Received: by 2002:a25:d4c6:0:b0:d7b:95ff:14f with SMTP id
 m189-20020a25d4c6000000b00d7b95ff014fmr13092370ybf.61.1694507044304; Tue, 12
 Sep 2023 01:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com> <1694429639-21484-15-git-send-email-quic_mojha@quicinc.com>
In-Reply-To: <1694429639-21484-15-git-send-email-quic_mojha@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 12 Sep 2023 10:23:53 +0200
Message-ID: <CACRpkdYBH09emydQPaRUgEJuHdV0tk3=xeMXxD9UVP0GH2XZEw@mail.gmail.com>
Subject: Re: [REBASE PATCH v5 14/17] pinctrl: qcom: Use qcom_scm_io_update_field()
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     corbet@lwn.net, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        mathieu.poirier@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, andy.shevchenko@gmail.com, vigneshr@ti.com,
        nm@ti.com, matthias.bgg@gmail.com, kgene@kernel.org,
        alim.akhtar@samsung.com, bmasney@redhat.com,
        quic_tsoni@quicinc.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 11, 2023 at 12:56=E2=80=AFPM Mukesh Ojha <quic_mojha@quicinc.co=
m> wrote:

> Use qcom_scm_io_update_field() exported function in
> pinctrl-msm driver.
>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>

As long as the qcom maintainers agree on the rest of the patches:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
