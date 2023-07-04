Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B73F9746D54
	for <lists+linux-doc@lfdr.de>; Tue,  4 Jul 2023 11:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjGDJ2G (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Jul 2023 05:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbjGDJ2D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Jul 2023 05:28:03 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0BA1AA
        for <linux-doc@vger.kernel.org>; Tue,  4 Jul 2023 02:28:00 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-bc379e4c1cbso6282514276.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Jul 2023 02:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688462880; x=1691054880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3TXes7w/Rmbj1DkXFlIvKaLc8Xq0FgJi7YMpllWJrA=;
        b=OoCw2qkjIS9uiDScfmNBkgBtmk4wM2nR69ViCcOw5vgDxOdTw0w90Ian78v4vjjtl0
         jOEeYH5dAB9l2vu6zowl1gNS4Knq4xtgos/5Krc4brqkt87G6myHuET4b5h9T4eRTzAH
         jtjIZTpHCpo1bz/be4ypmzT8DzCk4IrLebNiL7On5eSxPZEiLK9zBhExqgVQRAikyZji
         wGZzLQKaAdUQ3HS8xgMYwa6pZnr3n4D+awAFX88m9wK7eYgFZGHia9ZLhD8kyCBUxQv+
         sIJsAV8/whbNvJkxelVWjyf9mWZbmCgDDFMaHHF36MAqJDWkM46Xh0+bZPrBIdRrc6bx
         PIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688462880; x=1691054880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3TXes7w/Rmbj1DkXFlIvKaLc8Xq0FgJi7YMpllWJrA=;
        b=X7R5VMDs8+s5w/BU6L9Lpmgp/0nKRuE5G2kmkGH8jFlGXby2mUbAEw118MtF8vpI+d
         rVldRvI0PXWGuJPWCRJtHRp3UJI5244P+zyx94bHbKnvmzxYp9/1Gsg4cWWmtPTSnvXd
         TG7b8Kp85qcJdMOiuiBGVCEm3f9x36+GADWlauZJ4QC6CfmyEmoWd1d+9YBjdXLi4hVp
         qgNVIn3g0kF8KMkjyUKk8Z07Cex8+4x7uNLyT22R/YmwovSNo0yabAM/piKncV22I12w
         sY02wpwPQpZFyQpar/o9oYyfg1WOEFIjnhQsGPW1t83JdJbL0BT7RzUFvMJVam0IxDwU
         w2OQ==
X-Gm-Message-State: ABy/qLZnO8YinqcTP2cii0lIs/lmbpJaYQoWQJLL60yMjpEYwjFuCZga
        4cwRBnLiW+wp4JX1PBrHyhEY0vJchYz67oD+uSEMgA==
X-Google-Smtp-Source: APBJJlGjlh3CvPVpKROT51T36lYrYgCT70VTb+HBZrybLXHHEs7NrC37lmVz+67sLTPrYH9vI8gYMaFOi6LN15jfFD0=
X-Received: by 2002:a25:1d7:0:b0:c4d:96a2:5d96 with SMTP id
 206-20020a2501d7000000b00c4d96a25d96mr7651767ybb.34.1688462880018; Tue, 04
 Jul 2023 02:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <1687955688-20809-1-git-send-email-quic_mojha@quicinc.com>
 <2023062814-chance-flounder-f002@gregkh> <CAL_JsqLO9yey2-4FcWsaGxijiS6hGL0SH9VoMuiyei-u9=Cv=w@mail.gmail.com>
In-Reply-To: <CAL_JsqLO9yey2-4FcWsaGxijiS6hGL0SH9VoMuiyei-u9=Cv=w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Jul 2023 11:27:48 +0200
Message-ID: <CACRpkda3CJ7G4-wDPkWmzg6nyCoEfG+u2cQH6KXWNjbftd90ow@mail.gmail.com>
Subject: Re: [PATCH v4 00/21] Add Qualcomm Minidump kernel driver related support
To:     Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mukesh Ojha <quic_mojha@quicinc.com>, corbet@lwn.net,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org,
        andy.shevchenko@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 29, 2023 at 1:12=E2=80=AFAM Rob Herring <robh+dt@kernel.org> wr=
ote:

> My bigger issue with this whole series is what would this all look
> like if every SoC vendor upstreamed their own custom dumping
> mechanism. That would be a mess. (I have similar opinions on the
> $soc-vendor hypervisors.)

I agree with Rob's stance.

I think it would be useful to get input from the hwtracing developers
(Alexander and Mathieu) who faced this "necessarily different" issue
with all the hwtrace mechanisms and found a way out of it. I suspect
they can have an idea of how this should be abstracted.

Yours,
Linus Walleij
