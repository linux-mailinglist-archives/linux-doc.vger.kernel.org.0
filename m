Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52E23190257
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2020 00:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgCWX45 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 23 Mar 2020 19:56:57 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42167 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgCWX44 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Mar 2020 19:56:56 -0400
Received: by mail-ot1-f66.google.com with SMTP id s18so5833360otr.9
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2020 16:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ix8wgcI17GVIT6csUF0tAYBE2LaGOYJ65o4zi4Z+Z6c=;
        b=cxRClrgaWN/fpDic28j6dquzcmGVw+xYCBcb9evltHJpyFpceHUzfKZJMIJhOLclFx
         Yn2A3TP5Stbe0rKKKA/IDNeP6sQu7YUUq74s5fXrAmxwnECa9lFLzGP2bXzZ2DmVKPgL
         UDLguXXmIlABThiCSt5lssfGYmuDsDVHy3ovX3K/B0/plnPrQcOqebITxOQuZ/DZffwT
         OhGqRBkkNp3UqEPletWR4FAIHWjJFvKqYVN8qCAzkXSZ9bQ7aH/jjGGf8ucrXstsZArj
         gA7y7Jxp7obe4aoMrhUye9oj3Q9UqQfJGy1EH69U31823NIqpoSP5pj6ibFOe6U4weCd
         K+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ix8wgcI17GVIT6csUF0tAYBE2LaGOYJ65o4zi4Z+Z6c=;
        b=ZwbFht1WiXeaNYyY6GaBZeRd0j+ZqCATMDM0BOs2nXxyjcbTS3pIszGZvLb+KpZndz
         gNeyOC8wc9Vz/OGPrT/soa5DnIKW3yYdf/MAWdX1T90F75pMYoDbEcypD9SyAQm6sjmo
         3N6aDveTmOg3twK0gOYv+WqYNVhTa9Vo7aZV5leNp2dU7SyakY+k/nf2H7Jxr9ToIf+0
         EcfVoc6rfg3t9cvB9yeSbX6Z4pheW5qULgOnJeR/UPgtIxLyf/MxZwsm/A2KxGDQb6PT
         HB4Kys+NTnwJDjEsqQHKYOrPX+yrfy5GoPUSSHL+c6OIrqeld9B9SpAmlxdxxA96IpHV
         vv8w==
X-Gm-Message-State: ANhLgQ2CbrhM4l2KjXEpKSi3VVTBhG1RVvbTi1h/G+S7krb+hzj29kkZ
        FoWb1c2ZMPsVmW86CkYPSyDn1NZZB2rEs+7L5/cEUA==
X-Google-Smtp-Source: ADFU+vuDPdpSQy4eIZVOQE+DA/YA6x9KuEZDOGaV/GyUNXkAFHrjBMzNKJjNEWfmfUZNmYn+XKHPMpfaDEYyQ1QtrIo=
X-Received: by 2002:a05:6830:1e10:: with SMTP id s16mr4024265otr.33.1585007814217;
 Mon, 23 Mar 2020 16:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200318220634.32100-1-mike.kravetz@oracle.com>
 <20200318220634.32100-3-mike.kravetz@oracle.com> <2ca058dc-47e6-1d08-154b-77d2cbe98e34@c-s.fr>
In-Reply-To: <2ca058dc-47e6-1d08-154b-77d2cbe98e34@c-s.fr>
From:   Mina Almasry <almasrymina@google.com>
Date:   Mon, 23 Mar 2020 16:56:43 -0700
Message-ID: <CAHS8izOeYeVi-W7z-DKw3Uv0rAqwuD1__uTr-oF6Lx=V9ekm3g@mail.gmail.com>
Subject: Re: [PATCH 2/4] hugetlbfs: move hugepagesz= parsing to arch
 independent code
To:     Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Linux-MM <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-doc@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Longpeng <longpeng2@huawei.com>, Will Deacon <will@kernel.org>,
        "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 19, 2020 at 12:04 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
>
>
> Le 18/03/2020 =C3=A0 23:06, Mike Kravetz a =C3=A9crit :
> > Now that architectures provide arch_hugetlb_valid_size(), parsing
> > of "hugepagesz=3D" can be done in architecture independent code.
> > Create a single routine to handle hugepagesz=3D parsing and remove
> > all arch specific routines.  We can also remove the interface
> > hugetlb_bad_size() as this is no longer used outside arch independent
> > code.
> >
> > This also provides consistent behavior of hugetlbfs command line
> > options.  The hugepagesz=3D option should only be specified once for
> > a specific size, but some architectures allow multiple instances.
> > This appears to be more of an oversight when code was added by some
> > architectures to set up ALL huge pages sizes.
> >
> > Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> > ---
> >   arch/arm64/mm/hugetlbpage.c   | 15 ---------------
> >   arch/powerpc/mm/hugetlbpage.c | 15 ---------------
> >   arch/riscv/mm/hugetlbpage.c   | 16 ----------------
> >   arch/s390/mm/hugetlbpage.c    | 18 ------------------
> >   arch/sparc/mm/init_64.c       | 22 ----------------------
> >   arch/x86/mm/hugetlbpage.c     | 16 ----------------
> >   include/linux/hugetlb.h       |  1 -
> >   mm/hugetlb.c                  | 24 ++++++++++++++++++------
> >   8 files changed, 18 insertions(+), 109 deletions(-)
> >
>
> [snip]
>
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 2f99359b93af..cd4ec07080fb 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -3149,12 +3149,6 @@ static int __init hugetlb_init(void)
> >   }
> >   subsys_initcall(hugetlb_init);
> >
> > -/* Should be called on processing a hugepagesz=3D... option */
> > -void __init hugetlb_bad_size(void)
> > -{
> > -     parsed_valid_hugepagesz =3D false;
> > -}
> > -
> >   void __init hugetlb_add_hstate(unsigned int order)
> >   {
> >       struct hstate *h;
> > @@ -3224,6 +3218,24 @@ static int __init hugetlb_nrpages_setup(char *s)
> >   }
> >   __setup("hugepages=3D", hugetlb_nrpages_setup);
> >
> > +static int __init hugepagesz_setup(char *s)
> > +{
> > +     unsigned long long size;
> > +     char *saved_s =3D s;
> > +
> > +     size =3D memparse(s, &s);
>
> You don't use s after that, so you can pass NULL instead of &s and avoid
> the saved_s
>

+1

Acked-by: Mina Almasry <almasrymina@google.com>
