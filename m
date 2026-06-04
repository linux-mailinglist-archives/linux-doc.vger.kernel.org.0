Return-Path: <linux-doc+bounces-90879-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JdasGT0QIWow+wAAu9opvQ
	(envelope-from <linux-doc+bounces-90879-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 07:42:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9A863D0D9
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 07:42:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gdMDMi4Y;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90879-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90879-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7AFE300A130
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 05:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E0D3C09E9;
	Thu,  4 Jun 2026 05:36:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41573373C1E
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 05:36:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780551381; cv=none; b=T24BbU179UaLcDPcsiGKZ/Oh50pVN8+3FdwP4r5qNdA+C3XpxeU0UREw60ddFMMrLrX6DelmFO1r/Ljoda83NmDpDw7OqRVUhHmtRPdzya9UkNTBTMKqIlrCM1xwyg9vOYyPOF9sZvuOPtGvg2ndSWERUerGSXob91d7ENDeLGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780551381; c=relaxed/simple;
	bh=hlf6gZ7zE0nZZVqddnEN3mtWYxn26ImLM+nzUagCUEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=on8usKlQr7Q0R+gOXMtPQJ/X0MI6YIJJEFyk1bYAN1NYOhNH3Jj44imsQvChg5+/3KUZpiRE6Or584aS0yna7ccE1LHp/CktXlHTtb4Dz9fPQDrHUM4FwHv5844vqnEI/VhptJ0DHGj2jzBywehCQBRcp9aVxFx0maalY0C0Cuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdMDMi4Y; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D291F008A4
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 05:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780551380;
	bh=hlf6gZ7zE0nZZVqddnEN3mtWYxn26ImLM+nzUagCUEc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gdMDMi4YgBtoGh5YNLNCJyqy+lw64oERWsV7XQCyiUTXkrrJiCIzII6H7jD86aDKa
	 nkGhZQOUi5Gracb+Ixl5YFl85bXK+VEHccERo8LNO68+HU95F5hNUk5JJt+qjcBJQ5
	 LOMEPWl+JBreT6xT9hYuJUV20lbdw9i/mUyYNFNRjWowAKFCIIIScDqYgqeRKJVAEU
	 G4cpJlcSjqOMZaCJGNNezf9ZbDwFxGyM/YJd+0J7STxFEd70Aq9EJ8Sd/SiviBfrin
	 iWdT0TLA76pTpFttQXX2Phlb8rpUK3yGE5kESs+Wl6ihHGDHfBTWgR8ask9PmFhiBP
	 buW08RWhnj3AA==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bec450b950dso35939266b.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 22:36:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/VszIf4P9GQqQgJEW38VSJXQ4nkmhd6dR/dcoVeWBWkhkCisFBLWHfgw6v08lcoEpvCW2rIQ5s2KI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXya9EEkl242NKYhTUIInrxA9d/555zfg8N/WN8cd8daKUFlA1
	Bt5ujkZYvA/Aw1b8SPNJWXcUMTFQUI/QBrv34g0QiuU5fvoGNtOYP9Ge/t0qAugHT96SUzygXa5
	2QDqnMYAnc0o7Crpsj9mlI/hQxSoTMYg=
X-Received: by 2002:a17:907:c289:b0:bef:87ca:aec5 with SMTP id
 a640c23a62f3a-bf0afaf5209mr309828866b.47.1780551378864; Wed, 03 Jun 2026
 22:36:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-3-jiahao.kernel@gmail.com> <CAKEwX=MQe_KFZe2vBXQYh0aa-x+E8AzNwmyjJGJk4tDoS9ML3A@mail.gmail.com>
 <aho_VtLCmIRsNyvO@google.com> <6deeaea7-3cd1-4403-29fc-d2dc55c297f8@gmail.com>
 <aiBqzOtEv5iAC_qC@google.com> <CAKEwX=OhxUxRCEfvZMnWzXy=Fa4jgzL3DuP-RmaVzdK65m4bew@mail.gmail.com>
 <6db27a22-cc7a-9a94-db3f-c912fd39aa32@gmail.com>
In-Reply-To: <6db27a22-cc7a-9a94-db3f-c912fd39aa32@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 3 Jun 2026 22:36:07 -0700
X-Gmail-Original-Message-ID: <CAO9r8zM4SDdTgz9L2s1VfXL8K2VBjMD9ej2BTDxaGge1t2+quA@mail.gmail.com>
X-Gm-Features: AVHnY4IE7N3d59FLndV-s7gDFevntutRjRoeBw3qu7WJHZARyl3yLsqSevGQ5pQ
Message-ID: <CAO9r8zM4SDdTgz9L2s1VfXL8K2VBjMD9ej2BTDxaGge1t2+quA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mm/zswap: Implement proactive writeback
To: Hao Jia <jiahao.kernel@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, shakeel.butt@linux.dev, 
	mhocko@kernel.org, tj@kernel.org, mkoutny@suse.com, roman.gushchin@linux.dev
Cc: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org, chengming.zhou@linux.dev, 
	muchun.song@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90879-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jiahao.kernel@gmail.com,m:hannes@cmpxchg.org,m:shakeel.butt@linux.dev,m:mhocko@kernel.org,m:tj@kernel.org,m:mkoutny@suse.com,m:roman.gushchin@linux.dev,m:nphamcs@gmail.com,m:akpm@linux-foundation.org,m:chengming.zhou@linux.dev,m:muchun.song@linux.dev,m:cgroups@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jiahao1@lixiang.com,m:jiahaokernel@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,cmpxchg.org,linux.dev,kernel.org,suse.com];
	FORGED_SENDER(0.00)[yosry@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,linux.dev,vger.kernel.org,kvack.org,lixiang.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE9A863D0D9

> >> But doesn't it make more sense to specify the compressed size, which is
> >> ultimately the amount of memory you actually want to reclaim.
> >>
> >
> > I personally prefer compressed size to pre-compressed size. That's
> > kinda what user cares about, no?
> >
> > One thing we can do is let users prescribe a compressed size, but
> > internally, we can multiply that by the average compression ratio.
> > That gives us a guesstimate of how many pages we need to reclaim, and
> > you can follow the rest of your implementation as is (perhaps with
> > short-circuit when we reach the goal with fewer pages reclaimed).
>
> Got it. I will change it to use the compressed size in the next version.
>
> Yosry, Nhat, should we continue using the zswap_writeback_only key to
> trigger proactive writeback?

I *really* want the memcg maintainers to chime in here, it's
ultimately their call.

Michal? Johannes? Shakeel? Roman? Anyone? :D

