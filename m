Return-Path: <linux-doc+bounces-90768-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T7x7OVBNIGqz0gAAu9opvQ
	(envelope-from <linux-doc+bounces-90768-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 17:50:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CFE6396A2
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 17:50:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cmpxchg.org header.s=google header.b="PGuxVJr/";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90768-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90768-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=cmpxchg.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 724AB31B2427
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 15:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B62139937C;
	Wed,  3 Jun 2026 15:00:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1693CCFCA
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 15:00:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498818; cv=none; b=jGteD9sO92vrjpOlr78P249mD5kUbXEFXPsUB3SwCbr3rbqV7KQAIJtWbbA3LCANG+Mc//DeS/ozGwBi/0Si4qv3gf69ccZfQohnI517O+93cridBa/fkGMp57XBZO/smRpY3d+lDf3hdecGBKF7xn+9NQS2jnAcm1U03bIRuJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498818; c=relaxed/simple;
	bh=7avvJD037Pje5iEie+6YD1lXux4Fq1431pfDto1ugbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlT0zSXye/Xv01H54bD2zw4+rua5JU3Kj6iPKksNfazFxC4IHRlxquJP20y8fza0CJMOIEfPSVORqzDad1rv3enWkN5cRyIwdWmOiyhWlDb3bTXdpRrjTjs2DdoV/7afqJ7k59TToxygIPQyKUP+YdQ61nN3ebtIl9QKNsD5H0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=PGuxVJr/; arc=none smtp.client-ip=209.85.219.49
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8ce9df48e1bso36547186d6.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1780498816; x=1781103616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nvMHfiHYUP99FrIyQrPKXSaUDFV16/XdU6uT2nwNWZ0=;
        b=PGuxVJr/46eKO+QVvALARSwS0lriGwrPr/PIJN5wUud9RHcGodbi4ghbxd0y4bQvGS
         9tSQoI+21ICMDzMq/xlg7OxeszPJ60SIqZ79QVBwItPgKOaAGgcdljiQCDKqqcyq3Tdg
         XWwmyW4YczgssYkN3rO1A/c8UYwwGAPz4EiNRMABt6i4/0uqcxYGBOVyRUSt0jfYFesE
         2pEzSVWTDo5c5Ob3AqNfrH029D6vJIJMp+vH0aL6DUAVvkcbPiNbGx/iwQnVu1neFuyq
         dhy0+96a15jLQxDUs3e66JdItmht0olYC2ZpIsu7xBGi2cevs+p/4UH5AxO+E7t1/BNu
         PP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498816; x=1781103616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvMHfiHYUP99FrIyQrPKXSaUDFV16/XdU6uT2nwNWZ0=;
        b=PneULibaKB40jse+8v6PWow2g57uaQldXCRTrWOovAPghKz7huIaoWdpEhLjz/66x7
         ff3ORvE8hdAMVRNifegVd55t55hUCEL4a+QvpVfmKyoLiyvleI4ojjRSj2CKLsVCEKyB
         WBOqxOO6o0an2xwOu+edVUYitbThJgNm/Yz+Ip3HqXVsNCIkTs1tlUGiQn+MqhZFjhUq
         uf9XbN1bNPa80zngwIekDrz5aSe0aL6j91lNWcHqHI/QwbFey1+rqVQyAUkLlahc2VHs
         fyreWqC4zBiB6DWCnqgYnsKHS+KqMoBj4xlaxE/NvrID9WbCz5G10awuSATVgfregFD6
         pFGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VVSkovvi+md/vpap9PJUsnHHTpV5r+BI5n/tPoSD0iwdJ0g9e8xD4g/josBgm4uGNtQNKxbXe1+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPnjjIMICsxwZoktAeyQhIx4+wYuMOuUJVpmnoThn35jLWRy2R
	uvh57UoTnFMClcpu9B9XzeUKwehC4bMqF/GLc4q2ns1AmdWtaxSotTQSKoohMdAaz1o=
X-Gm-Gg: Acq92OF7EPHtWmIjsGM80IkK2KpB0Vbm6YBkMTT/cBwKVQ9Rx74SMpzFoAUAnMUhJpO
	jCU8NyaR2XyypD18ODphdm25NAsMzSJtZQWWqOSkUf0+7E7Tx+zLc7Srw+HjoavmZCvyTis5aCc
	oi1ebLOIfTU1dWGFwe2jbp40YkfHHA2qRoafv4IZPA0zPPJzMLvD3nHHWqruMmnBnzOI99p0ItH
	tNC76oGHfJK58YlVGQTLbiuOKWov7p4ovnGXqE4dC2ZjzJcS5KEy5Lc8cjI73bnZdPhoQf7RfFE
	7ZXWqTWXFH/IewiMeuPCE/XDEvURMK2ftR4RCgY9sJkrz67ItFXD/Nytb0BDGBe+ASouIJqyZQ/
	mxslsxTF/OU1guWKrMqsafbNM171jnctlD7u7+nzMvq1Q58/nxWzCDguClpGqKPURRwLE2JHLhO
	LpZVLKz3vC2krMNCAy2oxJ5YHp9joCk93k3EhAa3MB8fw=
X-Received: by 2002:a0c:ec03:0:b0:8ca:1cee:7c5a with SMTP id 6a1803df08f44-8cecdc329ccmr45124016d6.12.1780498815694;
        Wed, 03 Jun 2026 08:00:15 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecc8222bcsm22979756d6.0.2026.06.03.08.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:00:15 -0700 (PDT)
Date: Wed, 3 Jun 2026 11:00:14 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Jianyue Wu <wujianyue000@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
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
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] mm: move reclaim-internal declarations out of
 swap.h
Message-ID: <aiBBfh_lR2AUHidk@cmpxchg.org>
References: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-0-ce0219e100d9@gmail.com>
 <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-3-ce0219e100d9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-3-ce0219e100d9@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cmpxchg.org,none];
	R_DKIM_ALLOW(-0.20)[cmpxchg.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90768-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wujianyue000@gmail.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:david@kernel.org,m:mhocko@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:hughd@google.com,m:baolin.wang@linux.alibaba.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[hannes@cmpxchg.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,tencent.com,huaweicloud.com,gmail.com,redhat.com,lge.com,linux.dev,google.com,infradead.org,suse.com,linux.alibaba.com,lwn.net,linuxfoundation.org,kvack.org,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,cmpxchg.org:mid,cmpxchg.org:dkim,cmpxchg.org:from_mime,cmpxchg.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5CFE6396A2

On Wed, Jun 03, 2026 at 09:05:34PM +0800, Jianyue Wu wrote:
> Keep include/linux/swap.h focused on swap-facing interfaces by moving
> MM-internal reclaim and workingset declarations into mm/internal.h.
> 
> Leave the small set of LRU helper declarations that are used outside mm/
> in swap.h so this cleanup does not need a new public header under
> include/linux/.
> 
> Suggested-by: Barry Song <baohua@kernel.org>
> Suggested-by: Baoquan He <bhe@redhat.com>
> Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>

Nice cleanup, LGTM.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>

