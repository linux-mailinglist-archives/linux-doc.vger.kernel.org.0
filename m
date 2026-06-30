Return-Path: <linux-doc+bounces-94115-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id htbxF6QaQ2okQgoAu9opvQ
	(envelope-from <linux-doc+bounces-94115-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 03:23:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C3F6DF965
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 03:23:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=H66ceZmR;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94115-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94115-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1FD93018404
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 01:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31097271443;
	Tue, 30 Jun 2026 01:23:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BB63655D1
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 01:23:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782782624; cv=pass; b=gwUjsV9sxq4jOMLeqVYPkGMW+RZxDz36e0pH/8/lymM18kMj5kUoU9UbX9rnd6rMM/s6aQus5EIRtJ6u3TgQ5HgGM/Q9dA/UmZfK9STchID319Ny5TrqNXBSyjC2MoAhDTEFx/X6SwZJN8fGDnezWJ1e3pWaFwqVKtOFNN6ZcSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782782624; c=relaxed/simple;
	bh=wURpcLf4eszAJe3G/BFPxkcBdX382Pesu8s52a2oliQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ey+5OtTl7Hu67QwbRjw3KI5F24fXPBeKAyoLUSVvBQwL5vX0/L0uS/i7R6pw28Hu5mjeAxqNfjWeJsTIMLwf6LwWaB1s4VFrLKks/sDGzKWonyfdpMt1iZuJ0vwociGeQRzNuQlbARB1KKSGRGKa6PqP75PMN1KJlvLv8q5xDa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H66ceZmR; arc=pass smtp.client-ip=209.85.167.51
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aea0fff535so4014521e87.3
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 18:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782782613; cv=none;
        d=google.com; s=arc-20260327;
        b=hfCMFpNrqQZMNtCnCdBBnvgCmDZeZgl+NBw5iluIGxfTKcg5IqWotPYSbikFyf2Lab
         QZNfSOvgtWK3VwDHX9pI7Ldfn4elujoIg/F2fW8067MeexL5ZExCISyxHviqDFCuDaTo
         9B4P7FcTVRnB6CScQHGFBdTeD1C+6DqNQGtzSwCHudMAHQ9gzc9zMT7j4ywEbGihhE/I
         490LIUIryS1fvSIPoDaZ4otygXAwmwMpJpVdP6mAvc0InE1FOzVTLmcMjBvvLGK+1R+A
         pMQwbyaqpVFq48HInHs2Xwqacebs06XCJdoFWH+TTL1tK0LSrehRePPa2YJA15fC5Iof
         RN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=46A0ohYojyMmQy0oBsGSx+Y/V4MLJFoEQLBGXRE8WBM=;
        fh=z+Vwf5dWFmM5Su1DcSbGIWTo3UZTSOFkzqGt4cMXd3Y=;
        b=ma6Zjl86/QD+HtFR5Cr38huf4pxRn/Nhko4+q9tLCM7Z/ljw/2s1NuDKeOfUp+CSYP
         iBaU7eQKDdfzi1he6ZheSo2LASwlK8XIN1abIgkyN/Eaw3NQ1MrWQj3+r4i2yxdS3r1n
         MRIReo0M2INaZ0y2nVEIM02+9bDQ6Xzi/SY4ETwFwlxlcDHcYvv1HvyqNj3oTzS8dN4p
         QxfwcPnWFOiS+GUrkzhkX9mlgd/FiOBeIIz9egRt8O0FdPj2CoBgh/3OruyKuNLWQKKB
         qdWhPNrwFPWyJAd1ktIDukVaYCK5RGvRth/6tNw9eQAMS2vYcNQA1UcpxTbqIy8VJOYm
         /S6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782782613; x=1783387413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46A0ohYojyMmQy0oBsGSx+Y/V4MLJFoEQLBGXRE8WBM=;
        b=H66ceZmR6pKh92DqzIYExQWwtGuVD03eP1hRjGet9DD9n3hIhN4F0iusbhoVAQaDwq
         o5ctM0W9DLqz90OXoZseZmnZGJfqtTPnSE61WH0rBGJtT/ivYUd26hbIXmGUhbTmfJdL
         D8xJEf2vWWcCUSJdETii3xyfqhSauIQZHOQMWpul5yPnuRBJNff+g3lcvIytoZK3SX4q
         6XvsLMPTf4z3PgaDdi9doD5jiHCSJYCdd1fOr8u71+/YXgvZKi5nPAyytftIsGD3Tr3K
         SzAvYR8CbFvxDHLDrfp7SP3k/wBAf44umavFTDQo4jFOyIF5uDjbOkLgWTsqqePocbMs
         KsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782782613; x=1783387413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=46A0ohYojyMmQy0oBsGSx+Y/V4MLJFoEQLBGXRE8WBM=;
        b=YZPUUVD7e39YhN/zBiE1kR3ViH81GeyS3FeluHgXjlf6qLKSORiISMT2xvMeNKv4CQ
         XU72qKRsfREkj6R7vCRvwEBGp/HD9YVrcxOWCLMWgdQzSHmdp0NmSCFNYACzmHJQml/I
         HNoZZSU4Oi8RaZ9eL70uFtjDekT+3fmVxfrupFnasCU83WPZDMGgYTRPhoVtNuq5S0zL
         VnkV4o214pK6lQf0xn8N9moKxbAtPGBdOSqO9tGa53eFRjMJ3B9PiRLtMmkefJVwc5Xv
         3x8vmtKl/wDsNbnm/8nUb4ighei4eLAfrTM0i1SXS1mN50Mq1/e3qdRBpGF77l+PYrl2
         S9kA==
X-Forwarded-Encrypted: i=1; AHgh+RobC/28sJuAGjrqY1hyS/4CibHFd6ux2IZ0yY2XKQW5ozSyoSHmf8uK+txGAdlhgKJnngfTjeIHgwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSl8v8i6QHLZ/nE3x1ImjlQL2/xqAOhSH9gE+G9Pzrz/hW4v6+
	ca6ER+/b/0LpHSIDuY8McyAfJ+d3YE8mnnbs3Z0IJeG+bccoDgOpVxWWOeJrHDX8mj2acD29Dk3
	Fide6NJ3qRZ1Z0PEEipEbw0kdmiYQvDY=
X-Gm-Gg: AfdE7cl4IhjQCxcbpz/TnXs4ybjkR3TuZribnuIK6NgRrbUEhUtb//PYnX1wV5TfWmV
	OV00ujO5ALfhbbmMCn9o6wro0mouDIIeJoc+vYVIxp6d8ufXvJ1F0EthUNOESd9zgjX0HXxYv1I
	iTz2vsuz01NvHCC5T7Y1fNwm0Wp6oo4ASGrIv9bnlmCSBW2pJxND7bSSh0frx1WydoQpIohbayr
	oO5bx3Hx/pnXm8PhUd+sRaMQEnLJZEfyNi47duZF+DR4+IVQ+WUMKkpb6czmiQJl8dJNEBRHuag
	WQWfbdf2Oz/wQ0tMhuMjCHUJfA==
X-Received: by 2002:a19:f00d:0:b0:5ae:ba28:a56e with SMTP id
 2adb3069b0e04-5aebdbc9aeemr208126e87.35.1782782612898; Mon, 29 Jun 2026
 18:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630-ch-swap-series-plus-folio-lru-cleanup-v5-0-4627aba8ed1e@gmail.com>
 <20260630-ch-swap-series-plus-folio-lru-cleanup-v5-2-4627aba8ed1e@gmail.com> <akMX9hoSgBmulBzv@casper.infradead.org>
In-Reply-To: <akMX9hoSgBmulBzv@casper.infradead.org>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Tue, 30 Jun 2026 09:23:20 +0800
X-Gm-Features: AVVi8Cedsz-VebzwdsD-jm8opqU7__wn8vihfYFrkRMOKiwHn1ix3nY7PfwlmWE
Message-ID: <CAJxJ_ji9i-Mi0tAwiM9hwpSr4Y=hwZg69P-RHo2y1H3YgQLYkg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] mm: rename swap.c to folio_lru.c
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94115-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,infradead.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9C3F6DF965

On Tue, Jun 30, 2026 at 9:12=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Tue, Jun 30, 2026 at 09:08:18AM +0800, Jianyue Wu wrote:
> > Rename mm/swap.c to mm/folio_lru.c so the filename better matches
> > the code's main responsibility.
>
> I said I didn't want this.  Rename it to folio.c instead, and then we
> can move some other things there too.

Thanks Matthew. Will rename it to mm/folio.c in v6.

Best regards,
Jianyue Wu

