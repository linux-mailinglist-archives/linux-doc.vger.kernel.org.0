Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B42FE3989F
	for <lists+linux-doc@lfdr.de>; Sat,  8 Jun 2019 00:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731398AbfFGW1U (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 Jun 2019 18:27:20 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42275 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731266AbfFGW1U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jun 2019 18:27:20 -0400
Received: by mail-pg1-f195.google.com with SMTP id e6so1848810pgd.9
        for <linux-doc@vger.kernel.org>; Fri, 07 Jun 2019 15:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=hraLxNELwM1NZ3lrrobGX779u9y1WVgm2X9KZ6MnzVU=;
        b=fAQwIxWx36GcX9oIEt7f+jVMHginM+LONwFdfMNqwIhko+8c0QHYbEF8bNlyIqbI9j
         NQNEvOKC/rk/tH80WaLOxYfIeLrNuLs39w+NLcIj3q54Q271veY67rrkNFKpfdqfZfj7
         zJroDKjRWmVDQ90XGnNScGmFaTzL9du1I7zDspqbrM6NsrWdM1i+JbmO4PVz/elLIgeu
         6BrmpgiXUF9dz/S6HaFuV5ThOeSRhvAkGNBoMZMOPzaVaIgbNw2niqpkC+G9ce07EdDH
         qP3J8OITji6PPDgyiEOb7pbi42mIE/z0MQOvU/LZER5Na/CvkkoUFll6uwuMASm3splg
         LFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=hraLxNELwM1NZ3lrrobGX779u9y1WVgm2X9KZ6MnzVU=;
        b=CVdrepkc1cysZ/z/BJANNpJe+vcrci6zMw4unJDWGPviX+ttlDkBLTcvR3PsjoenEG
         NXoqx+UrNVUIRaajMrJ877v3bjxR0mKIsPmOqiZ7Ft3vphErFQ9oZORG6Xiyr+5oDg88
         CYILabqMzT1C+o4TvFhKIKTXJZQdzbqQOekybOJ/0Bwt9iNCFKLkYmKbJPgcKmGRB0OP
         mcURVtNLazK365VLSyNHQk+bFBTBENj0oP4aU1UApuNlhX5I/eVGxox4MYAAlFDJCFuK
         hd4MyAFTSEqNserQZrodJZBhroXo202UvS1nMWxxEKWf/qpChVtsOFIfUPE5HEb/leqt
         vYpg==
X-Gm-Message-State: APjAAAXvBQMEwcm3IxpFoWvKgRkd3v/qj+RJNqBUaD5NZsCWnhaR6M1K
        yaJ2S7z0tK7GATT2QrzWlarpUA==
X-Google-Smtp-Source: APXvYqwFO3Q0DLnvBTYrA6mi0dVS8BZ1iVqUNQ4tJLNaZqwnxT+p/ehoHtcdu1qHh/Y6c+cHQmyQLA==
X-Received: by 2002:a62:3287:: with SMTP id y129mr55579697pfy.101.1559946439420;
        Fri, 07 Jun 2019 15:27:19 -0700 (PDT)
Received: from ?IPv6:2600:1012:b018:c314:403f:c95d:60d3:b732? ([2600:1012:b018:c314:403f:c95d:60d3:b732])
        by smtp.gmail.com with ESMTPSA id 2sm3147331pfo.41.2019.06.07.15.27.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 15:27:18 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v7 03/14] x86/cet/ibt: Add IBT legacy code bitmap setup function
From:   Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (16F203)
In-Reply-To: <f6de9073-9939-a20d-2196-25fa223cf3fc@intel.com>
Date:   Fri, 7 Jun 2019 15:27:16 -0700
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>,
        Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4F7D0C3C-F239-4B67-BB05-31350F809293@amacapital.net>
References: <20190606200926.4029-1-yu-cheng.yu@intel.com> <20190606200926.4029-4-yu-cheng.yu@intel.com> <20190607080832.GT3419@hirez.programming.kicks-ass.net> <aa8a92ef231d512b5c9855ef416db050b5ab59a6.camel@intel.com> <20190607174336.GM3436@hirez.programming.kicks-ass.net> <b3de4110-5366-fdc7-a960-71dea543a42f@intel.com> <34E0D316-552A-401C-ABAA-5584B5BC98C5@amacapital.net> <7e0b97bf1fbe6ff20653a8e4e147c6285cc5552d.camel@intel.com> <4b448cde-ee4e-1c95-0f7f-4fe694be7db6@intel.com> <0e505563f7dae3849b57fb327f578f41b760b6f7.camel@intel.com> <f6de9073-9939-a20d-2196-25fa223cf3fc@intel.com>
To:     Dave Hansen <dave.hansen@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> On Jun 7, 2019, at 2:09 PM, Dave Hansen <dave.hansen@intel.com> wrote:
>=20
> On 6/7/19 1:06 PM, Yu-cheng Yu wrote:
>>> Huh, how does glibc know about all possible past and future legacy code
>>> in the application?
>> When dlopen() gets a legacy binary and the policy allows that, it will ma=
nage
>> the bitmap:
>>=20
>>  If a bitmap has not been created, create one.
>>  Set bits for the legacy code being loaded.
>=20
> I was thinking about code that doesn't go through GLIBC like JITs.

CRIU is another consideration: it would be rather annoying if CET programs c=
an=E2=80=99t migrate between LA57 and normal machines.=
