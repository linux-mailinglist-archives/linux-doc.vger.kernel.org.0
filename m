Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C33764B830B
	for <lists+linux-doc@lfdr.de>; Wed, 16 Feb 2022 09:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiBPIi0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Feb 2022 03:38:26 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:35358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiBPIi0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Feb 2022 03:38:26 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A4B9107081
        for <linux-doc@vger.kernel.org>; Wed, 16 Feb 2022 00:38:14 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id a7so823720ybj.12
        for <linux-doc@vger.kernel.org>; Wed, 16 Feb 2022 00:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=nB3HfM3BhGquAftym/jJwBBzfz0DE9ERRJbclnOQ+Ss=;
        b=AoJE4boMdQrveW8xFIMkbgh545n7iz6+n2tZJlpqLUM82AjxJJnMIiNFtxljk6lNu3
         s4a+Yl6qG47UNoksMRi6yPnLeqpWcnmtxSyrFUMRXDGotog78gKLuyAGp+3uaeFUc6s0
         BokOicKOGRz8t/3tG4MD/z0WPAXDXSCyMX53AUP+ecy665wCoYmmze0Owo3F8lFQxtyF
         oHRiTK7/aBEK6kxtIuAuzK/WFahetzhtBjQGllcTg1Jge8q2/knAH5xP8pjE+yjfIy33
         hp8kUDGB1tfJsCVrIx7fLR5KvSJz00ObkzieWFr5FsU5stbUYF4jxVGnKfUVrD3BQDpJ
         JPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=nB3HfM3BhGquAftym/jJwBBzfz0DE9ERRJbclnOQ+Ss=;
        b=cpoXPzQH2PzbEbs50J9iNtYt6B88TGY4z0H8mCNPe1Vox1lFtS6Bs3ej8bt9kneZsJ
         3hsvftJV+w7DVMWLOw6MKmcMdKQHOMV4uzYwXH369vkHfmLJMuuLgnvljE1hcUF2JzaL
         GNbOd8GlPT50hOpcajpou0uQntosHXMVd+7ufxrCN1ilOQ23L2ANr44vk0fvXtyYsPnK
         Ed+d3uZydIwgCoShWClI+HcKApx9ubxDRzByaY0bnBKwvTely+A40O/zgcolthY1TrOn
         gqhvqlUftX0IhAAV+Hjigkfa0r61hA71AIf+w7ZECQ+f41h63TMmnfnmE4aLunu4OY7O
         c6nw==
X-Gm-Message-State: AOAM533gJ/0wKxbdX5nTM5iFNmWvIe0cRS/tY840ZGHEZwIiWmyTL68K
        qy1WtZvVDE1VjI8pIcFMcAtyQopH0oR7HREcIKs=
X-Google-Smtp-Source: ABdhPJz1Z2MpW6r3u4tb+9JZxWeGBd98p12/CUDH7d7bVCPrgKRjlCXrkoCxTzywaer1adgCSLH6jzE1/ylEtxT6IXY=
X-Received: by 2002:a05:6902:248:b0:61d:b08a:9610 with SMTP id
 k8-20020a056902024800b0061db08a9610mr1129659ybs.755.1645000693909; Wed, 16
 Feb 2022 00:38:13 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7010:5b8c:b0:20d:bd87:6929 with HTTP; Wed, 16 Feb 2022
 00:38:13 -0800 (PST)
Reply-To: howardnewell923@gmail.com
From:   Howard Newell <konecoulibaly102@gmail.com>
Date:   Wed, 16 Feb 2022 08:38:13 +0000
Message-ID: <CANXJ+kQC4Hy4eiobPLb0v8O2bmbHU8t_6nQA5nHHJpq_C3HGOg@mail.gmail.com>
Subject: re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,HK_SCAM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b30 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [howardnewell923[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [konecoulibaly102[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [konecoulibaly102[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.6 HK_SCAM No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--=20

Hallo

Ich m=C3=B6chte von Ihnen wissen, ob Sie meine Nachricht bez=C3=BCglich Ihr=
er
Entsch=C3=A4digungsakte beim Entsch=C3=A4digungsprogramm der Vereinten Nati=
onen
erhalten haben. Bitte best=C3=A4tigen.

Mit freundlichen Gr=C3=BC=C3=9Fe!
Howard Newell
London WC2N 4JS, Gro=C3=9Fbritannien


Hi

I want to know from you if you received my message concerning your
compensation file with United Nations Compensation Program. Please
confirm.

Kind regards!
Howard Newell
London WC2N 4JS, UK
