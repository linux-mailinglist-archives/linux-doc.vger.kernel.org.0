Return-Path: <linux-doc+bounces-94370-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2LDVLGwhRWog7goAu9opvQ
	(envelope-from <linux-doc+bounces-94370-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 16:17:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B866EE998
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 16:17:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=hGcnKqXu;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94370-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94370-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D14B3136CBD
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 13:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919DF265CD9;
	Wed,  1 Jul 2026 13:53:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D09224B04
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 13:53:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914002; cv=none; b=RVx5YVyBbTh8aXj8dGeAj2lEPmuxPke3PlXfjlq9z+YVP9Z068ME0zl4WLhdjb+84Cr7oxBOmoXDhc3IvK/Qv24lCSP3sOeJq550ulIbyhDyc9+NQDYge0Z6k04//fuCpJNT/ndcw4KIimKHGNjAVg+b8xHk23gYuahRQDqer5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914002; c=relaxed/simple;
	bh=k6UrRFYCyc5Lzmrh2nnW7+82Ut94TI2p/klH6GO/JIw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jvWfz/sZYX929B70Uw9o3Ff+TVQ//5Zs6i/dtqDFcsTnPO8dYz51Yd+/JzioKIx6kTlpIqwzjYTrt2xEWH7CGGhQ7FO8Ang61ErQsSXWxl83XwmgCtzhFxLCtiA+HDnAIA7AMzGfL9IsfmR/kR+97XEs4siOHlrJCvrWnHfCSYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hGcnKqXu; arc=none smtp.client-ip=209.85.215.201
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c860544c077so909412a12.3
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 06:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782914001; x=1783518801; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2dlvRC/ivhzraYV58bWG4aEWroXr163d0LU1VPS4Meg=;
        b=hGcnKqXuDyYBtXoz9E2s3EvKuJde3fA/I5zDuDTQCmF6lWrrXkDMU0cj8a8RKAbP2J
         /vFmnMvZyvCBxsw0bVZY0nlu3fLi+eNFRQFTgMYadZw4hFSdmS/v4cq+UYOB10mH2fKc
         Szj8jhMEgAmjeeJjbDE5B7hVFPJH5CyBa1CXPLHY7v2XvnL4ofCnHuVvdiQe+zsrf+0E
         zwBQmocxPDeUJnF8rRf28lut7Wfx6N04gQwxVdiGJfSMIt7wlS62ph7/xmfuprtT4hG1
         T3TGu0K0scVdN/7hVThvmPEt3PaNQmGmRP3JQIV1R8F6k88Im7Vfc3/qVuo7HGoLufi+
         67Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782914001; x=1783518801;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2dlvRC/ivhzraYV58bWG4aEWroXr163d0LU1VPS4Meg=;
        b=ELZreOraYzuZAjRUsEqVIG0/ddoi31I7V6MWBoHe+0lCNYcnlwj5kj9ozweDOY+VaB
         cApoqT2ntK12vKBT/+rzeU0vOXo1/u7U6Nu38XA1dhJIaagzjiXS3e3jVMNhcCPW0Gb3
         m0za3ZRnQw/8IYt0+GYL9ZhOGuuUrfi+Zspa98ofbw2+CFTIZEsb9+ZZoUM5NLH6yrD6
         s7p27/eaVdNdA/GmVMeHQUlA0nxaDDuMgTIKWdj+tdMBUFKhf8c9KWRVoLsR/sN1wdLZ
         51w1FVVis0rY0f+VKjexfpgwrMkgewsHFYdVT/u8diuqp0f40X1Rn9x7lim1hfThZg1b
         ++Hg==
X-Forwarded-Encrypted: i=1; AFNElJ8yHNiBPVc8D8nluEBbDi0sd03w+lKt5ttuPkSV/HWZYUYOoYoH4/bv7G9vjOYUd6W/Nr1GbvUZ7O0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb0gAvbJ99gGqgzgGcv6dQ/Wuu7to1r3Yp87r3ZyWfEv/3DYH5
	ZrYuORhgmaCH1mDCWeyrlLb9UdzOQdIF7bwGThNBKh6OZLdle+aRU73pyeAOt/Q1GKqHLODUg9W
	HhcIMsw==
X-Received: from pgam26.prod.google.com ([2002:a05:6a02:2b5a:b0:c99:aff5:707d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a11:b0:3bf:acb2:5d48
 with SMTP id adf61e73a8af0-3bff4227b8fmr926021637.38.1782914000204; Wed, 01
 Jul 2026 06:53:20 -0700 (PDT)
Date: Wed, 1 Jul 2026 06:53:19 -0700
In-Reply-To: <25fdb77d-20f6-4b3a-8b3a-dbba0dc47046@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com>
 <aji/2svhcc84rn5w@yzhao56-desk.sh.intel.com> <CAEvNRgHYTFnHbsLLgMTCSitmnp1_j9Pomikm9qmpGTh1w8YE5Q@mail.gmail.com>
 <ajx5Vrz9ma--hrGH@google.com> <ajyJhZcgfYFtGfS2@yzhao56-desk.sh.intel.com>
 <aj0Jf30PS2f7x1nt@yzhao56-desk.sh.intel.com> <aj087H1UWSFxbShR@google.com>
 <aj3H2sxymOYTWTnE@yzhao56-desk.sh.intel.com> <aj7NwCRwWEfLK-gQ@google.com> <25fdb77d-20f6-4b3a-8b3a-dbba0dc47046@intel.com>
Message-ID: <akUbz_kJvYulaboo@google.com>
Subject: Re: [PATCH v8 24/46] KVM: guest_memfd: Make in-place conversion the default\
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>, Ackerley Tng <ackerleytng@google.com>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, forkloop@google.com, 
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
	FREEMAIL_CC(0.00)[intel.com,google.com,amd.com,linux.dev,linux.intel.com,kernel.org,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94370-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xiaoyao.li@intel.com,m:yan.y.zhao@intel.com,m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@ten
 cent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baoquan.he@linux.dev,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16B866EE998

On Wed, Jul 01, 2026, Xiaoyao Li wrote:
> On 6/27/2026 3:06 AM, Sean Christopherson wrote:
> > On Fri, Jun 26, 2026, Yan Zhao wrote:
> > > My first impression of gmem_in_place_conversion=true was that it enforces gmem
> > > in-place conversion. However, it actually only enforces per-gmem private/shared
> > > attribute.
> > > My worry was that people might think it's a kernel bug if userspace can still
> > > have shared memory from other sources after they configured
> > > gmem_in_place_conversion=true.
> > Ah, I see where you're coming from.  FWIW, truly enforcing in-place conversion
> > is flat out impossible.  E.g. userspace can simply replace the memslot, at which
> > point the memory effectively reverts to shared.
> 
> would something like below enforce the in-place conversion?

No.

> Userspace can create a memslot without gmem fd, but that memslot can only
> serve as shared memory and cannot be converted. So it doesn't violate the
> in-place conversion.

But userspace can delete said memslot and replace it with a memslot pointing at
a guest_memfd instance that was created without INIT_SHARED, at which point
userspace has effected a shared=>private conversion.

