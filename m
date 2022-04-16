Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5523D50368A
	for <lists+linux-doc@lfdr.de>; Sat, 16 Apr 2022 14:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbiDPMQm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 16 Apr 2022 08:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbiDPMQj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Apr 2022 08:16:39 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF8659389
        for <linux-doc@vger.kernel.org>; Sat, 16 Apr 2022 05:14:07 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id r64so6263954wmr.4
        for <linux-doc@vger.kernel.org>; Sat, 16 Apr 2022 05:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=SQy9P0rhOwUhvSd+a71wnOE0BH8FM3Td4SEvEsoSu9o=;
        b=FqBJaCmRLB6hDI9JF8uSymsMmYxv0K6jhmjKnjGaz5Q61hmXGbYMaFF8bg1JJrah0A
         3H9x/GA+jO9F15OiBljOnVWPtDvBH3zxPDN9AH0xiVdZoUuL8/H2lSzjIqMfAF/VRIk1
         /hdsgcfZjYz5/wo6fI0wW3cegSiJPFFZvfgk+PKNs3OT8iyhqx/+jCx74fu6zx8fO6qB
         sHmy0r+UnR1RbP9YN5tFoJOfWWEo9s1Oim4BHskG1ttUqSSH1b7ctBFzihmaGKMh4azo
         oFgkEUesZ2O+QlpkkktzEEKVq+Zqxt4TJLi1S5Q7noyJ45eCxCnipuB+Wyl5knPM2rhu
         REBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=SQy9P0rhOwUhvSd+a71wnOE0BH8FM3Td4SEvEsoSu9o=;
        b=r9X0rXM82NF0Put5Ct4Z65WgZamE1PjuKsluKsDDH2Q1RAX+bdd1Mc1DrdVFVvq5Oq
         6VF8pI1IACLtYIxKQBBIYPEaWaNVjPLE7R/A4xl53O9hFmlCBPIHx4iJqJe8RmmjwBTd
         gr28Od+skGM1ZCq/A7ea/1OPDKwHlXi5yLF6RtNZe5pGQoYPWt/0bYzFAxMjZ7zK1JOc
         SgQw6qgK8FoQLgR2xZFx+9QSX9vPMORh0PBQZcecbukP2/mfWB+WGbrFivYtQBhddU0l
         5cCliDWMuFKA/C0raldN2fNd1i7UTSkBT48fC2xYfQZFNL3z0KnDe9qvVMOKgjoVu3H2
         uZZw==
X-Gm-Message-State: AOAM5332FAp5eb/UqMAdYnWJMnASIumEfWokU5GGHXLiAo4x07aE2T+D
        ZCej12/45fYgrnAto1OEnoirxWHEwwrC3EnTNeY=
X-Google-Smtp-Source: ABdhPJxyH2dEJMWTd8v4FKTwoRlAd0a187aYrY5b4hdGRWlfdnM0ousqI+7ujjkVYo7UCVc3EFdsOLHCTORi00W8av4=
X-Received: by 2002:a05:600c:35c5:b0:390:9982:7409 with SMTP id
 r5-20020a05600c35c500b0039099827409mr2948986wmq.127.1650111245808; Sat, 16
 Apr 2022 05:14:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6000:3cc:0:0:0:0 with HTTP; Sat, 16 Apr 2022 05:14:05
 -0700 (PDT)
Reply-To: orlandomoris56@gmail.com
From:   Orlando Moris <ndanakadahonorine@gmail.com>
Date:   Sat, 16 Apr 2022 12:14:05 +0000
Message-ID: <CADx9BJCF1Z2OBk5BFju6cQLXwW6w4x+XtbNQiwYT6CvrUfvq6Q@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2YXYsdit2KjZi9inINiMINmK2LHYrNmJINin2YTYudmE2YUg2KPZhiDZh9iw2Kcg2KfZhNio2LHZ
itivINin2YTYpdmE2YPYqtix2YjZhtmKINin2YTYsNmKINmI2LXZhCDYpdmE2Ykg2LXZhtiv2YjZ
giDYp9mE2KjYsdmK2K8NCtin2YTYrtin2LUg2KjZgyDZhNmK2LMg2K7Yt9ijINmI2YTZg9mG2Ycg
2KrZhSDYqtmI2KzZitmH2Ycg2KXZhNmK2YMg2LnZhNmJINmI2KzZhyDYp9mE2KrYrdiv2YrYryDZ
hNmE2YbYuNixINmB2YrZhy4g2YTYr9mKDQrYudix2LYgKDcuNTAwLjAwMC4wMCDYr9mI2YTYp9ix
KSDYqtix2YPZhyDZhdmI2YPZhNmKINin2YTYsdin2K3ZhCDYp9mE2YXZh9mG2K/YsyDZg9in2LHZ
hNmI2LMg2Iwg2KfZhNiw2Yog2LnYp9i0DQrZiNi52YXZhCDZh9mG2Kcg2YHZiiDZhNmI2YXZiiDY
qtmI2LrZiCDZgtio2YQg2YjZgdin2KrZhyDYp9mE2YXYpNmE2YXYqSDZiNin2YTZhdij2LPYp9mI
2YrYqSDZgdmKINit2KfYr9irINiz2YrYp9ix2Kkg2YXYuQ0K2LnYp9im2YTYqtmHINiMINmI2KPZ
htinINij2KrYtdmEINio2YMg2YPYo9mC2LHYqCDYo9mC2LHYqNin2KEg2YTZgCDZhNmHINit2KrZ
iSDYqtiq2YXZg9mGINmF2YYg2KfYs9iq2YTYp9mFINin2YTYo9mF2YjYp9mEDQrYudmG2K8g2KfZ
hNmF2LfYp9mE2KjYp9iqLiDYudmE2Ykg2KfYs9iq2KzYp9io2KrZgyDYp9mE2LPYsdmK2LnYqSDY
s9ij2KjZhNi62YMg2KjYo9mG2YXYp9i3DQrYqtmG2YHZitiwINmH2LDYpyDYp9mE2LnZh9ivLiDY
jCDYp9iq2LXZhCDYqNmKINi52YTZiSDZh9iw2Ycg2KfZhNix2LPYp9im2YQg2KfZhNil2YTZg9iq
2LHZiNmG2YrYqQ0KKG9ybGFuZG9tb3JpczU2QGdtYWlsLmNvbSkNCg==
