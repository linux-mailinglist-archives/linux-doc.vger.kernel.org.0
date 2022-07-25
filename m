Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5606758040D
	for <lists+linux-doc@lfdr.de>; Mon, 25 Jul 2022 20:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbiGYSdm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Jul 2022 14:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbiGYSdl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 14:33:41 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B861ADAD
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 11:33:37 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id m9so14103226ljp.9
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 11:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=pgYBaH+00C0C/FNyLnHdtJ9SvrXPwaYLflV2FNVydgY=;
        b=K0RiXvWznMenQsDZYy3FsU/7iVfXxWb+Ixqor6Ez0hoAMipkS6SO3OHp81+0ff3aCK
         oBvqUio4yjmv8eaggYAApT8feRf+t5MMSuhBUO6eqbe2zBJiEhyr/KVUMcZZ0T7UV8/1
         xQIMGXhDDW0dxJdFTDLTBXV+tZzl1ZCBtSIoJKCnXTVeep7hhStD7z33ZxIkleSiDbl+
         d4piTuMOM3/3c2tlM6eQ5zbXQOPVbZfUDBnrG2qRwhEvC3juiR2lT/VPPIZrQT0NeBDj
         1ppa4NAgHt11ybmRyCB72QZBwOnEeezehN9coV5AcJ1iCLiBIorlQHQYL3VTorszSsVH
         vi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=pgYBaH+00C0C/FNyLnHdtJ9SvrXPwaYLflV2FNVydgY=;
        b=MQXpbRNiNNB45OSrErpwRWdE86K9MCUI3vfJXDweOy2XwPKDu9k83yBJQROKt//fQb
         0VM9RiaSaxab8zwB0HZDsYEDyZiSset9XtyUKwA3aLHM9mQxYgSmhv999JAwgS2wSbMI
         LVeuGH6VAcxcF2758YPyDzk/jETBj2FrmXjizet1HhQqxoWrRb5h8MeIFnG/R4e5fNR+
         FQSaemX+2dry0S0W6Wbtkgdv9HurRsCVWuXFfhWoFmMwfdluZJhLsqOUMJIF2pp3fJ6e
         R71xFswus9NEE0ljbcbvfjfcTZ00LB+LW5yWKA2egZplchTR2nISx6fliQPuDzC3JLpz
         2Tqg==
X-Gm-Message-State: AJIora/Xd0zvSXZr0DA4hz2oY3DXdA24NVR+HnFPDngAbGabzWpeAIWu
        SvXiXHUQ2yhBuY+mQycFuA4DvXf5EbhuxLGsuiM=
X-Google-Smtp-Source: AGRyM1uhpqe07uwwcxJiIJK2j9TApguDOxsokR3VUmJv2Uu/tH0u8qlziTKpNWX8IK84bPGsQiWSVuNtuYlVd+exBFI=
X-Received: by 2002:a2e:b70a:0:b0:25e:673:fb65 with SMTP id
 j10-20020a2eb70a000000b0025e0673fb65mr2528245ljo.236.1658774015984; Mon, 25
 Jul 2022 11:33:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6504:b85:0:0:0:0 with HTTP; Mon, 25 Jul 2022 11:33:35
 -0700 (PDT)
Reply-To: tescobank093.de@gmail.com
From:   Tesco Bank <magdalenedavid091@gmail.com>
Date:   Mon, 25 Jul 2022 19:33:35 +0100
Message-ID: <CAAeMwZ9mpLxMhSPuovbni2fVddx3ssnQZOGaj9ShJ41B2ZS=9A@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--=20
Ben=C3=B6tigen Sie heute dringend einen Kredit, um eine Investition zu
t=C3=A4tigen? Ein neues Unternehmen gr=C3=BCnden oder Rechnungen bezahlen? =
Und
uns auf Wunsch in Raten zur=C3=BCckzahlen? Wir bieten Kredite zu einem sehr
niedrigen Zinssatz. Wie viel Kredit m=C3=B6chten Sie???
