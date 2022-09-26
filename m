Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B36135EAA12
	for <lists+linux-doc@lfdr.de>; Mon, 26 Sep 2022 17:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235971AbiIZPRI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 26 Sep 2022 11:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235708AbiIZPQi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Sep 2022 11:16:38 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6BBE1004
        for <linux-doc@vger.kernel.org>; Mon, 26 Sep 2022 07:02:27 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id j7so6587580vsr.13
        for <linux-doc@vger.kernel.org>; Mon, 26 Sep 2022 07:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=W2hJLXZEpV+2eqAKMNoZcDhofs3a0fuyhAGVXRo+6bw=;
        b=J/uVON7XeKHt/uIk/3sGrIwVVB1drRcHOUIQzfTwNKusVKZ1zr6k8R71BUcQ1GFO0b
         Tgsw/bSm4xD/cvML/KzYiu/hfCl8+12m7pJ7NFss23fwZZR4f4AJoYPpZoepetP5lprh
         xMlG130zgiMLu7NLeXzdRxIZz8KPxNFrtsXfom8HOGsT8s8wP1ccAT5XTwp+l1fPVSJy
         OLxT2eeg4d8pCctrlMpVN/3ha3vwv5YJBmo02rZHMXCV13IK5uOGWf9M8MQ4BJSPXraT
         jHbLJvOdT1OJEBnYUc8uzA4g2CuoX+/RK10qJSaSN8AZQhvcNcAk6DGH9z3ZCJZRT9xN
         rdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=W2hJLXZEpV+2eqAKMNoZcDhofs3a0fuyhAGVXRo+6bw=;
        b=unJWq8plybIphRHG5fXC/57QpNyud6xjPRR8rpDWQ0CAQutk/1rb6lDxsT7EUwEAnk
         8Qdfv9KW78QwXRcZrAOUJZUkZxQavJcrKJJl6yiGM+cjw1K2X9n7egPCfoVWNXQfBAYA
         eUGvHxbyxnGBU08gm/6xd9MeCZVRYUPpeBGYVGoX8l2xOJOC4NYKmMtySb5ImuvWcWzk
         RlEC7epgYcKB/XC3Sm+Q50bYg2d2vP1mBlSCn2wRl0+Pz28NRYhMZg4rpBqLbvOxsgSr
         x3ESPESQYO5c+LxHmZSr4PKlmJRCNTO8nJIT26kxUUwmni+NXZlTYKq8HtV0AaIdY+sm
         iabQ==
X-Gm-Message-State: ACrzQf08DP2MTdTG1OMDHVa08dfTcgupkn4NRyoy6yS/isvqFdh6cJh1
        4DB+0+Si2G10R6c5Q+dvRQhgBfXAVPHMmYvEKEI=
X-Google-Smtp-Source: AMsMyM6LDOv3tIluzEztat/U56qp8FhupfMkFVh7HZyCZQzMgrdEuBfyN0p8SOJme5sveTwhmTPdTm64LKjryUaNOg0=
X-Received: by 2002:a05:6102:2f6:b0:398:5094:f748 with SMTP id
 j22-20020a05610202f600b003985094f748mr8008218vsj.50.1664200946884; Mon, 26
 Sep 2022 07:02:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:8199:0:b0:2f6:3de5:9c4a with HTTP; Mon, 26 Sep 2022
 07:02:26 -0700 (PDT)
Reply-To: stefanopessia8766@hotmail.com
From:   Stefano Pessina <nasteexogeele@gmail.com>
Date:   Mon, 26 Sep 2022 17:02:26 +0300
Message-ID: <CAGiQzK6yx0+HUyG=J0gnzxE8L8Nbm5j0QdFKcMLMb0JaWzjXDg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--=20
Kwot=C4=99 500 000 $ przekaza=C5=82 Pa=C5=84stwu STEFANO PESSINA. Uprzejmie=
 wr=C3=B3=C4=87 po
wi=C4=99cej informacji przez stefanopessia8766@hotmail.com
