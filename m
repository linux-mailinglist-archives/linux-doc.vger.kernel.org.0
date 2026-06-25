Return-Path: <linux-doc+bounces-93557-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wh3jGvJLPWrP0wgAu9opvQ
	(envelope-from <linux-doc+bounces-93557-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 17:40:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 231626C7219
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 17:40:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=O1HkzZQI;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93557-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93557-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AC06304CF69
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 15:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437D627E049;
	Thu, 25 Jun 2026 15:40:30 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067F623392F
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 15:40:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782402030; cv=none; b=MiD6HBi2dNgN/LdD/Fl+EDbEdoPTzYDB0mTUjwWte5b9QL1sBGjf5Ps26VxQhxtLCZGXl6c2y5PiFf3R8GlBfpkwamWx7brNxuZcYxRMX/dBiQMMj6fm+keWdadm1mxKsI+9bfDGvhXnMoTaDqQMuFWAiUmusE0nqaVkIor8yvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782402030; c=relaxed/simple;
	bh=wnycnk35ivpQHERfilV0c1wBVrlSSxbqgktgJps4HzY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FPIo3XzGqVzfVlmXJ8eABd4bPxmUHMvahYLcQKP0AR0NH2w1HOHDg4EXSaqWcGecSlLoSgWNpzBclL09S6bs/L/oWtY43iBOwSwJFdP6dlMHisOIYXyXIKbl2sR19oqN1E9wZUgK7t6iDuZKZO9hPvY34jHZPy6lPqvBt1Jzce4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O1HkzZQI; arc=none smtp.client-ip=209.85.215.201
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c85798977dcso9606a12.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 08:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782402028; x=1783006828; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Itjo2jMjkwhBM0k9+OlfOfXdIDoAWufeDNJNDd1hXfc=;
        b=O1HkzZQIi+MnRkSybj5bbHuNPOdQm0Cmmkp8R2vnMeuw9GWpob8A+A/aD4CDhOrWgP
         FJWl+84GxCOD51HXoVsHR9kMqxc0JN7hEHkV/ZXBReJ5S+BiDH5VKRRcuoOFAOyHvjlt
         Q+IMC3Rx+3t+vBvSw0G+3Q+y5kUa5TeEfSfy8Bpsp0XtvORO3v5FaT7VZdS/Y7VFGLlX
         0pg4Dshd8wn1n0dXEir7JeZzp6LGx1xIHBxPAZRpY//ieK0H6vF1eNPSDpUfyQ1vK1a5
         Ve9TtzFxPu/KyrX0abS2rMpjTgJzrWKggNpa4IRUcEzwHDRqASoj5uZQ2pXXTguf7WNc
         6thQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782402028; x=1783006828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Itjo2jMjkwhBM0k9+OlfOfXdIDoAWufeDNJNDd1hXfc=;
        b=ZOSAMlhgdzaBQB9LyunhEoE1z3gTi3doLKpw3mBE20i33yXdE8sbxsys6NTIxGLYfM
         GiYyF391gT+oaD6UEyCT4ajEQ0CqhHdbJSmv1+zWypWZfrQ13Cf+it/BxmZcUpmUgv+T
         jX3mZS+axOlaLfJJYAp2rneneP/tJpojhJJlZEyFXcvemV5AvlG/kMLFJ5I+WThRghjF
         vuDcZv0xN+9DUCL7O59VC4Uy9QXudOEQJ2e+wJJV8cI08AMEf/OJOrCEB0BDBgmyMP70
         9/m28MCwwbZvDir3In2llxQm5XHDc2JAXPQVizTeImyzaRLRSN1OXwcWpLg8C2HdPKut
         9JMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tP31+dIeQS6g1oIH2xxNzAUaFZDMQYDKN9Kg0rTDsNOBJAPeOk4nkN9vkOgxD4RJHsPLUpmitfdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJikP76hjaQX2TH+JMxLvTpvpSiIdU2thXEotqA4Du/LaiCCQi
	c1WzYcw/BHLbDEziZNuSWbqgAOGVPNiItxJWfSsoB5zVcB62R83wESD5YiJZ7F2zZM3DM6BJPLJ
	9voGFow==
X-Received: from pgbdk2.prod.google.com ([2002:a05:6a02:c82:b0:c85:9dd2:d11e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:cc97:b0:3b4:5c6f:cf30
 with SMTP id adf61e73a8af0-3bd4b25b347mr3615613637.38.1782402027934; Thu, 25
 Jun 2026 08:40:27 -0700 (PDT)
Date: Thu, 25 Jun 2026 08:40:27 -0700
In-Reply-To: <6ed7d12a-c3a1-4572-8385-754e6d5b8b44@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-18-9d2959357853@google.com>
 <ajwMYCSrPlxg-Fok@google.com> <CAEvNRgE8HZDOnexMJeim6TjmxGG1AUXFY2+HH1YyKB=aM6D-DQ@mail.gmail.com>
 <ajx3vmNPRf-M9kR6@google.com> <6ed7d12a-c3a1-4572-8385-754e6d5b8b44@kernel.org>
Message-ID: <aj1L626RI3Ty_hh3@google.com>
Subject: Re: [PATCH v8 18/46] KVM: guest_memfd: Handle lru_add fbatch
 refcounts during conversion safety check
From: Sean Christopherson <seanjc@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Ackerley Tng <ackerleytng@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,amd.com,linux.dev,linux.intel.com,kernel.org,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93557-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@hu
 aweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baoquan.he@linux.dev,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 231626C7219

On Thu, Jun 25, 2026, David Hildenbrand (Arm) wrote:
> On 6/25/26 02:35, Sean Christopherson wrote:
> > One thought I had, to avoid the IPIs that draining all per-CPU caches requires,
> > was to disallow putting guest_memfd pages in folio batches, e.g. by hacking
> > something into folio_may_be_lru_cached().  But due to taking a per-lru lock,
> > that would penalize the relatively hot path and definitely common operation of
> > faulting in guest memory.  On the other hand, memory conversion is already a
> > relatively slow operation and is relatively uncommon compared to page faults,
> > (and likely very uncommon for real world setups).  I.e. having to drain all
> > caches if conversion isn't safe penalizes a relatively slow, relatively uncommon
> > path.
> 
> Yeah, the lru_add_drain_all is rather messy.
> 
> We have similar code in
> 
> collect_longterm_unpinnable_folios(), where we first try a lru_add_drain(), to
> then escalate to a lru_add_drain_all().
> 
> Maybe we could factor that (suboptimal code) out to not have to reinvent the
> same thing multiple times?

As discussed in the guest_memfd call, we should do this straightaway, i.e. instead
of merging this series as-is, so that we don't export lru_add_drain_all() only to
drop the export a kernel or two later, and can instead export the helper to drain
any batches for a folio (or set of folios/pages).


