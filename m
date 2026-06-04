Return-Path: <linux-doc+bounces-90866-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pQ2zF4vDIGrF7gAAu9opvQ
	(envelope-from <linux-doc+bounces-90866-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 02:15:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E6663C04F
	for <lists+linux-doc@lfdr.de>; Thu, 04 Jun 2026 02:15:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GogIS8WD;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90866-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90866-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9326D303E219
	for <lists+linux-doc@lfdr.de>; Thu,  4 Jun 2026 00:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403165478D;
	Thu,  4 Jun 2026 00:14:53 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF3C45BE3
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 00:14:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780532093; cv=none; b=jyKs+IeaiiQEWH16fNams9jLfgNYR3hvAQJZwJ2dnDAVfii9n7gexPwDJTo/ocqyct+bV0gtwfTQontL+Ml3R6FO8djA9s0QlDrMa6DAkRI0ZZzDAa/oIJPQveyPkU9/yUPMhX1hgakMZHimkawBR/KWKBhHiUzkaGT3PKi4nAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780532093; c=relaxed/simple;
	bh=n4YC7t4GlSKsGsaODNCP0HjzaOKMmCDpq3XlidjCdvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZcxjMdPJNGT/CG4JIXz8T/By1jVbPA4rUhLuj6EotaqhBGhRe7beYDYk2xAE/MvfKaZh3iJGFu+HJ54iZa9LdNxbPZjuZTiw+9cR/5zd/hP3jaD0ISSVB3R6E28QOmbtqNs6Fi1J13+7Pge778qZq4SV5RbLgzkxCtWIya6tzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GogIS8WD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E1D1F00A05
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 00:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780532091;
	bh=n4YC7t4GlSKsGsaODNCP0HjzaOKMmCDpq3XlidjCdvk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GogIS8WD2PzsR8if7BjsUpZWNxHr0bw8VZoLPMUXHCAnE+Dlo2DAqxu5JqaRHKVQN
	 r6suCVGiluHrbzba01BoLLVlJA7aGnW5ft+6hl6+xUDWbYEop9UAblYXFYYrTFYVSm
	 G5HrvOBO6R+rPucdnSELB8x5QnRcrPZyAVeB+Sr8Q8oW/tpnKSa1Xc8cuJhgZ/fqjk
	 64W6l9Y3EmnKGn1dGfrHLUYS4OlEn9EU7fS/ZjSC/0EfZQnxUxsOTQ31M8OPzHDtJj
	 wogwflS/LVG24wWn6w6tsw9ahuAnt2Zcn9wEPi+zAZndAYVPmS0xZ1BqIRyhTvDZSx
	 Fkwx7YaCqHIJQ==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-91564c3a968so13615785a.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 17:14:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/FWhlEzBMJGtfg/FbPZJ9YFhCrrliv0b8CHWjk7l2lWkd0GbXASELfs2uJocQltV93At/M/+Pcei8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOjx5guIEdzC/lCu1n6R4P1WTHyNsV9wWHLbKimrluICqH9drK
	Ff2FPrFCAUT03IHlp7t3iwU+wlyYrIod533C0O+WiqSXk1roKGJXcotL8cIQEAGnhvhZf6GXO7t
	UFcigrVVxR3WW4M/f1WSSiG8mmI12HUQ=
X-Received: by 2002:a05:620a:2994:b0:915:8e2b:e5de with SMTP id
 af79cd13be357-9159ae6c1bcmr267493985a.7.1780532090478; Wed, 03 Jun 2026
 17:14:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-0-ce0219e100d9@gmail.com>
 <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-1-ce0219e100d9@gmail.com>
In-Reply-To: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-1-ce0219e100d9@gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 4 Jun 2026 08:14:39 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w-TxtJN=k9zQLYnRkMArTG8R4TVDoOCpjizi-uiASz3Q@mail.gmail.com>
X-Gm-Features: AVHnY4JapO8_ekxXZ1OEskQ-uXsmOhCdlaQcXY6K-wiwXSYgC-VpzegHnhchd5w
Message-ID: <CAGsJ_4w-TxtJN=k9zQLYnRkMArTG8R4TVDoOCpjizi-uiASz3Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] mm/swap: colocate page-cluster sysctl with swap readahead
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, 
	Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90866-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:wujianyue000@gmail.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:hannes@cmpxchg.org,m:david@kernel.org,m:mhocko@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[baohua@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,tencent.com,huaweicloud.com,gmail.com,redhat.com,lge.com,linux.dev,google.com,cmpxchg.org,infradead.org,suse.com,linux.alibaba.com,lwn.net,linuxfoundation.org,kvack.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baohua@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8E6663C04F

On Wed, Jun 3, 2026 at 9:05=E2=80=AFPM Jianyue Wu <wujianyue000@gmail.com> =
wrote:
>
> page_cluster and the vm.page-cluster sysctl are only used by swap-in
> readahead in swap_state.c. Move them out of swap.c together with
> swap_readahead_setup(), and make page_cluster static to that file.
>
> Rename swap_setup() while moving it as well. The helper is internal to
> MM and now only sets up swap readahead defaults and its sysctl hook, so
> the more specific name matches its reduced scope.
>
> swap_setup() previously lived in mm/swap.c, which is built
> unconditionally, so the vm.page-cluster sysctl was registered also on
> CONFIG_SWAP=3Dn kernels. swap_readahead_setup() is now a no-op stub when
> CONFIG_SWAP is disabled, so vm.page-cluster is no longer registered
> there. The knob only tunes swap-in readahead and had no effect without
> swap.
>
> Suggested-by: Baoquan He <bhe@redhat.com>
> Suggested-by: Barry Song <baohua@kernel.org>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>

