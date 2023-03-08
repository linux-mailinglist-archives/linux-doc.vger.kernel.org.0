Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEAB6B0C38
	for <lists+linux-doc@lfdr.de>; Wed,  8 Mar 2023 16:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbjCHPKL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 8 Mar 2023 10:10:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbjCHPJ5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Mar 2023 10:09:57 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC7F16881
        for <linux-doc@vger.kernel.org>; Wed,  8 Mar 2023 07:09:55 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id p6so18015271plf.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Mar 2023 07:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1678288195;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGgrbtL0osvGwqCEy5S6PgImlMHlY6fpkJDxu/3Zc74=;
        b=Cy+UsOiy8Kw+/Y5nUfo1zVaKbgnTQPV5QrFPFPlARLixMPr8kzSqNibag5C/pX8Lka
         wj94WV73tB+keA2r68yvUeg1nIE4qi47loC2k8XPxk43I3l1AjIJsu7Y3qiqq/VDHSVS
         F2Vn0biJWfJ2IrUwo0NsyfhSsBCRQG46yJJHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678288195;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGgrbtL0osvGwqCEy5S6PgImlMHlY6fpkJDxu/3Zc74=;
        b=stbQzdiRTJta+0FIpSbVW6SdTchhjjwI4n9yxaSQ+d7nqZ4htvhbT5k0oqBP9Rg3Jp
         6oDHWvCoGaCaRSSNuBkeMkiIIHznOZawucSIrkGktgERIV4h3Lg5db4mulPTRcFINYWO
         ZAQhoRMQDZz6FIC0kB1/nR0G1CAj6hFXuiEioqX/C0aVbN2CWyLfBscGOnxAkN+P5R+m
         Lj6CFzPxxmL8fXHv/WX3vyLcSbsVMYMHQ0pngK82LMath9ZVnA2WGLirNRZLomsE56wq
         MS9nTi0rmQbLNQtLvyRqNJbIwaP6CL8PLHe+g17wBWZdVPs4ARbVoNJKPl+sv/0IfYHy
         Q8XQ==
X-Gm-Message-State: AO0yUKXFtTf7fdc/skN9Mghlq7k9y++VzFbaehZUcQc58c5eKjZ4ptOO
        z1whi211KXKuHzO0Tj3S8vKbXg==
X-Google-Smtp-Source: AK7set+TDA4sUlwdVLO52Tw5fNk3QFkY9MHeImXJKiiUBwXcbYr+lIVs8Vtq2XaesY2ALOkZ3MfFtA==
X-Received: by 2002:a17:902:d4c5:b0:199:30a6:376c with SMTP id o5-20020a170902d4c500b0019930a6376cmr20622902plg.68.1678288195139;
        Wed, 08 Mar 2023 07:09:55 -0800 (PST)
Received: from smtpclient.apple ([2600:1010:b049:5d6c:a98c:abbd:1cd:6532])
        by smtp.gmail.com with ESMTPSA id jh5-20020a170903328500b0019a983f0119sm9941729plb.307.2023.03.08.07.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 07:09:54 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Joel Fernandes <joel@joelfernandes.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3] rcu: Add a minimum time for marking boot as completed
Date:   Wed, 8 Mar 2023 07:09:42 -0800
Message-Id: <4069DA96-5E01-4E70-8A04-52543A43B3BC@joelfernandes.org>
References: <ZAijOO0vEiiDn+Ex@lothringen>
Cc:     linux-kernel@vger.kernel.org, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
        rcu@vger.kernel.org, urezki@gmail.com
In-Reply-To: <ZAijOO0vEiiDn+Ex@lothringen>
To:     Frederic Weisbecker <frederic@kernel.org>
X-Mailer: iPhone Mail (20B101)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> On Mar 8, 2023, at 7:01 AM, Frederic Weisbecker <frederic@kernel.org> wrot=
e:
>=20
> =EF=BB=BFOn Wed, Mar 08, 2023 at 05:52:50AM -0800, Joel Fernandes wrote:
>> Just to add to previous reply:
>>=20
>> One thing to consider is that it is more of a performance improvement for=

>> booting in expedited mode to fallback to normal later, than a bug
>> fix. Repeated synchronize_rcu() can easily add 100s of milliseconds and t=
o
>> remedy that =E2=80=94 a conversion of the call from normal API to the exp=
edited API
>> will not help.
>=20
> 2 things to consider:
>=20
> 1) Is it this about specific calls to synchronize_rcu() that repeat a lot
>   and thus create such measurable impact? If so the specific callsites sho=
uld
>   be considered for a conversion.
>=20
> 2) Is it about lots of different calls to synchronize_rcu() that gather a b=
ig
>   noise? Then the solution is different.
>=20
> Again without proper analysis, what do we know?

Again, no one disputed that proper analysis is needed. That is obvious. I wa=
s just responding to your assumption that if boot is slow, user space will a=
lso be slow. That is not a good thing to conclude because there are many fac=
tors. Slowness at boot may be considered a bug, but slowness after boot may n=
ot be (say if the user care mores for power later).

On my side I am planning to dig deeper into our boot process, but it will ta=
ke time. I hope Qiuxu can do the boot analysis on his side.

Thanks.

>=20
> Thanks.
