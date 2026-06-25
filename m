Return-Path: <linux-doc+bounces-93447-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F1qcJWV5PGrMoQgAu9opvQ
	(envelope-from <linux-doc+bounces-93447-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 02:42:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB9A6C204E
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 02:42:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=ld0sQ5pn;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93447-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93447-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0BC3303D4C1
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 00:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D406534CFC7;
	Thu, 25 Jun 2026 00:42:05 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3517B3451C6
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 00:42:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782348125; cv=none; b=mTz9C8xUzGFDF9Lg4m6W6u/c7u1X005LLoe4EmzLe7/IdQ0GPDaNT90tLwm8tmXOpY1v7G6uWnMwTmRXzjdtb/OsMaSct1G0xAYxCIBX/uMcVSTP42cp94EerM1VSheRWBNb26O4Eb4nGwpz47b8jrehZ+g3pm5sNa61Bn05Khc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782348125; c=relaxed/simple;
	bh=YB5GE7E3Xs7izwgjr3ob/9chSpyxHi2CWbqKKsIl2LU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sT0N6zU4FTL003f4VIDmzuCcPum5D4hDvwUUAYNF5dR4bqIMRwtmO5Eti/nHN4cLeocLPfgo//T6eoZ+rEjgAZ5vOt4zY9ZN48hwh+nyvieuEZbMXvNk5R9PjQnn/HN5FkDYclKjTYgxPOUHijoMgRHbOAHVouWP0KLxJMGTxIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ld0sQ5pn; arc=none smtp.client-ip=209.85.216.74
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-37de9c29aecso1078614a91.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 17:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782348120; x=1782952920; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4DFjavBCbzblLm5XoFLaw3Sc1sbInL5uPLu8y3/D5AM=;
        b=ld0sQ5pn/27icAX0On2IPZvHVbb1d6nmZGTJ77Xwd3AqbJmmFP1dbrJ1KIK7QVr+Sr
         OOHdZwUb8C6QCd6v+gV4lerzyvAV6L472C86xkkL377yEUo9vI0t6C49OfkXqBTv2SgO
         AgAOwUGiioi3H941wg4zObSQCX8NjKD71d7bU8Yki6O4Mc8y+zbaQUO8q43PjwqXusQo
         pNGjKy+0V13aLP5zAXBSZnCEQhl6JgDvrAF4KuV+V7qqhJrtmPWjWHFaFKfpPrWVDSVQ
         vACTwlCEzHh62qfUm9rDoKAwTB1z+/Ey8VDCdKWDLum/x3s5KhLBtawQNrjtYoX8vkNv
         fjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782348120; x=1782952920;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4DFjavBCbzblLm5XoFLaw3Sc1sbInL5uPLu8y3/D5AM=;
        b=kpPnS1WYNqMVaTb3DJ4ojuxuBLmpTnWs29kB/pZUNftvcXOy/DhY1dJ9rcj1Ca/kkn
         Ad59iREgbUCEK9HKbAbV7+a9LDJUJQxXl9I89frB5JYMFFM30m9xJYf0upCDOaeZa2MZ
         8dOf8CzEU7B6BwQwbex/4Fztosx3ZNa/ft9yrvhUr7wMwEtaOCFwlqEuq8mauGrHFQrt
         3hLS5vLicZTOZnmB8M3yoJdSYz6BGM2nVdfHCnd9Op7+aubiRlLeKf4RmM03cB6CLeRe
         cI2mckopldKyBnay1f4Exw35iDBxju2rAOTZ4Ld4JWTQyWjt/6xOalT5c7UTn3VmheaU
         XJGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8omdYTxHl1B/GcvYNyrlCN0EamRSRtZpleKgsacmhizFQuKPgoifOwGHlvblimsh0Jfp/szs+naLI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3DPg4mhh649KjdTESJku86ebo4CPJ3kqUENWI611CBeiD+3VV
	JKh1Yu4SlTps67XpW9/56/XWmUy+F7CC41ofDTPVcsODj7UcfqNqWF+BjcZEqmsWN8jGtqleuCW
	Ap0+1+g==
X-Received: from pgbbo12.prod.google.com ([2002:a05:6a02:38c:b0:c80:296b:72cc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7fa3:b0:3b4:8bc6:138
 with SMTP id adf61e73a8af0-3bd4ae9cd56mr397852637.23.1782348119218; Wed, 24
 Jun 2026 17:41:59 -0700 (PDT)
Date: Wed, 24 Jun 2026 17:41:58 -0700
In-Reply-To: <CAEvNRgHYTFnHbsLLgMTCSitmnp1_j9Pomikm9qmpGTh1w8YE5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com>
 <aji/2svhcc84rn5w@yzhao56-desk.sh.intel.com> <CAEvNRgHYTFnHbsLLgMTCSitmnp1_j9Pomikm9qmpGTh1w8YE5Q@mail.gmail.com>
Message-ID: <ajx5Vrz9ma--hrGH@google.com>
Subject: Re: [PATCH v8 24/46] KVM: guest_memfd: Make in-place conversion the default
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
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
Content-Type: text/plain; charset="us-ascii"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,amd.com,linux.dev,linux.intel.com,kernel.org,google.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93447-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:yan.y.zhao@intel.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@hu
 aweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baoquan.he@linux.dev,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 3AB9A6C204E

On Wed, Jun 24, 2026, Ackerley Tng wrote:
> Yan Zhao <yan.y.zhao@intel.com> writes:
> > With gmem_in_place_conversion=true, userspace can create guest_memfd without the
> > MMAP flag. In such cases, shared memory is allocated from different backends.
> > This means this module parameter only enables per-gmem memory attribute and does
> > not guarantee that gmem in-place conversion will actually occur.

KVM module params are pretty much always about what KVM supports, not what is
guaranteed to happen.

  - enable_mmio_caching doesn't guarantee there will actually be MMIO SPTEs,
    because maybe the guest never accesses emulated MMIO.
  - enable_pmu doesn't guarantee VMs will get a PMU, because userspace may elect
    not to advertise one.
  - and so on and so forth...

Yes, there's a small mental jump to get from "KVM supports in-place conversion"
to "I need to set memory attributes on the guest_memfd instance, not the VM",
but I don't see that as a big hurdle, certainly not in the long term.  And once
the VMM code is written, I really do think most people are going to care about
whether or not KVM supports in-place conversion, not where PRIVATE is tracked.

> > To avoid confusion, could we rename this module parameter to something more
> > accurate, such as gmem_memory_attribute?
> 
> I asked Sean about this after getting some fixes off list. Sean said
> gmem_in_place_conversion is named for a host admin to use, and something
> like gmem_memory_attributes is too much implementation details for the
> admin.
> 
> Sean, would you reconsider since Yan also asked? If the admin compiled
> the kernel knowing what CONFIG_KVM_VM_MEMORY_ATTRIBUTES means, then the
> admin would also be able to use a param like gmem_memory_attributes?

No, because it's not all memory attributes, it's very specifically the PRIVATE
attribute that will get moved to guest_memfd.  I don't want to pick a name that
will become stale and confusing when RWX attributes come along.  The RWX bits
will be per-VM, while PRIVATE will be per-guest_memfd.

