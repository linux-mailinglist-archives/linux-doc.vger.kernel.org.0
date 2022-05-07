Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 468C951E593
	for <lists+linux-doc@lfdr.de>; Sat,  7 May 2022 10:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383693AbiEGIaj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 7 May 2022 04:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383686AbiEGIaj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 7 May 2022 04:30:39 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6A82CC86
        for <linux-doc@vger.kernel.org>; Sat,  7 May 2022 01:26:53 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id k8so2349732qki.8
        for <linux-doc@vger.kernel.org>; Sat, 07 May 2022 01:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=j6k4+uRS4RtRRD9pAYteN/2lL426z4uuqpmrOuos+wU=;
        b=P2zRHQObZSYEGsmrrwivnQf4dreWJtMuKd6rSsP3e7xr1lhgg74Ho3S4ArvDDtPJ/g
         AHgtR8vtupugW6iOdQGcb24Gcb2PvseBIfYUqTh98s3vugGKAoF24drlrtBGBs03PAfP
         mB0nS8k3LGnKq1jOi2afLcWpG3zyrdk1lwnMCpe5EiDsHt838CwkW8Q0a89p03ygP4Tq
         dFu6BpUwOm+++iK1GEQZ98dsz5aAOQKbkM6a7yv1lrFYlGqKT6BSkvyRMh73au0pLiW2
         yd6AeznomQ36yMaKefohUt8Mnrrn5EZkr55AjpYueYGTqDmhyKn6ZTa58lhMzmROzOUZ
         V1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=j6k4+uRS4RtRRD9pAYteN/2lL426z4uuqpmrOuos+wU=;
        b=05ln1qQbOeyOHwJ1uVFunfOPjuzNIRU5BJPtNYEs302n2WKTHrTP4JjL0nLGsByCD/
         wGQLdy3Z9cBuCF0XyEQgzzG+9i3Qj5GEFGpoy4lmNAhxIO50zt7MBj9CbO4L5ewT41me
         7jkDvfbu1HwhJSBh+5/UHR+JDg0pTtKXspR0NEB8H9oeG5g0XFLG9VrbVXIzRCIyKw/y
         HAvNITM0kYgLZZd8ArT7WAYhIvkT+EDli38yJKyg4YqMc+NV2OQMOR6/yCCWHSQZmW1q
         IgVwAYP4H9GQxXr8XjupmxubzicYgN3X2nAhT17inbI7NNr8lTwujZ5zKoSUBbJNh+ZJ
         LOVw==
X-Gm-Message-State: AOAM532EugOKnQAkvMpOeUua+keWqicVY5IW2QVqJtl8y4Gv27VSZTvW
        nWIQja7Jy2g9K4AUjL03C+SNupZBBPRTiVUwQCk=
X-Google-Smtp-Source: ABdhPJyIzmZUE5q6UG7nnESLpIkxqtBTnJ3M4MgQnAKw2zcOMfktjXlOQN5j4SIf8MYQTJIcE0uJISPP7kOlpFYw4Rw=
X-Received: by 2002:a37:4d4:0:b0:69f:cc67:6f89 with SMTP id
 203-20020a3704d4000000b0069fcc676f89mr5122464qke.61.1651912012819; Sat, 07
 May 2022 01:26:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6214:a0c:0:0:0:0 with HTTP; Sat, 7 May 2022 01:26:52
 -0700 (PDT)
Reply-To: mrs.bill.chantalone01@gmail.com
From:   "mrs.chantal roland" <mrschantalmiller4@gmail.com>
Date:   Sat, 7 May 2022 10:26:52 +0200
Message-ID: <CAEdX5eYDO9N9o9YZntr8PwZgUuncsfzxy6ihpQ0yJ0wYtgO6aA@mail.gmail.com>
Subject: hello....
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        HK_NAME_FM_MR_MRS,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:72a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrs.bill.chantalone01[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mrschantalmiller4[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrschantalmiller4[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.4 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  1.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

You have been compensated with the sum of  5 million dollars in this
united nation the payment will be issue into atm visa  card and send
to you from the santander bank we need your address and your
Whatsapp number  + 1 6465853907  this my email.ID
(  mrs.bill.chantal0101@gmail.com )  contact  me

Thanks my

mrs bill chantal
