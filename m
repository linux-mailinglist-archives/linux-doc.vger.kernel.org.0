Return-Path: <linux-doc+bounces-29370-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD6F9B77E6
	for <lists+linux-doc@lfdr.de>; Thu, 31 Oct 2024 10:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 910571C24BC7
	for <lists+linux-doc@lfdr.de>; Thu, 31 Oct 2024 09:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA15819883C;
	Thu, 31 Oct 2024 09:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W7x3+uoM"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF24519414E
	for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 09:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730368221; cv=none; b=QMfPR0+WZgc79+tvpOnjG3Ey8bfxXkC4rgBwJ0wBri/yrZEidUZntZahLhWwdGuXi4S22/JalHSWbFzX3afneApi28sQWKJ4FNPmgYpEY61jounO4GfmmIR+fUxsMfgErqNSdS39d2LJXfOfWw4dnk3sC6WJFQWbp96BiuiPEZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730368221; c=relaxed/simple;
	bh=JeqHqYTQbXzcOkcj5SKrTxHQTcinplbKbGCznH/JgL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UazXZ0NSJim/BnVoOCOxHM8HtKee6Q+QXxI+baa0oQY4fBrVpeXHqAVLSX7E2IawqeJ+fPRClnO4u0LjYNOPTFG3nmbDua3BKgUqspkZww/FbUpQ8fJrLePWm6fEbYzyZDfMcM7eWOVNyvamXg7nPltN9G7WIrsJqNeMEidtU40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W7x3+uoM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730368218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8dIcxwobV6BNAuIuaE7aLzJugH838eIdiZ2hVMt1ILQ=;
	b=W7x3+uoMCQhYfayA53p63kRppyei6GNX1cI2Qy7RrncGPb8q+zH6U1Q8R7WVTGABYwzyZN
	jvxQOjubk5ZeOVGiBQvuAJ6sTkI27LT/T6Wd64A1eAI4CqGRPMueS4GU5B+K0lktYE/C6w
	v3RlPn2xuvDaBkHhWn2MEFBi9JdjiL0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-84sG600UPX-Pseh0_FoosQ-1; Thu, 31 Oct 2024 05:50:17 -0400
X-MC-Unique: 84sG600UPX-Pseh0_FoosQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43157cff1d1so5743005e9.2
        for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 02:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730368215; x=1730973015;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8dIcxwobV6BNAuIuaE7aLzJugH838eIdiZ2hVMt1ILQ=;
        b=qcZ0ky70lX/CM7GU5RmtvDkCEh0dqtbsiKBi/CQ97cUoFG3ua4esTe/RoJ9eGq0IrW
         4xHKrURm6pbeWoxZBS1lG1fJ+NkT9SxVbHGFN+Hey74McS/SmVk+0UbWD2QxjBBehBdv
         gzTHy11mdKPdHwQQZCA4PeVepHXfmMAzlBTa3b4OgEfdzxkbkLySQSJiKt4lu2Tfib22
         XvR7jmdWHYPNBVDFKUkG55Jd6qxbO23o7UhMoHSQnWqORsCJ4KMdLGDp5NQV1u1wgHI+
         UAltp8hweRy1qucz5oT1Yg1RsjtVPiJeJlrFeaSGV8iDCnVeJFtvYpHZIRc9osxBTxnd
         v0wA==
X-Forwarded-Encrypted: i=1; AJvYcCUjl/BBpUs0sG5EbO6OsjNDd9T7T+OX8u51vVEYmHj5O3W6P5y+6a065SXY4bS/CgMDxlShK7c13YI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuFxaO4HlzbbOLafPrvumoNtVbfeb0I7zrEh+R0td5JXaMokUa
	KZuM8RvGFzYXajRMG2zG4c0uvn8aEV/5FDjRjQxfLpllGN4+yIQYPnHmYV7Bj8JAlx1e3h9g5LD
	istsUFgGy6jKipgIpLK1wv3m+7GZXxAeo2zNChqfhclv6KJrs0iqvPhr9wg==
X-Received: by 2002:a05:6000:1866:b0:37d:33a3:de14 with SMTP id ffacd0b85a97d-381be7adfdemr2447494f8f.7.1730368214982;
        Thu, 31 Oct 2024 02:50:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeVaRdVGCqBIKY+7Vfj4lrlXB4BTEaQ/Q5YZsm5NFKJxn9YuGzq2b6/rrf6LYaZ8QcgqCaug==
X-Received: by 2002:a05:6000:1866:b0:37d:33a3:de14 with SMTP id ffacd0b85a97d-381be7adfdemr2447426f8f.7.1730368214468;
        Thu, 31 Oct 2024 02:50:14 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:ed00:7ddf:1ea9:4f7a:91fe? (p200300cbc70aed007ddf1ea94f7a91fe.dip0.t-ipconnect.de. [2003:cb:c70a:ed00:7ddf:1ea9:4f7a:91fe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d49d4sm1605679f8f.34.2024.10.31.02.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 02:50:13 -0700 (PDT)
Message-ID: <4aa0ccf4-ebbe-4244-bc85-8bc8dcd14e74@redhat.com>
Date: Thu, 31 Oct 2024 10:50:10 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/6] Direct Map Removal for guest_memfd
To: Patrick Roy <roypat@amazon.co.uk>, tabba@google.com,
 quic_eberman@quicinc.com, seanjc@google.com, pbonzini@redhat.com,
 jthoughton@google.com, ackerleytng@google.com, vannapurve@google.com,
 rppt@kernel.org
Cc: graf@amazon.com, jgowans@amazon.com, derekmn@amazon.com,
 kalyazin@amazon.com, xmarcalx@amazon.com, linux-mm@kvack.org,
 corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, gerald.schaefer@linux.ibm.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, luto@kernel.org, peterz@infradead.org, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com, shuah@kernel.org,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20241030134912.515725-1-roypat@amazon.co.uk>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20241030134912.515725-1-roypat@amazon.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.10.24 14:49, Patrick Roy wrote:
> Unmapping virtual machine guest memory from the host kernel's direct map
> is a successful mitigation against Spectre-style transient execution
> issues: If the kernel page tables do not contain entries pointing to
> guest memory, then any attempted speculative read through the direct map
> will necessarily be blocked by the MMU before any observable
> microarchitectural side-effects happen. This means that Spectre-gadgets
> and similar cannot be used to target virtual machine memory. Roughly 60%
> of speculative execution issues fall into this category [1, Table 1].
> 
> This patch series extends guest_memfd with the ability to remove its
> memory from the host kernel's direct map, to be able to attain the above
> protection for KVM guests running inside guest_memfd.
> 
> === Changes to v2 ===
> 
> - Handle direct map removal for physically contiguous pages in arch code
>    (Mike R.)
> - Track the direct map state in guest_memfd itself instead of at the
>    folio level, to prepare for huge pages support (Sean C.)
> - Allow configuring direct map state of not-yet faulted in memory
>    (Vishal A.)
> - Pay attention to alignment in ftrace structs (Steven R.)
> 
> Most significantly, I've reduced the patch series to focus only on
> direct map removal for guest_memfd for now, leaving the whole "how to do
> non-CoCo VMs in guest_memfd" for later. If this separation is
> acceptable, then I think I can drop the RFC tag in the next revision
> (I've mainly kept it here because I'm not entirely sure what to do with
> patches 3 and 4).

Hi,

keeping upcoming "shared and private memory in guest_memfd" in mind, I 
assume the focus would be to only remove the direct map for private memory?

So in the current upstream state, you would only be removing the direct 
map for private memory, currently translating to "encrypted"/"protected" 
memory that is inaccessible either way already.

Correct?

-- 
Cheers,

David / dhildenb


