Return-Path: <linux-doc+bounces-96472-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PyNcNAD6U2oVggMAu9opvQ
	(envelope-from <linux-doc+bounces-96472-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 22:33:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 188AE745D63
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 22:33:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mMndYpb3;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96472-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96472-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1B89300A3BF
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 20:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4AD370AED;
	Sun, 12 Jul 2026 20:33:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7027353A63
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 20:32:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783888381; cv=none; b=sirz76fnTWGnrvPAM++Pqye9F2ZqXkBmM7vuh5rbm0NvJIBRRZdStTFnvrSew7sH9uYzaVRyRbjgK5nTMdUOpBBFRjtE00dGAMC2T0RhlRJgT6N34Iw0NQs7gHk7HC399MYrhaECwCmPRpO8bAGf8845kqTXtkDYyIteh8Cca2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783888381; c=relaxed/simple;
	bh=vIxocmQXXq6Vrqr+5uIHeLC+jGNN0zgOMuWrSgXpbzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=CmZx4cErqS3KnFfFKK7qshntC3EtcILVBasCKJqtqI+DsNhYI2iwhmHAdVn+3yw1qQICs0sWtS1MGlkPZHzYZz1dVlDqZuIWgxViM5OTC1sMKdd236LdmaFevG2yQf4yVI/CV0ErcBJB+iWCf4L0kRB9Dr1f0CbyzGPTW5RnukY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMndYpb3; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-472326ca506so1935651f8f.2
        for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 13:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783888378; x=1784493178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hoFLr1vfVTbyBPCDDFLHELDOVM+etETDJUoaDXyGSaU=;
        b=mMndYpb34zhFfe6n0q6ytkYCkSYMBGJsTvSSn3nwukDrqQemtcbxyf0xWzTKPP274i
         ZXJNT1vaef+9uw9IwoO5VnvNqSVXUgQKgtOgLzPvZNyJU0jNTSllZVkjEPd6YDGxuvCR
         UN73jY1FPFHKzWrH/gEZKxI7RwMtmH5uHP5Ag91Jsf0NagdpZScIo6NFC+dM0BEYYZoH
         dYGwdoM0F3/GEED+L8BNIB9iTSf5mu/ralFFF3O3kox3DHWhwD8JhOtPvo94B2LrMwJV
         OMpYF8Gfn6wOAK45OGCBEiUhqD03vJyKHvJSaOxRCtHHP6kbbwYs1DuWVD0UOsiDG1Fl
         l3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783888378; x=1784493178;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hoFLr1vfVTbyBPCDDFLHELDOVM+etETDJUoaDXyGSaU=;
        b=PIfG59ICPHb0EsfhTdPfe7K0stK6bHxnJXjEoKP2ZvzFjJnK4Ubi5+uUS4Q1bEF3To
         S2SB148gOadRwqvAxG8yxvvrvj6uM5jlJqG4hOKNwuyx6m85q1gGNB/e+Wa2UkdSld0m
         w2zA2616DQLlT9KHY9n1IMr48YD101JeovfXyYwPWILdd2nGY8WPkBrdBxgLN4BfDa+7
         TMWGdDoiLvKLpgeFJ5OFny3s7pz5Qql7cOmAm8Mv2CSBlGj8vkoGnTeJokypbqpKWeLY
         6LPV+5gNI1q01HTfRvPGK+DOKUFvx5szSHHTnY0RDU0ZDXBLHNbbtbu6ajp4Wr0kaZAA
         XgwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTx435BcHf7LwkXMSylj1moUMDlyYUUvivOUpJQ1RCAUAgLAWFVIQ6RqjwbIvSDCKU4yp9EUwxoCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPkc67zxwzMDAL1N2tQqrv2sUB7NTn2NhA0gb9MKNeRA8IOW52
	j+ikz0x8q9j8lS3bVdQe0Ew7IVliihkmY+1CoGxvwhooCD7PGQkCilPh
X-Gm-Gg: AfdE7clly340Jw3tFsZcg3b6gUzRB2mHJBBUUPnT1fh/CS8vLcvKIXz4YFcYnFPEn6J
	4LnwcZvSuuZ5n+U2DvcMduc+8eNne7flvUFCsnamINWVCZkzvopuYlzvfvRRuvMXWToR5QyZ1li
	9YLyKUjXCL2eMEoIetjFvX3np2hPbCC+JUcrvX4NwQHt6Mlat4qSLshOQG6xhufKY3N95wOAf3m
	F0LWEDnbK1BsPnlpaOEMzQyAmx3VEKTtCUF48hmsl/Ck3sLvRPVw0C/obfpLv55Y6/De/P3zRxX
	1jso9imWMpqF5iPgRTCmXpqs2kT8SnIWrHH948PxHUmQU7sMJxrTiVoFjrAp9jsr9Ss2/dLiRPq
	uSm9y025wWELUgTtX4HhiSXikLH/Um1u9AzftoETAIPDNy29btydmEyWxYQgWxdIkK7JglZyzo7
	Hmw0OePS51I3XeyJkF7Mwv5A==
X-Received: by 2002:a05:600c:b99:b0:493:b61c:72c3 with SMTP id 5b1f17b1804b1-493f8829956mr66599105e9.32.1783888377859;
        Sun, 12 Jul 2026 13:32:57 -0700 (PDT)
Received: from WindFlash.powerhub ([2a0a:ef40:f61:3b01:d08a:833b:756:8fce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm88998034f8f.17.2026.07.12.13.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 13:32:57 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Leonardo Bras <leobras.c@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Harry Yoo <harry@kernel.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Marco Elver <elver@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Li RongQing <lirongqing@baidu.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Gary Guo <gary@garyguo.net>,
	Christian Brauner <brauner@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Coiby Xu <coxu@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v4 0/4] Introduce Per-CPU Work helpers (was QPW)
Date: Sun, 12 Jul 2026 17:32:49 -0300
Message-ID: <alP58SgTc2_8OFPc@WindFlash>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260520130903.Ebsd4aUa@linutronix.de>
References: <20260519012754.240804-1-leobras.c@gmail.com> <20260520130903.Ebsd4aUa@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96472-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[leobrasc@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bigeasy@linutronix.de,m:leobras.c@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:peterz@infradead.org,m:mingo@redhat.com,m:will@kernel.org,m:boqun@kernel.org,m:longman@redhat.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:harry@kernel.org,m:hao.li@linux.dev,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:bp@alien8.de,m:rdunlap@infradead.org,m:tglx@kernel.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:kees@kernel.org,m:elver@google.com,m:
 kuba@kernel.org,m:lirongqing@baidu.com,m:ebiggers@kernel.org,m:paulmck@kernel.org,m:nathan@kernel.org,m:ojeda@kernel.org,m:nsc@kernel.org,m:thomas.weissschuh@linutronix.de,m:dianders@chromium.org,m:gary@garyguo.net,m:brauner@kernel.org,m:pasha.tatashin@soleen.com,m:masahiroy@kernel.org,m:coxu@redhat.com,m:frederic@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-rt-devel@lists.linux.dev,m:leobrasc@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,lwn.net,linuxfoundation.org,infradead.org,redhat.com,kernel.org,linux-foundation.org,google.com,suse.com,suse.de,cmpxchg.org,nvidia.com,linux.dev,gentwo.org,tencent.com,huaweicloud.com,lge.com,alien8.de,linux.alibaba.com,linux.intel.com,baidu.com,linutronix.de,chromium.org,garyguo.net,soleen.com,vger.kernel.org,kvack.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leobrasc@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_GT_50(0.00)[65];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 188AE745D63

On Wed, May 20, 2026 at 03:09:03PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-05-18 22:27:46 [-0300], Leonardo Bras wrote:
> > The problem:
> > Some places in the kernel implement a parallel programming strategy
> > consisting on local_locks() for most of the work, and some rare remote
> > operations are scheduled on target cpu. This keeps cache bouncing low since
> > cacheline tends to be mostly local, and avoids the cost of locks in non-RT
> > kernels, even though the very few remote operations will be expensive due
> > to scheduling overhead.
> > 
> > On the other hand, for RT workloads this can represent a problem: getting
> > an important workload scheduled out to deal with remote requests is
> > sure to introduce unexpected deadline misses.
> > 
> > The idea:
> > Currently with PREEMPT_RT=y, local_locks() become per-cpu spinlocks.

Hi Sebastian, thank you for reviewing!
(Sorry for the delay)

> It does not become a _spin_lock because it does not spin. It sleeps.

Right, it's a per-cpu mutex. 
My point is that it's a full lock, and we could use it instead of doing the 
whole scheduling thing, since we are already paying the 'atomic overhead' 
to get the lock here.

> 
> > In this case, instead of scheduling work on a remote cpu, it should
> > be safe to grab that remote cpu's per-cpu spinlock and run the required
> > work locally. That major cost, which is un/locking in every local function,
> > already happens in PREEMPT_RT.
> 
> We did have this before but only in the RT tree. It was a bit messy from
> the naming because it started with local_ but then it was a remote CPU.

Had the same naming issue here. This idea was initially a expansion to 
local_lock() mechanism, about the same way you were planning in the past.

> The main issue was the different code path which led to a few deadlocks
> back then.
> By the time local_lock_t went upstream, the cross-CPU locking was
> removed. As far as I remember, the cross-CPU user which did schedule
> work on a remote CPU and annoyed NOHZ folks were replaced.

I understand this could be a big issue if used in a generic way.

What I am proposing here a mechanism that standardizes those 
local_lock()+IPI strategies based on how they are done today, so we are 
only explected to get 'remote-cpu' pwlocks in the 'IPI replacement' 
operations.

The idea is pwlock_local* in every local function, and pwlock*(,cpu) in 
operations that can be remote. 

Maybe being used in a more constrained way, it has less chance of being an 
issue. Also, the whole idea is to improve CPU isolation numbers by 
reducing IPIs, so maybe NOHZ people will be happier with that :)

Thanks again!
Leo

