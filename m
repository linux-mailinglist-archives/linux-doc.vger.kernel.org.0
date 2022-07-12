Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 526E95712CD
	for <lists+linux-doc@lfdr.de>; Tue, 12 Jul 2022 09:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbiGLHKi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 Jul 2022 03:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiGLHKi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Jul 2022 03:10:38 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2A12AE2D
        for <linux-doc@vger.kernel.org>; Tue, 12 Jul 2022 00:10:35 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id t127so6993103vsb.8
        for <linux-doc@vger.kernel.org>; Tue, 12 Jul 2022 00:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=VaLdCxxT6H+yQ21ljsJJCI0JVFTWEh1IT2eBGtm6sxQ=;
        b=AYbH/BwwR/3nG5HJ416AGTRe5B1p9pKYSMLF43KI7zJrYd0V1KA/nd5aL4DIJ4NDHX
         T6Pfr4UMzEbzrO/vZVaHr/dHPVzg9EnIIrKPwgJnLzrNADT9tx0JyPgjLC+Q49D5g35X
         LG7xVZ6lD93a9M1xrmbJCrNOqBUv88bzsjkIp2ZYp2mjeB8G9DxSserW6FzcfpXobwfa
         GCv+8uSilJ7xpnUYArhN+MCkp5DcSIXYcpQaOSD0ciGLLLc02wXUJT3gEvdEZlMUenhC
         FOZzyY2gGUylUVyxKcVudwHKSMWt6Zp1dh9+74iOQFWAbOQC+jwIewY6PwgrSZcHjmb7
         zRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=VaLdCxxT6H+yQ21ljsJJCI0JVFTWEh1IT2eBGtm6sxQ=;
        b=t27/80z9AQd+giimKfSutvA0pob2BQGDPKfHYgx+fjHeHoukx0mt/MkkhiNW5jonFi
         4p4CAstUzZiZ18JAiNnQqH/jJfmoqeOAHrINyOIcleMuCqZqAPLV2GauKkb6fnWTt8C3
         qJwMmPxXzreznvoQEOYENmqEjhs3IlbFSbimNk9QECSi/F7hkj4Pjtc35M1r6OMv5R2c
         pwnf3e2rpZf2XREhge0+zkRHXvcX6e4yU6JfrdhLQr3Ora6m0cY4x6aKvvnvf8t2Q5gp
         75Jv1R1dcAAeaOuc2X2UBtDJWkSLKXY/9s1shTYm+FPPxxNLXcpX+Ewr7uA9GCgNT2ZS
         Vs2A==
X-Gm-Message-State: AJIora+4kR09SJOQja4ij27rEGwfnt/9NcSx40Y7oOhcKbHBDV/FX6E6
        pCC6U36vuRVr7TAWWwzNoUo4B3Wj0TPkDAVF9ck=
X-Google-Smtp-Source: AGRyM1uyqUPWVt14j7dYrXfyaORAMsp3Hlvjb5JcHaVQ3ByVlPyBjvKYn1pbNYlxVIuQwFZc4r7qrbjOmsJB780qqcg=
X-Received: by 2002:a05:6102:b16:b0:357:5533:ded4 with SMTP id
 b22-20020a0561020b1600b003575533ded4mr3789788vst.36.1657609833809; Tue, 12
 Jul 2022 00:10:33 -0700 (PDT)
MIME-Version: 1.0
Sender: ahaijout@gmail.com
Received: by 2002:a05:612c:210a:b0:2c9:f309:ea94 with HTTP; Tue, 12 Jul 2022
 00:10:33 -0700 (PDT)
From:   "Mrs. Aisha Gaddafi" <aishagaddaf95@gmail.com>
Date:   Tue, 12 Jul 2022 00:10:33 -0700
X-Google-Sender-Auth: z835C80p2D4HsBLOpCKxpoRzhqM
Message-ID: <CAOCce-wkkp4MEzTqqWnYKNZNeYSb2pdFu_MZg7tSnhPpvQgcPg@mail.gmail.com>
Subject: hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.7 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
        LOTS_OF_MONEY,NA_DOLLARS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e30 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7460]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [aishagaddaf95[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  1.5 NA_DOLLARS BODY: Talks about a million North American dollars
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  1.0 FREEMAIL_REPLY From and body contain different freemails
        *  2.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

-- 
Please i need your kind Assistance. I will be very glad if you can assist
me to receive this sum of ( $8.5 Million US dollars.) into your bank
account, my name is  princess mercy i am 21years,i need who will help
me save  this fund,
i lost my father and only brother,
Please contact me through my private email:(princessmercy68@yahoo.com),
 for more information
