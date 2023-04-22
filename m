Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 631A36EB820
	for <lists+linux-doc@lfdr.de>; Sat, 22 Apr 2023 11:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjDVJAt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 22 Apr 2023 05:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjDVJAs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Apr 2023 05:00:48 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4C61BC2
        for <linux-doc@vger.kernel.org>; Sat, 22 Apr 2023 02:00:47 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-18777914805so15258839fac.1
        for <linux-doc@vger.kernel.org>; Sat, 22 Apr 2023 02:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682154047; x=1684746047;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y1bEiNpfNWaupTJq/MT6CaNCMwtQHUlCN6T2ayUv+NI=;
        b=g9S5qKCdQChjO8wmUlvuU8GogUgtpqISqAjB5phVL1n1CV3Gh40RK+fLK2whlX5NiQ
         cSM6kVd1uAOZOGDaoWR5pBMJfl7cxgAfrHVBkumyRlkjQ6FB46cG0z+ITCkqToRhZkfS
         VgvW10XfLDGwep9IXIJh0aDkNZ0I3CdcZnzyBf6YYHtukB5QkCN1FUo45sdQKJqfrkAi
         0AyrrXcuwRjEeqTSv6jp9RMMpUzBlIiLTrPmvsuO1lngmvECCNsoe5KVD8XMfKd+OMKO
         4bZJo6oHJwBwRJHYQ0znzQlVvi6Ub2HgOLLB01u0+oGu0EEsXYJG7SiPcP5Fot+xjReC
         6nEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682154047; x=1684746047;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1bEiNpfNWaupTJq/MT6CaNCMwtQHUlCN6T2ayUv+NI=;
        b=PGstab48+ao+0hsZl8LglC94LTDaqsu1P8eoW+DZjzdqz3GrhZ79hO8Q4lw4/xKw/I
         0nHadfNrklb5fyX6AKECDH7fomQBIgKyvm9cFFURsexTNAFyGeM27E9+4HgEDcZEnXbA
         M+zyRs/CqR0254hUccN989vVldQ7GpH4L+pUQjQXcXrRHJEnkv08g440HyENA56v+PSY
         V0i/VwEUnSjz88eBClP4Y2R+51h7gFrl3T2VOL71tr6PMJul11BtnOeOcQfRFlTA7I2D
         nYrj4hLSrdEPQwAROK8avULMhaeOARbvK2gVEKYib4pEWVHPLJo//AJ5miiQpiUeAtPz
         LbKQ==
X-Gm-Message-State: AAQBX9dRyRtatySCs9sBuKjzEZO9+nXP4eoEF0AUjvPBgybAAnrXHx/S
        +YczlS92UDPNnoE5+z2vqtYgdlrYu9M4V0zgzcA=
X-Google-Smtp-Source: AKy350YeAPB6S0xDEU4UeyflI/0dT/01SJbAh3Qen58hrbUx5L8wgDmljSkrLuvclDHGjQ2oey9hLwgDyPRSZDjQoKY=
X-Received: by 2002:a05:6808:206:b0:38e:8ecc:b4d9 with SMTP id
 l6-20020a056808020600b0038e8eccb4d9mr2127161oie.10.1682154047248; Sat, 22 Apr
 2023 02:00:47 -0700 (PDT)
MIME-Version: 1.0
Sender: namaroismael54@gmail.com
Received: by 2002:ac9:6157:0:b0:4d0:8c5:9f3e with HTTP; Sat, 22 Apr 2023
 02:00:46 -0700 (PDT)
From:   Miss Marybeth <marybethmonson009@gmail.com>
Date:   Sat, 22 Apr 2023 09:00:46 +0000
X-Google-Sender-Auth: 2Wr_l0umdsZfEl9uxtafvcB4eVQ
Message-ID: <CAFXq+JJK0gRJjpvTfqU5cD5Q6ZWbzu2OUYWVoEG+Vq0w8azm4g@mail.gmail.com>
Subject: RE: HELLO DEAR
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hola,

=C2=BFRecibiste mi mensaje anterior? Me comuniqu=C3=A9 contigo antes pero e=
l
mensaje fall=C3=B3, as=C3=AD que decid=C3=AD escribirte de nuevo. Confirme =
si recibe
esto para que pueda continuar,

esperando por tu respuesta.

Saludos,
se=C3=B1orita marybeth
