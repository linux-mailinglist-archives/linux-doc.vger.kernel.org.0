Return-Path: <linux-doc+bounces-93205-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PXFeHAlCOmqs4wcAu9opvQ
	(envelope-from <linux-doc+bounces-93205-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 10:21:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 141EA6B53CA
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 10:21:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=xww56uZA;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93205-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-93205-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40F65304AE42
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 08:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE883CCFAF;
	Tue, 23 Jun 2026 08:21:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597E83CCFA8
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 08:21:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782202873; cv=none; b=h2hghA38A8EpuZH5IdEsv/KCyuu6CxLEmm1NF8/IXxmhNA1glF4xhXP8hScT6N0nM5nSUw96L+GghrhEomadQqxu1HM4059/UsNMLq00djW3l2ZD1lLuzkV2PyifDyg44Q1NKoC3CX7+7QqHu1TpWLwgodCQT83OaGXXLd+0Dtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782202873; c=relaxed/simple;
	bh=vWncEwffRc3SYTUhcngGHajaIOMNvIgO6vhdoy3NFQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AkfSPk4HzpAYRDKBrHQdtcQYexlL7fx6BjhHYR0X7QD8yLOZJuKlLDt8KqRXjzH4+age9XvN+vmLOGZM5xkmzffwah9er/DX7cNVqt6Lfh7alGHqewzfd3vfn+2AtkkXtzaP2G53rXabtmVlGjnrJYnDr+Tytow+5ezb317xYkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xww56uZA; arc=none smtp.client-ip=95.215.58.183
X-Forwarded-Encrypted: i=1; AFNElJ+IAyhVdWmnn5T/cOMkUkR/fXlANbGQvo4QnGN7FzIQ8Yzoz7fInCOiWNCIlXfo49O0s09vXflLXQM=@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782202870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QXAENCcp5BDbPSOsn4f1upfQaIKMcigDEFtOKnyVkvM=;
	b=xww56uZAvKekX61nmvfAovT0pNsZZ8j5IFjhEs+9/iuxN6htn/Z9hPyCoiC1funxtAm9t3
	rfVbvEirki//gj0J6cjCms6nv+oeftXtBlX1Jgb4vK8AJa2Q4JnoDeJ0t2heSY/rvsfdGJ
	+atsXjA4nnLz3Qsw3gWpXAjQQib9ihs=
X-Gm-Message-State: AOJu0Yy5vSxG7SxOABnqTfp2+MmoeVxyUz6elBD1PSOuM1Y0Vo4jiBNu
	HTXuPfRpFDhxvSJISTvxGwnzdsBPKcS7rE6d6VkU7Q+IJhpLjlcv2zKWipgsLdqvY1JJhJD6Hn+
	xrVQSIfzKk9LX0FhiBU3+9sp9KekgNi9rXIwiveyT
X-Received: by 2002:a05:622a:1246:b0:519:f8a0:16b4 with SMTP id
 d75a77b69052e-51a522c6f26mr6874451cf.14.1782202842728; Tue, 23 Jun 2026
 01:20:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-13-9d2959357853@google.com>
 <CA+EHjTx2xKjheiW5VzHw_TdWFUqdJqfgu=dOPa=_yaYBMY8uyw@mail.gmail.com> <ajnRxuJ19OzZ8zJC@google.com>
In-Reply-To: <ajnRxuJ19OzZ8zJC@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 23 Jun 2026 09:20:06 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwLPCvZJgPv=8u3pgp+kwEwQbsXn_13FL3xUbJ7HRfXzw@mail.gmail.com>
X-Gm-Features: AVVi8Cd8AX_ogmuHxl3lyKLs763XEWuLTlPOQRHFThhzmhUCsdYVCq6sKYCvrh8
Message-ID: <CA+EHjTwLPCvZJgPv=8u3pgp+kwEwQbsXn_13FL3xUbJ7HRfXzw@mail.gmail.com>
Subject: Re: [PATCH v8 13/46] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
To: Sean Christopherson <seanjc@google.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
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
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[fuad.tabba@linux.dev,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93205-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,amd.com,linux.dev,linux.intel.com,kernel.org,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@h
 uaweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baoquan.he@linux.dev,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fuad.tabba@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux.dev:dkim,linux.dev:from_mime,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 141EA6B53CA

On Tue, 23 Jun 2026 at 01:22, Sean Christopherson <seanjc@google.com> wrote:
>
> On Fri, Jun 19, 2026, Fuad Tabba wrote:
> > On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
> > <devnull+ackerleytng.google.com@kernel.org> wrote:
> > >
> > > From: Ackerley Tng <ackerleytng@google.com>
> > >
> > > Introduce base support for KVM_SET_MEMORY_ATTRIBUTES2 in guest_memfd, which
> > > just updates attributes tracked by guest_memfd.
> > >
> > > Validate input fields in general. Guard usage of KVM_SET_MEMORY_ATTRIBUTES2
> > > by making sure requested attributes are supported for this instance of kvm.
> > >
> > > A new KVM_SET_MEMORY_ATTRIBUTES2 is defined to support writes (unlike
> > > KVM_SET_MEMORY_ATTRIBUTES) in addition to reads so it can provide error
> > > details to userspace. This will be used in a later patch.
> > >
> > > The two ioctls use their corresponding structs with no overlap, but
> > > backward compatibility is baked in for future support of
> > > KVM_SET_MEMORY_ATTRIBUTES2 and struct kvm_memory_attributes2 in the VM
> > > ioctl.
> > >
> > > The process of setting memory attributes is set up such that the later half
> > > will not fail due to allocation. Any necessary checks are performed before
> > > the point of no return.
> > >
> > > Co-developed-by: Vishal Annapurve <vannapurve@google.com>
> > > Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> > > Co-developed-by: Sean Christoperson <seanjc@google.com>
> > > Signed-off-by: Sean Christoperson <seanjc@google.com>
> > > Reviewed-by: Fuad Tabba <tabba@google.com>
> > > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> >
> > Note sure if it's user error on my part, if I'm applying this to the
> > wrong base, but I found a build break here on patch 13:
> > kvm_gmem_invalidate_start() doesn't exist in the base tree. The
> > function is kvm_gmem_invalidate_begin() here. The rename
> > (190cc5370a8b6) landed via a different merge path and isn't an
> > ancestor of the stated base.
> >
> > Patches 19 and 20 have the same mismatch. Fix for all three is
> > s/kvm_gmem_invalidate_start/kvm_gmem_invalidate_begin/.
>
> Ya, Ackerley used a slightly older kvm/next to send the patches.  I at least was
> testing against kvm-x86/next, which does have the rename.
>
> Other than noting that this should be applied against the current kvm/next, I
> don't think there's anything else to be done?

Agree. Sorry, didn't mean to be nit-picky, but this really threw me off :)

Cheers,
/fuad

