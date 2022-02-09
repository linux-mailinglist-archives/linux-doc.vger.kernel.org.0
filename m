Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE1D4AEDA2
	for <lists+linux-doc@lfdr.de>; Wed,  9 Feb 2022 10:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233429AbiBIJJ2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Feb 2022 04:09:28 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:47256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233525AbiBIJJZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Feb 2022 04:09:25 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE97EE03B9F8
        for <linux-doc@vger.kernel.org>; Wed,  9 Feb 2022 01:09:19 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id f17so2881172wrx.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Feb 2022 01:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=DUmHVshkvWp2RY/UyFIfNWg44HUvXNupx5/iL+mP6EE=;
        b=cxBl8c4P1cvv7Tv6Dxk+62SeRqlxp783g9ffvZPcvj5SJRfu8Y6LIcGLX1P+PQUir1
         JevDJ2yBQILmIxQKvle+oy2/AgeJcMxr7cQ5OnZlimYcAHwtKeDdZYZHMPb0EHmRwAnQ
         bkY/luTPPSGkTJfJtM0KYEGCCZ0935BbQORU49iVDHsMazLlLZxx4ws6k7VsWiGbcHdO
         2n9Kd73b/O9ADWc9TVL+e/6moIiwEvkDYLij9NO/G/zFrjdEosbXDFuCG0jL7w9PBWGq
         PJTwvsglhwoyrTPIly6PKGuD8YvmdkxDU6mCB7U16I8Zo5FS7shj0XUiIBw1SA48GY9H
         2tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=DUmHVshkvWp2RY/UyFIfNWg44HUvXNupx5/iL+mP6EE=;
        b=ZMDmngFH7WqrwkjLvdxb3d5bbT+phR0VPr8dBcxV3gIkRHN/CHgtIQ9nHfto641mfB
         QjpckfjxxXMzvTkjuWvY7AdsRifeBK/BCrlp6HGExxoELuZg+Xw9QuhAPLHlSIxGk5d4
         DE7397nTWZSu5oi37E968NX0JGxGbaiGVk00COpLmexNRf91ZcwrMNOLbu14LsqGrM1Y
         LAXRAsNi2RhcJl6c189eVUr85QmOmtErbYrqZzWJ0c1ItVkos/l2wWQjBT5c8PYCsGRL
         aOY4M3PlsClGA3jSsEsEEy5hECELSmOo713IWcQkDLEZxiLoD6JVAKioEqkHVEu/HwZa
         iu8g==
X-Gm-Message-State: AOAM530184k+7VE4iWkNbVHEgKYUHt+cw1J4qKeyCuta0o/qTAsOE2z9
        L9Te08Si9OrrRm+l6Nc8x/5cdiNu3lYEkIDcFGA=
X-Google-Smtp-Source: ABdhPJz1eS/722hgBMJEKEmRQ3BeLd0T99TaFj3I8lpWO5ISQ3AZczjYElqtFC5T7e46PUbwMK5c/brZBkn+v75JiXM=
X-Received: by 2002:a05:6000:1e15:: with SMTP id bj21mr1250622wrb.222.1644397749318;
 Wed, 09 Feb 2022 01:09:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:600c:3acd:0:0:0:0 with HTTP; Wed, 9 Feb 2022 01:09:08
 -0800 (PST)
Reply-To: howardnewell923@gmail.com
From:   Howard Newell <muhammed.gaba113@gmail.com>
Date:   Wed, 9 Feb 2022 09:09:08 +0000
Message-ID: <CAMz__ZafWt0s3=ymLud7o1xDCgoEomNd-D18xr=hh=hGJ1maCA@mail.gmail.com>
Subject: re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,HK_SCAM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:432 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4967]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [muhammed.gaba113[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [muhammed.gaba113[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [howardnewell923[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.1 HK_SCAM No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

-- 
Hi
I want to know from you if you received my message concerning your
compensation file with United Nations Compensation Program. Please
confirm

Kind regards!
Howard Newell
London WC2N 4JS, UK
