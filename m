Return-Path: <linux-doc+bounces-96526-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mDswKMPEVGrbSgAAu9opvQ
	(envelope-from <linux-doc+bounces-96526-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 12:58:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E03D174A0FE
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 12:58:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QqW05C7F;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96526-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96526-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 137CA302D121
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 10:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4DE3E2746;
	Mon, 13 Jul 2026 10:55:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC463128B8;
	Mon, 13 Jul 2026 10:55:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940152; cv=none; b=NkVFIaP3To4WVp6+ulWqxMegV3/r52K75YMnaqhXNDwZ6px72mCpjymII/Q8pIBsw4KxM9Xzki3RIEcuCm6cWX3LsN4+S0z+TGYvpWe736rjhOVUAgIPvZ4YCcYYTtmgE1Hk6B11mKYrmB//iWxpXGv5gjIST4sKucJNs+a5Mpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940152; c=relaxed/simple;
	bh=OHxeKsuRZMH3tkVAqEqXnbLzGq/1XXYS8H3vtpEZ+0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBTvPpuJ9l8BdHS24qNIOm5R3bmc7Bi854J5s4jznT/STaXLietPio7FEIxeKlEdw7u5umfPuVvsq2SsVO2UTRSkaHb2gIJKMpXMUHojAx8Tdg4+1mZ9IgtrLgq79me6LHLPQOGQUv1Sw1SpY+OPQFM7W+w34eSshGToiG/TPsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqW05C7F; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC801F000E9;
	Mon, 13 Jul 2026 10:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783940150;
	bh=c0ggmWwX6GQOIV2l6a9PTnt/FjxjzQ5JHVZFBNdoHA0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QqW05C7FDH/qY4mqQTK/rn2Z8orF2/BAGrrSIH/MKrBIfeJS2VkDrHXWEUeT0foEd
	 OHQSGFcgVgNHQnJNMr4U/aQYgBMXT9iTkr0RnBe+3Yp2dtocgfBhQwhOr2RtaBiKtK
	 11RtZ6fmUGSAlfNSC32jUacIKi3fGNNjHP97AdNaqeObRSnH+DJRjucnwCsodSvUnQ
	 HejdBAYDHoOY1nPXbvcZR+5p5WbkE1oddzzBQQCkUHLrEpf1nbXxsqY2H7t+Vz8Cfy
	 6YVR3o+tfhmFEYDOowXc6b4h/7XAsXQNrMjfjvpHkccIHNv3zUMRoTAByahUrWxYqu
	 qY+PGicp9lQ7w==
Message-ID: <157f60cb-ff83-4fed-8b05-e6c6390f85bc@kernel.org>
Date: Mon, 13 Jul 2026 12:55:36 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] slub: apply new pw_queue_on() interface
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Leonardo Bras <leobras.c@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Waiman Long <longman@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Zi Yan <ziy@nvidia.com>, Harry Yoo <harry@kernel.org>,
 Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Randy Dunlap <rdunlap@infradead.org>, Feng Tang
 <feng.tang@linux.alibaba.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Li RongQing <lirongqing@baidu.com>,
 Eric Biggers <ebiggers@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Thomas Gleixner <tglx@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Gary Guo <gary@garyguo.net>, Christian Brauner <brauner@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Coiby Xu <coxu@redhat.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-rt-devel@lists.linux.dev, Marcelo Tosatti <mtosatti@redhat.com>
References: <20260519012754.240804-1-leobras.c@gmail.com>
 <20260519012754.240804-5-leobras.c@gmail.com>
 <20260520145308.nay9zt6r@linutronix.de> <alQWr2L_Kn23pxd9@WindFlash>
 <20260713073634.3Hrxpfcx@linutronix.de>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20260713073634.3Hrxpfcx@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96526-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bigeasy@linutronix.de,m:leobras.c@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:peterz@infradead.org,m:mingo@redhat.com,m:will@kernel.org,m:boqun@kernel.org,m:longman@redhat.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:harry@kernel.org,m:hao.li@linux.dev,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:bp@alien8.de,m:rdunlap@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:kees@kernel.org,m:elver@google.com,m:kuba@kernel.org,m:lirongqing@baidu.com
 ,m:ebiggers@kernel.org,m:paulmck@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:ojeda@kernel.org,m:thomas.weissschuh@linutronix.de,m:tglx@kernel.org,m:dianders@chromium.org,m:gary@garyguo.net,m:brauner@kernel.org,m:pasha.tatashin@soleen.com,m:coxu@redhat.com,m:masahiroy@kernel.org,m:frederic@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-rt-devel@lists.linux.dev,m:mtosatti@redhat.com,m:leobrasc@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,infradead.org,redhat.com,kernel.org,linux-foundation.org,google.com,suse.com,suse.de,cmpxchg.org,nvidia.com,linux.dev,gentwo.org,tencent.com,huaweicloud.com,gmail.com,lge.com,alien8.de,linux.alibaba.com,linux.intel.com,baidu.com,linutronix.de,chromium.org,garyguo.net,soleen.com,vger.kernel.org,kvack.org,lists.linux.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linutronix.de,gmail.com];
	FORGED_SENDER(0.00)[vbabka@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[65];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E03D174A0FE

On 7/13/26 09:36, Sebastian Andrzej Siewior wrote:
> On 2026-07-12 19:35:28 [-0300], Leonardo Bras wrote:
>> On Wed, May 20, 2026 at 04:53:08PM +0200, Sebastian Andrzej Siewior wrote:
>> > On 2026-05-18 22:27:50 [-0300], Leonardo Bras wrote:
>> > > @@ -4733,121 +4735,121 @@ void *alloc_from_pcs(struct kmem_cache *s, gfp_t gfp, int node)
>> > >  
>> > >  	/*
>> > >  	 * We assume the percpu sheaves contain only local objects although it's
>> > >  	 * not completely guaranteed, so we verify later.
>> > >  	 */
>> > >  	if (unlikely(node_requested && node != numa_mem_id())) {
>> > >  		stat(s, ALLOC_NODE_MISMATCH);
>> > >  		return NULL;
>> > >  	}
>> > >  
>> > > -	if (!local_trylock(&s->cpu_sheaves->lock))
>> > > +	if (!pw_trylock_local(&s->cpu_sheaves->lock))
>> > >  		return NULL;
>> > 
>> > alloc_from_pcs() can be called from kmalloc_nolock()/ NMI context.
>> > I don't remember why exactly local_trylock_t was introduced here instead
>> > of a per-CPU spinlock_t. 
>> 
>> Probably to save the cost of using atomic operations on locking, and having 

Yes. Also function call overhead as spinlocks are often not inlined.

>> about the same restrictions that would allow using local_locks

Indeed.

>> > But there should be nothing wrong with a
>> > trylock on it from NMI as you do here.
>> 
>> Awesome!
> 
> The problem is always the unlock which requires full locking and is
> usually the problem from NMI.
> 
>> > 
>> > One thing worth noting, on !PREEMPT_RT, spin_trylock() always succeeds
>> > on UP. kmalloc_nolock() checks for it, not sure about other callers.
>> 
>> 
>> Sorry, I did not sure I understand that part. 
>> You mean we have since it always returns true, we may be in NMI context, 
>> after it was interrupted holding this lock, and it will return true which 
>> will use the protected area even though the lock should avoid it?
> 
> from include/linux/spinlock_api_up.h:
> | static __always_inline int _raw_spin_trylock(raw_spinlock_t *lock)
> |         __cond_acquires(true, lock)
> | {
> |         __LOCK(lock);
> |         return 1;
> | }
> 
> on UP a spin_trylock() always succeeds.

Indeed. This was a problem in the page allocator, because there we don't
even disable irqs, so it wasn't just nmi, but an irq that could get a
false-positive spin_trylock(). See 038a102535eb ("mm/page_alloc: prevent pcp
corruption with SMP=n") which was a hot fix.

This was later cleaned up with 3 commits starting with a373f371166d
("mm/page_alloc: effectively disable pcp with CONFIG_SMP=n").

Since here you're also replacing local_trylock() (with no _irqsave) with
effectively spin_trylock(), the problem also won't be limited to NMIs and
thus the checks in kmalloc_nolock() won't help.

But I see in Patch 1:

+config PWLOCKS
+	bool "Per-CPU Work locks"
+	depends on SMP || COMPILE_TEST

So that's basically avoiding the problem in the same way as the page
allocator after the clean up.
Maybe just remove the COMPILE_TEST part? It's not clear to me what it
achieves. Just make it require SMP as there's no point for this on !SMP.

>> Humm, but if that scenario exist, then is it actually ok to return true on 
>> trylock() in that scenario?
>> 
>> Thanks!
>> Leo
> 
> Sebastian


