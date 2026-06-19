Return-Path: <linux-doc+bounces-92924-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FUNzAr8jNWrynQYAu9opvQ
	(envelope-from <linux-doc+bounces-92924-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 13:10:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D1F6A55DE
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 13:10:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=of3g3E9E;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92924-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92924-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA5423051CAD
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 11:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4074C370ADF;
	Fri, 19 Jun 2026 11:10:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DA334EEFD
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 11:10:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781867436; cv=pass; b=gAtdjYfDKYC4udkZDXiApmpmwhUi7Ig6mgz+e8VUhblVPMNywEfKip0K7jQuqim0iG9WHEL4IBLK0qj55cV2YRVt9KpoOcuUXkpJ6AxDn3K2J+RfDThYBw/ugeMjP1xa8vBsfnXQhjduwSzrJmpoqf2QGbtfhYaVJ0h4EXs7aDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781867436; c=relaxed/simple;
	bh=btKm2haKQomkQw+uhQB5pBRiK+95+O2o3qtewMx7Z8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRvVdqwaMTC0NnLh1Lt80TcD2bSoPq04QKDr+1AWZtTNuNibIsjsZosoJ3Zxnw4lrH56e2IE23VZq/yfdGHkFScuP1zri9NhDWJcOHZW1dr7FQfPrY9BeIS65MyLmNQQ/TIsmd0WrEk9crV+tNBFnyS6sJHy5f4kRcTRPvtVOrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=of3g3E9E; arc=pass smtp.client-ip=209.85.160.180
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5177d1ff061so150371cf.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 04:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781867432; cv=none;
        d=google.com; s=arc-20260327;
        b=m4lzjiiNlrhbHI+ja6M+TyH9+R4YnCKHBakLxKlFZEdyy6DZJMbwrt0VMlc/Z67tRS
         1jg9YvLodn+Djt0b92YoKJu0w9L/3h4LCMN5FvUKfprKXDwlc6VEpuETR5+BIoKTsCSr
         kHUY5JX8E0bXXPRQP3W/0le/QN8rlfXSz16Fz+DEUELH9rVDvdgFufIv5juFrfYyEDPK
         Nhcqlg3JKRj1/S4nDuzbhGFOS4eQufydcd+/ezYrlq7UB8KSQKmzRGTknlJMoYUYuK2k
         UmfkEVuCqGIXTEz46za3cIp9dYdeoYRmjpmROku57Pzq0zMGB71PQcxyeZ/6ImV+/9r/
         DHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WoD6HBjRT9eDykv3AXG3feHx1dss625bK8G+vITqymE=;
        fh=PFdBlulfzkvPHvaVMRweqxpyXXr2HP+lHGT0Iryxf0U=;
        b=NXSbFub6uzZT56AhpISO8aVlZYluZM+JewP+zoXtJ1ESd94hpc69IE0sov60a5V0i5
         QUNhQLmYB3ANTQ/KcJvNyzx+E43tZzOHXuYZKy9iDis0yEY2Hr0ehgh7nXyeev8SR0H1
         5M4CrKdIGPhzhxD3x3W+Es657qZdSTcHiZOBW7VwLqeOTf9XdqhUWW8GFUQxahUtdOIk
         D3K+7MNGcj7rYeg1oCz3AmaOgxs5SrYmnnQ0hZpPC85dWLTxlCtsZNSX7odFensikP9r
         NnwQhSkKOdV4VI7J9uBPK1bgY3i5C6J1KeTzHy+uMbThXKN7dTe1QXxHVFih04/paiLx
         9uPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781867432; x=1782472232; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WoD6HBjRT9eDykv3AXG3feHx1dss625bK8G+vITqymE=;
        b=of3g3E9EWrUYK2VJsf21DH2lVzJYSFekJNs53pg/sCEMq/9gqzry6oRfbRUT7w8vTW
         T9fVtrBBP+n3Rf2X5wlpZPQSO1/9ABHl53gpE0wx3gZ9xqAYAwgGzoXVuzKljkkUuj45
         wjJexN7C9et7BkauciDx6nv9LeEY+MlDqRnaVoThgNRSUldTvu+UGMHDyKtLxiYnsLbM
         Q28hkkzwfBr64cA5YNZeWfm5DQMlPSeW6dd13XO7RsInRVbK6OqteljFnd83iH27XMpk
         Z35kcD25KiV4e7pqZefO/Kgjfd7hwm5fZxwuP/XTumbyP4+of7kd8/H5G74VM0fJ3+0t
         MQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781867432; x=1782472232;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WoD6HBjRT9eDykv3AXG3feHx1dss625bK8G+vITqymE=;
        b=iapGdlluyaNyVpybLrZFlZk3+Fqpyc0OOnIL9zBaFvPILPjI5TO/29ixZosXy2BhgJ
         deokV20+Ocwq9Sd1dXlONFvtgHHIkQ/OQmAQt9o4NSzcvBTVyuloVkwGjGeICKF0S5cY
         bLGIVWtRWBZ8Pqt6CQqENej3d6qohbuII2uqa6EzBzB6VEBgaKVz8MCDaBw18Q6G7O+V
         qBFRxHN35QQy9rF0LwJY4CRzAn2+8B4QVBITU+llCqr6io7Nur8bl7+1/kllC1xef3x3
         fLbIwQwrdD5gMC/xiID6OEQztVaKLDc7RLe07R/bNv5HSppDudA1NKyCtAIuLEukNF/2
         INzA==
X-Forwarded-Encrypted: i=1; AFNElJ90zxMsTauxEObAKONfm2nXfkb88N9SQvI4mD+Y8aaiTG6fGgwsKgHsCdPj4jIegDjQv4kYqtuItuU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyylt7Zu6dfKlc+yHzpKKyRfhgQjyjfkl2Trr13vPtEa/Rgf8x5
	TkUshJRY44DxnPqVjsfx6kJFWBTIquPV9sc3NKdpee0ip4OYYqtLQ31FgBadh5VFpYLb0ERQkJ/
	bLelJUBDyKru6rSc3Y0fWutlhOCmseHFId6pjgABH
X-Gm-Gg: AfdE7cmOotQAq6vtqWK+up99NHYS21Zw/0bC45ZBtiAxBjfm42aZjyJ69aeIRUKAUcG
	XE35gWQzhFSmxBOjS9NUeKNb+/SNzLwvUMFPVGEX5PPx9/WdInVgSw3WRcx1EP5CMHyhrOGm+fY
	Z+mq+kDFPur0DPtxSLRS4tNJq0ygpX+U2rssmo7s9ZuwFeTmjWPerP5gRUqOxB0im1VfLJjb9Mq
	mf6lzevqPuUMpcdfqAzATsw2rN8dwNi+Pu9xEtfOiYxE2AZrMkxUIPgzr1lZgLyFLJ4lE63ew==
X-Received: by 2002:a05:622a:2b08:b0:517:99ea:ab7a with SMTP id
 d75a77b69052e-519e4ab67d5mr7722981cf.26.1781867431624; Fri, 19 Jun 2026
 04:10:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-23-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-23-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 12:09:54 +0100
X-Gm-Features: AVVi8CeUT44zBCOt4kdWsDDIMV1MwoUKi9VlfHD19GzvGrkCGzRWMwEiO6g5I68
Message-ID: <CA+EHjTyj-JdW8H0ii2j3dayqnT2s3VV+brSG++p335=FGd2GXg@mail.gmail.com>
Subject: Re: [PATCH v8 23/46] KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tabba@google.com,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92924-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,linux.dev,linux.intel.com,kernel.org,google.com,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@h
 uaweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baoquan.he@linux.dev,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tabba@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60D1F6A55DE

On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> Update tdx_gmem_post_populate() to handle cases where a source page is
> not explicitly provided. Instead of returning -EOPNOTSUPP when src_page
> is NULL, default to using the page associated with the destination PFN.
>
> This change allows for in-place memory conversion where the data is
> already present in the target PFN, ensuring the TDX module has a valid
> source page reference for the TDH.MEM.PAGE.ADD operation.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Sashiko flagged that when src_page = pfn_to_page(pfn),
tdh_mem_page_add gets identical physical addresses for r8
(destination) and r9 (source), reading with host KeyID and writing
with TD KeyID on the same address. I don't know enough about the TDX
module's operand constraints to confirm whether it allows overlapping
source and destination, but the concern looks legitimate.

nit: why does it have Sean's SoB?

Cheers,
/fuad


>  Documentation/virt/kvm/x86/intel-tdx.rst |  4 ++++
>  arch/x86/kvm/vmx/tdx.c                   | 11 ++++++++---
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/virt/kvm/x86/intel-tdx.rst b/Documentation/virt/kvm/x86/intel-tdx.rst
> index 6a222e9d09541..74357fe87f9ec 100644
> --- a/Documentation/virt/kvm/x86/intel-tdx.rst
> +++ b/Documentation/virt/kvm/x86/intel-tdx.rst
> @@ -158,6 +158,10 @@ KVM_TDX_INIT_MEM_REGION
>  Initialize @nr_pages TDX guest private memory starting from @gpa with userspace
>  provided data from @source_addr. @source_addr must be PAGE_SIZE-aligned.
>
> +If guest_memfd in-place conversion is enabled, pass NULL for @source_addr to
> +initialize the memory region using memory contents already populated in
> +guest_memfd memory.
> +
>  Note, before calling this sub command, memory attribute of the range
>  [gpa, gpa + nr_pages] needs to be private.  Userspace can use
>  KVM_SET_MEMORY_ATTRIBUTES to set the attribute.
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index ffe9d0db58c59..56d10333c61a7 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -3198,8 +3198,12 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>         if (KVM_BUG_ON(kvm_tdx->page_add_src, kvm))
>                 return -EIO;
>
> -       if (!src_page)
> -               return -EOPNOTSUPP;
> +       if (!src_page) {
> +               if (!gmem_in_place_conversion)
> +                       return -EOPNOTSUPP;
> +
> +               src_page = pfn_to_page(pfn);
> +       }
>
>         kvm_tdx->page_add_src = src_page;
>         ret = kvm_tdp_mmu_map_private_pfn(arg->vcpu, gfn, pfn);
> @@ -3278,7 +3282,8 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
>                         break;
>                 }
>
> -               region.source_addr += PAGE_SIZE;
> +               if (region.source_addr)
> +                       region.source_addr += PAGE_SIZE;
>                 region.gpa += PAGE_SIZE;
>                 region.nr_pages--;
>
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>

