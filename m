Return-Path: <linux-doc+bounces-94202-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pv59EsbwQ2qRlwoAu9opvQ
	(envelope-from <linux-doc+bounces-94202-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 18:37:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB696E6855
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 18:37:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cmpxchg.org header.s=google header.b=khLiWr43;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94202-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94202-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=cmpxchg.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C884C3000529
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 16:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C29D1427A;
	Tue, 30 Jun 2026 16:34:53 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BDF3B3BF7
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 16:34:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837292; cv=none; b=dNUOZfvDlwq9iReDs1HXc5taL8DTXnKdgAomaMA98M+q5qpYiPU3uNbQbOGaLQOxLF0UHLUYLr18/T3nJ9DRTUdFW3TwgRwjpgKAD0qj2fuC6J9qhK9+qY3roEpt1kuztkUKAmdB7aSSkPiaXZeRChNHtjHZwgSy21qp75QMrY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837292; c=relaxed/simple;
	bh=An8LAuAebhAilZhop/a0/z/TNrwidNc5UkozEG2D6Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O23VHvcZOsHh/AZo92rr0l0uC2fA8YeuiAE3eaH+pCFFbvxA55AMhMIH2cgWycEioNSRoFG3mpFNJsSWTuc9gD/LL3mg0pH6C2ctI2SWH1jNzfNJFx/wynPpx8x5ThqzYwTJyA8UAxMUG7lNyJVCfaNsTEvyq8mDxDFsvK3PXP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=khLiWr43; arc=none smtp.client-ip=209.85.222.174
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e6a434cabso54498385a.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 09:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1782837290; x=1783442090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F3vzLp53JrizIZ8vRPTNfFVJq97fTRHFgjl0sdoikIw=;
        b=khLiWr43a99ZzKZSus27qjuZh+h7yDjTgeMAs4VNvOi+tbZnYQuEgNp8rY9hPdvyYH
         K1URXys8Xpkg8DcPnXZ6DUANLvwxP1XZZUbj0vUkWcBMVeKnLwFpz2Z/RAKF+QBqRcmS
         bgY5AKPRRUZwcnSW2vqylqdroshZcsbCU5YnE6IM1nIcArRimpC+d+XEcE34ptnw6xD9
         TRV+aFWewuxykwLJvJ0NZmoBMKWG5rMnzEKE3A7C/KwY7u4m9x6XSV4aWU7fNtq9JsHr
         rp3Ht7ThAeapoKQXKU3JLADmS59pWrJo31moZVx1GBqPAPElnTO3UJlUfi37RPwmFi91
         qZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782837290; x=1783442090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3vzLp53JrizIZ8vRPTNfFVJq97fTRHFgjl0sdoikIw=;
        b=nfhgh+qQA4uJLAHZu2c66H/4Fr9Onc1L0OlkcxObEeTGiGD9xZJ5/jUtlzCTLOMX6N
         q5dPGmGn5mbdbGVqh/L9po9vYinzdAgE8QgHR5ofZE0H+027KQwCioLiLNGtLrXtCgLV
         ux++pMensDLw3GNBP2nkUpMcsoHAYvE6GITQMYcrPSFa8+QZwVUXRkQRGzNB9tEChQRA
         Ryjwj9Qzd5VuC7IjsLxwSHpRPtnBBgQI444f1MnGOCF8t0dds3QygPf7D1zt67pNf7Ck
         jQBIznQL3bJ2RAKuEVDp5nFoexR22wjT90kJ1ws7kbPB3rkm5bEfBKkUBgPkzdRqNDTP
         Bp6Q==
X-Forwarded-Encrypted: i=1; AFNElJ83u2YBckJ48sWLhP7fvTzd+hZMkyAgbAGS5C/IHP50uSw9NvFE/AW+0QPHTUBDaIEukLXbH6/DiUE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn5aqBFspJ+a8LR7fi6+BdxJ4J1mpzm0KdoWEob151nlGHWp2P
	l18potSTslXyZ+42SNDxXgm/+ID7fQcMBLetFh5AzLdxJJvwO7jfss6yxWnIel5vcJI=
X-Gm-Gg: AfdE7cnFE/wBmdyfpQ4jMIi9JvuRGYdWuXdCQravezj9KPprbAU6HrD4srKgK0WEMKt
	9LOwHSnrV/t9Nq4YEhoy1PdAWCTIAq6BtGhFZaIZJVD2z9kPLSb8dgeNloNsR+qbQtv+gGq3HJG
	LBTUsNt19ZFc1zwIqh41aeOJwzLFUAFWVaye5UD1mxiBLAj3cX2//2DIzKPgExT83khXWyZE2br
	i1HZ2WlKob8gWQqO/1RmJsFmvQzVObdNw2Sa8T3luTeG7bcjFofouzGxB1XaR88AkoynxX7JWC1
	2I0TimhzmXnGaLnRfK+9HWIv3g5DlGQ3FeHlkq7Y/V1mgk2Vj1bD/c+rDitIiRxb0Hs/6UwIJT4
	vEP7FQ1B5c1VPM7f+9iGlORRND31+XFTxpBn1CxTjZI6k6Fhzomq9lH9NGFQJQheXQFOAYLlfm1
	8RUNL5s+exOxg=
X-Received: by 2002:a05:620a:2b9b:b0:925:4655:a89b with SMTP id af79cd13be357-92e625f7147mr682887885a.27.1782837289779;
        Tue, 30 Jun 2026 09:34:49 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e6213bc41sm273914985a.6.2026.06.30.09.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:34:49 -0700 (PDT)
Date: Tue, 30 Jun 2026 12:34:48 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 1/3] mm/swap: colocate page-cluster sysctl with swap
 readahead
Message-ID: <akPwKK22ahROxDqL@cmpxchg.org>
References: <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-0-d4f648963382@gmail.com>
 <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-1-d4f648963382@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-ch-swap-series-plus-folio-lru-cleanup-v6-1-d4f648963382@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cmpxchg.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[cmpxchg.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94202-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wujianyue000@gmail.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:david@kernel.org,m:mhocko@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:baoquan.he@linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[hannes@cmpxchg.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,tencent.com,huaweicloud.com,gmail.com,lge.com,linux.dev,google.com,infradead.org,suse.com,linux.alibaba.com,lwn.net,linuxfoundation.org,kvack.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hannes@cmpxchg.org,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[cmpxchg.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,cmpxchg.org:dkim,cmpxchg.org:email,cmpxchg.org:mid,cmpxchg.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ABB696E6855

On Wed, Jul 01, 2026 at 12:27:32AM +0800, Jianyue Wu wrote:
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
> CONFIG_SWAP=n kernels. swap_readahead_setup() is now a no-op stub when
> CONFIG_SWAP is disabled, so vm.page-cluster is no longer registered
> there. The knob only tunes swap-in readahead and had no effect without
> swap.
> 
> Suggested-by: Baoquan He <bhe@redhat.com>
> Suggested-by: Barry Song <baohua@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>

Btw, I suggested this:

https://lore.kernel.org/all/adUTC-7iyOAUlhR7@cmpxchg.org/

