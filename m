Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0588452987B
	for <lists+linux-doc@lfdr.de>; Tue, 17 May 2022 06:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbiEQEFH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 17 May 2022 00:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbiEQEFG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 May 2022 00:05:06 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8531B46653
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 21:05:05 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id y12so9738724ior.7
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 21:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=VZ3+jRYysVSzPrF2cPXM7JV7GD7Bh36eFjL55nP7+ZE=;
        b=jfYUf9X7j8PPzVMreTTizRP5tXseUnYLCcd5kxVL0FKpUToRC2iVnfu2fHORs3ugKw
         HDBoEkBE5g7cF/RpU3Y0CDEygPiuq03s13RNnwXPQZPCShpvDjTOk8mPwmSWrCwAfyWx
         +YWwo5HwgzgGvkWzi1BOqMMpdQeUdylK/NXmUp88AT13GXnRN0el/p9QQxNFxZZxgBr6
         IVQIsnxZfeDBDmQJN564ywJz5rR3bn1spimthiVlPjahIYNWqBXConh86GZdNgBAftYg
         0RMcWiGXcXbIbutC/WRxzL7rmyKo7dIXF4paMMVGQOBhzyJhW7eOwiDhIqkjRByRF5Jt
         qKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=VZ3+jRYysVSzPrF2cPXM7JV7GD7Bh36eFjL55nP7+ZE=;
        b=570swi+xxB3ItEeBVo82C5jyHI0U3/DdQwiQ/4IdBVWF8JyPTY+00FdwAz0iDsK+JF
         jakYRaOZ3qq0tIVFp5BOpP1rZR7mS2KoQd0FTbfA1HuCyp7rqUdFuOOphubzV/SibVFD
         smz8G5oXpxjx2k5vHG1NUp0kzKjL5M0ZpY/UQNY7tSSYBuCxXaI8G55D17ur7RGnZ4fg
         NwqU5IMBRJQF1v7imPnok+8Q1SN/gwr6MriPaAu1doZVR24ZZuHafGUKZLfR+F7LwvZ4
         TAGKJK8nnLd+mbZCn8sqPWaqkxB88tjPq64sr4cf+vXYUsZM+PlZ69CSr+cN2EpMBXZU
         IEgA==
X-Gm-Message-State: AOAM530/x6rqznUEyTnHyp8DACWirLuH33cnTcFqYMKuOZVl7wkvLIVN
        Fkl3QAjQxK2psrqzgjsU2BRhwm3zq6u9l8B0fkg=
X-Google-Smtp-Source: ABdhPJwhMoZbui2YRGxsHCtABVIPuvcuB8yG+XbdxZ5aOyfXRmeLG8K/2e9xD3tV9tx1JXCjYOGACC7AKPLzk/KWA7E=
X-Received: by 2002:a05:6638:401e:b0:32e:199d:fc38 with SMTP id
 i30-20020a056638401e00b0032e199dfc38mr6539845jai.285.1652760304906; Mon, 16
 May 2022 21:05:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6602:2e8d:0:0:0:0 with HTTP; Mon, 16 May 2022 21:05:04
 -0700 (PDT)
Reply-To: mr.alabbashadi@gmail.com
From:   "Mr, Abbas Hadi," <rbiremittanceofindia@gmail.com>
Date:   Mon, 16 May 2022 21:05:04 -0700
Message-ID: <CANZXHo3MM+hBayi309o6nFO0tGXhb1Ow2KsQeF64vwPxo+-5Kg@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.2 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        HK_NAME_FM_MR_MRS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d2b listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7146]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [rbiremittanceofindia[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  1.5 HK_NAME_FM_MR_MRS No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

-- 
Good Day,

I am Mr. Abbas Hadi, the manager with BOA i contact you for a
deal relating to the funds which are in my position I shall furnish
you with more detail once your response.

Regards,
Mr. Abbas Hadi
