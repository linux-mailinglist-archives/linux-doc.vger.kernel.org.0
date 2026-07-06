Return-Path: <linux-doc+bounces-95234-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c3NLBckOTGpqfgEAu9opvQ
	(envelope-from <linux-doc+bounces-95234-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 22:23:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7843D715643
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 22:23:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a4p73KlE;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95234-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95234-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19F1B3179787
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 19:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D6F3D8115;
	Mon,  6 Jul 2026 19:29:00 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8643C3ACA70
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 19:28:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366140; cv=none; b=POtRfrhnjafEwzdJ1Chi3t1vdDMNKxhvCqTUJluRKC/dvl4PdX00NzTyvkYp9TgfZ+gB8vjyv+57guV675JTkHlitht223+X+Os0Kx9U3ExGWWtJ/jDgq3akBT6AmBUvRfOcu7L6fMfQmY1JwB3cdhCoVWWJuatpefG6QNXoh1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366140; c=relaxed/simple;
	bh=IDvYMz3nG8st0a0aM+DKLAcAyTaasmqSXHhj6f2axZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdcOGRvOtN0/ck/oTYQeIWXF3sSs5yJF+hQOq4xpAPD/jxWUHWN/NLl/9Ts4m4N2wkHy9ZulRA81nOH8RqQlwoTJSFR1Vp3+NCKe4zkzd0wfKhjBzOlDmykNaN/BxNJLDEiT8vfOf0NppmcWcoKu0c5BdtCdN4pDWi6BF6E++v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4p73KlE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FCB81F00A3A
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 19:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783366139;
	bh=IQcrKM144IteF7RLbk69gWQNPIW8WjgMMggN5ygWDkE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a4p73KlEHDRzOjXQJ3AFLPiKcraSRL6Z7FvrO0fRkw2zsAyQjd1biBl6QFeLvrfga
	 bk4rjDE1kfCeKgsFVS5AMThbo/mTMUQ+dmlzamV/Mb6KBK83tvi+y9gxIZOEOgU3jV
	 6VGeLaUjEEdoGDvk8XyDZet5mx2U9lSgRFYcTld6GupjmlrLpO6i7GfehhmchpwMLM
	 CKZx41bPOIBqJbMgkQAoUoPysFq7nl7XmV8pjXDp168TyS5MSi1yT3Wiw85ffgUrT0
	 pRSGhDZcDwk3kjL99ZZ8QAX7oTB9D54UzTevy7k7ar6fZRz4Erl1l1au+z2bSm+wgq
	 Nh5qmr178ZkoQ==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c12788a75abso467427666b.2
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 12:28:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoDaxlssbBuO5/3H2fsuSdvBMrGM3n90uGPDD8IIU4w0rH2JbLCfoBfKA/teKt8oQA19CG3dSIfYH8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk07/dQQrbEYKoCC9FOt+kO+8rdZg8FCD80nbBw+4Hhu9lzyIk
	7v1AV34ELADdLhO4zXs7B4ISjrQrdc1IGSTSwz+qmtpdPNCPjy9B65DH46xZPV8vgcaSnQ/6kUT
	maTKNplQnSrawySdNeF7XiXMK+9Vls3k=
X-Received: by 2002:a17:907:e107:b0:c12:61c5:c141 with SMTP id
 a640c23a62f3a-c15a690a339mr80814966b.53.1783366138212; Mon, 06 Jul 2026
 12:28:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
 <20260629112032.20423-5-jiahao.kernel@gmail.com> <akMJ8UfeZXrVe5LN@google.com>
 <cbbdf506-b67d-193c-2c94-bacf828d559f@gmail.com> <CAO9r8zNCEis2QHROEsM5QZsb_H4ofNjA_sE-pM7SVxtgHg_rqg@mail.gmail.com>
 <a1c139d9-08b8-9631-7a85-697df4c23d52@gmail.com>
In-Reply-To: <a1c139d9-08b8-9631-7a85-697df4c23d52@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 6 Jul 2026 12:28:46 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNOEfRadPaMv33nexQztgDxWEWi5=w=fKd+n7A+1L592g@mail.gmail.com>
X-Gm-Features: AVVi8CejFCreebY10J5qVyRaGPCWsbYJB7Ywv5bR5xAz3vYSS39OxmpII_xEK0M
Message-ID: <CAO9r8zNOEfRadPaMv33nexQztgDxWEWi5=w=fKd+n7A+1L592g@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] mm/zswap: Implement proactive writeback
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95234-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jiahao.kernel@gmail.com,m:akpm@linux-foundation.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:shakeel.butt@linux.dev,m:mhocko@kernel.org,m:mkoutny@suse.com,m:nphamcs@gmail.com,m:chengming.zhou@linux.dev,m:muchun.song@linux.dev,m:roman.gushchin@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jiahao1@lixiang.com,m:jiahaokernel@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[yosry@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,cmpxchg.org,linux.dev,suse.com,gmail.com,kvack.org,vger.kernel.org,lixiang.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yosry@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7843D715643

> > If you're looking for another cleanup to do, shrink_worker() should
> > probably also use mem_cgroup_online() and avoid taking/dropping an
> > extra ref :)
>
> IIRC, this might not work because zswap_next_shrink is a global variable
> and is accessed outside the lock during reclamation.
>
> Consider the following race condition between shrink_worker on CPU0 and
> zswap_memcg_offline_cleanup on CPU1:
>
>
>            CPU0                            CPU1
> spin_lock(zswap_shrink_lock)
> memcg1 = mem_cgroup_iter()
>    memcg1.ref = 1
>    zswap_next_shrink = memcg1
> spin_unlock(zswap_shrink_lock)
>                                zswap_memcg_offline_cleanup()
>                                spin_lock(zswap_shrink_lock)
>                                css_put(zswap_next_shrink)
>                                memcg1.ref = 0  <--
>
> shrink_memcg(memcg1) *maybe UAF*

You're right, thanks for double-checking. I lost track of why the
extra ref was needed.

