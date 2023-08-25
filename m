Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD391788938
	for <lists+linux-doc@lfdr.de>; Fri, 25 Aug 2023 15:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244832AbjHYN4B (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 25 Aug 2023 09:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245001AbjHYNzy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Aug 2023 09:55:54 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E95A5213E
        for <linux-doc@vger.kernel.org>; Fri, 25 Aug 2023 06:55:49 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-57325fcd970so615976eaf.1
        for <linux-doc@vger.kernel.org>; Fri, 25 Aug 2023 06:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692971749; x=1693576549;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zYLKMzgHofES2SxyyPDOxTq+zmzu+ok6jUwXmUWniOQ=;
        b=f6F1DAvsaiqvfCdtEfItT4NLCLRfbK0etIqrzOEOxHqvCAgLDDvV2EAkMwbDpzDJUU
         1alKzhB1kqp1zhh058bLrHZWrJtVp/f03dK61+czAt9hUVw6swnjQFxNTltoclVfrBig
         eIS6HZ3AAm0Gfr7L9o26zYGGxgSjJc/d6xNreZ1N01uFC+T9sbxgfE0vG7WqvDWG2t04
         s1k97lVOov0il5mJD91mAA+shIILbyZZSglm4/ddadg6xN64nuRK6Wlp590RBHzdDFxv
         /2jpo0fDT9ZOBO1BFzBgN6Lj04xLHSzpUHhLi5D5DBdYglhptZViMW3bzlMxLNc/Ktso
         64WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692971749; x=1693576549;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYLKMzgHofES2SxyyPDOxTq+zmzu+ok6jUwXmUWniOQ=;
        b=d74RmpNeyYBWwUe4ItRNmdrJERMb9m0aIeock4WRNoPp896eIyNTCTYqubN/fGyXC+
         mQdPZbN9nkIiBZxWlc7kAzm47A8ERFI776N9iaUf1vifuVypL+by9qoabBvvvW2Cqi9c
         vA8qWynWMTcTJVNYovSVkuCSWg9HmSzbH1FhWwwtaLVbm3Icxs9vu8f86ndt+BxRgqo7
         snG0jwrZHUeYfy1hUd61B4yj6LlHWKN9n5P4whZpVzxWbBLEeTfqaGUSlY3r81R6t9Dk
         WXCVN82be/NQLUsqW7YM9R622aCEs2cOl6fvjdDCHMDXIMai1ttW4HtXjfw3l+ycpMLZ
         6aeA==
X-Gm-Message-State: AOJu0YzYtpJjnBjvVSGWkHxzuO8dcJpBKhcODxwYoGc7oVRFpqmgJDZh
        D/2+4XQOlwvYOvADhPjiQQN3ZZ3G7GIkIzZB6Ns=
X-Google-Smtp-Source: AGHT+IFyssT1EukwtLcaQ1SwWkzUZC/tuJTZ5NlowhzCLlu/FoZDgkWRdrzLaDVqq8Y0+cBL91Om5H1/DEkJok3ClTo=
X-Received: by 2002:a4a:dfb4:0:b0:56d:10bb:c2d4 with SMTP id
 k20-20020a4adfb4000000b0056d10bbc2d4mr4912372ook.1.1692971749134; Fri, 25 Aug
 2023 06:55:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:60a:0:b0:4f0:3fc2:2f99 with HTTP; Fri, 25 Aug 2023
 06:55:48 -0700 (PDT)
From:   Nancy Peters <pnan313131@gmail.com>
Date:   Fri, 25 Aug 2023 14:55:48 +0100
Message-ID: <CADUx0pjrdLPKGqZXjxjwVrz5wgZ7Q2v4VLbqya0n5+2az=zqfw@mail.gmail.com>
Subject: =?UTF-8?Q?Spende_f=C3=BCr_wohlt=C3=A4tige_Zwecke?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.8 required=5.0 tests=ADVANCE_FEE_2_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLY,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:c2c listed in]
        [list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [pnan313131[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [pnan313131[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  1.0 FREEMAIL_REPLY From and body contain different freemails
        *  3.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  2.0 ADVANCE_FEE_2_NEW_MONEY Advance Fee fraud and lots of money
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mein Freund
Ich m=C3=B6chte $ 8,5 Millionen, die ich von meinem verstorbenen Ehemann
geerbt habe, an Sie f=C3=BCr die Waisenhausstiftung in meinem Namen
spenden, weil ich krank bin und damit nicht umgehen kann.
Wenn f=C3=A4hig und interessiert, schreiben Sie zur=C3=BCck auf
(nancypeters02@outlook.com) f=C3=BCr Details.
Frau Nancy Peters

xxxx ENGLISCHE =C3=9CBERSETZUNG XXXXXXXXXXXXXX

My friend,
I want to donate $8.5 million I inherited from my late husband to you
for orphanage foundation on my behalf because I'm sick and can't
handle it.
If capable and interested write back on (nancypeters02@outlook.com)for deta=
il.
Ms.Nancy Peters.
