Return-Path: <linux-doc+bounces-20980-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED79B9345A7
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jul 2024 03:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CBA81F22657
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jul 2024 01:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11ADE2C1AC;
	Thu, 18 Jul 2024 01:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mHvQQSxJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837361DA2F
	for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2024 01:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721265005; cv=none; b=MwAtsAJZlAxoJpZLwipFIpCSW7Om2iNHCPspJBMAoSCZfIOvy0wYcOi8gLliFf67h8G+5svaoA6p/y+IbQ50jjzpXemqb89Xg7pHyp+1ezsX5LOie9Htz+FksCVjYlyTN6DqpOG9o2PTvGahM/48MVd66d/vQ6MvL0JUnm0DPv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721265005; c=relaxed/simple;
	bh=UeqdEqQ9qaqakkZP50KbE0lEAt7K9mATOftkyIAZ5no=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ipVyEgIhmB50SWlReJIV2rGvKf0x5vx35cBYtNMWKMX6pbGHpVUezMGQAOvHE3+pMztgigDjnaAKkB3/opXICgAt1fyexMExZMUPadR5VONJn1xpu+9YVNkHU61TUQlPvMDRJKQjQnkR5Z4AcHCaVICM1Ns7oDheT2NOg0j6utg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mHvQQSxJ; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-44a8b140a1bso151911cf.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 18:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721264998; x=1721869798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMJuhChikF4wLeOBxp1PV2NNfAI2pBpeeewnSnEI4VI=;
        b=mHvQQSxJvJCF0R5IblScC8QinYv6mb30jXdR/vtIkVqD3fWca4xopYcOJI/C3HmnOw
         TkLxVLXpwLs/3sckbQTgimpcTWKQNg7Id/au5xbOTsXjbDTbsmX0ZlxKuXOql6NUX4NU
         tGoZ0D360+GdfQepvTlvTDazgemRzpDyy1zqQldFhY1Xseua97637Cs5gtkfCUWhLJ03
         NrhODM+ZW1v1Py4tLjwUyfwevHk6RiKLBEXpU9tph4qI59sOzL51YpV/8LcABwvBkteO
         wMabcYzZShfJA6njWd0Y8qp3MT8Jzn9MLXEMjKjp9a9SnAmqc01oRhNDiwM2eUSP1SR8
         3tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721264998; x=1721869798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMJuhChikF4wLeOBxp1PV2NNfAI2pBpeeewnSnEI4VI=;
        b=JhV0pWBll3nW4GOMtBhfPvIe8esYXQHRaGYqFPoXy7cZXOs4c53cO7jJU9Zt4W+e7r
         1xuqO0U5Ml/NeAbpwXEAV4vo3Zi/oUS2lPwcCFKKm2xMgQtIBdA58SRfH1loYt5fJwv0
         wCbRS32+EYj3V16WQy1kBKN17qsiFg/bT04DQOcJKFEuF6uNFTnb2KVrLqZ+snogzCVe
         43Z9DfUnhJNmjkbJHYncxfJmHMyl3SgXFWkwwaQ0CAv8w4YNZLvmB6gKZB/9588H4ksB
         XDsvPdPXGEPcVisCJ3He2iRW8AqgfiBCPkw2ZzsxUv6Tdt+5AiogFFcZSD6YjNtHwc0N
         EJVA==
X-Forwarded-Encrypted: i=1; AJvYcCVP++Dhy7C+PmtJ0xQKiT5KyhP2mkBaClqzzBDSZVkxlg6FzUdcbH/lDcmGeKf/e/BcV5jMQ9f5yuPnzbB0kol7iXQcP93+H6+X
X-Gm-Message-State: AOJu0YxaFJyr2c+5fJi/+YDnQ0itqhGi/U1u5IZ5zbzCA0uAxYly6tmM
	VXWoQvR7qjV1aeWQ2ycZ+TXdUMXQBW6Yw2du6pGrBeURY/37TA2NGHWcnOn2r81QFss9NXraR3y
	+/gcTsfiePN/KgYyq7L7HjgWt3YMiGhyRw8NA
X-Google-Smtp-Source: AGHT+IEZhvA4xdp3JDyHouO5xbLvgcqjQtJ68LnXmSiZSDoBs5IOa7uIURj+JfJnO87UzHFxvFPd5/pxTPCSC15wyGA=
X-Received: by 2002:a05:622a:17ce:b0:447:e04d:51b1 with SMTP id
 d75a77b69052e-44f923eff22mr662261cf.11.1721264998174; Wed, 17 Jul 2024
 18:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com>
 <DS0PR11MB637397059B5DAE2AA7B819BCDCA12@DS0PR11MB6373.namprd11.prod.outlook.com>
 <CADrL8HUv+RvazbOyx+NJ1oNd8FdMGd_T61Kjtia1cqJsN=WiOA@mail.gmail.com> <DS0PR11MB63735DAF7F168405D120A5C6DCA32@DS0PR11MB6373.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB63735DAF7F168405D120A5C6DCA32@DS0PR11MB6373.namprd11.prod.outlook.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 17 Jul 2024 18:09:21 -0700
Message-ID: <CADrL8HWM-DX48GudKuc-N5KizZCqy-RvppejzktmtHS62VbaeA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/18] KVM: Post-copy live migration for guest_memfd
To: "Wang, Wei W" <wei.w.wang@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, David Matlack <dmatlack@google.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 8:03=E2=80=AFAM Wang, Wei W <wei.w.wang@intel.com> =
wrote:
>
> On Wednesday, July 17, 2024 1:10 AM, James Houghton wrote:
> > You're right that, today, including support for guest-private memory
> > *only* indeed simplifies things (no async userfaults). I think your str=
ategy for
> > implementing post-copy would work (so, shared->private conversion fault=
s for
> > vCPU accesses to private memory, and userfaultfd for everything else).
>
> Yes, it works and has been used for our internal tests.
>
> >
> > I'm not 100% sure what should happen in the case of a non-vCPU access t=
o
> > should-be-private memory; today it seems like KVM just provides the sha=
red
> > version of the page, so conventional use of userfaultfd shouldn't break
> > anything.
>
> This seems to be the trusted IO usage (not aware of other usages, emulate=
d device
> backends, such as vhost, work with shared pages). Migration support for t=
rusted device
> passthrough doesn't seem to be architecturally ready yet. Especially for =
postcopy,
> AFAIK, even the legacy VM case lacks the support for device passthrough (=
not sure if
> you've made it internally). So it seems too early to discuss this in deta=
il.

We don't migrate VMs with passthrough devices.

I still think the way KVM handles non-vCPU accesses to private memory
is wrong: surely it is an error, yet we simply provide the shared
version of the page. *shrug*

>
> >
> > But eventually guest_memfd itself will support "shared" memory,
>
> OK, I thought of this. Not sure how feasible it would be to extend gmem f=
or
> shared memory. I think questions like below need to be investigated:

An RFC for it got posted recently[1]. :)

> #1 what are the tangible benefits of gmem based shared memory, compared t=
o the
>      legacy shared memory that we have now?

For [1], unmapping guest memory from the direct map.

> #2 There would be some gaps to make gmem usable for shared pages. For
>       example, would it support userspace to map (without security concer=
ns)?

At least in [1], userspace would be able to mmap it, but KVM would
still not be able to GUP it (instead going through the normal
guest_memfd path).

> #3 if gmem gets extended to be something like hugetlb (e.g. 1GB), would i=
t result
>      in the same issue as hugetlb?

Good question. At the end of the day, the problem is that GUP relies
on host mm page table mappings, and HugeTLB can't map things with
PAGE_SIZE PTEs.

At least as of [1], given that KVM doesn't GUP guest_memfd memory, we
don't rely on the host mm page table layout, so we don't have the same
problem.

For VMMs that want to catch userspace (or non-GUP kernel) accesses via
a guest_memfd VMA, then it's possible it has the same issue. But for
VMMs that don't care to catch these kinds of accesses (the kind of
user that would use KVM Userfault to implement post-copy), it doesn't
matter.

[1]: https://lore.kernel.org/kvm/20240709132041.3625501-1-roypat@amazon.co.=
uk/

>
> The support of using gmem for shared memory isn't in place yet, and this =
seems
> to be a dependency for the support being added here.

Perhaps I've been slightly preemptive. :) I still think there's useful
discussion here.

> > and
> > (IIUC) it won't use VMAs, so userfaultfd won't be usable (without chang=
es
> > anyway). For a non-confidential VM, all memory will be "shared", so sha=
red-
> > >private conversions can't help us there either.
> > Starting everything as private almost works (so using private->shared
> > conversions as a notification mechanism), but if the first time KVM att=
empts to
> > use a page is not from a vCPU (and is from a place where we cannot easi=
ly
> > return to userspace), the need for "async userfaults"
> > comes back.
>
> Yeah, this needs to be resolved for KVM userfaults. If gmem is used for p=
rivate
> pages only, this wouldn't be an issue (it will be covered by userfaultfd)=
.

We're on the same page here.

>
>
> >
> > For this use case, it seems cleaner to have a new interface. (And, as f=
ar as I can
> > tell, we would at least need some kind of "async userfault"-like mechan=
ism.)
> >
> > Another reason why, today, KVM Userfault is helpful is that userfaultfd=
 has a
> > couple drawbacks. Userfaultfd migration with HugeTLB-1G is basically
> > unusable, as HugeTLB pages cannot be mapped at PAGE_SIZE. Some discussi=
on
> > here[1][2].
> >
> > Moving the implementation of post-copy to KVM means that, throughout
> > post-copy, we can avoid changes to the main mm page tables, and we only
> > need to modify the second stage page tables. This saves the memory need=
ed
> > to store the extra set of shattered page tables, and we save the perfor=
mance
> > overhead of the page table modifications and accounting that mm does.
>
> It would be nice to see some data for comparisons between kvm faults and =
userfaultfd
> e.g., end to end latency of handling a page fault via getting data from t=
he source.
> (I didn't find data from the link you shared. Please correct me if I miss=
ed it)

I don't have an A/B comparison for kernel end-to-end fault latency. :(
But I can tell you that with 32us or so network latency, it's not a
huge difference (assuming Anish's series[2]).

The real performance issue comes when we are collapsing the page
tables at the end. We basically have to do ~2x of everything (TLB
flushes, etc.), plus additional accounting that HugeTLB/THP does
(adjusting refcount/mapcount), etc. And one must optimize how the
unmap MMU notifiers are called so as to not stall vCPUs unnecessarily.

[2]: https://lore.kernel.org/kvm/20240215235405.368539-1-amoorthy@google.co=
m/

>
>
> > We don't necessarily need a way to go from no-fault -> fault for a page=
, that's
> > right[4]. But we do need a way for KVM to be able to allow the access t=
o
> > proceed (i.e., go from fault -> no-fault). IOW, if we get a fault and c=
ome out to
> > userspace, we need a way to tell KVM not to do that again.
> > In the case of shared->private conversions, that mechanism is toggling =
the memory
> > attributes for a gfn.  For conventional userfaultfd, that's using
> > UFFDIO_COPY/CONTINUE/POISON.
> > Maybe I'm misunderstanding your question.
>
> We can come back to this after the dependency discussion above is done. (=
If gmem is only
> used for private pages, the support for postcopy, including changes requi=
red for VMMs, would
> be simpler)

