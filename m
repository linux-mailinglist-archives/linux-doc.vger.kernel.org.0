Return-Path: <linux-doc+bounces-94320-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ABnjOFHuRGrA3QoAu9opvQ
	(envelope-from <linux-doc+bounces-94320-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 12:39:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D94306EC416
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 12:39:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QrL8q1uV;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94320-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94320-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE0CA304844C
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 10:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0C33FF1A9;
	Wed,  1 Jul 2026 10:30:40 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADA141C2E7
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 10:30:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782901840; cv=pass; b=PM3s7rr8C441n1XNoOc00srIa4d45jfwJe1yLyqYQkBDqOl/pnLvQijLpceb12jIMcyVGIqz6rwyl/xoyMaXWphXogzpfO21yPmQ/ENUfNDCAbNoaT19smSfL2x1/sYLohh0VPUEESuqS4GEyl0AcovKeHLMxmtVZw9X9/eIe8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782901840; c=relaxed/simple;
	bh=wrW+mCsfq4LaynKFg1P1KAG6cLXEflZEICLLCJkk+60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QxKExFaEhBuSoRJA12Pi9ow8c0kaKw2HEooB9OQksJFXVdfddXwEsiZP3p7OO9gQDB/pLT1ifEC3B0ckXJiMAATMQpvym0D3bm3LqlEruONSQOWNDUuc2ApDSTRbcxv/IrOBWmh45WPYCOGXPp4idZd0cB+VXCrZjo33P7j7A2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrL8q1uV; arc=pass smtp.client-ip=209.85.167.51
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb91c003eso468917e87.3
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 03:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782901831; cv=none;
        d=google.com; s=arc-20260327;
        b=eyxiKsaWbvFB9YAyvOvexgIhTgpQkhLDpXNh9fC2R2xJlxh/0uxBeZkUkrvLHDhoxd
         z0jsz38AbTTjGv5E9TWm0XHzXEs7wQQV5bx3Dic5JtG7g3QKwYgEu8nbooNiPPlEO+8L
         N7ZHx7z7Fs0bQnoLL6Qr6OMmLV6aerjW3ysvMCaYCaKywJdaeKISE0fQ/DpQNR+bmREz
         S298jzf1H4AYbHCCCklrsv4UHUQ1nYORuLg7PmcDVJGLPS3iRqWvazCsakR4lLiuRD5q
         1sKCTG48XsbuxgA0joEBWj8tF/3k+2KGDHd7BkrBdBpNZu4I/NbUgDzooewoj2DQEt5D
         44GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xA5qwJQ5ZOB9PrEYWpKUaKUpyF3b4ancjvRigQCLEfE=;
        fh=uw8hBOmxZNosJF7hsBUh4sPDn8r4+GMo4gN616xRA4Q=;
        b=saF0+GxvkWF0Rge0WiIUyBo694Q8L3lDZ/rXXkcDfT6GhI8QoU86nUwM05tXROrgSs
         fp23iqiqoDM1xWNSRDWusxa+ffcv6r/3mY25sCWWZGvHdZiKrEpjIBmA2q7OrWImQMlB
         x+RrmMo7RPCA+6JO5fvLVAzjZwiQGCvOe85ArWltKXPHc9mofgUk/wCsQym55st5PULA
         mCyTY3qOOT/4Zdhf0t4+/4xCpzDbFn/5EY6ger1b63739PVQvkRaFy9y+gNZrx/4RKo9
         Mu+Rxzk3labUVxRTyKJ84D9M0Vcvorkw+oJYoJW8ckrhE6+mOslt+n28NK9uZJ586wZ/
         XyfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782901831; x=1783506631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xA5qwJQ5ZOB9PrEYWpKUaKUpyF3b4ancjvRigQCLEfE=;
        b=QrL8q1uVbGLLQoWZCwGewtC9ew8zosd7jNjRcsBfKo5XxZPG0zREwMqKaeBJw/75A6
         RXBn5oIf4IYKe5yMjobJStalbZmS7lmVz8jNuCFknR7z16OEVq0hoJv3fVgjcQeTBKZY
         lnByOYLA9dp5MkAtcAbk5n8u3yU0sXJafo1zjWH9FHYLYIrfHWvYc6rl5/k1zXwmUI61
         NQBVJ7Yw/YmC5bB8fiGQpJXTX8OPjY1ekQR3aqqV+jwuu8884MVBp4+l7HxqmpKiSplR
         D6Ln6XVkR2Au4Ji90IVwES4LlOblInkANYxJN9AY9ooLifWEfRq6tLM8c2TvILv52GQz
         kRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782901831; x=1783506631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xA5qwJQ5ZOB9PrEYWpKUaKUpyF3b4ancjvRigQCLEfE=;
        b=cN8JOyIviPj3lmIvQ9dCHmpmdaVCAwcJRzQy1e4gYUf5XQxTXkENlMnEjG/iDExoA9
         cj/qEjtrk9TicSV1Y4X+d19M9zYbTtRi7uoTRC8o0RdX6HN/IMypjw/StJnh8QiBg3E7
         XSu0k+B9PU3UAOo8wWoEvueAhgS3b2WUl5Ne/eJMYg33M7XLkSwVJ4JvosNbIox5C4/Z
         Dm0fD1oOtrtR9Hlil2YCsnonU/ryJmrKFGr8Z95QjNt1VnxnntTQQB4w9LaDpza0yFJM
         5lZanANrGyCWppPEvInhK5x6uXOjmAzCtUqC5mo4GCWlh+SIvsK/QZM8gXAkmAZ/F2gE
         qWWA==
X-Forwarded-Encrypted: i=1; AHgh+RpEX33XCGFPZWaBXp0VXs0TkPXt01O6J4g8PIEMtgA/XZLSGhj+NV45kWLofwld54T4m3NONwQLdGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTIrHYtQKh3+lIa/LXUcB8y+t9ZfHRe+8hxEC/RtN1Kjc8Ct+i
	EG8+hYTbarbvSJ44hXQHR6B/wc/QDraVlVXzJKzEb2KSXu7e4v3Km/Y5P9QNyHywr7w2RCIObK/
	srdExvMAGMxJsH3C3wHviN7765tJPqDk=
X-Gm-Gg: AfdE7cmnB4PIsoU1Syy+XFJ5VXuGOqPZ2S9/9Cq3LxQh8zw5EgOANw31eAYkjHHhf+o
	43lrfgr02yXUS8lL7dWfM6fz9XCWoyMTLXy/hiWdDsBsfgNwaHDDp6iQeR7cfTGLOf9lyLRvpJI
	r94lD5edvY2YlpvYyOR7uqtZLfCqCmJlUtl7qnFeFgGvz7KaiejeMec8dHwfAq3sA6JUGV9byvF
	fZt1hT3LrJuB0j4h/grRFZPWxLF3oukHnftVwBc3b5Kswuuh8wuEHVp27Xa5AmNKrUUwE/i9oX4
	DFxrzsIu0BIgdvb3lYgl9Y5BiA==
X-Received: by 2002:a05:6512:630f:b0:5ae:b270:505e with SMTP id
 2adb3069b0e04-5aec67973e3mr225140e87.1.1782901830996; Wed, 01 Jul 2026
 03:30:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-0-d4f648963382@gmail.com>
 <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-2-d4f648963382@gmail.com> <akQOmJOy1TYrhlq5@casper.infradead.org>
In-Reply-To: <akQOmJOy1TYrhlq5@casper.infradead.org>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 1 Jul 2026 18:30:18 +0800
X-Gm-Features: AVVi8CdEKckBCl7bwZrAts0Mp322Jz5dOoJByytnqbXcKin9G8KQmplLTfNe_BE
Message-ID: <CAJxJ_jhaxah3WzjO6+hF9XFY_ffPjHRw_RjoOQFTY+3ZAs7qcA@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] mm: rename swap.c to folio.c
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94320-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:hannes@cmpxchg.org,m:david@kernel.org,m:mhocko@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:baoquan.he@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wujianyue000@gmail.com,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,tencent.com,huaweicloud.com,gmail.com,lge.com,linux.dev,google.com,cmpxchg.org,infradead.org,suse.com,linux.alibaba.com,lwn.net,linuxfoundation.org,kvack.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wujianyue000@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D94306EC416

On Wed, Jul 1, 2026 at 2:44=E2=80=AFAM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Wed, Jul 01, 2026 at 12:27:33AM +0800, Jianyue Wu wrote:
> > @@ -17057,7 +17057,6 @@ F:    include/linux/swap.h
> >  F:   include/linux/swapfile.h
> >  F:   include/linux/swapops.h
> >  F:   mm/page_io.c
> > -F:   mm/swap.c
> >  F:   mm/swap.h
> >  F:   mm/swap_table.h
> >  F:   mm/swap_state.c
>
> I would argue that folio.c is now not part of the "MEMORY MANAGEMENT -
> SWAP" responsibility.  Agree that it's part of the LRU maintainership
> still.
>

Hello Matthew,

Thanks. Agreed. mm/folio.c is LRU-only now, so it stays under MGLRU and
not under SWAP.

