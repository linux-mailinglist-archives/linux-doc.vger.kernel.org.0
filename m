Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC6A2D16E8
	for <lists+linux-doc@lfdr.de>; Mon,  7 Dec 2020 17:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbgLGQzR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Dec 2020 11:55:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgLGQzR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Dec 2020 11:55:17 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA788C06138C
        for <linux-doc@vger.kernel.org>; Mon,  7 Dec 2020 08:54:02 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id c12so3502006pfo.10
        for <linux-doc@vger.kernel.org>; Mon, 07 Dec 2020 08:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=F2rYrqS8SHhox6gb/PLA5FF8Na5ObfPjeNw5CWUgJBA=;
        b=EB9xXVBYnph+yLymg1YrR5VAcltS94YlY6g/tX2JMroPaR766LWa/Gzq1LriJvndL9
         Ra/PKOAP/hbVwcJwA9T+ofrgXyV4/YhX4T0t8c9L1XMB21pDKue1sURccq5B66diFsFX
         g0nLZqhpoFpGzzprGg3JwSywVaNx5gnY2UMLtj1ZNQWjFcS7hFftxWEcyX9JsR0cQJrx
         N3OBLrfsIBOjYaObDBVuvpXOTnAmnlaZo6OD5tUH5X8tdL0Jd/ge8fX+zTijfuVh0+lR
         E+yG7u11Hg/e3JSk/WZm24CvjGehCaTkoZh/n0m8LHJOpJRoL49iTO8KeKYSTLKZyEZm
         eTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=F2rYrqS8SHhox6gb/PLA5FF8Na5ObfPjeNw5CWUgJBA=;
        b=Kgi9g+Y3HW8DB9KwDeFEsu7FYa6MT7IE3UVg4A9syP7u34OrIcAjkg0Lujs6EPbiVx
         bnwSARftozm3/bXxmkOers3IyGtFeYa6vr8zBzzT+kbP4vgSp0+IQ1ao4kHHeCjna7t0
         j9TPHqOfkr9HUMvQmft2K/tHNIXiAchf982IseYnHVpRL4glmAFu6PT4TiBl8QORhaXM
         7eslMxSm82pF1qGlTgT+bcJdeTAYyB8ZaIhC1b3luahnl6xs8Bk4Wzz5SeEl5y+MNVjh
         AQEeatuy1CdNsZfw+I8IeR9JTldVaLyg4ClzDp12+mYW+lsalBM9aAghofYuR0C+PCsR
         vVDg==
X-Gm-Message-State: AOAM533Zqaqu4yRswsmNbJ4JqFYk2X9DPVIM1oFFs4guJgW3d5ZIXrlu
        M/EyqnOLrpXEXji5o8VBmbxTGA==
X-Google-Smtp-Source: ABdhPJwn7nhwft//+r3F0Vxp9f1u8P3YnJM/m0z6bq5efFikrvoUwibXAaVfdivhuEkQeFgFnGroAw==
X-Received: by 2002:a63:d312:: with SMTP id b18mr19102857pgg.233.1607360042167;
        Mon, 07 Dec 2020 08:54:02 -0800 (PST)
Received: from ?IPv6:2601:646:c200:1ef2:799e:e3fc:86a:de72? ([2601:646:c200:1ef2:799e:e3fc:86a:de72])
        by smtp.gmail.com with ESMTPSA id y23sm12988888pje.41.2020.12.07.08.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 08:54:01 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 1/3] KVM: x86: implement KVM_{GET|SET}_TSC_STATE
Date:   Mon, 7 Dec 2020 08:53:59 -0800
Message-Id: <905DFDCE-71A5-4711-A31B-9FCFEA2CFC52@amacapital.net>
References: <87a6up606r.fsf@nanos.tec.linutronix.de>
Cc:     Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jim Mattson <jmattson@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Borislav Petkov <bp@alien8.de>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Jones <drjones@redhat.com>,
        Oliver Upton <oupton@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
In-Reply-To: <87a6up606r.fsf@nanos.tec.linutronix.de>
To:     Thomas Gleixner <tglx@linutronix.de>
X-Mailer: iPhone Mail (18B121)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> On Dec 7, 2020, at 8:38 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
>=20
> =EF=BB=BFOn Mon, Dec 07 2020 at 14:16, Maxim Levitsky wrote:
>>> On Sun, 2020-12-06 at 17:19 +0100, Thomas Gleixner wrote:
>>> =46rom a timekeeping POV and the guests expectation of TSC this is
>>> fundamentally wrong:
>>>=20
>>>      tscguest =3D scaled(hosttsc) + offset
>>>=20
>>> The TSC has to be viewed systemwide and not per CPU. It's systemwide
>>> used for timekeeping and for that to work it has to be synchronized.=20
>>>=20
>>> Why would this be different on virt? Just because it's virt or what?=20
>>>=20
>>> Migration is a guest wide thing and you're not migrating single vCPUs.
>>>=20
>>> This hackery just papers over he underlying design fail that KVM looks
>>> at the TSC per vCPU which is the root cause and that needs to be fixed.
>>=20
>> I don't disagree with you.
>> As far as I know the main reasons that kvm tracks TSC per guest are
>>=20
>> 1. cases when host tsc is not stable=20
>> (hopefully rare now, and I don't mind making
>> the new API just refuse to work when this is detected, and revert to old w=
ay
>> of doing things).
>=20
> That's a trainwreck to begin with and I really would just not support it
> for anything new which aims to be more precise and correct.  TSC has
> become pretty reliable over the years.
>=20
>> 2. (theoretical) ability of the guest to introduce per core tsc offfset
>> by either using TSC_ADJUST (for which I got recently an idea to stop
>> advertising this feature to the guest), or writing TSC directly which
>> is allowed by Intel's PRM:
>=20
> For anything halfways modern the write to TSC is reflected in TSC_ADJUST
> which means you get the precise offset.
>=20
> The general principle still applies from a system POV.
>=20
>     TSC base (systemwide view) - The sane case
>=20
>     TSC CPU  =3D TSC base + TSC_ADJUST
>=20
> The guest TSC base is a per guest constant offset to the host TSC.
>=20
>     TSC guest base =3D TSC host base + guest base offset
>=20
> If the guest want's this different per vCPU by writing to the MSR or to
> TSC_ADJUST then you still can have a per vCPU offset in TSC_ADJUST which
> is the offset to the TSC base of the guest.


How about, if the guest wants to write TSC_ADJUST, it can turn off all parav=
irt features and keep both pieces?

