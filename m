Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3307A586EB8
	for <lists+linux-doc@lfdr.de>; Mon,  1 Aug 2022 18:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233180AbiHAQig (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 1 Aug 2022 12:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232909AbiHAQi3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Aug 2022 12:38:29 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E113B6
        for <linux-doc@vger.kernel.org>; Mon,  1 Aug 2022 09:38:25 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id v7so5279254ljh.5
        for <linux-doc@vger.kernel.org>; Mon, 01 Aug 2022 09:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=q9Slei3vdZHf3BWZhWjxjnYHcSiTDd6lLLw5COAJJH4=;
        b=UpgXbpfO0w/dJq4k0vuSl6sUdwOXFPzo72SUDWGRn4yCt6QTXqfTKNyPrrLSbJ8yzY
         7SvNYiuTJto9ZKlzvm5aoeOkIg+OLPLmA7JtBAqJNAo3ZwaSjplZ/wAzKUOl+dDU/dDK
         hYOtZRuneAEXUY6rJcSHGhuzX712qrYQrFpKbC7RuKjQlSCmwGRK5sGDya2wx4XaUf+k
         IlVzDxfqSKvxeU6NrU/S6TRC1i25W9OIICD2HGjN/h5O8s28u9oHxFPUHjB6EjmlL3W1
         LOFyxwAfOSDkgEr1jZ/ZsXk1P0uSiTY0XrYgKEkG3SBkCMdWMSlGcFhfScKKMVApzTc3
         wpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=q9Slei3vdZHf3BWZhWjxjnYHcSiTDd6lLLw5COAJJH4=;
        b=f7eNyU3Q/2ywJESfqO4Npz13AdI3LJh30jw5XIVngQG0567tJHp7bX25a35HLord7q
         9E2XIa9/P1982aHI4kQXB0HEMKBmLtCCKkgjYDcE48SO8cxCRIuqgYx/hOFQmAfW5ueT
         5GV1C+YLhgUp47nfsnS3zgzbLQqRo9dtCbSfJV/BVQZugU02qJMKNXA/YGC2zaBDt4Qn
         ftAuqPFriDXoxz1FjzFbjcbSupfhYGvqti0TkFFJiosKcdK7hqRPvVzkLfQAf0wtwtpr
         ZUDZHxlbf24iV5UPaq3apbDKRFhnz1dOuTqIdESyZ4YkegiX+5gQN4Z7+3QejezV9A5J
         odfg==
X-Gm-Message-State: AJIora8g+JS4Z6XNBv8UyIYov8wXSbipOyE/qRSjrkcix1SLvJOo2FxD
        bT5j3nCPJwXI9RT2q9eqRVGHmW0dNgbqEX3cWSo=
X-Google-Smtp-Source: AGRyM1uhfxKvD7WlSvnzrbGlwEuRLAbxrb3yEpNH1m/q+RCiRS7C4p1DxknGjCMobov/SaZ/nFOLCAAIjg3qtSJ3b84=
X-Received: by 2002:a2e:be90:0:b0:25e:1496:a0b8 with SMTP id
 a16-20020a2ebe90000000b0025e1496a0b8mr5567966ljr.194.1659371903861; Mon, 01
 Aug 2022 09:38:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa6:cb52:0:b0:1fa:aaed:e6d9 with HTTP; Mon, 1 Aug 2022
 09:38:23 -0700 (PDT)
From:   Bright Gawayn <gben68387@gmail.com>
Date:   Mon, 1 Aug 2022 22:08:23 +0530
Message-ID: <CAG1+V0w-Pt5No3wNn5Sm7K_0Y_mZnH5=drEjS3cseB6w-yBsLg@mail.gmail.com>
Subject: Lucrative business proposal very urgent!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.9 required=5.0 tests=ADVANCE_FEE_3_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:244 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gben68387[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [gben68387[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  3.5 ADVANCE_FEE_3_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  2.5 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello dear My name is Mr Bright Gawayn,  It's my pleasure to contact you today.

We use a certain raw material in our pharmaceutical firm for the
manufacture of animal vaccines and many more.

My intention is to give you the new contact information of the local
manufacturer of this raw material in India and every details regarding
how to supply the material to my company if you're interested, my
company pays in advance for this material.

Due to some reasons, which I will explain in my next email, I cannot
procure this material and supply it to my company myself due to the
fact that I am a staff in the company.

Please get back to me as soon as possible for full detail if you are interested.

Thanks and regards
Bright.
