Return-Path: <linux-doc+bounces-96476-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NSZ/N4gEVGrCgwMAu9opvQ
	(envelope-from <linux-doc+bounces-96476-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 23:18:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D76FB745EE5
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 23:17:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sjAR59VT;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96476-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96476-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0F2530055D9
	for <lists+linux-doc@lfdr.de>; Sun, 12 Jul 2026 21:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B709376497;
	Sun, 12 Jul 2026 21:17:44 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D89379996
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 21:17:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783891063; cv=none; b=gaT6kZr4FqOeAtyy6ajJjwGGxsiIAHsoQcey2YU9cdJTkn7g/BCPouumJt6hqz0Wjf+2jS80dS/Zn9FxuQYwEVOv26ZusML5hnvdnePtW93NPIdspnCFAwkHcihHpZsGAB7ykI6RyKdD/dZtaQ8tr30zj4UpAcau9DtfWwzok2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783891063; c=relaxed/simple;
	bh=2LJzXj9ppebEulv72Db9DKrXEuSmBOMhC8AFnbyQWp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=TeYDviaC3x4nT39Sr9wVTC/lyPEQw8U7t+CJDwHyikiDbYK907hc8UXK4bj6l1G3PXKlL3/BX5ZN8dXxbD1O9NjLPHfLtqpVlrOEXayIg0uzkAJcPRxj1ZvP7osE904q4t5HppwWKYCyxM7jUpjzd2k9+wEKzY2tlpU+wZIJvuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjAR59VT; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47df440fcd5so1268928f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 14:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783891057; x=1784495857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mO9PnufslFYNDwqPjTJ3f3FlkpnmJVQM4/pFUcrdNco=;
        b=sjAR59VTEDa/cb52L8PLRcMT3yrFi0f2X7lcST8XihoNdmz2YoJFA7LbbUmJsklkxU
         KPitG7MQ2SkQlcNe8GofB9FLj8XekMyHLOjXVxHYOogSc/8dplmUwk+cRCMnA2a8rmhq
         4WAapzhQnv+5E6dLKDZn38CtFTMPXU3xaAZYLNXC2QoDr3pNUs2Rblv9IT4uyZnEs31D
         7p1scGr5RkodE3V6ghr9v7Fv6K7DantC2WEN3reR6MMtudWUN+fpkEp8M6WrGGrZPMfx
         8V7SET6itAM54WYW1pY47WTJ+lUBrmOta9HtImfQPku+BCZ+KOlR9qg74iq1ih61Jpaa
         ThUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783891057; x=1784495857;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mO9PnufslFYNDwqPjTJ3f3FlkpnmJVQM4/pFUcrdNco=;
        b=JeRkfU7pWpZqEw1rlszQVWs0yQ+HsOtH5SaBVuyUn/mSSLDomWSqrEpHHDgyEEVIyv
         nd1V78xvZr0kkl6uQ9KDLeq+v3xaPq74ROx82zVJdWvZwtNkOdaGLVWWw8S8sllMoIUh
         1JD8P1A6/pdNSzdxmT8SmS2RWi816t6aRppU3G0ffLMjMJOne/RyehL7mZlZIpAyCfTz
         EXTIXr4OhD57HFWEtSrEOj5BztEvsIsr5HeM8f40jolDFxjkWDH+EphQnxVndm4Qq0Tf
         cd63aumGDXu1G5G3y2LLJ47FSEZZ8qRezJ8yN6/xdT2HIsbqaO6ICSLsuU2+7UWocvsY
         kXjg==
X-Forwarded-Encrypted: i=1; AHgh+RpQEES2JHhbXWQrIllLmmpVqCDt1jKq7wL5DK7HVFkt6Ih1Md8IUCxWl0z9V+DKQbStfdKbj6gNKIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBcpHF+EAFBS+7ydS6vfo1MTi5bUR+8YMY9ohSw6LijRlyRCfb
	2eOvDFhU0lkoz+gilFDEb34Tl0/XycPPl+lildD8iJHYV4TnZ5faYnDo
X-Gm-Gg: AfdE7clUJok1RG2cjEZ8f6XWJqetZ17AJiF2X65+4gm6Q/Cr/g79MNcWWL+4FBfHGl/
	BG7NXRykjG3UqLfS4zyBfjQOPZ+ivcSir5aek34mlL4Z69XNwVf/2lRMTMPqQBgY7RtyvJKMJtn
	BpglFZigOPLK1NrQMnIzTBbeSwYUpa2VScB+93o49YTUKWZoiC7rzrYghp2W7c6m6rzBJ8NZQsX
	cEJ/pyOauE158FhiXGsbRZOp66lYbGLEuVeOxl6ooNxWRxhJQ0O69nfmbU7jfAP7f+IdVHI1E2P
	IKMb8PjhDD9NYZ3bI6a7HrJuvgd50pcCDTDZ6DCJlz4cahLW6Tuu2A9/toe6CZgzec/bIdv80A4
	BSSZJpvFG+v0Dq74/wgYUz7U9J8V1Y3rvR905pYyO+tYsepNINOFMJr/Tl4MCU/YmwQ5e9ncwIa
	85fvEVU9V7RoC8L58eE8wNnw==
X-Received: by 2002:a05:600c:a42:b0:493:c77c:108a with SMTP id 5b1f17b1804b1-493f883c8ffmr70582755e9.36.1783891056739;
        Sun, 12 Jul 2026 14:17:36 -0700 (PDT)
Received: from WindFlash.powerhub ([2a0a:ef40:f61:3b01:d08a:833b:756:8fce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm307923765e9.1.2026.07.12.14.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:17:36 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Leonardo Bras <leobras.c@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
	Feng Tang <feng.tang@linux.alibaba.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Marco Elver <elver@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Li RongQing <lirongqing@baidu.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Gary Guo <gary@garyguo.net>,
	Christian Brauner <brauner@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Coiby Xu <coxu@redhat.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev,
	Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH v4 1/4] Introducing pw_lock() and per-cpu queue & flush work
Date: Sun, 12 Jul 2026 18:17:34 -0300
Message-ID: <alQEbpfo7mHHkIcx@WindFlash>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ag3Jh-8iUdgKvw5y@localhost.localdomain>
References: <20260519012754.240804-1-leobras.c@gmail.com> <20260519012754.240804-2-leobras.c@gmail.com> <20260520134832.WS7TrMnu@linutronix.de> <ag3Jh-8iUdgKvw5y@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96476-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[leobrasc@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:frederic@kernel.org,m:leobras.c@gmail.com,m:bigeasy@linutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:peterz@infradead.org,m:mingo@redhat.com,m:will@kernel.org,m:boqun@kernel.org,m:longman@redhat.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:jackmanb@google.com,m:hannes@cmpxchg.org,m:ziy@nvidia.com,m:harry@kernel.org,m:hao.li@linux.dev,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:bp@alien8.de,m:rdunlap@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:kees@kernel.org,m:elver@google.co
 m,m:kuba@kernel.org,m:lirongqing@baidu.com,m:ebiggers@kernel.org,m:paulmck@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:ojeda@kernel.org,m:thomas.weissschuh@linutronix.de,m:tglx@kernel.org,m:dianders@chromium.org,m:gary@garyguo.net,m:brauner@kernel.org,m:pasha.tatashin@soleen.com,m:coxu@redhat.com,m:masahiroy@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-rt-devel@lists.linux.dev,m:mtosatti@redhat.com,m:leobrasc@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linutronix.de,lwn.net,linuxfoundation.org,infradead.org,redhat.com,kernel.org,linux-foundation.org,google.com,suse.com,suse.de,cmpxchg.org,nvidia.com,linux.dev,gentwo.org,tencent.com,huaweicloud.com,lge.com,alien8.de,linux.alibaba.com,linux.intel.com,baidu.com,chromium.org,garyguo.net,soleen.com,vger.kernel.org,kvack.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leobrasc@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_GT_50(0.00)[66];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D76FB745EE5

On Wed, May 20, 2026 at 04:47:35PM +0200, Frederic Weisbecker wrote:
> Le Wed, May 20, 2026 at 03:48:32PM +0200, Sebastian Andrzej Siewior a écrit :
> > How likely is it, that you you had users before late_initcall()? Also
> > can it happen that one of them uses one function to lock and the other
> > unlock in this brief window? There is no check if this was used before
> > static_branch usage.
> 
> Or let alone initialization on the wrong member of the union.

Right!

> 
> -- 
> Frederic Weisbecker
> SUSE Labs

