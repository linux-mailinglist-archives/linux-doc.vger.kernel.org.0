Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD901212C78
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2020 20:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgGBSnv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 2 Jul 2020 14:43:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59021 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726065AbgGBSnv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Jul 2020 14:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593715429;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=eBs9fJWNeYySdMcu8KtkWgGYnn/ATIhNzdp6AqWn/po=;
        b=HoLWrgpwPQf4+ccF4lEaRRRpUeRyBcqOIlKnAQeqUnqjGLdgzpa5nKH2EqaWI1wwYMUgzt
        Vwg/NvFiIMOirJQRTgojI8zhdfuxQo2rXLE3bdbUjVnN5u2t9PwjBuSDEgoDyqKWkIF3WJ
        dnuCRsSoYYMJywTwZD7j1IN7TrdDwM8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-WERl0DqDNK2S-PoCGns3eg-1; Thu, 02 Jul 2020 14:43:44 -0400
X-MC-Unique: WERl0DqDNK2S-PoCGns3eg-1
Received: by mail-qk1-f200.google.com with SMTP id h4so19263245qkl.23
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2020 11:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eBs9fJWNeYySdMcu8KtkWgGYnn/ATIhNzdp6AqWn/po=;
        b=gWvm3L/uGr2icOSZlGvybhiNeECNffTYGRtM+VdDJ478PyrZlzUqmPc/fmC8vJ1J9r
         X6hBVNrJ2VY2DPvC/zi9idDSZKrxsG6HcUyTHBXA/NQp5Iklpjl3jyEL7P5aSSNMJzVS
         Q61Hjgd9s+SQt/opN/gJ+2mtqr+zeXNLoJQLNVX8CiEjDIt/JGwY63XS/uZ/6fy1Putd
         A5maDj9nH+XPwV4mHr6P10Fl6lB8eLrBRdwt6iEykRrVH3893n1iTKunapnGRIIwfqoM
         4tXvViKKiUBNOa4SXJLj4/ngz4zHZk+FnIBhHwG7T3PSrn+XQyphfl/el1VQIAltxEuH
         rRIw==
X-Gm-Message-State: AOAM5312DjLCX/ge+cuRMs+h3l78q7v4ixrDqsHDrD7/RTQ7UjrcEVgv
        sNBbe7zRt4XqUg4nmYlagBGArKBW01Q8LIZEMAek1O3WCNSSbJTuELN0b9X9zqftLVjt3nvhBkX
        DX/XAsoV0lFKvO1T6PvjvRUgSXL1eUQuNE1hQ
X-Received: by 2002:ac8:429b:: with SMTP id o27mr21484395qtl.124.1593715423282;
        Thu, 02 Jul 2020 11:43:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeunlLTSmJ7ldLPyyGx2hly92ochyhDWedphYsrnNnrZbxzUOcSEgJ30myWyCcqcZPawXx+2/U/YGBr1VRid4=
X-Received: by 2002:ac8:429b:: with SMTP id o27mr21484372qtl.124.1593715422996;
 Thu, 02 Jul 2020 11:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <1589395957-24628-1-git-send-email-bhsharma@redhat.com> <159370984726.27923.4874334372278158979.b4-ty@arm.com>
In-Reply-To: <159370984726.27923.4874334372278158979.b4-ty@arm.com>
From:   Bhupesh Sharma <bhsharma@redhat.com>
Date:   Fri, 3 Jul 2020 00:13:31 +0530
Message-ID: <CACi5LpNUDmoMkEuHvw0Asg=OHJCB3SfZR7XmuyzpFdSkdb5vjw@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Append new variables to vmcoreinfo (TCR_EL1.T1SZ
 for arm64 and MAX_PHYSMEM_BITS for all archs)
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     x86@kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Amit Kachhap <amit.kachhap@arm.com>,
        Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        John Donnelly <john.p.donnelly@oracle.com>,
        Scott Branden <scott.branden@broadcom.com>,
        Boris Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bhupesh SHARMA <bhupesh.linux@gmail.com>,
        Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Steve Capper <steve.capper@arm.com>,
        kexec mailing list <kexec@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        James Morse <james.morse@arm.com>,
        Dave Anderson <anderson@redhat.com>,
        linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 2, 2020 at 10:45 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Thu, 14 May 2020 00:22:35 +0530, Bhupesh Sharma wrote:
> > Apologies for the delayed update. Its been quite some time since I
> > posted the last version (v5), but I have been really caught up in some
> > other critical issues.
> >
> > Changes since v5:
> > ----------------
> > - v5 can be viewed here:
> >   http://lists.infradead.org/pipermail/kexec/2019-November/024055.html
> > - Addressed review comments from James Morse and Boris.
> > - Added Tested-by received from John on v5 patchset.
> > - Rebased against arm64 (for-next/ptr-auth) branch which has Amit's
> >   patchset for ARMv8.3-A Pointer Authentication feature vmcoreinfo
> >   applied.
> >
> > [...]
>
> Applied to arm64 (for-next/vmcoreinfo), thanks!
>
> [1/2] crash_core, vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
>       https://git.kernel.org/arm64/c/1d50e5d0c505
> [2/2] arm64/crash_core: Export TCR_EL1.T1SZ in vmcoreinfo
>       https://git.kernel.org/arm64/c/bbdbc11804ff

Thanks Catalin for pulling in the changes.

Dave and James, many thanks for reviewing the same as well.

Regards,
Bhupesh

