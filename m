Return-Path: <linux-doc+bounces-93409-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6/1hIFANPGo5jQgAu9opvQ
	(envelope-from <linux-doc+bounces-93409-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 19:01:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6C96C0331
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 19:01:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iQU7Tb2N;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93409-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-93409-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E15E0300E02F
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 17:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB5335E944;
	Wed, 24 Jun 2026 17:01:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290C6356767
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 17:00:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782320461; cv=none; b=i5813CQTugkBYQjbyqUMV/YeS+SsXlbpw4S2wiPeEM+18VHcFO5iEk2jdUW3ON8rv0f42kTyfYwIW69okr6qoOj/POQY2ArjEu6rZnEXQWW2wHSQQ8gRGnL2MeVVRTiK6kr6PaF7PeN+JwQjv/VAzEW3W8H55d+KAGRyO47Yx2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782320461; c=relaxed/simple;
	bh=pEVC2AN5SysH52/PZLUtq9gl60gQIXWwpFqc8ASw8jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pm48nS4xahXuzaRtE+5XhZjaxdlJezOfCFFZfhr51Q9oqiMVWG+SFrol1UVPwyozU38lgOR8n6fZ0woJOUY8G0EMQcfBHc8f24CSRtC/l5hpZgvlK1MS8msAojZdY/8XR8csPw2y+/OTNMAtiZTNOTVifoTUVQtDm+Bgt/sYAvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQU7Tb2N; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35061F01558
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 17:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782320459;
	bh=lVVJtxXyVjgi/BtOT1bRdEE1rJmfHlFaC1R3BjgiYrc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iQU7Tb2NT1KiSInJPVW+D63hs1SqjAFIzspWwd3E+tOqJhmaHXPd6jeSJReGW4W96
	 T/lu7esPqrMiveWMr31vS4f7TDZ1i0Gxfub7o0JqvG4IJlxttc3m5KqdL0XY0DehVF
	 IWjkVWFs44mNs4FP+rDMgccSawscCiyYEucsE1SxUBBne38GlxRLHE33XylM7RMywe
	 qxOPYBSt4r18ruxN0GXqqY2bf99yzpx+gMK/x8QL4oYRAZYdWO21AoVjBE5fTUxqHe
	 PkfRS71FNXViqDFK2IH9d72OlEGfXQn2peYkjMOVINyTvnRZ4NM2dmVCsvlvon4rEQ
	 BBKv3uMlDHkCQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c0e12cb1d90so155145866b.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 10:00:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8nd4o69v43A1fDcp+g1T6XgXFeddshpzKGqWCvQFSXLGTiEKAWpyqwYG14IMXx0txwXoKkT2VP55c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJPDJsXOA4uMaeqwfTwJ/zlsq6HUyu0pCe51hi/b1qAJ8kXUrt
	5+Orc8apRa4dbu+yKW8NUlk6eyF6tZ9MzK3qwdCpOQ4DSLqQG9PDg9lXUEcD1wrtpj2liwzOxnm
	qbhihZB+8Hd7YEfr9LRI/aB78Dz1fwAY=
X-Received: by 2002:a17:907:1c1c:b0:c0a:5b0e:3d60 with SMTP id
 a640c23a62f3a-c119e1c0c52mr250171166b.13.1782320458723; Wed, 24 Jun 2026
 10:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <20260618044857.69439-3-jiahao.kernel@gmail.com> <ajnGTt8tkbAWX8Oc@google.com>
 <0916e673-861f-b472-7417-afbffbcc98ad@gmail.com>
In-Reply-To: <0916e673-861f-b472-7417-afbffbcc98ad@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 24 Jun 2026 10:00:47 -0700
X-Gmail-Original-Message-ID: <CAO9r8zPSZLaqLXw87V3q4tZa8WD7xCympKqfLMLB+o-++GksJQ@mail.gmail.com>
X-Gm-Features: AVVi8CeBIAL_SrdM8s9oEhC5-NPGoXvgoAGhPTPfjDkpJYNf1drEvhkgW-bCgZI
Message-ID: <CAO9r8zPSZLaqLXw87V3q4tZa8WD7xCympKqfLMLB+o-++GksJQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] mm/zswap: Factor writeback loop out of shrink_worker()
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93409-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B6C96C0331

On Wed, Jun 24, 2026 at 4:55=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
>
>
> On 2026/6/23 07:36, Yosry Ahmed wrote:
> >> +/*
> >> + * Walk the memcg tree and write back zswap pages until the
> >> + * (lower_pages, upper_pages) window closes, or abort encounter
> >> + * MAX_RECLAIM_RETRIES times of the following conditions:
> >> + * - No writeback-candidate memcgs found in a memcg tree walk.
> >> + * - Shrinking a writeback-candidate memcg failed.
> >> + *
> >> + * For shrink_worker(), it passes lower=3Dthr and upper=3Dzswap_total=
_pages().
> >> + * The @upper limit is refreshed in each iteration by re-evaluating
> >> + * zswap_total_pages(), and the window closes once the total falls
> >> + * below the threshold.
> >
> > This is the wrong abstraction level, and it's obvious by the fact that
> > the function calls zswap_total_pages() again to recalcualte
> > 'upper_pages'. It gets much worse in the next patch as well.
> >
> > The lower_pages and upper_pages thing is also unnecessarily hard to
> > follow.
> >
> > The core of the reuse here is the retry logic. So maybe keep the memcg
> > iteration in the callers, and define a function that takes in one memcg
> > and reclaims one batch from it? failures and attempts can be passed int=
o
> > the function to maintain the state across scans of different memcgs,
> > like zswap_shrink_walk_arg?
> >
> > WDYT?
>
>
> Perhaps something like this?
>
> struct zswap_shrink_state {
>      int attempts;
>      int failures;
>      bool stop;
> };
>
> static bool zswap_shrink_no_candidate(struct zswap_shrink_state *s)
> {
>      if (!s->attempts && ++s->failures =3D=3D MAX_RECLAIM_RETRIES)
>          return true;
>
>      s->attempts =3D 0;
>      return false;
> }
>
> static long zswap_shrink_one(struct mem_cgroup *memcg,
>                   struct zswap_shrink_state *s)
> {
>      long shrunk;
>
>      shrunk =3D shrink_memcg(memcg, NR_ZSWAP_WB_BATCH);
>      if (shrunk =3D=3D -ENOENT)
>          return 0;
>
>      s->attempts++;
>      if (shrunk <=3D 0 && ++s->failures =3D=3D MAX_RECLAIM_RETRIES)
>          s->stop =3D true;

Do we need 'stop' or can we just return a value here to indicate that
we should stop (e.g. -EBUSY)?

>
>      return shrunk;
> }
>
> static void shrink_worker(struct work_struct *w)
> {
>      struct zswap_shrink_state s =3D {};
>      unsigned long thr;
>
>      /* Reclaim down to the accept threshold */
>      thr =3D zswap_accept_thr_pages();
>
>      while (zswap_total_pages() > thr) {
>          struct mem_cgroup *memcg;
>
>          cond_resched();
>
>          memcg =3D zswap_iter_global();
>          if (!memcg) {
>              if (zswap_shrink_no_candidate(&s))
>                  break;
>              continue;
>          }
>
>          zswap_shrink_one(memcg, &s);
>          /* Drop the extra reference taken by the iterator. */
>          mem_cgroup_put(memcg);
>          if (s.stop)
>              break;
>      }
> }
>
> We could also fold the logic of zswap_shrink_no_candidate() into
> zswap_shrink_one(), but adding a !memcg check inside zswap_shrink_one()
> feels a bit awkward.
>
> WDYT?

I think splitting the shrink/retry logic over 2 functions makes it
more difficult to follow, so yeah I think fold
zswap_shrink_no_candidate() into zswap_shrink_one(). Then the callers
only need to iterate memcgs (depending on the context) and call
zswap_shrink_one() for each of them.

