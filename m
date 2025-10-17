Return-Path: <linux-doc+bounces-63731-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C70BEB97A
	for <lists+linux-doc@lfdr.de>; Fri, 17 Oct 2025 22:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7B6B54FD13E
	for <lists+linux-doc@lfdr.de>; Fri, 17 Oct 2025 20:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FEE34CFA3;
	Fri, 17 Oct 2025 20:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EL8IzmC5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BC7338596
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 20:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760732013; cv=none; b=e4Y/gFKUL2qIi0pvZbnpKpyMM1ryyfE28N5RQlIUK/xnG1k5anvVA0GOkDtdNWBj6Zny2LAudZDofIS79bx/b+PGU0rSWR/chFke0cHKnJC0ptEhNidNLKt2VXulnom+mK0gCzsKt19qvqLSbsNy42uBAkNlrXNKeTN/D2xvPLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760732013; c=relaxed/simple;
	bh=30zQD4pjDiSn/+U/aldACY0mrFS2JuKzSnFZG7FjNQk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ARgvITrSJuLJ5/2i1p+HDCX0NCJ0w29VSDehJHsy+C+cs2JvQ8J3+HJHMSlduccYsRUR3Vbb7B40e46UuIJq18OiQ1o02lzHVtO08z6xutDb5mdK6TInDZyQ7ddve2uKjmpBmRW7f4bRc+jIpqufm06cj1889apUpZP/Q8nOEnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EL8IzmC5; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-33428befbbaso2806607a91.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 13:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760732002; x=1761336802; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0mpVwCYbwMET7AecOcE2QimVcHIz1TOOFcfyLkjDeGo=;
        b=EL8IzmC5z4DTQUYvZCy3jKls8uL6JbJj8vXJCerWWlefkvzKo3EiyPvHEWDXtbvLeL
         ps9wFnbKHg7T67l5dHLlFW+c96db/77a4px1hqLuvOTAGCLCMF8wgXXDGuJchJenCGh+
         eoFgD/SbJ1HhQmEd0UNEeikNEsdmbbyf0KPuzEI2sY5TVYzGE/K1BvRBFrpKSEgBoYZj
         F2hWTGsF78bsFJKdW1WMwg10IwDuK4PBZUoDI3LE3f/njKyvBqMo1C++ioBKM4yvlVhp
         miBHevQlyRYoSLjSp9HMrP6kEZ6gNAzVvLtaUY+3Lvq4AkQHA78RNk/jkDyzgVPcdz8X
         F+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760732002; x=1761336802;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0mpVwCYbwMET7AecOcE2QimVcHIz1TOOFcfyLkjDeGo=;
        b=cDZS4lluvlmJDk2idcYhVC0LniXIuP/aJTFBA7Jv1+UHJdJ/GsXyfkyE5s7TmCNrbo
         0qS+PNnvrtYUwXZagEZ/2EFOJlPAkW20Z+4ozAIL0T3Rnc0behDZRNciUQXv+jTRd0hk
         u59aclyqcKjgjanuFSYqim80IjAr4rQ+M3cVA2o5Z6bod0SyX4nrFkiEyFKMTSxf+mxx
         LXlqx/hX4iKPsFbjRaR74Swmj5xrTl+2sAfd3jLCsVfNVpYDUQIMSn3Q+IcyywWMfk27
         vG3y3211qvn1V072kxlMl5WqrEtXAKhVzffu+0cCef2jeehODNh1W7cxtnTsN8JPVGKt
         yBZg==
X-Forwarded-Encrypted: i=1; AJvYcCWrSXxkcMZYAU1mBb93GhH55lb+u7BsOxXarZQMAa0nIUFPrfvY3oPm+TCSbayVYM18yRJfbmFBV9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/byQx0/CTUy7IldTMgCkWnXEAk0QAqpib6xamtWDkLwvOtQcd
	aOhSxRlrd6AhoMCnt95+u3Sn85gm9IiVt6BUtnYE9CCuMajec0IRR/ovE3GrzU1h/2YFw/xD5BK
	G+hjuT4gWQ63g8h6r9eXC473kLQ==
X-Google-Smtp-Source: AGHT+IHcO4NwxOJfZLNEBbx6WNz/S52BTLMchZETWWpFSftU3iw+fmFyD6t6Of9AgSIAzGHhdhWoKd+61TBtvxNmOQ==
X-Received: from pjbfs17.prod.google.com ([2002:a17:90a:f291:b0:32e:bcc3:ea8e])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3d87:b0:32b:baaa:21b0 with SMTP id 98e67ed59e1d1-33bcf853679mr6444234a91.6.1760732001959;
 Fri, 17 Oct 2025 13:13:21 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:12:13 -0700
In-Reply-To: <cover.1760731772.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1760731772.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <a3126618d7cb353faad7b231e70c2b732498f449.1760731772.git.ackerleytng@google.com>
Subject: [RFC PATCH v1 32/37] KVM: selftests: Check fd/flags provided to
 mmap() when setting up memslot
From: Ackerley Tng <ackerleytng@google.com>
To: cgroups@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: ackerleytng@google.com, akpm@linux-foundation.org, 
	binbin.wu@linux.intel.com, bp@alien8.de, brauner@kernel.org, 
	chao.p.peng@intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@intel.com, dave.hansen@linux.intel.com, david@redhat.com, 
	dmatlack@google.com, erdemaktas@google.com, fan.du@intel.com, fvdl@google.com, 
	haibo1.xu@intel.com, hannes@cmpxchg.org, hch@infradead.org, hpa@zytor.com, 
	hughd@google.com, ira.weiny@intel.com, isaku.yamahata@intel.com, jack@suse.cz, 
	james.morse@arm.com, jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com, 
	jhubbard@nvidia.com, jroedel@suse.de, jthoughton@google.com, 
	jun.miao@intel.com, kai.huang@intel.com, keirf@google.com, 
	kent.overstreet@linux.dev, liam.merwick@oracle.com, 
	maciej.wieczor-retman@intel.com, mail@maciej.szmigiero.name, 
	maobibo@loongson.cn, mathieu.desnoyers@efficios.com, maz@kernel.org, 
	mhiramat@kernel.org, mhocko@kernel.org, mic@digikod.net, michael.roth@amd.com, 
	mingo@redhat.com, mlevitsk@redhat.com, mpe@ellerman.id.au, 
	muchun.song@linux.dev, nikunj@amd.com, nsaenz@amazon.es, 
	oliver.upton@linux.dev, palmer@dabbelt.com, pankaj.gupta@amd.com, 
	paul.walmsley@sifive.com, pbonzini@redhat.com, peterx@redhat.com, 
	pgonda@google.com, prsampat@amd.com, pvorel@suse.cz, qperret@google.com, 
	richard.weiyang@gmail.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, roypat@amazon.co.uk, rppt@kernel.org, seanjc@google.com, 
	shakeel.butt@linux.dev, shuah@kernel.org, steven.price@arm.com, 
	steven.sistare@oracle.com, suzuki.poulose@arm.com, tabba@google.com, 
	tglx@linutronix.de, thomas.lendacky@amd.com, vannapurve@google.com, 
	vbabka@suse.cz, viro@zeniv.linux.org.uk, vkuznets@redhat.com, 
	wei.w.wang@intel.com, will@kernel.org, willy@infradead.org, wyihan@google.com, 
	xiaoyao.li@intel.com, yan.y.zhao@intel.com, yilun.xu@intel.com, 
	yuzenghui@huawei.com, zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"

From: Sean Christopherson <seanjc@google.com>

Check that a valid fd provided to mmap() must be accompanied by MAP_SHARED.

With an invalid fd (usually used for anonymous mappings), there are no
constraints on mmap() flags.

Add this check to make sure that when a guest_memfd is used as region->fd,
the flag provided to mmap() will include MAP_SHARED.

Signed-off-by: Sean Christopherson <seanjc@google.com>
[Rephrase assertion message.]
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index cb73566fdf153..8603bd5c705ed 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1057,6 +1057,9 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 		region->fd = kvm_memfd_alloc(region->mmap_size,
 					     src_type == VM_MEM_SRC_SHARED_HUGETLB);
 
+	TEST_ASSERT(region->fd == -1 || backing_src_is_shared(src_type),
+		    "A valid fd provided to mmap() must be accompanied by MAP_SHARED.");
+
 	mmap_offset = flags & KVM_MEM_GUEST_MEMFD ? gmem_offset : 0;
 	region->mmap_start = __kvm_mmap(region->mmap_size, PROT_READ | PROT_WRITE,
 					vm_mem_backing_src_alias(src_type)->flag,
-- 
2.51.0.858.gf9c4a03a3a-goog


