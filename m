Return-Path: <linux-doc+bounces-93332-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 15RqFz0gO2oCRQgAu9opvQ
	(envelope-from <linux-doc+bounces-93332-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 02:09:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B6D6BAA96
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 02:09:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=veUsiC1C;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93332-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93332-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 173EF305D806
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 00:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2D879CD;
	Wed, 24 Jun 2026 00:09:29 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFD6184
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 00:09:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782259769; cv=pass; b=qVMd8BltjMRXwEvbcx97hXdyXZ3ocE8f5tZDUy6L8D5j9gnevSVJ49dzPqmsz3MTKAFkw/3yyQIRZ6aSUG5h4Z7j+XHXVG0rbqJA1qpR09nvyGuBjZw0zy8YQa10ix7Xbip3EfS6mp0zgKB8qDAxlFaKZBE8eXOu1igDtWUFk1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782259769; c=relaxed/simple;
	bh=rQfqkBaw/xkmyQgEiFlC2Kezzoeugio7gq7U/cPAgVE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPB1FMLW8v3gHs7goyyVcQ28Nv8DCrjR+4qU5FdNxYyOf94yV9FWYS5+3LTNl4/NQKVEmGlW6L094l/xa1omDqC+4Czc6pAQLt4isNDhI+eeTXK2M9Z+Jha+YLxIlQCRH+UHXT/TR8I7RxPiHYT0M9OWXVcy8iK5s7/q22e4qPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=veUsiC1C; arc=pass smtp.client-ip=74.125.82.47
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-13981833e13so523701c88.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 17:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782259768; cv=none;
        d=google.com; s=arc-20240605;
        b=FVPnLo8svHuToXfqLLI8GmnVYNf/YQC14Nl0gSNLQaeXDd22W7gPjf9lAmUZWDqM+K
         kDbglONw/cv/5OnIW0BXonfqItM5rXAyajmuy/vsDfXbFCt58WSGJNUzwufimKMzdcwm
         g9gsSh2sBFKJ50dPC/Koz4KDnGxfQythsowylB1/0ff91nvbWWHJs4u4cYIpVnR32WcJ
         RsuA4Q6Ux7U68wazEmCeP085UG3IKgAaHUlpN4Bf8hUYL347rmTQF5tSginjQja3irc+
         k688eDzCHEAEl297ADDLpYrn4k3fCCRw9yHAF1qmnzshxrvb2iL9DGQU3qtxuazXIfKO
         7skw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=LOf9tviNFkAeKYv+XoLw2pXVKZU7weWckYUjDtw8Ax8=;
        fh=jTlLV2hTyChTFGD3VDnEtR3GlUyJl0Zgdw0sTytk+10=;
        b=bODaQU8aMz/sp0MZHbZp+esr8jf0Pfo6gr2abh3Kuc/8aSOYfKPLy3TePKa2G6zhJa
         oJiwMGGVNQDtCirSsF+nNwViPENolnFipRI8UcdQ4z4Uq7bBCsJGhg1UvRbYS27T2qbE
         /iEaMrTfHu56h+SzADjtVUL4MBL3q5/oaeGK8Da26XMapvy9OqjAbx2KUtEGCr4xBqu1
         fVZTOaZSp4TkW25AiEneorX0UO/fQ37L7wSxtVjIlnHjjxbvmoaobH+hDERSnB/PpjQa
         guIVzO0XwsSqH7Db4SID5GlWx7sMD6kxgIUCLGKAzRFMSXNnnUkS5HWPQCdkt5NSSyiZ
         crAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782259768; x=1782864568; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LOf9tviNFkAeKYv+XoLw2pXVKZU7weWckYUjDtw8Ax8=;
        b=veUsiC1C69EY+fW+phEEcbGGJR1QtHjfW0d5G1V91rsvTaqXDyiTLhXXS9KvXQDxcZ
         oWZfD4aPELOrcjBl0S4WaAofqhRsh7rEZ5pQO3FCfS3ra6aku162Pf0qCkXR+xXopq1O
         IQKeS/G6Yi915cxG1Q5coGJU9a+qvcY+2pF5iSXRniVzMo3wiX9bpO5siiQcu5hv10zG
         IRNmijyT3ZTFPax8idXSgIdxbUpbhO10FVExLS2PxXXeKQXDrr99e5Cw7mM91YAKYLN/
         5W7OT8L10Oa4D+7xzkF7MBH1sJvrlSEyXhHEhhSosvwz7SMH4/WDaSXCQlJ4lOg1Sf2i
         XC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782259768; x=1782864568;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOf9tviNFkAeKYv+XoLw2pXVKZU7weWckYUjDtw8Ax8=;
        b=CSRf7GtR/1b2Q3mBUM2xMSDdCp4Eh5gfWTuJwtof59VXPl5NEtHVAjoyodlAO9JPCb
         fHTOrTYkH7wEhq9Of0lWWr3sfaOQS5k2RUISnxu9L/1O2GQ16GjdYaxMO4JKMmqaaQ5V
         cYIuqjoZLIPm/Mo6GCZH7u8pJVpRU1ZGCuTQMboUwewLu47eI7iILyZChEwHfbGQQsZm
         44J4Hrx5YTCUlSvSBW0GI+BHcgtVg0bNldjGDC/2Jajp8QYQgKQjhIvide3KX08SFla1
         Jus+k+r/VI1BSE6AC5QS/weH1Kp2vMsKeDzX2ln8Cp60waIc4Wkw5WD0K8cf6ZS65EQj
         5MIw==
X-Forwarded-Encrypted: i=1; AFNElJ8qlMLwNb5wzaPh5uxVj+LYVYDbfeIu3mEVzpI3Eo8vKCyVzaGOJYUBOXUVEYDtZ7NUmkfNuoVE3ms=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAuo0EpGKOX4aPKcfbH7ZYZI1avGuWhB0oljKCAh7Ha3tpCxiy
	vRjgMXUSBs+IshMu1M5lXZBZMh4GnxNPXNarfmQoFPoOSZiWFEHDyQiF8eZY0rBHZ5kNMPJObZd
	559uPLi1ZBOmFYRn1UvdY69Dgt2gCUmpCJpITjHv9
X-Gm-Gg: AfdE7cmfAttEAdGwUqa/3zlL0bF20BXnIfiqvVmQz/cjDlxdOreFC4bPOTgXJ4MQpLD
	6NzOGrdlSm+WeFZgDx0ZawmOhKpfVwb1SlqiEnfbXoMH1XYh5YbNyt0euIBpEiGg/CsLbhhFmeY
	vN7XSH+v/tHhVTqFVRuggwa/cM8jFThVV3xIc+Ps2vRvjRjn7e4JUjv8KQeXyKi8bb7hIjLhDSl
	PXQghw8UV6w3SP+kRvYomkkYftClqrLDc8WgO5nNcEYW7Q0x3WJajLYS95nNChL84KLAnCwIptm
	vvO7cXgBx22fyFzgLUIsfVKXqBMmBHvLzkMHYd40dQDxIoyYzJnTntNSUsQ=
X-Received: by 2002:a05:7022:45a4:b0:127:3f2a:af21 with SMTP id
 a92af1059eb24-139c5cff378mr4117596c88.15.1782259766886; Tue, 23 Jun 2026
 17:09:26 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:09:25 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:09:25 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ajnjTJdQKD1Kz3tf@google.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-1-9d2959357853@google.com>
 <aceb07e1-77bc-49b6-a932-5fd9b5a21727@linux.intel.com> <ajnjTJdQKD1Kz3tf@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 23 Jun 2026 17:09:25 -0700
X-Gm-Features: AVVi8Cdk7fD1H5RbfHSz0rAk7YN_q01NbBdLx3di9F5nnt4X6vdgAPFTH7tGEuQ
Message-ID: <CAEvNRgFU4H5FrjQvLMQm9DOQ9ujiHfFfsV6zVKNVi-rzC_zSxA@mail.gmail.com>
Subject: Re: [PATCH v8 01/46] KVM: guest_memfd: Introduce per-gmem attributes,
 use to guard user mappings
To: Sean Christopherson <seanjc@google.com>, Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,linux.dev,kernel.org,linux.intel.com,google.com,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93332-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ackerleytng@google.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:binbin.wu@linux.intel.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweic
 loud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baoquan.he@linux.dev,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ackerleytng@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93B6D6BAA96

Sean Christopherson <seanjc@google.com> writes:

> On Mon, Jun 22, 2026, Binbin Wu wrote:
>> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>>
>> [...]
>>
>> >
>> > +static u64 kvm_gmem_get_attributes(struct inode *inode, pgoff_t index)
>> > +{
>> > +	struct maple_tree *mt = &GMEM_I(inode)->attributes;
>> > +	void *entry = mtree_load(mt, index);
>> > +
>> > +	return WARN_ON_ONCE(!entry) ? 0 : xa_to_value(entry);
>>
>> If the entry is unexpectedly missing, returning 0 means the attribute would
>> be treated as shared.  And then in kvm_gmem_fault_user_mapping(), it would
>> allow the userspace to fault in the folio.
>>
>> Should gmem deny such edge case?
>
> After several bugs this year where a WARN_ON_ONCE() fired, but was entirely
> insufficient to prevent true badness, I'm definitely senstive to making the "bad"
> behavior as harmless as possible.
>

I guess both are indeed awkward.

> However, in this case I think we're just hosed.  If KVM treats the memory as
> private, KVM will incorrectly do prepare(), incorrectly allow populate(), and
> will caused missed invalidations (though I suppose __kvm_gmem_set_attributes()
> "only" lies to userspace in that case).
>
> That said, assuming SHARED is definitely odd for cases where guest_memfd *can't*
> hold shared memory.  Ditto for assuming PRIVATE.  What if we instead fall back to
> the "init" state, e.g.?
>
> static u64 kvm_gmem_get_attributes(struct inode *inode, pgoff_t index)
> {
> 	struct maple_tree *mt = &GMEM_I(inode)->attributes;
> 	void *entry = mtree_load(mt, index);
>
> 	if (WARN_ON_ONCE(!entry)) {
> 		bool shared = GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED;
>
> 		return shared ? 0 : KVM_MEMORY_ATTRIBUTE_PRIVATE;

I was wondering if we should not only return the init state but also set
the init state, but that would involve performing a conversion to the
init state... Too complicated for an edge case.

> 	}
>
> 	return xa_to_value(entry);
> }

Thanks Binbin and Sean!

