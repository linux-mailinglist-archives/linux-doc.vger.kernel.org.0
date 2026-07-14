Return-Path: <linux-doc+bounces-96699-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N/xVN9wLVmoEygAAu9opvQ
	(envelope-from <linux-doc+bounces-96699-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 12:13:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE654753496
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 12:13:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=zk2GyPuL;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=UX4RPTay;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96699-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96699-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D1D6301F77C
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 10:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFCB3644C9;
	Tue, 14 Jul 2026 10:12:54 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FD336403C;
	Tue, 14 Jul 2026 10:12:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784023974; cv=none; b=StcJP3bie1cXdrP8Kf7AvtBTaTxr3xcIGQhHWFhM19vro7jDIuYWdVXUo5Ou+n0BK3CTCUIBBiRvDiyGg2+uR1cIUQtCfXQ0aHJ7NJhcjckpR+IjwvNvLXtECtsTgtFc+cRrM6FTQYfUAYusxG5JL4QtcxLXM1h9Am8tIeqxXqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784023974; c=relaxed/simple;
	bh=eGQhjevRi4VUY0qp+zJAH8KVskQKAiTQMslzprRoCd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srvFq2DYjTVSd0EWYkOmqD/GN+ZYhr6CEeBaDaY1mOdNkNLg93oqT2ie+4v4gYvbTPwd74vxLloy85kKrbJ2+MnhDjnfu7gAwCEBJM7N6B/Ler8GkKxqDqwg8X4YtdUTATOtIILnzNsc7baMnYvN8oBmEVL14MK8yWpQjD6hcTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zk2GyPuL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UX4RPTay; arc=none smtp.client-ip=193.142.43.55
Date: Tue, 14 Jul 2026 12:12:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784023971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iTkmerU8UE91t1uqi1Zg80dTpHp+N6TCCSgmWke5AWY=;
	b=zk2GyPuLv/CULvPLi8yopdSODYUTrhGxZKZk8dd8mzHUNuBSoZcHm43puFTCkFjFXm8uD0
	EKzG/04UrVUW5/s+MKyPIecaj7TnLKSsJhra2w69fUBlZqCRtgex48kf84oZWv+ijO7xUB
	MXwsbqhdUvynljp3nafCL1enVh0Xp8d/AJUv6JgfXle0ZzSTTq8sBb6IEcWVhyy4IO8/Nf
	/s+UlSdE/v9xVUUZpvRTJ4pVRv9yKjQPDDR3a25XVGjttjZOmrgfZv5qsP92UwibxkupX1
	ZRClx/XM9C1sf50o+COZoIqgSIL+m5BDD0Lri5/T6Nvz3L8z47TpJqgu3s7SUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784023971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iTkmerU8UE91t1uqi1Zg80dTpHp+N6TCCSgmWke5AWY=;
	b=UX4RPTayR35zaZYCZZkIfXYdmcBvYC+h+fQ87S32/PfxvcS+wsHmXehsVSYaPPhLzb4Uhl
	mvzIyqsh+iM8wJCg==
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
	Thomas Gleixner <tglx@kernel.org>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Kees Cook <kees@kernel.org>,
	Marco Elver <elver@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Li RongQing <lirongqing@baidu.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Gary Guo <gary@garyguo.net>, Christian Brauner <brauner@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Masahiro Yamada <masahiroy@kernel.org>, Coiby Xu <coxu@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v4 0/4] Introduce Per-CPU Work helpers (was QPW)
Message-ID: <20260714101248.hV06z2cr@linutronix.de>
References: <20260519012754.240804-1-leobras.c@gmail.com>
 <20260520130903.Ebsd4aUa@linutronix.de>
 <alP58SgTc2_8OFPc@WindFlash>
 <20260713080723.XOTiibfG@linutronix.de>
 <alVV44RO_SolaqMW@WindFlash>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alVV44RO_SolaqMW@WindFlash>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96699-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:leobras.c@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:peterz@infradead.org,m:mingo@redhat.com,m:will@kernel.org,m:boqun@kernel.org,m:longman@redhat.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:harry@kernel.org,m:hao.li@linux.dev,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:bp@alien8.de,m:rdunlap@infradead.org,m:tglx@kernel.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:kees@kernel.org,m:elver@google.com,m:kuba@kernel.org,m:lirong
 qing@baidu.com,m:ebiggers@kernel.org,m:paulmck@kernel.org,m:nathan@kernel.org,m:ojeda@kernel.org,m:nsc@kernel.org,m:thomas.weissschuh@linutronix.de,m:dianders@chromium.org,m:gary@garyguo.net,m:brauner@kernel.org,m:pasha.tatashin@soleen.com,m:masahiroy@kernel.org,m:coxu@redhat.com,m:frederic@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-rt-devel@lists.linux.dev,m:leobrasc@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,infradead.org,redhat.com,kernel.org,linux-foundation.org,google.com,suse.com,suse.de,cmpxchg.org,nvidia.com,linux.dev,gentwo.org,tencent.com,huaweicloud.com,gmail.com,lge.com,alien8.de,linux.alibaba.com,linux.intel.com,baidu.com,linutronix.de,chromium.org,garyguo.net,soleen.com,vger.kernel.org,kvack.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE654753496

On 2026-07-13 18:17:23 [-0300], Leonardo Bras wrote:
> IIRC there are multiple users of this mechanism around the kernel. I 
> remember picking the first three (swap, slub and memcontrol) as examples of 
> how to use pwlocks (QPW at the time). With the concept proven, I could then 
> proceed to work with other potential users to replace it. (We ended up 
> dropping memcontrol in the process)
> 
> The main idea is to replace as many potential users as possible to reduce 
> as much as possible the amount of IPIs in isolated cpus, and allow Linux 
> to run workloads which require much lower latency.

Right. I am not entirely opposed to this idea. If you can't improve the
situation by other means I would consider this as the last resort. If
the mm folks are on board with this, then even better.

> This idea came as a general solution to a bunch of latency violations  
> Marcelo and I were coming across.
> 
> Thanks!
> Leo

Sebastian

