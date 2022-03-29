Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B28A4EB5CC
	for <lists+linux-doc@lfdr.de>; Wed, 30 Mar 2022 00:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236658AbiC2WVQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 29 Mar 2022 18:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236522AbiC2WVP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 18:21:15 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A148520F4B
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 15:19:31 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id b19so26730208wrh.11
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 15:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=Uof+slHbMHausGvMfA7oniLvQXMjiZ9VhJ5YEICGLmGHrQksJ+TdhZEkmRXi8wB0Ob
         Ifx7nPUtESoKTrHJbTFqPwo4ICNT3/wVxwFAKR+nGiqd7sztZuFiiblehXJVochvAxY3
         VFVQzOfo0pE/UVd+9VliynmlzBiHt5mRjvrv0aS+SAxjfQM+NcD0q1a3HsVTF7pwJ323
         Bh+RoRGXil4/ZqCRtV+tbdFB1UzbcsDKq5mQdgyuGJQnSCf/izZCNCX9AQ8lO0Rvmlrw
         FcSkiDWvbVZACqAm9ABt92nGvyyZ4AW/CUY1F7dq5f3JCsJYFN8a6CMPyZ12pMeaSVNJ
         /bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=8JpJIW0q++mALPXAsLIhVsPafya3k95wXM64Uz7NSuMHhzaU69OSwxIpHC1zS3AgKk
         WeuMIPfCI4rp2Xl1EWhroGKYzk01wZyCrp1Rx7TjHON8XWqBKY3dS6NLWBvH/b30PWY0
         G+xJOCX+EbuCOlKe+h8De3EVC47G+7u4V4ybBygoI8Vi0JYzV4dvC8IvVMORdnsTHk2D
         yMtARE31LtNkfD1+msHUfX/zJtrT6oufxgXEYD+T2EdiDlK7GKLRWv9eH4u9FwSfP0eR
         Kpd3y9vI5zbkpED89piNBCK2hzX2Rj5j90rkkMB68iLPCfvPXUDyu8DfRWkYVUwiBeHz
         834Q==
X-Gm-Message-State: AOAM5314fuBq/NrwTNrVBE+0SfK+1TVhd6jr9UAbwro/rIOixA5yHG2p
        h2lfs/ozQ+bPPzsUP+CPmtA=
X-Google-Smtp-Source: ABdhPJzB2Vh6E20ITLcFb86b7DIU/oIdaQuHcGYrwUH89+TOqumQJteJLmt++hPdn4JZe0quaO20sw==
X-Received: by 2002:a5d:525b:0:b0:203:8f00:1a56 with SMTP id k27-20020a5d525b000000b002038f001a56mr33490754wrc.202.1648592370310;
        Tue, 29 Mar 2022 15:19:30 -0700 (PDT)
Received: from [172.20.10.4] ([197.210.71.189])
        by smtp.gmail.com with ESMTPSA id g1-20020a1c4e01000000b003899c8053e1sm4263738wmh.41.2022.03.29.15.19.22
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2022 15:19:28 -0700 (PDT)
Message-ID: <624385f0.1c69fb81.dae14.1f53@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Gefeliciteerd, er is geld aan je gedoneerd
To:     Recipients <adeboyejofolashade55@gmail.com>
From:   adeboyejofolashade55@gmail.com
Date:   Tue, 29 Mar 2022 23:19:15 +0100
Reply-To: mike.weirsky.foundation003@gmail.com
X-Spam-Status: No, score=2.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Beste begunstigde,

 Je hebt een liefdadigheidsdonatie van ($ 10.000.000,00) van Mr. Mike Weirs=
ky, een winnaar van een powerball-jackpotloterij van $ 273 miljoen.  Ik don=
eer aan 5 willekeurige personen als je deze e-mail ontvangt, dan is je e-ma=
il geselecteerd na een spin-ball. Ik heb vrijwillig besloten om het bedrag =
van $ 10 miljoen USD aan jou te doneren als een van de geselecteerde 5, om =
mijn winst te verifi=EBren
 =

  Vriendelijk antwoord op: mike.weirsky.foundation003@gmail.com
 Voor uw claim.
