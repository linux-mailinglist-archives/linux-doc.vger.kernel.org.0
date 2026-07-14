Return-Path: <linux-doc+bounces-96695-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hCK4CPoFVmqpyAAAu9opvQ
	(envelope-from <linux-doc+bounces-96695-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 11:48:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B72B7530DE
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 11:48:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=2hWoWkG4;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=LP96mIHU;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96695-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96695-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5DF53046386
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 09:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614E1441044;
	Tue, 14 Jul 2026 09:48:03 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026A443DA55;
	Tue, 14 Jul 2026 09:47:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784022482; cv=none; b=aCr/7OmylAYzXkE59U6M0f08SI4x/fLtgsA+JQfZPH1OGiK63Ch602xR1SA0ivUkJosDbqOQONxjKDDMcTr8He7G6AcaS7WaUkh2OHWn+8Wb7CSaymMbUudmbiStIl7R0v/3qu7KnUqqS8RSYrIN7V+Py0E+svtHHmKrLMtQ5iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784022482; c=relaxed/simple;
	bh=tAT4Z+WZSwzntwIe2Ep114LUICO74oUvIOFxwyfiux8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLXqdF89CbZsRKXl3Y1/xrODCrA70eRK96SuBJN3JO3C8zjC8y8ucq4YxGgFjCPAGyfoiVMIoCC4nDe44UYOP4J+nY65V//ADUQoYv3aeVfmqVVW4oa2NLxpxpcKV+n8Prz2TquwSYqeH2sssQ6CO/zT8Tw4OPY8rS3amGc5U9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2hWoWkG4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LP96mIHU; arc=none smtp.client-ip=193.142.43.55
Date: Tue, 14 Jul 2026 11:47:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784022474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsoTcN4gOIUfOGf3p48bZzeZDJjL/YfjT1YTWmmpNPE=;
	b=2hWoWkG465yKctF00Mw9KQ6sYZmw5YgJznP4SIGc5ImYPXmIYeS6IbfXVTCZTHv/KI4E2U
	f8Bk6aFvBq49FugZVTn/t+nTwVk3uOjUb+xLzqQ1ylaI4YuaVeQfW1h09gVtK/zATFk1TZ
	KoCxwcqYpF9YJ4jj1zLGKjJeoB4MSxGtc7Va4jbCSzz0ouoQjupqRadMZCq1GBawg720Bl
	pdo2Ck6m0mFasT7WVF1Iqf3WadNyYaLzwhhBu6WdOkok08jY6fpQ8fFG0EBD9iG9UOgs41
	BW39orBcuHa6++UhOEQPMc52HNKuWtZFgfJ6Oa6qJIbZP2toU8fOyfn2K8UUUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784022474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsoTcN4gOIUfOGf3p48bZzeZDJjL/YfjT1YTWmmpNPE=;
	b=LP96mIHUFuA16DNuxJK0oAMY1HLEt9nhBrM68LGoz5RXQeqSK/DTieqKA8U5nLiTSEr7Ea
	k0NF1Gm40CLZW6Bw==
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
Message-ID: <20260714094752.1Vi-C4fe@linutronix.de>
References: <20260519012754.240804-1-leobras.c@gmail.com>
 <20260519012754.240804-5-leobras.c@gmail.com>
 <20260520145308.nay9zt6r@linutronix.de>
 <alQWr2L_Kn23pxd9@WindFlash>
 <20260713073634.3Hrxpfcx@linutronix.de>
 <alVbaf-UVMNaEtvk@WindFlash>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <alVbaf-UVMNaEtvk@WindFlash>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96695-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:leobras.c@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:peterz@infradead.org,m:mingo@redhat.com,m:will@kernel.org,m:boqun@kernel.org,m:longman@redhat.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:harry@kernel.org,m:hao.li@linux.dev,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:bp@alien8.de,m:rdunlap@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:kees@kernel.org,m:elver@google.com,m:kuba@kernel.org,m:lirongqing@baidu.com,m:e
 biggers@kernel.org,m:paulmck@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:ojeda@kernel.org,m:thomas.weissschuh@linutronix.de,m:tglx@kernel.org,m:dianders@chromium.org,m:gary@garyguo.net,m:brauner@kernel.org,m:pasha.tatashin@soleen.com,m:coxu@redhat.com,m:masahiroy@kernel.org,m:frederic@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-rt-devel@lists.linux.dev,m:mtosatti@redhat.com,m:leobrasc@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linutronix.de:from_mime,linutronix.de:dkim,linutronix.de:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B72B7530DE

On 2026-07-13 18:40:57 [-0300], Leonardo Bras wrote:
> On Mon, Jul 13, 2026 at 09:36:34AM +0200, Sebastian Andrzej Siewior wrote:
> > On 2026-07-12 19:35:28 [-0300], Leonardo Bras wrote:
> > > On Wed, May 20, 2026 at 04:53:08PM +0200, Sebastian Andrzej Siewior w=
rote:
> > > > On 2026-05-18 22:27:50 [-0300], Leonardo Bras wrote:
> > > > > @@ -4733,121 +4735,121 @@ void *alloc_from_pcs(struct kmem_cache =
*s, gfp_t gfp, int node)
> > > > > =20
> > > > >  	/*
> > > > >  	 * We assume the percpu sheaves contain only local objects alth=
ough it's
> > > > >  	 * not completely guaranteed, so we verify later.
> > > > >  	 */
> > > > >  	if (unlikely(node_requested && node !=3D numa_mem_id())) {
> > > > >  		stat(s, ALLOC_NODE_MISMATCH);
> > > > >  		return NULL;
> > > > >  	}
> > > > > =20
> > > > > -	if (!local_trylock(&s->cpu_sheaves->lock))
> > > > > +	if (!pw_trylock_local(&s->cpu_sheaves->lock))
> > > > >  		return NULL;
> > > >=20
> > > > alloc_from_pcs() can be called from kmalloc_nolock()/ NMI context.
> > > > I don't remember why exactly local_trylock_t was introduced here in=
stead
> > > > of a per-CPU spinlock_t.=20
> > >=20
> > > Probably to save the cost of using atomic operations on locking, and =
having=20
> > > about the same restrictions that would allow using local_locks
> > >=20
> > > > But there should be nothing wrong with a
> > > > trylock on it from NMI as you do here.
> > >=20
> > > Awesome!
> >=20
> > The problem is always the unlock which requires full locking and is
> > usually the problem from NMI.
> >
>=20
> You mean, like, the trylock succeeds in the NMI handle, does the per-cpu=
=20
> operations, and then unlock()s?=20

Yes.

I'm not sure what I was thinking when I wrote it back then. Try lock
with local_trylock() might work under RT from NMI. However the unlock
path (which needs to follow) requires an unconditional lock of the
inner-lock plus a potential wakeup of the waiter.=20
:
=E2=80=A6

> Thanks!
> Leo

Sebastian

