Return-Path: <linux-doc+bounces-17242-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D116F8D4090
	for <lists+linux-doc@lfdr.de>; Wed, 29 May 2024 23:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CF682845F4
	for <lists+linux-doc@lfdr.de>; Wed, 29 May 2024 21:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68C21C9EBD;
	Wed, 29 May 2024 21:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FI/Vb4UP"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B034225D6
	for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 21:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717019750; cv=none; b=sK6Im5NnZ3dpm80+c44bbG3KNUL7FiGEobkFUH7+mZDKADnu+59/D27zgOdU3Z81JbF1N6menqROSirPAtpdZQFFoKhix8HzW8/GpM1nRnapjYFT5CK4NJBBM++lgr3rR03ZIWNWd3a7dfWzQRnerKZOiXin5w/M0DrrA6bG2Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717019750; c=relaxed/simple;
	bh=UNxJLMGZl1gnRZO6sW+znZ/L8AD9EkiPEE3WJ3MdUgk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Spz1CJMydRLAbREuG8QYLGXF5EBASqSmF8HKi3A65cKp2VSbWhkajb2xGDZPmLCvl0mubv7+jsnGVttoKwkXzLvWO0Zx6AhcBiVzh7Nu9ZU5IuTwLl8htJa/a+jpLU3QW0hYtmazGe8cIHEcbvVtVehkKDo+d/VtPv+xCLlNuL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FI/Vb4UP; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-65e7c88cb40so210858a12.0
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 14:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717019749; x=1717624549; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0O8RdWVLc2UjPDSDGViR160MauFo82inRxl7GpP6bk=;
        b=FI/Vb4UP86exDz3dIJiCXtaFMKxh27cM2trVsP7atzrPcumEz2F1G+FtFyry7U4D8A
         Fha8DDVcjugcrgjcCCbBoSJg8lTTb4RTwiNB+UpkBZNonB21vGIDLzXn6PcALb8RdUBx
         tTUlteIUJBV1wmlGDcPckPc0+s7vGdz5tEtgwVkgEx+xxErqaYorw9uYtXUTppjmMsmX
         Y0GrTT/ftr6abfC7IihASGMF9Nvo0ilZbPvakLP55DLlqhvB8Diir+zBLEtvTB/MAnID
         F1zv+ZRBTEPoaeH7AFLEMy88nBRzK84vyfOtTxv/l8nI3e00iamT0iCxXAhQECepprKG
         WGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717019749; x=1717624549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0O8RdWVLc2UjPDSDGViR160MauFo82inRxl7GpP6bk=;
        b=ES2eQMRbvhlRy6d+/urXjqrfIrPcgfGFSRj3NStQMacHTJZzd2G+Enlwiuuw+7VBE9
         KGyE8HB++YKmrRH7tWZ74A11xaa4wPs9cQc4pHcA+vMWMR0Q+jZnTk1WIB0NOy418lYj
         +87uofDcu4N2BWyIpwqfDF9/3KN07ixpjCTYL5pp7eBhhCeh2oKTjzPLt+rm3VgvTA6w
         FwezBUEVAuWYhKSELC0wtt94CsOvU9+y97JzOJdf18d+ifC800z3/8hAww/F/vHdLEWq
         dYkQ9r4wT6RsVaw5UQav99U5xjikTJBSMc/g5QNEZd1owqstpghbzLHQDPWbM1ZoBGR7
         tfIg==
X-Forwarded-Encrypted: i=1; AJvYcCWtv7RDhBYrGpWUyaKepqExj0L573fSxvPv6jDlYagnlUuuuw43AtS4+8bl1iVE43631p9kICe0sBAEC+cP0lVtpmLI4427qIH5
X-Gm-Message-State: AOJu0YzTUFQ5NZkkuhHXjSxO85i4lMGqHSx7K97663U8t7A9lxQgiqA5
	xQM6uT0FIVzpre++drTAq7pnt8yF8HHsG0j7c2sep3E4e54ncBZc3glDXFj5D4GV0TSsoThsPs9
	w6A==
X-Google-Smtp-Source: AGHT+IGx3SrykKCWRo4963j21qgI5u7l1D5l4vFz5cSTor42JO4rQICXW/WPSO9JICYG6TRZvTrpM8pyR8k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:308:b0:65c:f515:1590 with SMTP id
 41be03b00d2f7-6bfdaf2b2f6mr480a12.11.1717019747924; Wed, 29 May 2024 14:55:47
 -0700 (PDT)
Date: Wed, 29 May 2024 14:55:46 -0700
In-Reply-To: <20240529180510.2295118-5-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com> <20240529180510.2295118-5-jthoughton@google.com>
Message-ID: <ZlekYljG7KJwblUj@google.com>
Subject: Re: [PATCH v4 4/7] KVM: Move MMU lock acquisition for
 test/clear_young to architecture
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, May 29, 2024, James Houghton wrote:
> For implementation mmu_notifier_{test,clear}_young, the KVM memslot
> walker used to take the MMU lock for us. Now make the architectures
> take it themselves.

Hmm, *forcing* architectures to take mmu_lock is a step backwards.  Rather than
add all of this churn, what about adding CONFIG_KVM_MMU_NOTIFIER_LOCKLESS, e.g.

static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn,
							 unsigned long start,
							 unsigned long end,
							 gfn_handler_t handler)
{
	struct kvm *kvm = mmu_notifier_to_kvm(mn);
	const struct kvm_mmu_notifier_range range = {
		.start		= start,
		.end		= end,
		.handler	= handler,
		.on_lock	= (void *)kvm_null_fn,
		.flush_on_ret	= false,
		.may_block	= false,
		.lockless	= IS_ENABLED(CONFIG_KVM_MMU_NOTIFIER_LOCKLESS),
	};

	return __kvm_handle_hva_range(kvm, &range).ret;
}

