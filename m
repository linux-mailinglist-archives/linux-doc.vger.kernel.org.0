Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA5EC53A5CA
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jun 2022 15:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353170AbiFANSa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 1 Jun 2022 09:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353183AbiFANS3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Jun 2022 09:18:29 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7BD54A3DD
        for <linux-doc@vger.kernel.org>; Wed,  1 Jun 2022 06:18:27 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id e4so1936602ljb.13
        for <linux-doc@vger.kernel.org>; Wed, 01 Jun 2022 06:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=4IWjHL/5Vo6JeFN3XdXq446L6FUUmY7SjaH1cuJ3kmM=;
        b=JNfWGMCqD4jqApHRcz5KfIrVqEZ0P+yDeYzl2EbpNOsbRdV3dXN/WLuhiNcbc7HAjY
         F/bBrZjfSo3KRLtCJlaI6xTWF+o7swL4bkx2ot6Rb7PHPi93Hc1SNafYayaE2UxNA5MF
         AruvI63X6jYUbslPtX/euhS1RXc3WlVwdqWXCEyEvQLpYci2u1ZZkd5LT2LOY0pVP/zJ
         JICzja3ZsaB3j//6GXi8ipeVYtyDJYxMH0b79BbrA+WxFfzxKqqrjJ/yt4qQ/QyoVVsl
         u9ckDf7uwxETK+49c4TInDkZOvyctHfil0/ShzAfgBzXXRbeb/Buri9NzHKuh6lY2W1t
         WPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=4IWjHL/5Vo6JeFN3XdXq446L6FUUmY7SjaH1cuJ3kmM=;
        b=6p+FTHKAporyACfkfahjP4wLvF35Josk6jpK9BkE5JYv7L0SQp2cYHDLs9SHpzhiRc
         UhrSZo0fQvRnSsKLbuvY0q4B3dnalp+z7zvzV7emagUnw2p51NGY6jmwvkg+/QR2W2XP
         uw54b8VMgcyirNX4s+SGOhjR12c1exC8BI3dsynkBCtbkpJFz7S/As4w5J2oLm3cPHy0
         fW+D5sr2FAb17W1VR2xUVIdPaR2I8PaOUFukB/EiLVa+KnUXB0yg7K+XSawTDr2av/cl
         ccsQ4pQVulK6aMyqymXTl8kN87n7jrdLOm/9lKx8IY1GIqDhjaahupZiK1nGp3ALp2kB
         Pjpw==
X-Gm-Message-State: AOAM530MFVDGl00CAPrbv55xeqrIlyleuiblDBvblqX7nwJjjCpLCfv4
        vJN/wEWUsfukz6Kcu/dpMLsm4pkyG1guxTynwIw=
X-Google-Smtp-Source: ABdhPJz7bpz4hE43t2izmj54AAe5IXeqm/SD2e4j41bWWX3jVvJ3UUpBfNBGpHf5rrbyjukCHA2+kfD5Y0qcHM8Nl9g=
X-Received: by 2002:a2e:980f:0:b0:255:5d00:2386 with SMTP id
 a15-20020a2e980f000000b002555d002386mr4879539ljj.468.1654089506197; Wed, 01
 Jun 2022 06:18:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:6bef:0:0:0:0:0 with HTTP; Wed, 1 Jun 2022 06:18:25 -0700 (PDT)
Reply-To: jub47823@gmail.com
From:   Julian Bikarm <klotsijeann2019@gmail.com>
Date:   Wed, 1 Jun 2022 06:18:25 -0700
Message-ID: <CAFjstLyMF158FQiE-DAakHooDi+e5VONFzUYDLY-FEvqN0oMYw@mail.gmail.com>
Subject: Please can i have your attention
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Dear ,

  Please can I have your attention and possibly help me for humanity's
sake please. I am writing this message with a heavy heart filled with
sorrows and sadness.
Please if you can respond, i have an issue that i will be most
grateful if you could help me deal with it please.

Julian
