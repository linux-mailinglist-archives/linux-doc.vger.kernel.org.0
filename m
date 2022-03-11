Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEDE4D699B
	for <lists+linux-doc@lfdr.de>; Fri, 11 Mar 2022 21:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbiCKUn2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 11 Mar 2022 15:43:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbiCKUn1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Mar 2022 15:43:27 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D171E3753
        for <linux-doc@vger.kernel.org>; Fri, 11 Mar 2022 12:42:23 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6CD5C2C3;
        Fri, 11 Mar 2022 20:42:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6CD5C2C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1647031342; bh=G4u3O34O1Os/6jYVlKYgqwyHKYx4+pmSM99+pDYPiU4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=F4CLw7VRt8rUegGITINaszVgCazEPD5wdYn1af5+Nyes7KWL8GVjhQY1cpOe9K1aP
         xjs9cULFrn+58tgwpEGxkzOJ12tPtVMS7LfloAg4VHw5ezpUoPzYMqgxXukSxOEcWZ
         HWNP07lyZ4Yh93Cg2Zmc7w+nsL7N7NXlgdrEFsY4KP1DtsW2VmDCcXLS0fwNfw5v9L
         9d9NTaYfIoG+5qm1Gg6q7LewXMPwLuGcuj9j5he/350S4eSmPExXskP6uUCZrV9a0M
         IXTUNAPIoC3c2IY77EreIVVd4ydCjFQHSPvOyqGe4Z0OlyhjrBDzsDoEIXX5oeKU2N
         D5OWI8y+ws9vw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v7 0/3] Add Chinese translations for KSM documents
In-Reply-To: <cover.1646899056.git.siyanteng@loongson.cn>
References: <cover.1646899056.git.siyanteng@loongson.cn>
Date:   Fri, 11 Mar 2022 13:42:21 -0700
Message-ID: <874k4443wy.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> v7:
>     Add Yanteng's Signoff tag. [PATCH v7 1/3]
>
> v6:
>     Build test in next-20220307.
>
> v5:
>     Add Yanteng's Signoff tag. [PATCH v5 2/3 and 3/3]
>
> v4:
>     Fix build error and build warning.
>
> v3:
>         Fix the patch '[1/3] Add Chinese translation for vm/ksm.rst'
>         because its old version does not apply for the latest commit.
>
> v2:
>
>         According to the suggestions from Yanteng Si, Alex Shi and
>         Jonathan Corbet, I have modified my patches. Here are my specific
>         changelog:
>
>         1. Remove Redundant Labels in added Documents like ``.. _ksm_sysf=
s:``
>
>            Yanteng Si said: Too many tags will cause a compilation
>            warning, because an identical one already exists for the Origin
>            document. Jonathan Corbet think so.
>
>         2. Align with standard Chinese format on the 'original', 'transla=
tor',
>            etc.
>
>         3. fix some translation error like =E2=80=9Cpages_unshared=E2=80=
=9D, I remove  '=E7=8B=AC=E4=BA=AB'.
>
>            Alex Shi suggest to remove '=E7=8B=AC=E4=BA=AB'.
>
>         4. Refactor translations/zh_CN/admin-guide/mm/index.rst.
>
>            Yanteng Si: Compile pass is only one of the basis for checking
>            through, we also have to check the html for any problems, as
>            far as I know, the above treatment is very ugly.
>
> xu xin (3):
>   Add Chinese translation for vm/ksm.rst
>   zh_CN: Add translations for admin-guide/mm/ksm.rst
>   zh_CN: Add translation for admin-guide/mm/index.rst
>
>  .../translations/zh_CN/admin-guide/index.rst  |   2 +-
>  .../zh_CN/admin-guide/mm/index.rst            |  49 ++++++
>  .../translations/zh_CN/admin-guide/mm/ksm.rst | 148 ++++++++++++++++++
>  Documentation/translations/zh_CN/vm/index.rst |   1 +
>  Documentation/translations/zh_CN/vm/ksm.rst   |  70 +++++++++
>  5 files changed, 269 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/index=
.rst
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/ksm.r=
st
>  create mode 100644 Documentation/translations/zh_CN/vm/ksm.rst

Set applied, thanks.

jon
