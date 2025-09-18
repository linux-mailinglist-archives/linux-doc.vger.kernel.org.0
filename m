Return-Path: <linux-doc+bounces-58866-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AB6B445B3
	for <lists+linux-doc@lfdr.de>; Thu,  4 Sep 2025 20:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B370EA0787C
	for <lists+linux-doc@lfdr.de>; Thu,  4 Sep 2025 18:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AC5253F1A;
	Thu,  4 Sep 2025 18:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zt77tJU/"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB00021885A
	for <linux-doc@vger.kernel.org>; Thu,  4 Sep 2025 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757011570; cv=none; b=eT+9ww51vZRRWLqFre94e0ILEshkWib+aKB8dR1bRZ4WD0OFj1uFX3DN0pXpHHfbmybjQruPJM52HUu/IVbJeS62AZd2e+PFAAqXV1lkJcldQU2aNNUkTC8zaYS73SNE6IIXeIKi9l0GkizzRC/8LhXwVdE4JKFVwWIRL1IhhOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757011570; c=relaxed/simple;
	bh=lvuwRmNZNM7aSL/GeaizMNzN5z2gDAqq7f4Bxl2+g5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBrs5Dxh7zc+Vc0DXu8k/8lAIcPVHC04ODbRa8lEQ+vdVLFvGvLjXxMBCSTcXaJ5yjn0R0t6kMKP0xAHnNog1x6tjGMoRJISISOemuDq11EcxFVeX1iGkM0UlY50XshOetBYZRI1EeNpvWjI0j/iPSuEMoSgGKDvsP3DCb83/eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zt77tJU/; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e9d74ec040cso879640276.2
        for <linux-doc@vger.kernel.org>; Thu, 04 Sep 2025 11:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757011567; x=1757616367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMO3Rs3kVsbeR9kpL3G2iwG3KSDbb6leHyCteNZWJKU=;
        b=Zt77tJU/S7/4wbkTKrWks5+MLgDI1RO0M1xym5NvnxBx7Et6iV5qwFviZyOKRSkVBc
         FMAClKvBs//jl6iQ5vb+q2xzwUWjRfFQNfLJistGfZYLCOajqL91xTBB/abZNYXb+nqH
         2MVP6l8ZiJVdLlQ3zQm9LBbY4OhO5u/Qo4XTh/d+KuyBps+VFHqeEJuXcsgEty52kqpy
         HWRokTSahu5ZqCXz9DstpOGWy4aXse0j2AAmHFURZh6lpyq5uAxYvRdQkRCoyOLyFKdM
         puSCgGKV+AW3aQCw2mEk0qyTgLtdU8G/0iz6s800aUPw/KArR6gvs1XcLUHJNWHSaUzx
         o9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757011567; x=1757616367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMO3Rs3kVsbeR9kpL3G2iwG3KSDbb6leHyCteNZWJKU=;
        b=e1KLxDZoht5XPu4Jbg+F4oP2+c54KA12WespvxlANo+ty6qbL+RRNClDeSY0DsYIFr
         tYIvu8KQfpJa+2JFcHYIHTw4XMCqLXY2fvf693bELgEvGncezS6446zCww7u+GQPpB+o
         L+J12XP7TXRz5TjBtkZi0xd0Nr685e29HyTJ9wBbrbwytLBBBeKNkwHYKj7u4VXSZjGr
         +21ea+GzOo+iH1KAMsPJ3Xk9f3DikpONlvdv6SwqtaXM8lQom55riGdt33QkznV9oPHc
         YiRX9UWigI1crdPFpF5dTBOtZ0XsYfhlhB8hi8C7aFQ1EnWs7NzI7eX4lHJ3gGxT705I
         gWbw==
X-Forwarded-Encrypted: i=1; AJvYcCX/AE6IAvXKchH+uSxCixOA1GWSlJLuIjFDhBgJmvpViXqnz3Bckv6fx1NDhsypqQMj+7QUR/GRLrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxetJu26oedqaEvlLLd7tXy44fNVavahL8e+nCpdxfYjbK3bxOC
	BWGXJLgXIiQo7nMY2LWFGAS/nVgtzrN0lPw3Sqf67cwl9qd1cDeL8OckzM4kIKhCEZx6Zmu07NS
	KG7sXhBRxN32fgEn6vfv5t7Wa6QkX9CnI8heWN6qV
X-Gm-Gg: ASbGncuuL30M65WvminlhYXvHoTS+PxGEf86x9S0eOnG4u5KYNUIWpPCx+xGhX/u7wa
	M4nbtlNqFQZdwTFZg+klNCUE4Eqr1qfR7FNVulW5iD0WaP4FUifIOIFGxPi1c5yYPy7RBg/9Lpz
	K+2iY5nMXtNs8wewHODZkT3csMSLZCcbVbAW8aPXXjdLDSUbl6onG/R0geOmOCYmEWDB4jZZsuo
	UCd5SH+IEAizMk+KLURGkjr9O9csk58LcHJX2EYgbFU7GJejWPWWTM=
X-Google-Smtp-Source: AGHT+IGn9N+homcANGMwR4jfEFzD2NCD2KcIcBhFWplr8ibSUoc3dBeDSKfXSBSRcFnFSDBlKc1RK8qrGOI6Pnn1inw=
X-Received: by 2002:a05:690c:f86:b0:71c:40c9:b0d1 with SMTP id
 00721157ae682-72276134719mr229604487b3.0.1757011566319; Thu, 04 Sep 2025
 11:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com> <de7da4d8-0e9d-46f2-88ec-cfd5dc14421c@amazon.com>
In-Reply-To: <de7da4d8-0e9d-46f2-88ec-cfd5dc14421c@amazon.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 4 Sep 2025 11:45:30 -0700
X-Gm-Features: Ac12FXzXQ2J2IObwStpXP8KUnuPjviPOSORfujA1_ZEACSuvKQLNHacmBk1cLV0
Message-ID: <CADrL8HVxvwB4JrnUf6QtDCyzZojEvR4tr-ELEn+fL8=1cnbMQQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] KVM: Introduce KVM Userfault
To: kalyazin@amazon.com
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Yan Zhao <yan.y.zhao@intel.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 9:43=E2=80=AFAM Nikita Kalyazin <kalyazin@amazon.com=
> wrote:
>
>
>
> On 18/06/2025 05:24, James Houghton wrote:
> > Hi Sean, Paolo, Oliver, + others,
> >
> > Here is a v3 of KVM Userfault. Thanks for all the feedback on the v2,
> > Sean. I realize it has been 6 months since the v2; I hope that isn't an
> > issue.
> >
> > I am working on the QEMU side of the changes as I get time. Let me know
> > if it's important for me to send those patches out for this series to b=
e
> > merged.
>
> Hi Sean and others,
>
> Are there any blockers for merging this series?  We would like to use
> the functionality in Firecracker for restoring guest_memfd-backed VMs
> from snapshots via UFFD [1].  [2] is a Firecracker feature branch that
> builds on top of KVM userfault, along with direct map removal [3], write
> syscall [4] and UFFD support [5] in guest_memfd (currently in discussion
> with MM at [6]) series.

Glad to hear that you need this series. :)

I am on the hook to get some QEMU patches to demonstrate that KVM
Userfault can work well with it. I'll try to get that done ASAP now
that you've expressed interest. The firecracker patches are a nice
demonstration that this could work too... (I wish the VMM I work on
was open-source).

I think the current "blocker" is the kvm_page_fault stuff[*]; KVM
Userfault will be the first user of this API. I'll review that series
in the next few days. I'm pretty sure Sean doesn't have any conceptual
issues with KVM Userfault as implemented in this series.

[*]: https://lore.kernel.org/linux-arm-kernel/20250821210042.3451147-1-sean=
jc@google.com/

>
> Thanks,
> Nikita
>
> [1]:
> https://github.com/firecracker-microvm/firecracker/blob/main/docs/snapsho=
tting/handling-page-faults-on-snapshot-resume.md
> [2]:
> https://github.com/firecracker-microvm/firecracker/tree/feature/secret-hi=
ding
> [3]: https://lore.kernel.org/kvm/20250828093902.2719-1-roypat@amazon.co.u=
k
> [4]: https://lore.kernel.org/kvm/20250902111951.58315-1-kalyazin@amazon.c=
om
> [5]: https://lore.kernel.org/kvm/20250404154352.23078-1-kalyazin@amazon.c=
om
> [6]:
> https://lore.kernel.org/linux-mm/20250627154655.2085903-1-peterx@redhat.c=
om

