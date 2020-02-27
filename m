Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF8C170F3D
	for <lists+linux-doc@lfdr.de>; Thu, 27 Feb 2020 04:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgB0D5G (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 26 Feb 2020 22:57:06 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41736 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728287AbgB0D5F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Feb 2020 22:57:05 -0500
Received: by mail-pf1-f194.google.com with SMTP id j9so887818pfa.8
        for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2020 19:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=CnaaQj5OkZlinyuOBz/+nnOP++fx4EwIlpltdiovgCE=;
        b=CvFkH5dzd6cq24Yi56VcybisKknibFmU/ow2ZqelBQazvt8BufBh2ODr6THyJye6BK
         pWi9IQSyRt+DW4H7LH3Aw5WOB0wmY2ss62VcGrpUEDa8LKWEhtep7DgNKCIbBL1AWb6E
         Tq57vgFbkcc608Dp5NIyKYhwGlsVs0fuPZ3UMk/nQOtDlUMasKcyMX8I/qiEzMoaNKIQ
         y6n/KjR0q+J0RQiLg4/94jYEXnIlUggAEkQ/dDJpkqkojBDmZJ0kwbgYurQI4Y7i8MIi
         0yIhFypbvEihEA0ivMQ6+HmGvD0QQVI3e6COI7tobO8x7xKc8jppGDUrtCV8AD2tGzdl
         S8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=CnaaQj5OkZlinyuOBz/+nnOP++fx4EwIlpltdiovgCE=;
        b=kYLDcOwxW9tGSDCM2Y27g3BuUw058T2QNnpy5bYxPkcgLm+8qB4fDrMR4Yvd+HwVzl
         j5UcM2rUF6MZJ/i8MNdl2/fDJ758XqpjyuQjLL9IxQnWNqi8GGyzGvUy1UaryfZK1AZl
         0X1qTsK2SuVVqFHaoBsQJQyln+13I9H/1EaoOq8oVVN78uK0wC1YeUOsdKLmX0+LFwmO
         SYpwQSzgCgwmpt7V/BtSqV5jTY7gr7uR1oRTepW75To1ZNQmrCcYVXNun68caV5lvwjy
         8fRp9Aa8nzbiVk2ZHxPy+LybX8uVOo+tIhJEVapPpUwnpM+lFC1vykSsrOq9Q3w2Hmts
         iF7g==
X-Gm-Message-State: APjAAAWJRvxyjpzX1HZ2fiXLZLqyZ9D2ur/jOfI3UwKQIbYByEXOvKPb
        gTaKqrezxd7+xNWyK2AYXnk1ZA==
X-Google-Smtp-Source: APXvYqy28xXxMFJjJ7wZKlE7xuddyqQc8I1BmGULeVfYLEzR3Y+/xN7FT1RQFMCIBqkzWHgsDEn21A==
X-Received: by 2002:a62:17c3:: with SMTP id 186mr2085313pfx.158.1582775824816;
        Wed, 26 Feb 2020 19:57:04 -0800 (PST)
Received: from ?IPv6:2600:1010:b069:8a27:ddd9:92ea:d62b:8a52? ([2600:1010:b069:8a27:ddd9:92ea:d62b:8a52])
        by smtp.gmail.com with ESMTPSA id j21sm4165728pji.13.2020.02.26.19.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 19:57:03 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v9 05/27] x86/cet/shstk: Add Kconfig option for user-mode Shadow Stack protection
Date:   Wed, 26 Feb 2020 19:57:01 -0800
Message-Id: <FF42D299-D7A4-4884-9E45-DBEB5853FE56@amacapital.net>
References: <CAMe9rOqhf4y+e6h8i7P8+70pwLSg8n=ise6LEqABNPKarECdeA@mail.gmail.com>
Cc:     Dave Hansen <dave.hansen@intel.com>,
        Yu-cheng Yu <yu-cheng.yu@intel.com>,
        the arch/x86 maintainers <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>, x86-patch-review@intel.com
In-Reply-To: <CAMe9rOqhf4y+e6h8i7P8+70pwLSg8n=ise6LEqABNPKarECdeA@mail.gmail.com>
To:     "H.J. Lu" <hjl.tools@gmail.com>
X-Mailer: iPhone Mail (17D50)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> On Feb 26, 2020, at 6:11 PM, H.J. Lu <hjl.tools@gmail.com> wrote:
>=20
> =EF=BB=BFOn Wed, Feb 26, 2020 at 5:16 PM Dave Hansen <dave.hansen@intel.co=
m> wrote:
>>=20
>> On 2/26/20 5:02 PM, H.J. Lu wrote:
>>>> That way everybody with old toolchains can still build the kernel (and
>>>> run/test code with your config option on, btw...).
>>> CET requires a complete new OS image from kernel, toolchain, run-time.
>>> CET enabled kernel without the rest of updated OS won't give you CET
>>> at all.
>>=20
>> If you require a new toolchain, nobody even builds your fancy feature.
>> Probably including 0day and all of the lazy maintainers with crufty old
>> distros.
>=20
> GCC 8 or above is needed since vDSO must be compiled with
> --fcf-protection=3Dbranch.

Fair enough. I don=E2=80=99t particularly want to carry a gross hack to add t=
he ENDBRANCHes without compiler support.


