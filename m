Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 231044BCB7D
	for <lists+linux-doc@lfdr.de>; Sun, 20 Feb 2022 02:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237526AbiBTBeT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 19 Feb 2022 20:34:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233344AbiBTBeS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Feb 2022 20:34:18 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267323CA62
        for <linux-doc@vger.kernel.org>; Sat, 19 Feb 2022 17:33:58 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id v12so20838952wrv.2
        for <linux-doc@vger.kernel.org>; Sat, 19 Feb 2022 17:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=T28r8IcApmahqshNb89Vq7Sss5daNXvHX2RvLjpVFBs=;
        b=fRLxy+epS5NvWaILV9g3T++hdq5kEqTktZ++O1HM+mnSJasLX2ijkOqSRqwE70FAwP
         uRvR2PEqn/4HEyFN+eUqZtmLOp/llN7zCut0c8htbVvAFdKJTcE2pIHhkUA6nRMx8Upu
         nL/EbiROvilcVZzIUOKL8ABT8R/xto6w7u4BGeXfdnyKCe3Ddw4h2mND96IBgBJqRAGM
         2X0YpAjHKPk6uToln/RADZcm/skfRBzWfPwgFoVy84Wsvi5988faYy7j2vT1JE/O3JGN
         pcsQJdyRHct2Ox6creHO0prDYA+QhnTeRX/e+aSR5g2YxDIFG4l14Yc1aJXJo6/lthkx
         GjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=T28r8IcApmahqshNb89Vq7Sss5daNXvHX2RvLjpVFBs=;
        b=1iuhFEz6cjXE4qhB0gvuoCmnACYEntEhUCijgAKhESTQaZ+aTtJ7uM+reuY+NVHP2e
         dIL6bmz/Vh3f3iMkuMZZyr4TRKBoB0k548ZW7oqZ9SrWFvFn+Ey6eAGQQpeE8fs8DjCG
         3dzISFwbi+GdVIZQFsQ/MAowPe4N5kQlfI8GLVhmgPHMCi+d4r80r2Saian2p4Ii4E2M
         Ie1EkyHvnnVuFUkJvMrdvRpTWgLQh1+zsQZufuwwF5NXaCxhnnax/XB8kpJa0XX+Mx4B
         F6iyZCyBPt5Bs6h4XOdw5jit1C521EIXmkhffr4wwZ6qUJcuFZBrZWeNqGCR1oS/ULcN
         Ww4Q==
X-Gm-Message-State: AOAM533GmMm7HJDGz+f4yDuOi2t6aYiOZj2a07FC9uxn83mFmIlxuxq+
        cA2GjGMcxRTWdJdnv6Uyhxg=
X-Google-Smtp-Source: ABdhPJy3DJ6b0gde4EEjpk0eMSjjfYODFlsM6/G3YcfSNbJh6ZjjhfyukC7lu1FlcMeZ3a4bx1cDMQ==
X-Received: by 2002:a5d:52ca:0:b0:1e5:8cbc:7f2e with SMTP id r10-20020a5d52ca000000b001e58cbc7f2emr10968269wrv.309.1645320836603;
        Sat, 19 Feb 2022 17:33:56 -0800 (PST)
Received: from [192.168.0.133] ([5.193.8.34])
        by smtp.gmail.com with ESMTPSA id c5sm14928362wrq.102.2022.02.19.17.33.52
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Feb 2022 17:33:55 -0800 (PST)
Message-ID: <62119a83.1c69fb81.1f04a.6999@mx.google.com>
From:   Mrs Maria Elisabeth Schaeffler <borealex766@gmail.com>
X-Google-Original-From: Mrs Maria Elisabeth Schaeffler
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Spende
To:     Recipients <Mrs@vger.kernel.org>
Date:   Sun, 20 Feb 2022 05:33:43 +0400
Reply-To: mariaeisaeth001@gmail.com
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,TO_MALFORMED,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hallo, =


Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Wirtschaftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen, die restlichen 25% dieses Ja=
hr 2022 an Einzelpersonen zu verschenken. Ich habe mich entschlossen, Ihnen=
 1.500.000,00 Euro zu spenden. Wenn Sie an meiner Spende interessiert sind,=
 kontaktieren Sie mich bitte f=FCr weitere Informationen.

Sie k=F6nnen auch =FCber den folgenden Link mehr =FCber mich lesen
https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Gr=FC=DFe
Gesch=E4ftsf=FChrer Wipro Limited
Maria-Elisabeth_Schaeffler
E-Mail: mariaeisaeth001@gmail.com
