Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6716B178B40
	for <lists+linux-doc@lfdr.de>; Wed,  4 Mar 2020 08:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbgCDHY3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 4 Mar 2020 02:24:29 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:34362 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbgCDHY3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Mar 2020 02:24:29 -0500
Received: by mail-io1-f67.google.com with SMTP id z190so1308920iof.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2020 23:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.washington.edu; s=goo201206;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+0StPfC8X5r/f0uwQzYAuENN0Fy4oQ3SfFfmaNBTQnc=;
        b=X5H4VtDyPvqJAdUJVPRhTnJNzg0cr0lXQnBxXOFBn70TvIaxwS7X1BhYAA6rW6iMx/
         2KL8fW6WmM9hvIfkxJ9HJLlSveCUGVutVFlbs/Dn3AB07u+7H4rIDUAkprO6clAYF+fk
         Yp/tkE8C0hW1UN84pzTDY8f0QLod+qUSCGqHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+0StPfC8X5r/f0uwQzYAuENN0Fy4oQ3SfFfmaNBTQnc=;
        b=FDuVoLyEFXc4GN8aOmIBFphlUqhLzoezNKn7srEua1pwsyhLLuGLO+SWbS2KC6hTUJ
         5o7iryArRzsapUf/laxRe8niB3r3eCnnzex1MG8j9KBQqcsRhPPyijV40+x+XrM/DzCy
         Gv5dcyECSO9S+nGjLR+gOJPHJG+6618S6OS3GKZcobhcEatB+Te+X+StBFfUymwVFeDa
         JJ1vk7jCMpWOAQabyULzGbRo6t2cxJpKm1dku4n1ioDew7K+sMtpNqm+T8KKRfQ8reRi
         vh0lMSX8FOVxLww3WlGizxLo+nh4wQqO9geFFI2fn1D3rWrv/8ACoIugsiFgFt8hgJzu
         sMGQ==
X-Gm-Message-State: ANhLgQ1qyX/8LTKSw7r7zwGw3MRjTuAiqNSogtJzBnbRlHWVy0GPh7lK
        n1fcsnhh6GPtbCAW0fMrMe0NLtpHa1bCtnRRZ/PwoA==
X-Google-Smtp-Source: ADFU+vtDP7J5I0uMr20ywNsGyuaqUtek9TyRHdnutO5YfvwGkuTKwFkRZeZRpw6nW1oXLNcQ+vXM+/g2FixK4+iaGBM=
X-Received: by 2002:a02:a1c9:: with SMTP id o9mr1543147jah.33.1583306668640;
 Tue, 03 Mar 2020 23:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20200303005035.13814-1-luke.r.nels@gmail.com> <20200303005035.13814-3-luke.r.nels@gmail.com>
 <CAJ+HfNjgwVnxnyCTk5j+JCpxz+zmeEBYbj=_SueR750aAuoz=A@mail.gmail.com>
 <CADasFoBODSbgHHXU+iA-32=oKNs6n0Ff_UDU3063uiyGjx1xXg@mail.gmail.com> <CAJ+HfNhOp_Rbcqer0K=mZ8h+uswYSv4hSa3wCTdjjxH26HUTCw@mail.gmail.com>
In-Reply-To: <CAJ+HfNhOp_Rbcqer0K=mZ8h+uswYSv4hSa3wCTdjjxH26HUTCw@mail.gmail.com>
From:   Luke Nelson <lukenels@cs.washington.edu>
Date:   Tue, 3 Mar 2020 23:24:17 -0800
Message-ID: <CADasFoA3JN7PkvnVAmFZOFeDo2WgWzViankpwwRRWcjebSx+DQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 2/4] riscv, bpf: add RV32G eBPF JIT
To:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Cc:     bpf <bpf@vger.kernel.org>, Luke Nelson <luke.r.nels@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        Andrii Nakryiko <andriin@fb.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Xi Wang <xi.wang@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> I like that, but keep the first patch as a refactoring patch only, and
> then in a *new* patch 2 you add the rv32 specific code (sltu and
> pseudo instructions + the xlen preprocessor check + copyright-things
> ;-)).  Patch 3 will be the old patch 2. Wdyt?

Thanks! I'll make sure that patch 1 is for renaming bpf_jit_comp.c
and factoring code out. Do you think it's reasonable to add the
RV32-specific code to the header in the same patch that adds the
RV32 JIT implementation (patch 2)? It might make sense to commit
them together.

The full plan for v5 would be:

Patch 1

- Refactor existing code to bpf_jit.h and bpf_jit_core.c
  + Including the minor modifications to build_body() and
  bpf_int_jit_compile() (These are unrelated to RV32 and we could
  forego these tweaks).
  + Also making emit_insn and build_{prologue,epilogue} non-static
  and renaming them to be prefixed with "bpf_jit_".
- Rename bpf_jit_comp.c to bpf_jit_comp64.c

Patch 2

- Add the RV32 BPF JIT implementation to bpf_jit_comp32.c and
RV32-specific changes to bpf_jit.h.

Patch 3

- Update documentation.

Patch 4

- Update MAINTAINERS.

Thanks again,

Luke
