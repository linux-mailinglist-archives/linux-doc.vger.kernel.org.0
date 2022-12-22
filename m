Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90891653BDF
	for <lists+linux-doc@lfdr.de>; Thu, 22 Dec 2022 06:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbiLVFvG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 22 Dec 2022 00:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbiLVFvB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Dec 2022 00:51:01 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C8182A2
        for <linux-doc@vger.kernel.org>; Wed, 21 Dec 2022 21:51:00 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id x11so1258482lfn.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Dec 2022 21:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZx+l47CzuZ3xlEKU80E40CSh3ZgdwDHh7dVN/b5kRo=;
        b=MTbMkDCK0Mmi2hIFlgHoLrDkruKvtjfostC91CKcGaUc8EbPJwzsIQIb5wW9DU7A54
         pWKBjJstaimH6/HI7ewr93Fkcsw2ZOfhvFIhtwS8X1j5wmgNZfQe87XXBvFqifB6btFJ
         5lQ/JBeOXtj1pAdmM0ePuB9lzbdKuffHdPx7TPAwpoC8r+9dgkweXfztBZOu5rP6Meg7
         GuhUoOshLrPi4yJGMsjFamCI7+K6Q0Yu46MBagw00rV2eJeS0B+vArlSTyPaiNkk30ll
         18plwfk3jtxYSuIbdZrz1GEf2OeEWC9H5g0AZwxlAx+GZ/ORz1CY3TY32mx8SrEkJ9y3
         LccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZx+l47CzuZ3xlEKU80E40CSh3ZgdwDHh7dVN/b5kRo=;
        b=dlRfYi3wt9qXga5kn/O8Iq3861/+vHOUogjEnbuqCEBESzcgqpdLzo8CUYAqsfd3RF
         tumF3zLaZCt5dA4aUqUaeAC0hQcP8bIUY58lLzHY5lFSRoQl5/1qUssnVo/0NW4O/mKX
         ts+RWjivN6axUZu4HDUhoO/GZ33BeIyHrG6u/TUm2XmsibT2b9JcI4iZ8g0UmCEb8bxk
         yO81G+g9DNOYiDqQrZHK0ROD/t2NP0bNwn9iTgsCYgWbSvPRSLUaJ3dZXxVp53tLhCck
         w19ayUHNpTpfjfU5kh8YHzAiEb0m/xjE7gnre901Ds+gmimCt47YmWFPgEVCffcTFYUR
         EbRQ==
X-Gm-Message-State: AFqh2kok4t+6Or2Xs0RyQiWMz+mOUqpjqPCLGnOpnLhEcGfUPQ8J1r71
        uQ2XYQtXSXx16AGcqgBPVlNU0XK609xalHx1V7U=
X-Google-Smtp-Source: AMrXdXt1PvdXWo2PV4CvyDrECbjcqy1Houems4sj4Rrb4yJcbsZfGAbCvH/TRdKKGA/2b4G5D8oMmO1nslyIQb62r84=
X-Received: by 2002:a05:6512:1582:b0:4b5:b111:babd with SMTP id
 bp2-20020a056512158200b004b5b111babdmr487888lfb.516.1671688257858; Wed, 21
 Dec 2022 21:50:57 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6504:1594:b0:201:4770:d326 with HTTP; Wed, 21 Dec 2022
 21:50:57 -0800 (PST)
Reply-To: seyba_daniel@yahoo.com
From:   Seyba Daniel <yameogojacqueline70@gmail.com>
Date:   Thu, 22 Dec 2022 06:50:57 +0100
Message-ID: <CANwBPNG1qQBkDPcc-PWbisx+u15jDUyj+t=WE6joy8X56iSeyQ@mail.gmail.com>
Subject: Seyba Daniel
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I urgently seek your service to represent me in investing in
your region / country and you will be rewarded for your service without
affecting your present job with very little time invested in it
My dearest regards

Seyba Daniel
