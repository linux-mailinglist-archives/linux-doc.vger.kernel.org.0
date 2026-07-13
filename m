Return-Path: <linux-doc+bounces-96508-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NgjUF82WVGrOnwMAu9opvQ
	(envelope-from <linux-doc+bounces-96508-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 09:42:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0657484A1
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 09:42:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=W0U7mlyj;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=SP6eoOrW;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96508-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96508-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF38830056C4
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 07:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA31638F230;
	Mon, 13 Jul 2026 07:36:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C463F38F633;
	Mon, 13 Jul 2026 07:36:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928201; cv=none; b=a15O5yDvxOvG0jFcn+nCck2HRqWClv58P3NtgsY047+4UMyp8VoUicVrnP6Za/rfLeVovKLsnN2iKhr1kCBNbX+ykZArZMyJ08kOGeuJWejU+tdqJM2bT3CWsl7j6nuxn9nDCAlWN95gR9lIAdlBlYDl57xnnlED1FiWUnPJJPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928201; c=relaxed/simple;
	bh=mHCZKAcQUBimskWiWG6NLWBjA8DyFG2wLO0Pm3mvtdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPgIE6Yxz258ssdSboUPOOj0FbfkrqMO3jWarD2nGTg95odussC/r4z954gKe9sGyzEzMTUsD2HZIc+wFKhdHRV2J0Lf7lcBPiOGnhhH4aJcpq46VHVb8tkEiKy7pcUNKlse8l63sPmm9/jKMCAH1B/hOJHof200vJF4Chmfygc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W0U7mlyj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SP6eoOrW; arc=none smtp.client-ip=193.142.43.55
Date: Mon, 13 Jul 2026 09:36:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783928197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+oJ+oiAJmm6M2K7Ydw/ek8HK5Sp2SDGAkvAxlUMtUw8=;
	b=W0U7mlyjOkyC/qu/kf7Rx/Jyuc+9x1Bjgu+Si4Q/HR8XmxUngDgHeyNGyfbLVKEwQx9Js+
	TchO0iSQvF6zRyH4qCapFqKVvF4i6a5kiKjoA6OtHPnCdvOjtrGNgIMsHKzNBqKHaQnc/m
	whwu/Kg6jRa4Ec4PoqjhNVaiHyDF9MkI34iflFI4YvHwk5Qw4ddaxEeHf3nhXSr/51E1dd
	cW+WLkQG5DuD1uhX3ZCGTkZS/N4hmYTl3n3tTSDBTosSCmCoRBgNk5o6UV/hEKmwvAPYkl
	NMdrDjyEdLildLm2JagNZdO/2vvZaQ3o3/clC8VBAInNYKWOdCGxZw3wUTf+VQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783928197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+oJ+oiAJmm6M2K7Ydw/ek8HK5Sp2SDGAkvAxlUMtUw8=;
	b=SP6eoOrWruZC728Gbiktd+y7UFnGggX0GuRBK1mtb4RABNg/mE/y0Jy9niGxN4YM+I/pVQ
	m+9W2TOgais4OLDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Leonardo Bras <leobras.c@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Kees Cook <kees@kernel.org>,
	Marco Elver <elver@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Li RongQing <lirongqing@baidu.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Gary Guo <gary@garyguo.net>, Christian Brauner <brauner@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Coiby Xu <coxu@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev,
	Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH v4 4/4] slub: apply new pw_queue_on() interface
Message-ID: <20260713073634.3Hrxpfcx@linutronix.de>
References: <20260519012754.240804-1-leobras.c@gmail.com>
 <20260519012754.240804-5-leobras.c@gmail.com>
 <20260520145308.nay9zt6r@linutronix.de>
 <alQWr2L_Kn23pxd9@WindFlash>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alQWr2L_Kn23pxd9@WindFlash>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96508-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:leobras.c@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:peterz@infradead.org,m:mingo@redhat.com,m:will@kernel.org,m:boqun@kernel.org,m:longman@redhat.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:harry@kernel.org,m:hao.li@linux.dev,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:bp@alien8.de,m:rdunlap@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:kees@kernel.org,m:elver@google.com,m:kuba@kernel.org,m:lirongqing@baidu.com,m:e
 biggers@kernel.org,m:paulmck@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:ojeda@kernel.org,m:thomas.weissschuh@linutronix.de,m:tglx@kernel.org,m:dianders@chromium.org,m:gary@garyguo.net,m:brauner@kernel.org,m:pasha.tatashin@soleen.com,m:coxu@redhat.com,m:masahiroy@kernel.org,m:frederic@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-rt-devel@lists.linux.dev,m:mtosatti@redhat.com,m:leobrasc@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,infradead.org,redhat.com,kernel.org,linux-foundation.org,google.com,suse.com,suse.de,cmpxchg.org,nvidia.com,linux.dev,gentwo.org,tencent.com,huaweicloud.com,gmail.com,lge.com,alien8.de,linux.alibaba.com,linux.intel.com,baidu.com,linutronix.de,chromium.org,garyguo.net,soleen.com,vger.kernel.org,kvack.org,lists.linux.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[65];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:from_mime,linutronix.de:dkim,linutronix.de:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC0657484A1

On 2026-07-12 19:35:28 [-0300], Leonardo Bras wrote:
> On Wed, May 20, 2026 at 04:53:08PM +0200, Sebastian Andrzej Siewior wrote:
> > On 2026-05-18 22:27:50 [-0300], Leonardo Bras wrote:
> > > @@ -4733,121 +4735,121 @@ void *alloc_from_pcs(struct kmem_cache *s, gfp_t gfp, int node)
> > >  
> > >  	/*
> > >  	 * We assume the percpu sheaves contain only local objects although it's
> > >  	 * not completely guaranteed, so we verify later.
> > >  	 */
> > >  	if (unlikely(node_requested && node != numa_mem_id())) {
> > >  		stat(s, ALLOC_NODE_MISMATCH);
> > >  		return NULL;
> > >  	}
> > >  
> > > -	if (!local_trylock(&s->cpu_sheaves->lock))
> > > +	if (!pw_trylock_local(&s->cpu_sheaves->lock))
> > >  		return NULL;
> > 
> > alloc_from_pcs() can be called from kmalloc_nolock()/ NMI context.
> > I don't remember why exactly local_trylock_t was introduced here instead
> > of a per-CPU spinlock_t. 
> 
> Probably to save the cost of using atomic operations on locking, and having 
> about the same restrictions that would allow using local_locks
> 
> > But there should be nothing wrong with a
> > trylock on it from NMI as you do here.
> 
> Awesome!

The problem is always the unlock which requires full locking and is
usually the problem from NMI.

> > 
> > One thing worth noting, on !PREEMPT_RT, spin_trylock() always succeeds
> > on UP. kmalloc_nolock() checks for it, not sure about other callers.
> 
> 
> Sorry, I did not sure I understand that part. 
> You mean we have since it always returns true, we may be in NMI context, 
> after it was interrupted holding this lock, and it will return true which 
> will use the protected area even though the lock should avoid it?

from include/linux/spinlock_api_up.h:
| static __always_inline int _raw_spin_trylock(raw_spinlock_t *lock)
|         __cond_acquires(true, lock)
| {
|         __LOCK(lock);
|         return 1;
| }

on UP a spin_trylock() always succeeds.

> Humm, but if that scenario exist, then is it actually ok to return true on 
> trylock() in that scenario?
> 
> Thanks!
> Leo

Sebastian

