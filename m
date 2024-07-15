Return-Path: <linux-doc+bounces-20740-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA00A931D85
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jul 2024 01:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91E9D1F224B8
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jul 2024 23:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63BD113DBB1;
	Mon, 15 Jul 2024 23:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0LDvVCLs"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05239208A9
	for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2024 23:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721085346; cv=none; b=Zfr58p6wTHM2An+DY9ImImhNnvtjZ6WeOpq108d/C9uNF7ojT4v8hgLFXItM+5CrKbIHU3M9NUVwSicUwwVAgDc5VrfUi8CO/uxyHoniLWUenUBmhnQo36RdudiTQYMeGeJNW8l63O0wKwM2mZjXblTnak7iPloAjw3amW2EkP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721085346; c=relaxed/simple;
	bh=Q98GzkXhuy8Mqk8ABLLqoDEDauT65uD8JlHGR1iepyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PV1mx/LbQ4RC4ewR027N1B1xfBwheqbTUJoXwHrC/GobCSiKTvc94RzEhtflVkaQXSfK8iZfZUVYCKu//HoWY0akeSixm9SdPl1nrTFH4mg3neTJ7yPhHmlphKOqQ/3yz7vlUvW3LX5bO/YqiEZDtaaWONbbgFRWxMHdxmdBzLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0LDvVCLs; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fb2936c4ccso88065ad.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2024 16:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721085344; x=1721690144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exEH9iPNcIg3KpVyQ+q3mCt+4C/Fcr8/ESkE/4SO1o8=;
        b=0LDvVCLsRRWkXspdoczva2BMbEromBfdpIAsheczfEtZoJKvkQbEpyZpn3Im1wfF5W
         UZcacuZtGj9elg8sx7Oh82BwhQwLniqwV5wUgMkcibw1GoNLDlnFpGRh09sscubHGCY0
         omhPBnTmQAn0SW3uD8x9gEzhT8KXhvXayTCyhmT2kVbOj5wI5FqxTvds00KAQrq23OZW
         rXGxttPZXx9Gj5mSxRFa99vT1pxaZtaqd7cZR1VJcWyV03MKdajBZj9hMdchlpuaxTSE
         UX7FN0Vmd1kGB8uPXdukWL7gSjvQIZP4U9T7QXx025JZLj9w4mLChmvqKZKrinJ5l+dC
         CQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721085344; x=1721690144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exEH9iPNcIg3KpVyQ+q3mCt+4C/Fcr8/ESkE/4SO1o8=;
        b=j6IdXG00bBH0Qs8BJpW5etMIII0ASt6psdJ2E9CBABADVQJ/F2MI93fsXXgE94JNvj
         mCwpCQJpb4eSd3G6chfGAFQINlNDo02Gl2yd4WZA31lRtr5DIP31cNPRcYnTAX1fpZko
         nhns0qXshyqTOLoIZ1T1zk3FfByVaAQlCaw/xf/QvtAOmOj53E8y4nftT4bFD/WPIZ+Z
         n3r1rCACrtQ2Hramq8pGTIkjq3iN9JPkV/O+OyfYURjl+VfQnpbJpxMbKzEw+LrtoVTO
         ixgvy0FqPBi2zLG/Q4nrC54aAqEZRbNwqbHvU9K+v/diG4gorU0Xrs2ZaZguMb5fZ3jQ
         77AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRsI1dSNOCy4zQT7TyWjycri7hGUFYc1Zrh0iWPQzW3SP/yOX5pDJRvbIKGD4Onw5bJzdFZK7xxx87sNcASgSboPs9qFp7+JJF
X-Gm-Message-State: AOJu0Yy9HMSKrGhg/2FWDPhc15Sc30+kxYKhiAggDnSS8rTOLB99VOIk
	zdxfYZiFYn/NQBLOJsrFPh8el4gNvMyeUEZn1YFjDsZDDowtdl+EQuawasb/JVfc+D2B1w3D2Bt
	DWu7sZmbUQ2hMt734KL4IyHRdm4kecisJMvVj
X-Google-Smtp-Source: AGHT+IF37bptgINSCLE9dDjInkdJLhm19J5sk44W8p8j4cV76p1iCJXBcZEjJTiahXiPn4ncuCw2O5xLUjXDk1VNB9o=
X-Received: by 2002:a17:902:f688:b0:1fb:2924:5c7e with SMTP id
 d9443c01a7336-1fc3d7698a7mr591975ad.11.1721085344002; Mon, 15 Jul 2024
 16:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADrL8HUW2q79F0FsEjhGW0ujij6+FfCqas5UpQp27Epfjc94Nw@mail.gmail.com>
 <ZmxsCwu4uP1lGsWz@google.com> <CADrL8HVDZ+m_-jUCaXf_DWJ92N30oqS=_9wNZwRvoSp5fo7asg@mail.gmail.com>
 <ZmzPoW7K5GIitQ8B@google.com> <CADrL8HW3rZ5xgbyGa+FXk50QQzF4B1=sYL8zhBepj6tg0EiHYA@mail.gmail.com>
 <ZnCCZ5gQnA3zMQtv@google.com> <CADrL8HW=kCLoWBwoiSOCd8WHFvBdWaguZ2ureo4eFy9D67+owg@mail.gmail.com>
 <CADrL8HUv6T4baOi=VTFV6ZA=Oyn3dEc6Hp9rXXH0imeYkwUhew@mail.gmail.com>
 <Zo137P7BFSxAutL2@google.com> <CADrL8HW4PLTeC9Gq3Fd43-idjzOw8mXOzzG_RP1TYVoGp1_g+g@mail.gmail.com>
 <ZpFGYvCAQWhldWJZ@google.com>
In-Reply-To: <ZpFGYvCAQWhldWJZ@google.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 15 Jul 2024 16:15:06 -0700
Message-ID: <CADrL8HXLGj-V0Qd8U3xRXnJeMTKOJqB-TsyLTOo8j0sGo2byBw@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] mm: Add test_clear_young_fast_only MMU notifier
To: Sean Christopherson <seanjc@google.com>
Cc: Yu Zhao <yuzhao@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Wei Xu <weixugc@google.com>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 8:06=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Jul 10, 2024, James Houghton wrote:
> > 1. Drop the WAS_FAST complexity.
> > 2. Add a function like mm_has_fast_aging_notifiers(), use that to
> > determine if we should be doing look-around.
>
> I would prefer a flag over a function.  Long-term, if my pseudo-lockless =
rmap
> idea pans out, KVM can set the flag during VM creation.  Until then, KVM =
can set
> the flag during creation and then toggle it in (un)account_shadowed().  R=
aces
> will be possible, but they should be extremely rare and quite benign, all=
 things
> considered.

So I think you're talking about .has_fast_aging bool on struct
mmu_notifier, and we would do look-around if that is set, right? So
we'd need to have something like mm_has_fast_aging_notifiers() to
check if any of the subscribed mmu notifiers have .has_fast_aging.

We could toggle it in (un)account_shadowed(), but I think I'd need to
demonstrate some performance win to justify it.

