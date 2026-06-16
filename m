Return-Path: <linux-doc+bounces-92555-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 23xdHOWxMWr9pAUAu9opvQ
	(envelope-from <linux-doc+bounces-92555-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 22:28:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9DD695349
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 22:28:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JuHuu832;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92555-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92555-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A62A430AF4B4
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 20:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E47394E80;
	Tue, 16 Jun 2026 20:27:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650223911B8
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 20:27:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641632; cv=none; b=HF0GaJEM7O6zh5poM27L5h3A5c92EU+z37jTILb/2+yHFnHc+Hvrml/DPF6s3FLZd8RMq/i++OKXxcR8PNYAbXUCah5K4fW37yrvgNEoYEy2+YgVDzMb4rd6h54zHULuj8g0PoC5TosmdoJ0UlG5BGn6cXOzqkW1lC4sUBSxQro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641632; c=relaxed/simple;
	bh=e6nRZUUDaqrNRBspLG7ihU4cunwzWB+iNdq0zIyl7ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uuWK5RnW+7wnGHkQMOIW5AIV9Yr7i1f5ICBbxxIQOAeLyNQvtm9uRUR8L7R48ypI/YJLhKGeknNYGb8qB6Q+QT2mW6dIO3EI86/7oxNBUIiDpoRgh9v+6sZZ+fZ3x8qpvcYYhrIgNyf7Kd5C5aVgLo7LjKBV+XwZHatprXmTp9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuHuu832; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111261F01563
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 20:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781641631;
	bh=e6nRZUUDaqrNRBspLG7ihU4cunwzWB+iNdq0zIyl7ds=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JuHuu832ps/PLAv/yjPk05o0j/bNWU+8RQEPpNUm12No95UDH4ydA/RnpaX0vKxOQ
	 bMOKWuENOMqiq1ZmHfZX+tyYpmRZ9jbR68Pg3GXPiEttCHCBNkxjoMgusSYAlxxYIp
	 WPhsjHYJEnkYmhJKTJr1bXIKaR0p6jN58Lhm7zYuK33zmj5lsaUfEZt+e46Dn7jl75
	 /+WkL8VWfs/4p8OfhmRkeXMULgoi3L4ZBvUPuQaM08r/kNEaJrXPY2h5R40+Nhy11A
	 jkLT/8QkQNdzPa+BTmgWkAR5Zvdyb0a/AIBtFGYFWwJHx4DPDZ493iuwCyO5hyI1cs
	 SFULSDoPg8t/g==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bf0170c80f7so851986466b.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 13:27:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9GjYGvZHzfXV4gEEtZW+jORycrGurxumotc4OkiBYlKYfZqvdiLGJFfcAbCK9LmHVJujeguhDM2+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKkZabjbcC6bLIe22cUnbuqoTYQj2OuZJzFGpu48zNE9X8aYhg
	aOs2Xrz6RaS49Oh7jVrult4XQ7jGeeEf/nEn/xiPSqyoN4ln9SLqpR4i6WzZr+ODloHvKg03zfY
	oBulVJQoyaErSHzhsyxw/WlDpGGsRifM=
X-Received: by 2002:a17:907:3f0a:b0:bec:6c5c:cced with SMTP id
 a640c23a62f3a-c05a69ec26dmr89257366b.28.1781641629909; Tue, 16 Jun 2026
 13:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aictKA0XWMWbxFdN@linux.dev> <CAO9r8zPvCaCqvoUhPdAN5Oi_Sj0mK-t7DJhOOz3Xf1DT-Wrgcw@mail.gmail.com>
 <aieUQUBHI+E3uNPW@yjaykim-PowerEdge-T330> <airzE7jD9UtyR17J@google.com>
 <aisEWnb3pzmVC4dl@linux.dev> <aiu06fbV7rWqY0Bm@yjaykim-PowerEdge-T330>
 <aiw2p5ANjsQUCIHA@linux.dev> <ai5y923elCSZp41j@yjaykim-PowerEdge-T330>
 <CAO9r8zOVqbJEaBqTHw=r2bYw7Lm1tO0TU9QuG+eH1rfqcTAJJQ@mail.gmail.com>
 <ajCgzNIPLhjTRSXR@yjaykim-PowerEdge-T330> <ajC+FNpkVpI4pbBz@yjaykim-PowerEdge-T330>
 <CAO9r8zMimM8n54BL1viuX3pYzO=wzQU89LhCF1HW0bAv97ZQtg@mail.gmail.com>
 <CAKEwX=Nz9SWcEVQGQjHN8P8OANJY4BG0w+iQOzoNOWuteoVjAg@mail.gmail.com>
 <CAO9r8zOD7XaJ0Uo_LLLDTRKbeTOmAwmM3q8q6rUyH3oS-X3Csw@mail.gmail.com>
 <CAKEwX=N=Umi94wdKcLxEWOqUwhz6=Lj909pc1Pr_5ivVnZmdPQ@mail.gmail.com>
 <CAO9r8zMHGFG_jcVeDPgowaQ2RNntp3KankwzQdgrJb9PrWu8_w@mail.gmail.com> <CAKEwX=NyfxfXhHESTLyirAgdVA6QaYAcam792-vSZdmo0Pz+bA@mail.gmail.com>
In-Reply-To: <CAKEwX=NyfxfXhHESTLyirAgdVA6QaYAcam792-vSZdmo0Pz+bA@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 16 Jun 2026 13:26:58 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOg0OP1Ak1v7CRzSfQq0D8b4Dw+_T0Jui6YTM_KwQQNOA@mail.gmail.com>
X-Gm-Features: AVVi8Cef9RFgkBD4H21fnyl2aKEeUxi6JgJdg1HlDVnffa50e_DqpC4LMfTVVho
Message-ID: <CAO9r8zOg0OP1Ak1v7CRzSfQq0D8b4Dw+_T0Jui6YTM_KwQQNOA@mail.gmail.com>
Subject: Re: [swap tier discussion] Re: [PATCH v3 2/4] mm/zswap: Implement
 proactive writeback
To: Nhat Pham <nphamcs@gmail.com>
Cc: YoungJun Park <youngjun.park@lge.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Hao Jia <jiahao.kernel@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, mhocko@kernel.org, 
	tj@kernel.org, mkoutny@suse.com, roman.gushchin@linux.dev, 
	akpm@linux-foundation.org, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>, chrisl@kernel.org, 
	kasong@tencent.com, baoquan.he@linux.dev, joshua.hahnjy@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92555-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nphamcs@gmail.com,m:youngjun.park@lge.com,m:shakeel.butt@linux.dev,m:jiahao.kernel@gmail.com,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:tj@kernel.org,m:mkoutny@suse.com,m:roman.gushchin@linux.dev,m:akpm@linux-foundation.org,m:chengming.zhou@linux.dev,m:muchun.song@linux.dev,m:cgroups@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jiahao1@lixiang.com,m:chrisl@kernel.org,m:kasong@tencent.com,m:baoquan.he@linux.dev,m:joshua.hahnjy@gmail.com,m:jiahaokernel@gmail.com,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[yosry@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lge.com,linux.dev,gmail.com,cmpxchg.org,kernel.org,suse.com,linux-foundation.org,vger.kernel.org,kvack.org,lixiang.com,tencent.com];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE9DD695349

On Tue, Jun 16, 2026 at 1:24=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Tue, Jun 16, 2026 at 4:10=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wr=
ote:
> >
> > On Tue, Jun 16, 2026 at 1:09=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> w=
rote:
> > >
> > > On Tue, Jun 16, 2026 at 3:54=E2=80=AFPM Yosry Ahmed <yosry@kernel.org=
> wrote:
> > > >
> > > > On Tue, Jun 16, 2026 at 11:33=E2=80=AFAM Nhat Pham <nphamcs@gmail.c=
om> wrote:
> > > > >
> > > > > TBH, without vswap, we should not allow setting zswap as its own =
tier.
> > > > > It's meaningless. Maybe makes it a no-op, and warn users what the=
y're
> > > > > setting is gibberish?
> > > >
> > > > Why? vswap is transparent to the user. Why can't zswap be its own t=
ier?
> > >
> > > Without vswap, if you set zswap as its own tier, which phys swap
> > > device should we allocate from for the backing slot? :)
> >
> > Today we just allocate a swap slot in a swapfile during reclaim,
> > before swapout, and zswap will just writeback to that one. I assume
> > the same will work with swap tiering, except that maybe the way that
> > swap slot will respect the allowed swap tiers?
>
> Yep! So if we set zswap as the only tier, then it wouldn't be able to
> allocate a swap slot in swapfile right?

Ohh I thought you meant we shouldn't allow zswap to be a tier at all,
not the *only* tier.

> Or are you suggesting that if we set zswap as the only tier then we
> can allocate from any swapfile (since we're not doing any IO anyway)?

Hmm, technically having zswap as the only tier should be equivalent to
disabling writeback, but you're right that if zswap is the only tier
than the memcg is not allowed to use swap slots from any swapfile, so
zswap cannot be used. Very good point :)

In this case I think yes, we need vswap to be enabled to allow making
zswap the only tier. That's one gap between zswap being the only tier
and disabling zswap writeback, the former requires vswap while the
latter doesn't.

