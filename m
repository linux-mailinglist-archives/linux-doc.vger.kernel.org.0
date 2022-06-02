Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA4E53B882
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jun 2022 14:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbiFBMBJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 2 Jun 2022 08:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233369AbiFBMBE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Jun 2022 08:01:04 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 677106CF5E
        for <linux-doc@vger.kernel.org>; Thu,  2 Jun 2022 05:01:01 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id d129so4565041pgc.9
        for <linux-doc@vger.kernel.org>; Thu, 02 Jun 2022 05:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=4IWjHL/5Vo6JeFN3XdXq446L6FUUmY7SjaH1cuJ3kmM=;
        b=Z0GNLGOQlQiVCTn0GSzIMExA6LQSF964HsiNo0/GkCcgyoVikpFVgb3SgNI6IocpoK
         18QirK0BMjGIPFByKBkJpk9YYl3o5GKcvvu37zWBDiIrEbPiUigOnBBRfhFAFZlogr0Z
         q24uOPLTo4hgWQS580Sc+lKFapzmj7HG0W6Zn/PMGzWM2+H+7A9QwUG9V8O4K3LC8NCM
         Du/oS4Ix9agXfU5hMcQcnfZaWNK2rfBZvkCmQalC3Gcqj59VVg9DJbgGdf/sEWDy/Ykh
         Tklnz9RB2rIMl/hMxN9Y0c1ulH3rEy+lCMyfzHOYMmKcrBUjFlmI/wzDGFp23mVxofLt
         Ic6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=4IWjHL/5Vo6JeFN3XdXq446L6FUUmY7SjaH1cuJ3kmM=;
        b=iyJpU9G/ZqyY9LQzwxWDJ1JTd/csg05CAeLp8P2/X7ugrLZpB8De0wli2iNwQdvgrv
         o933UXKgsnkyDWZ7wY6bYzTeXPcTgxHBKkQaSMVOWs0tCi6ACcSePq74WZq6GWTWoPXg
         a8bBIR1De1gi/770Z+/0Cb4bG4KoP5x3pOnatrCxjDXNEohWW6VhtrlgDJtTTRHvu6ZV
         Vjyaw1zjnQxkhO64HD9bZXu67KmyzA4MUsBLujlDWTCAUbDc5sPpfn7EVRgfrC8vXU9g
         4NNC6BeIQFE9NK7rz93JVlNnxwSaRdgmfz6V6oUpBVIVNv7iHooMxIifj1imYS1qdhtk
         ntMA==
X-Gm-Message-State: AOAM533Eu45FvUcPH3F6Bly3AOh8RExG36P+/6MfFYizH4GP9tcMRaDg
        8QD2NwWzUjcB4tfhQri6GHOIZIf5bNhNr226P5s=
X-Google-Smtp-Source: ABdhPJwdSQDf750AkGLNra4aP67+c78Cn7v5xBdGA8WYFq1b7NwHKp+APY5aD6SUMxYKyqPhE11PGhanDJn5K5gjdQI=
X-Received: by 2002:a05:6a00:a01:b0:51b:51d8:3c2a with SMTP id
 p1-20020a056a000a0100b0051b51d83c2amr4886763pfh.68.1654171260883; Thu, 02 Jun
 2022 05:01:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:be1d:b0:82:5e75:b37c with HTTP; Thu, 2 Jun 2022
 05:00:59 -0700 (PDT)
Reply-To: jub47823@gmail.com
From:   Julian Bikram <kodjoadannou123@gmail.com>
Date:   Thu, 2 Jun 2022 05:00:59 -0700
Message-ID: <CAOtKoZ8bsyr6zRMfTHWmV5RcLTrD82WEbCWgfdNaiQDTV4fhdA@mail.gmail.com>
Subject: Please can i have your attention
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
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
