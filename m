Return-Path: <linux-doc+bounces-93166-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XtrcJDTlOWosywcAu9opvQ
	(envelope-from <linux-doc+bounces-93166-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 03:45:24 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBF46B3580
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 03:45:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=hRn3tqx+;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93166-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93166-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FEA0305B123
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 01:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB9B35A39F;
	Tue, 23 Jun 2026 01:37:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CF113E02A
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 01:37:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782178639; cv=none; b=k9/4ikDcVUVo4ZXyrFpOqc8+NJrS9+mGC/5uY/ss+my/T/PGTF4e0VcrF9VgKP6hAZXn+MM9mwpt8QAZx0/q+gfXOSgfvR4QnrlUMEEwkogEtbim9LVWiNz/dObrv5kUQoKSqodahbFyKLTdeoD4rz2SDMEzO3XHx2l0towiZpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782178639; c=relaxed/simple;
	bh=5DxnOpKxfSLreEefJhlh19ZNtNNDhg7LneuBINRCFH0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g5gp3B9THZh6HxxagdJBLsTBGYWCxpPx4X/tPOeCYT7pEu8A359XhW/cYdK2NF6XiMdwG0cUOnGlggwxmx0PU+2GeBLOj/2KgEzPzS64pGSk6loIZ3BT58z0GX/HdN9MZm2H4gizr5HmNtHPqow5tmetNJvnHIj23QMkL/XWlJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hRn3tqx+; arc=none smtp.client-ip=209.85.214.202
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c0532a6588so44075455ad.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 18:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782178638; x=1782783438; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AP9gehEakYRCrViEtM0iQf/Z+UhqMaziDYgqcj7Zu0I=;
        b=hRn3tqx+Sz8fueo4/W3oWJiLZ8I6XXIlhDj8ugi8QdXZIv4FrxBaMw/z9DbQsh+H55
         qg6S2EcgvsrtLPAxT3OqjzT2lUVXYMGS07H32nTNP5EOr4R9J3EY7ZPbNcBPmSBTRK8i
         5bWai6YNUqT6XuNqEeaZQWj6ajY+LsES/9QF3TmiGL0hUagoN8Unz7XtqLHPjPwSNiUZ
         3CLncvk9uH7NTJWJne/Vpn/693HMcfGoQMqhhWX8MlUC3J9/knjy85ewtxYQm+qwDhbe
         scPCG9WTN9OoIQIQ/fORHRIGjEG7M0+2mueTIsuRey7AttGsP0NOZdZGjEpx/4prN6wP
         O2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782178638; x=1782783438;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AP9gehEakYRCrViEtM0iQf/Z+UhqMaziDYgqcj7Zu0I=;
        b=C/r13QTl6vz1IswNb2hL8C0uHmMOm4zJFOGDUVJS6DEqrfycferNFxWXlj4UOwGxLo
         1Tgz+oDDC2Wbb0ogH6PqGT/KaUAxzDm60657+FXm+xcZOVF9ECJPuByDDM7RvEWWqgGq
         HX+2t1SlF8X4bo93mE6dp1zlE6w3p55cRCEM1y+RjJQL6TJrpniTVAjKZXn7cm85riOC
         RdAEXkb7ZlLiScPkHJjKZyP5ROAkDdi3s2ZhU3mfinJb32PovobPdHaRyFJwC4QWO0hO
         PmFVQQs9z25QsNdJWz1qk9zJAbpNd7knLcWPSZ0b/f8dHkp3+F6ebGCYnBlgjf3LXj/V
         4coQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGaQCIshxSckNXzeHvW5IKXP1+jcFxsQ39hBI8EMVxU62QL3ZNKFoqiX5O63JIlUd0RdIE2NsPU2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTwbn9GXoFMwbVnD4RDenuvsSk46XzMvCajQPpNwVMxv1WLmWe
	GaOGNKzQ/VqRYqQnQ4YI2ANVuW8U1qPXO8HNzV/Fbe4Q9PFOj6gooA8v1mXuhHjY4fePhVMGJ5r
	54SGqkA==
X-Received: from plox10.prod.google.com ([2002:a17:902:8eca:b0:2bf:27ab:9cf4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a68:b0:2c7:9ba7:a39f
 with SMTP id d9443c01a7336-2c7c99de6e3mr2076175ad.17.1782178637132; Mon, 22
 Jun 2026 18:37:17 -0700 (PDT)
Date: Mon, 22 Jun 2026 18:37:16 -0700
In-Reply-To: <aceb07e1-77bc-49b6-a932-5fd9b5a21727@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-1-9d2959357853@google.com> <aceb07e1-77bc-49b6-a932-5fd9b5a21727@linux.intel.com>
Message-ID: <ajnjTJdQKD1Kz3tf@google.com>
Subject: Re: [PATCH v8 01/46] KVM: guest_memfd: Introduce per-gmem attributes,
 use to guard user mappings
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
Content-Type: text/plain; charset="us-ascii"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,amd.com,linux.dev,kernel.org,linux.intel.com,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93166-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:binbin.wu@linux.intel.com,m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@hu
 aweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baoquan.he@linux.dev,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0BBF46B3580

On Mon, Jun 22, 2026, Binbin Wu wrote:
> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
> 
> [...]
> 
> >  
> > +static u64 kvm_gmem_get_attributes(struct inode *inode, pgoff_t index)
> > +{
> > +	struct maple_tree *mt = &GMEM_I(inode)->attributes;
> > +	void *entry = mtree_load(mt, index);
> > +
> > +	return WARN_ON_ONCE(!entry) ? 0 : xa_to_value(entry);
> 
> If the entry is unexpectedly missing, returning 0 means the attribute would
> be treated as shared.  And then in kvm_gmem_fault_user_mapping(), it would
> allow the userspace to fault in the folio.
> 
> Should gmem deny such edge case?

After several bugs this year where a WARN_ON_ONCE() fired, but was entirely
insufficient to prevent true badness, I'm definitely senstive to making the "bad"
behavior as harmless as possible.

However, in this case I think we're just hosed.  If KVM treats the memory as
private, KVM will incorrectly do prepare(), incorrectly allow populate(), and
will caused missed invalidations (though I suppose __kvm_gmem_set_attributes()
"only" lies to userspace in that case).

That said, assuming SHARED is definitely odd for cases where guest_memfd *can't*
hold shared memory.  Ditto for assuming PRIVATE.  What if we instead fall back to
the "init" state, e.g.?

static u64 kvm_gmem_get_attributes(struct inode *inode, pgoff_t index)
{
	struct maple_tree *mt = &GMEM_I(inode)->attributes;
	void *entry = mtree_load(mt, index);

	if (WARN_ON_ONCE(!entry)) {
		bool shared = GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED;

		return shared ? 0 : KVM_MEMORY_ATTRIBUTE_PRIVATE;
	}

	return xa_to_value(entry);
}

