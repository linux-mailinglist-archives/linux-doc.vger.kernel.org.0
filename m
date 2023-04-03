Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE2936D4D71
	for <lists+linux-doc@lfdr.de>; Mon,  3 Apr 2023 18:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjDCQWT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Apr 2023 12:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232849AbjDCQWJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Apr 2023 12:22:09 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4EDA1BF5
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 09:22:08 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id q14so30934168ljm.11
        for <linux-doc@vger.kernel.org>; Mon, 03 Apr 2023 09:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1680538927; x=1683130927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFwQPWx8Ux6bh8rA+x2qSR6v2JLfRrPIjTrTWUE6sUM=;
        b=C6FDzj3IPNk0iZwTtYTIzDWf+zQLV0fFBOn/WSZoISjvBbt895huzfD8M5OUx845t0
         m8Pk0sCXupjSDGoBMREKJJzJuX6qZl3Hw8LjpE9oy+Pp/jtbP0g1tBOSRzBjfWfJUlB7
         F35QIlUm7r3oRUXFEaWl3UnxC+I3xy4RNXrY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680538927; x=1683130927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFwQPWx8Ux6bh8rA+x2qSR6v2JLfRrPIjTrTWUE6sUM=;
        b=iJ9MoMTxpdsLelFi9/88COQELrgXEbtf+LCCNo5dD3jEvCXUdhMjTHo/6dFznZ5H5e
         BFJItfjf+kSR73Nm+zP0NTzwi4HjSGaxD/vWoucNlC/+LnCXVKJh0corsvwst/oixyTY
         ATFD+Xb1ebtHQKklRoJaQzKPp/J2smYCCh4/o3ekJY7fwo+Qynv5feZViagmQBcXceUf
         i2q8QVPJn06GJgAxjfQtyeHzsxh20g/XKbAznGcuKhSUVoI5+/Z1UjFtKwIqrICGZiFU
         xs7NifkRuh/CUcmx0Fo4ul6hG4I7nZOfSYRuwg9kARQEVo+xE29Z88u4GJPjwCk6KeIZ
         y50Q==
X-Gm-Message-State: AAQBX9dN5P9VMyxDYS+lWm1xSL2kpd4Y9mLTcnHQl6jaKOmrAFDMprco
        j5K5FHrDKOgfPZ1+zB9YBp3nNI1rScfJzsIjAilT6A==
X-Google-Smtp-Source: AKy350ay29LLgY8kFM5kcKwfJDHLJEoMGBHu9m/GmUR6KWNGJ+PEpU98FnF4wd4kdzbiIxuzy/pSOQ==
X-Received: by 2002:a2e:82ce:0:b0:29b:6fcf:d2e8 with SMTP id n14-20020a2e82ce000000b0029b6fcfd2e8mr5511ljh.53.1680538926809;
        Mon, 03 Apr 2023 09:22:06 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id m9-20020a2e8709000000b002996e0e6461sm1817070lji.29.2023.04.03.09.22.05
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 09:22:05 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id c29so38829759lfv.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Apr 2023 09:22:05 -0700 (PDT)
X-Received: by 2002:a17:907:3e16:b0:932:da0d:9375 with SMTP id
 hp22-20020a1709073e1600b00932da0d9375mr11670367ejc.4.1680538904942; Mon, 03
 Apr 2023 09:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230403140605.540512-1-jiangshanlai@gmail.com> <20230403140605.540512-3-jiangshanlai@gmail.com>
In-Reply-To: <20230403140605.540512-3-jiangshanlai@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 3 Apr 2023 09:21:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=whY8tkKJoFjzP1-kR5rqCmgTEiX2i+GJgjdJcn+q+3HTQ@mail.gmail.com>
Message-ID: <CAHk-=whY8tkKJoFjzP1-kR5rqCmgTEiX2i+GJgjdJcn+q+3HTQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/7] x86/entry: Add IST main stack
To:     Lai Jiangshan <jiangshanlai@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Lai Jiangshan <jiangshan.ljs@antgroup.com>,
        "H. Peter Anvin" <hpa@linux.intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Andy Lutomirski <luto@kernel.org>,
        Asit Mallick <asit.k.mallick@intel.com>,
        Cfir Cohen <cfir@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Hansen <dave.hansen@intel.com>,
        David Kaplan <David.Kaplan@amd.com>,
        David Rientjes <rientjes@google.com>,
        Dirk Hohndel <dirkhh@vmware.com>,
        Erdem Aktas <erdemaktas@google.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>,
        Juergen Gross <jgross@suse.com>,
        Kees Cook <keescook@chromium.org>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        Mike Stunes <mstunes@vmware.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Raj Ashok <ashok.raj@intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Tony Luck <tony.luck@intel.com>, kvm@vger.kernel.org,
        linux-coco@lists.linux.dev, x86@kernel.org,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 3, 2023 at 7:05=E2=80=AFAM Lai Jiangshan <jiangshanlai@gmail.co=
m> wrote:
>
> diff --git a/Documentation/x86/kernel-stacks.rst b/Documentation/x86/kern=
el-stacks.rst
> index 6b0bcf027ff1..be89acf302da 100644
> --- a/Documentation/x86/kernel-stacks.rst
> +++ b/Documentation/x86/kernel-stacks.rst
> @@ -105,6 +105,8 @@ The currently assigned IST stacks are:
>    middle of switching stacks.  Using IST for MCE events avoids making
>    assumptions about the previous state of the kernel stack.
>
> +* ESTACK_IST. bla bla
> +
>  For more details see the Intel IA32 or AMD AMD64 architecture manuals.

Maybe the cover letter description could be used here, rather than the
"bla bla" placeholder?

              Linus
