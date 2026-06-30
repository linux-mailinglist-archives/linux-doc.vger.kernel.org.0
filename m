Return-Path: <linux-doc+bounces-94195-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0Vc3FojrQ2pTlgoAu9opvQ
	(envelope-from <linux-doc+bounces-94195-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 18:15:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A77F86E6549
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 18:15:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RaP2Jv7c;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94195-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94195-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9ADE304D254
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 16:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0664140F8CF;
	Tue, 30 Jun 2026 16:10:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE7B46AF31
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 16:10:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782835820; cv=none; b=EqYGLwrRnVdkpk694Zjpc97GnE+VWU7d/20LOG2g45pCl8iBcquUTiGJ43G4yJYc12qQz4TWoRnglIH6MJFBC443wEIWVjC/EqYnaeb/EUTmXQimTHSCpyxM8KMoiTSNABAsDXiHxCGT0Z0NSKsnOkh2tCNb0Jl1Rbp1Lc9Scm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782835820; c=relaxed/simple;
	bh=HTNp9J5o9oIGQiCBLTet8+69QCDehQ9dtlU8XsDpxho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKAPGn6/o2syZk5qlI34DGmsagPmVbdBirhfHP31YmvRk+tZ97guf3f75gt+pH1NQUrD8Akf7NpKGxi67FCcs9hQNOlz4Sm20yBh8NLTKaTL7I9d4Nnrp5vx6BCaeSqQz9vgGs1wimSxCLtg3eM9xkzEZcAaVgOPzBfc576C8qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RaP2Jv7c; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094521F00ACF
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 16:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782835818;
	bh=k7zChJl8MwHEyfkHkyO60Kplml0v/iOPphL5IgITDh8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RaP2Jv7cYX1bNGREFeq7tshSNm/SWgYSS88YwrjEXc8F4U0mUzFD4557v+Z/5LeND
	 V1nuZejIU+u+MIRn7O9cB3RnHz2Edc23OMyorbL67IChaAH3TZs+pnpyGoyO63SwlW
	 QtoGzj6Im4O8FAakxrB8rSSzAGHYZ81UfVHDTHxvHLbKk+SKS5gDGEtRMXkjnDM+aL
	 TEoXzHIgiIgTYGjDe6Loz97mgHvn5aOeagJKjTJHsgFuwsoFsY1MnC5Ot5jHdGJftk
	 GSS6BaVRIFj5pjezXTnYaI9suwSIUgs/Xn463XnjJVOa9gSs9LxwGllHAKhp/1xpuR
	 rgoPWLbK+E+Qg==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-697bd41a4ecso5862813a12.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 09:10:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RolksgWBH+0T/9VgJdOQy9KpYaBqpvEAP/jjE7oKJ3X//TU5NhxTW4YDiCsAIwSYL343vTUq667co4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuDO8A0VmJGuQe3pXrTdR1Z0WeKe3I/gLu7u1RYRyuuyMHUQpv
	y+XYhjGGkbwpdXV+QDiUsnH+dLAmbL7HFRiaYYuSPgFe5lm0KIQ61rOUBHaFFdd19meyTG2YCQZ
	DyDXbO9pjd43mjpQkztBMha54uV4nOiw=
X-Received: by 2002:a17:907:e155:b0:c11:f6cd:e120 with SMTP id
 a640c23a62f3a-c1297c09d89mr49816466b.25.1782835816933; Tue, 30 Jun 2026
 09:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
 <20260629112032.20423-5-jiahao.kernel@gmail.com> <akMJ8UfeZXrVe5LN@google.com>
 <cbbdf506-b67d-193c-2c94-bacf828d559f@gmail.com>
In-Reply-To: <cbbdf506-b67d-193c-2c94-bacf828d559f@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 30 Jun 2026 09:10:04 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNCEis2QHROEsM5QZsb_H4ofNjA_sE-pM7SVxtgHg_rqg@mail.gmail.com>
X-Gm-Features: AVVi8Cdt9VAUjUs2EYnk1zT9l08rcztQNfD1M7IbhQzMhnu027BpAaMiWC_e3cE
Message-ID: <CAO9r8zNCEis2QHROEsM5QZsb_H4ofNjA_sE-pM7SVxtgHg_rqg@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] mm/zswap: Implement proactive writeback
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94195-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,cmpxchg.org,linux.dev,suse.com,gmail.com,kvack.org,vger.kernel.org,lixiang.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jiahao.kernel@gmail.com,m:akpm@linux-foundation.org,m:tj@kernel.org,m:hannes@cmpxchg.org,m:shakeel.butt@linux.dev,m:mhocko@kernel.org,m:mkoutny@suse.com,m:nphamcs@gmail.com,m:chengming.zhou@linux.dev,m:muchun.song@linux.dev,m:roman.gushchin@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jiahao1@lixiang.com,m:jiahaokernel@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[yosry@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yosry@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A77F86E6549

> > Before going through more versions we need to figure out if this will
> > pivot to be a proactive demotion interfcae for swap tiering.
> >
>
> Yes. Should I drop patches 4-6 in the next version and wait for swap
> tiering to be finalized?
> We can try to get the non-memcg parts (patches 1-3) merged upstream
> first. This would also give them plenty of time to bake and catch any
> potential regressions. Thoughts?

Patches 1-2 can be sent and merged separately, yes. For patch 2,
please include some numbers for the writeback performance before and
after batching.

Patch 3 does refactoring in preparation for patch 4, so I don't think
it makes sense on its own.

> >> +int zswap_proactive_writeback(struct mem_cgroup *memcg, u64 bytes_to_=
writeback)
> >> +{
> >> +    struct zswap_shrink_state s =3D {};
> >> +    struct mem_cgroup *iter =3D NULL;
> >> +    u64 bytes_written =3D 0;
> >> +    int ret =3D 0;
> >> +
> >> +    if (!memcg)
> >> +            return -EINVAL;
> >
> > Can this ever happen? It would be a bug in the caller.
>
> IIRC=EF=BC=8CWriting the following to the NUMA node sysfs entry triggers =
this
> check:
> echo "10M source=3Dzswap" > /sys/devices/system/node/nodeN/reclaim

Oh yeah, I forgot about that one :)

If we keep this, probably combine the !memcg and writeback check below.

>
> >
> >> +    if (!mem_cgroup_zswap_writeback_enabled(memcg))
> >> +            return -EINVAL;
> >> +    if (!bytes_to_writeback)
> >> +            return 0;
> >
> > Do we need this? I think the loop will just never enter and
> > mem_cgroup_iter_break() will do nothing.
>
> Will do.
> >
> >> +
> >> +    while (bytes_written < bytes_to_writeback) {
> >> +            long shrunk;
> >> +
> >> +            cond_resched();
> >> +
> >> +            if (signal_pending(current)) {
> >> +                    ret =3D -EINTR;
> >> +                    break;
> >> +            }
> >> +
> >> +            /*
> >> +             * Use a local iterator to walk the memcg and its online =
descendants
> >> +             * in a round-robin manner. Upon exiting the loop, mem_cg=
roup_iter_break()
> >> +             * must be called to drop the iterator reference.
> >> +             */
> >> +            do {
> >> +                    iter =3D mem_cgroup_iter(memcg, iter, NULL);
> >> +            } while (iter && !mem_cgroup_tryget_online(iter));
> >> +
> >> +            shrunk =3D zswap_shrink_one_memcg(iter, &s);
> >> +            if (shrunk > 0)
> >> +                    bytes_written +=3D shrunk;
> >> +
> >> +            /* drop the extra reference taken by mem_cgroup_tryget_on=
line() */
> >> +            mem_cgroup_put(iter);
> >
> >
> > Can we just use mem_cgroup_online() instead since mem_cgroup_iter()
> > already graps a ref?
> >
> Will do.

If you're looking for another cleanup to do, shrink_worker() should
probably also use mem_cgroup_online() and avoid taking/dropping an
extra ref :)

