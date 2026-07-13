Return-Path: <linux-doc+bounces-96615-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KqHEG+9VVWomnAAAu9opvQ
	(envelope-from <linux-doc+bounces-96615-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 23:17:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC48974F366
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 23:17:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=oMHN5ODE;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96615-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96615-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87BAE3028B5A
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2026 21:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A532EEE84;
	Mon, 13 Jul 2026 21:17:32 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A698623E358
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 21:17:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783977452; cv=none; b=VWRnwMErFtGYYOa6CC1Zv9uSFVDlUNpFGKjGAHk4TT6WGNU3zrKe63zylKNAGIzkOYxjINbWg4luMXg8uVlcsetSoTZ3fIvUjLYyx1VpfH9a8AFzc8Hzi8kwG7f7hPqeDCPP+SBujuvNBxqINInhtGjb+Gvg/fRquk/ckx6Ry1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783977452; c=relaxed/simple;
	bh=ESZSUj+QsiIF6nv0NbuhSDu+P6Pwr5U/SNiDVxlW6sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=HptEz1Ybc4OBZ2UFOY9s5UoRcmAOK2EJy2soW2EsdVYCz9T81XICG/iWOgZjdKTk+zvMgnNkxta9KRIhAFfZTWzdy3PBBCJfO/EZL9Ud/vVRHgshrPQM02HYU0y+UZ1WEYAlm4cAph1Wj+uBT9/yoLXKCC4rSXbvUh3FKIor65Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oMHN5ODE; arc=none smtp.client-ip=209.85.208.41
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-697cee2eb6dso342069a12.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 14:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783977449; x=1784582249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=npiX22YSguzWJpXGx2hHTXeW3ywrBRl4LUKqa1yh85s=;
        b=oMHN5ODEsWjYmZrdJCzfdOqFdP+qBC3cKNC+RxVz+zkhavTaEZJXW0euPRlaBJaoBS
         aWuSY56DIscLKrywDNhaQFNnZ5SCQpy57WMrTVQCDrLWbd8b8+Jkgcs4LvGQhosohbtx
         mi06pSDb7AGBtaNlIktcA/40JdTqWvXq8b8bBBuumxyhwCXCa/K/0cpk9EqP68ijmwau
         pRlKqm6akrEhYdeVLZGRQn2a2BpsE7LnnWN92+9fXfDys90mIZeIUctDCa2WVIsR1y8I
         u17sLoCC0fHxtTwQR9Xw7VMEjGPLxkh2B97lz+9zbR6cQknfbrBeEsANuhtJXcfBcr2I
         glzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783977449; x=1784582249;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=npiX22YSguzWJpXGx2hHTXeW3ywrBRl4LUKqa1yh85s=;
        b=hQ5M/GPexvKguVW3ujwyOOJYihcm6N2P0WycRyChbcqGTcuc4Ty4I3RgW9+zy5oyna
         3Kid9knR2jc8J7QHeMBaMnUKKFgeG5uf1O0JEsqzzgSYvCugTsl3rq+YBzrbyaOFN2zF
         5+TghYjknhcTWIhr6iWQjDLklrz/heV4TSd49bgDIIR5qQwpjxZiQ08mRvyZzzKXMXDM
         PhoKnx/mI1/7sjwIEqmcQxT5SEyR2ivaAWSjYNmZT5MirVaOCa5Nogpkp8TbS2EEPiAz
         SenmlUS2DA+AZ0E/JBlbRCaNgl/flGLrU80mHALzZKtGAkXdPh/l2KUoCeCV3JyVRh9O
         PrVw==
X-Forwarded-Encrypted: i=1; AHgh+Rrg+uGDNYVGNGNyPAQqlGHrH2yvFZtOB7Altrp2R0I0eCelImVmbtoYk0aK/yQVYZZ6tXzwoCkf+rc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQLMJNvWl333KEuPVVYJbPILQbA0t411P5OBsLJlJK2nFmMzhe
	MwgyNSPF9xreiy4mVovVG2wDzIxeL0JXO7C9ZN/9M8YHvtW9UVUULky+
X-Gm-Gg: AfdE7cklDqX4NjjPw5OjKQMayrAS5BveoJZujO0l28VW2mhUmjGyK+JUAGE57H6LUho
	yc01yZ0FO9/gyX6lGoVRhtRs2Xhlsyy5v2KkyWMXNpxovN9KcTdEYA7mSm4GKt05nzDtq5Y0sNh
	KBHvAZ4sZjjPZtxvdi4RICGoL3EY5tSDKvICQ1nHpBYuBQ0e6vdTsFPKrvrxSRKk9m9B3diA6Lz
	nVArWxGO+R8YvvuRwUAd5Jc+qcZ+ejR//6+WeWWTcjiyAc5CNUIuaBWDWMU6cepvMkXAIXRtk4I
	h6jcipBvBebML2mTy3ypBJED9JJ1BntYZvMJPrmHnndW2bjD490cy3E1v7QJB/lRhn44GtANQgH
	byVEezky8Eq9eW9YSG5W2ihD2Ycyxw4Lm/OzOmpIvjAv6EEYA9+sDYSoVOMLDnHyz10NtI864iL
	6Qwqp+Cxc/CRERhO29WcUIyBRG7VcLzydp
X-Received: by 2002:a05:6402:3220:b0:698:ad7f:9383 with SMTP id 4fb4d7f45d1cf-69c5f0c3130mr4880740a12.14.1783977448821;
        Mon, 13 Jul 2026 14:17:28 -0700 (PDT)
Received: from WindFlash.powerhub ([2a0a:ef40:f61:3b01:d08a:833b:756:8fce])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2952836sm386903a12.27.2026.07.13.14.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 14:17:27 -0700 (PDT)
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
Date: Mon, 13 Jul 2026 18:17:23 -0300
Message-ID: <alVV44RO_SolaqMW@WindFlash>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713080723.XOTiibfG@linutronix.de>
References: <20260519012754.240804-1-leobras.c@gmail.com> <20260520130903.Ebsd4aUa@linutronix.de> <alP58SgTc2_8OFPc@WindFlash> <20260713080723.XOTiibfG@linutronix.de>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bigeasy@linutronix.de,m:leobras.c@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:peterz@infradead.org,m:mingo@redhat.com,m:will@kernel.org,m:boqun@kernel.org,m:longman@redhat.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:harry@kernel.org,m:hao.li@linux.dev,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:bp@alien8.de,m:rdunlap@infradead.org,m:tglx@kernel.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:kees@kernel.org,m:elver@google.com,m:
 kuba@kernel.org,m:lirongqing@baidu.com,m:ebiggers@kernel.org,m:paulmck@kernel.org,m:nathan@kernel.org,m:ojeda@kernel.org,m:nsc@kernel.org,m:thomas.weissschuh@linutronix.de,m:dianders@chromium.org,m:gary@garyguo.net,m:brauner@kernel.org,m:pasha.tatashin@soleen.com,m:masahiroy@kernel.org,m:coxu@redhat.com,m:frederic@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-rt-devel@lists.linux.dev,m:leobrasc@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96615-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[leobrasc@gmail.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lwn.net,linuxfoundation.org,infradead.org,redhat.com,kernel.org,linux-foundation.org,google.com,suse.com,suse.de,cmpxchg.org,nvidia.com,linux.dev,gentwo.org,tencent.com,huaweicloud.com,lge.com,alien8.de,linux.alibaba.com,linux.intel.com,baidu.com,linutronix.de,chromium.org,garyguo.net,soleen.com,vger.kernel.org,kvack.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leobrasc@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_GT_50(0.00)[65];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC48974F366

On Mon, Jul 13, 2026 at 10:07:23AM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-07-12 17:32:49 [-0300], Leonardo Bras wrote:
> > > > The idea:
> > > > Currently with PREEMPT_RT=y, local_locks() become per-cpu spinlocks.
> > 
> > Hi Sebastian, thank you for reviewing!
> > (Sorry for the delay)
> > 
> > > It does not become a _spin_lock because it does not spin. It sleeps.
> > 
> > Right, it's a per-cpu mutex. 
> > My point is that it's a full lock, and we could use it instead of doing the 
> > whole scheduling thing, since we are already paying the 'atomic overhead' 
> > to get the lock here.
> 
> The whole lock is a spinlock_t. There is also raw_spinlock_t and
> bit_spin_lock(). All three are considered spinlocks.
> 
> > > > In this case, instead of scheduling work on a remote cpu, it should
> > > > be safe to grab that remote cpu's per-cpu spinlock and run the required
> > > > work locally. That major cost, which is un/locking in every local function,
> > > > already happens in PREEMPT_RT.
> > > 
> > > We did have this before but only in the RT tree. It was a bit messy from
> > > the naming because it started with local_ but then it was a remote CPU.
> > 
> > Had the same naming issue here. This idea was initially a expansion to 
> > local_lock() mechanism, about the same way you were planning in the past.
> > 
> > > The main issue was the different code path which led to a few deadlocks
> > > back then.
> > > By the time local_lock_t went upstream, the cross-CPU locking was
> > > removed. As far as I remember, the cross-CPU user which did schedule
> > > work on a remote CPU and annoyed NOHZ folks were replaced.
> > 
> > I understand this could be a big issue if used in a generic way.
> > 
> > What I am proposing here a mechanism that standardizes those 
> > local_lock()+IPI strategies based on how they are done today, so we are 
> > only explected to get 'remote-cpu' pwlocks in the 'IPI replacement' 
> > operations.
> > 
> > The idea is pwlock_local* in every local function, and pwlock*(,cpu) in 
> > operations that can be remote. 
> > 
> > Maybe being used in a more constrained way, it has less chance of being an 
> > issue. Also, the whole idea is to improve CPU isolation numbers by 
> > reducing IPIs, so maybe NOHZ people will be happier with that :)
> 
> I get that part. The local_lock_t part is cheap on !RT and becomes a
> full lock on RT. While the lock details change the overall expectation
> remain the same. With this change it is possible to acquire the lock
> cross-CPU but this depends on the config/ setup. This might not be easy
> in terms of testing and maintenance.
> The more potential users you have, the better it might become in terms
> of a selling argument. If you have just (say) two users it might be
> simpler to address just those.
> 

IIRC there are multiple users of this mechanism around the kernel. I 
remember picking the first three (swap, slub and memcontrol) as examples of 
how to use pwlocks (QPW at the time). With the concept proven, I could then 
proceed to work with other potential users to replace it. (We ended up 
dropping memcontrol in the process)

The main idea is to replace as many potential users as possible to reduce 
as much as possible the amount of IPIs in isolated cpus, and allow Linux 
to run workloads which require much lower latency.

This idea came as a general solution to a bunch of latency violations  
Marcelo and I were coming across.

Thanks!
Leo

