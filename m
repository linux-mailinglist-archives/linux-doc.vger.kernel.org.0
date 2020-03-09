Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3CE817EB9D
	for <lists+linux-doc@lfdr.de>; Mon,  9 Mar 2020 23:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgCIWCv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 Mar 2020 18:02:51 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45888 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbgCIWCv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Mar 2020 18:02:51 -0400
Received: by mail-pf1-f193.google.com with SMTP id 2so5446374pfg.12
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2020 15:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=B5OgwLbxTYL8rRn4EF2MAfAN7hpkfoK750t2M4UCwgo=;
        b=k7m0mMFH+E9q0CRxNmkcw/WjIiU3u8HYrkthyvX44sVEWwSTtlfL9zkRTWaymm0suE
         z/oxWHIuh8U6qpYlzE/uQv8I2nH9Cq7mWonmkYvAA8FFoEtNExjsUyB3EkAR5IIui3Ws
         +ZMeEfw+tUooprJRQE2K4pBEIO+Krj+J200DwENOWzFav0P5RAzc3ZcoEkQn+KZ47yOP
         sdY2c3TneVv0k2YoQhIYlkhgHyfLOenohLqOLf4d/BxIX9wXrvTZrJtuN4qlRQwHs3sN
         XaZtsypjg/xuhgxYLejS54RIfQ8WhqX/OAyaeMB6VFTlZEOYPGbWmt8vZtK38VR6V4UD
         z3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=B5OgwLbxTYL8rRn4EF2MAfAN7hpkfoK750t2M4UCwgo=;
        b=F8QiYRhKCwK6OltYRevPJKg46IuHKwVWgMlsp0uGl7ApCbs/CLxhbcFDCClnFkB0mm
         fIYHen6L4TBHjHSRaADjxdVm+ImzT2A41u05kmhZHTGU1RtPztYK9fXOhufZsUSf4GHp
         e7sn576LziKChDScdFEQjvDQ+vzIqZ/8U/shE/SzL1djBtPYWYW8BxP5JXPE6LbyaGdD
         EUJml66Z6Hf5MawgnCtqFB4RM9uSC3jrl3GM4ARs3207moYeAB8UuotGx5e2FAP4F+iS
         jzGjqPmvsF975XEfAGrf8jFMe65is+CfbjP9LLbvB1gO+wPZo3Fnreh6uVzkoc8YNFKc
         oreQ==
X-Gm-Message-State: ANhLgQ1cLqcWp8mI4F3GJZ9oOWXHifRGLTuU6TUFyJtd7htLrR4GE31r
        hGR5FzD93WrnpuCtNAmYhrmHaQ==
X-Google-Smtp-Source: ADFU+vsx7LnRrhN+zK+Ce/q90rwl9eKyvQc5jsl61yoaiGP1sPVaeB+aS/NwpUfls6ugHik69LHdsA==
X-Received: by 2002:aa7:8805:: with SMTP id c5mr19035175pfo.142.1583791369790;
        Mon, 09 Mar 2020 15:02:49 -0700 (PDT)
Received: from ?IPv6:2600:1010:b008:e441:7cf7:7af3:4ebc:f96b? ([2600:1010:b008:e441:7cf7:7af3:4ebc:f96b])
        by smtp.gmail.com with ESMTPSA id y28sm21152320pgc.69.2020.03.09.15.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 15:02:48 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v9 01/27] Documentation/x86: Add CET description
Date:   Mon, 9 Mar 2020 15:02:47 -0700
Message-Id: <2F4A39C5-34EF-4D41-A178-08C34FFA9762@amacapital.net>
References: <CAMe9rOqf0OHL9397Vikgb=UWhRMf+FmGq-9VAJNmfmzNMMDkCw@mail.gmail.com>
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
In-Reply-To: <CAMe9rOqf0OHL9397Vikgb=UWhRMf+FmGq-9VAJNmfmzNMMDkCw@mail.gmail.com>
To:     "H.J. Lu" <hjl.tools@gmail.com>
X-Mailer: iPhone Mail (17D50)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> On Mar 9, 2020, at 2:13 PM, H.J. Lu <hjl.tools@gmail.com> wrote:
>=20
> =EF=BB=BFOn Mon, Mar 9, 2020 at 1:59 PM Dave Hansen <dave.hansen@intel.com=
> wrote:
>>=20
>> On 3/9/20 1:54 PM, H.J. Lu wrote:
>>>> If a program with the magic ELF CET flags missing can=E2=80=99t make a
>>>> thread with IBT and/or SHSTK enabled, then I think we=E2=80=99ve made a=
n
>>>> error and should fix it.
>>>>=20
>>> A non-CET program can start a CET program and vice versa.
>>=20
>> Could we be specific here, please?
>>=20
>> HJ are you saying that:
>> * CET program can execve() a non-CET program, and
>> * a non-CET program can execve() a CET program
>>=20
>> ?
>=20
> Yes.
>=20
>> That's obvious.
>>=20
>> But what are the rules for clone()?  Should there be rules for
>> mismatches for CET enabling between threads if a process (not child
>> processes)?
>=20
> What did you mean? A threaded application is either CET enabled or not
> CET enabled.   A new thread from clone makes no difference.

Why?  Dave=E2=80=99s example seems like a good reason to allow per-thread co=
ntrol.



>=20
> --=20
> H.J.
