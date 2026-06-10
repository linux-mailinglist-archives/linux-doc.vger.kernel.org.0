Return-Path: <linux-doc+bounces-91883-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cE/QNNnjKWpOfAMAu9opvQ
	(envelope-from <linux-doc+bounces-91883-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 00:23:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7E166D2FF
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 00:23:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="v/y78KOp";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91883-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91883-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA56330316C8
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 22:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848C42E7375;
	Wed, 10 Jun 2026 22:23:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446EC3358CA
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 22:23:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781130199; cv=none; b=c0xCk2KqGgHsiHlH125Ch6gFo8BTGWrWcL88Jg7O88O5s5WW43qJRQ2M/MvZsBA5ZMKHGb2XbEPOwF1hSx5pvRBIF9GL575ZuG0hjkgi1X4O9x6MR/zyTbyuPuwiIFyDi87NbDDGHDHUfV88S0vM612m5Iq3hI/Pjclwgwnw+ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781130199; c=relaxed/simple;
	bh=qAjd2/KUhCE05aLK86qBIKOiIpOhNXWGC/5z6iGv760=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tsBDDDy/VzW4BF/BrEIceJo1L/aqnGQUI7ZN9TjUZzoDsgS9jRPDQENAO0GSmSr45NAdNP0/hdO0dBx1N+NbasM1I43a6Wqrexq93a7wOW08GZfmx6apqwvAFteN4oYfeTgVTUmiJzig7bNWwEXmkGGg8jJNDia9BknbsXdQrQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v/y78KOp; arc=none smtp.client-ip=209.85.214.201
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bf2bc4371bso2061615ad.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 15:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781130198; x=1781734998; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=98nQEvZDyKKcPdn3AcVzWFv9XYmn8L+0P9K+2v5L7Fk=;
        b=v/y78KOpMM8Epdinj0Xd1ajiQGJ9nvLmAuLlvnNN5mC4ejiucVZcg1iGoZf/12aAoa
         ten+bmESuXsdcP+YVqnpO7vMWHm7dOm7LxSCrDZH9Qm/3AtgtBAVQhA7/N8RirUKtbxd
         wyiW5hY2MiniyOnEqEKUh6fBTZPo2FvpttmZylPFqs9nh9mE9EnwJ6LKdSSwItCt2xiF
         FBbGo4j9qn8cAH1sqgrtZ8Kfs6vyBwlVdV2l9LiYQskgBRd4w2or4xutpD/CTi+xGa6s
         riN21OgqjBNctSNpy/6f2xk4rYgNsXb8fGoIStUcoB31NggKGLXJVp71Om83RhR26I4E
         Qv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781130198; x=1781734998;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=98nQEvZDyKKcPdn3AcVzWFv9XYmn8L+0P9K+2v5L7Fk=;
        b=Wb+qNkfqUJNxIR6ujHD8ZHzBKT1dXl/XDbm6yNTRyvYHtbwlZMPypII58gEHECAJ/Q
         qamGnUClhe2xOpTf4JOiV301Ly0+TtCCECJkKbV/lN5h+++45Ce4kbBOsfAJU9Bk80zK
         CPH8TRmXrh+ONYqw7aV2Px/6RWX+RQt2Rg3QFGwF4g5lk72YSjpI63xjAZ1sJV2eFN+7
         7EHkfGwdXZncl2DVII7jIGe/gt3cxwztVCdFJa4DIFCW0jv9jV8de99XIfp3n3GGs8sV
         fXo7PAoqCkavX1l9VBB7duen6v/bIHd24h7sQ8cCp8bVCk6vcnX385oRpb2iyWnmBKe5
         S8cQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uqcQLdg5wd3C4HeLqab39PelgL2J42sB9hRT6G9J+Ya9FXvjdOWpZYt+594UhdFr4lAB2UkFr4+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlDhj7X9scAoPK/1hmA66M1eRxHaWy6K3NzajmTEIA4B+6nhw8
	I9KfHIonJ6rB1TmsdEaeYkTAJf/TLZKU99SIS5plWVAjos6/7HmzaGc4Y4W1Cksh77GwzCyMhRs
	xIE/aZQ==
X-Received: from plpv10.prod.google.com ([2002:a17:902:9a0a:b0:2bf:224f:daf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3c6f:b0:2bf:1aa9:6c8a
 with SMTP id d9443c01a7336-2c2dce83fd5mr4806375ad.12.1781130197572; Wed, 10
 Jun 2026 15:23:17 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:23:16 -0700
In-Reply-To: <20260522-gmem-inplace-conversion-v7-6-2f0fae496530@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com> <20260522-gmem-inplace-conversion-v7-6-2f0fae496530@google.com>
Message-ID: <ainj1B4jB_XihoHZ@google.com>
Subject: Re: [PATCH v7 06/42] KVM: guest_memfd: Update kvm_gmem_populate() to
 use gmem attributes
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,linux.dev,linux.intel.com,kernel.org,intel.com,google.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91883-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:ira.weiny@intel.com,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tenc
 ent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C7E166D2FF

On Fri, May 22, 2026, Ackerley Tng wrote:
> Update the guest_memfd populate() flow to pull memory attributes from the
> gmem instance instead of the VM when KVM is not configured to track
> shared/private status in the VM.
> 
> Rename the per-VM API to make it clear that it retrieves per-VM
> attributes, i.e. is not suitable for use outside of flows that are
> specific to generic per-VM attributes.
> 
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

We should squash this in with the previous patch, i.e. wire up PRIVATE to gmem
in a single patch (sans the ioctl support).  I had a hell of time figure out how
the range-based lookup was supposed to work when revisiting the "wire up" patch,
until I realized populate() was handled in the next patch.

