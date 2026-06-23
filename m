Return-Path: <linux-doc+bounces-93295-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DU0MA+nNOmqoHQgAu9opvQ
	(envelope-from <linux-doc+bounces-93295-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 20:18:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FF36B9689
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 20:18:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cswXgtWY;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93295-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93295-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0889D30398A3
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 18:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8276938E129;
	Tue, 23 Jun 2026 18:18:13 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A86030C17E
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 18:18:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782238693; cv=none; b=WjVFkwH18F/c3pUtrSEdu+Ll6AdUdqYaRf2jvG9d0qD1IkG/eB1mMamjv25sPR9GOWHptxarW3VomgegwAofXr6ZjmRa0Jn5V2ER+sAeh4G4wN0GJNTmbldJMtZTToGQ0VvB0jqyk7Q/znkCiYeeFz5NCxZ782A2p02gZuyOrlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782238693; c=relaxed/simple;
	bh=87z31hPKGzTKxQu8ZZU9xJKH8pc2SnNPjlKdrbpSvDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ov2vazEtI3SwQLcjKJNS5p9o9Os6QsKfYMvfaBiPG6pdjgPYv38siu8NF0exJC6Wimeqdb3uIU1bJtqAKdoNf7uxRPfB/9UzZ8hf2zkhgbL5valrhdZ+h3IIP+b1/eiBvxbHXjw0fxytzEYqLxoyECWVk+LNa2j5zxneCP10KD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cswXgtWY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7DF1F01558
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 18:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782238692;
	bh=HGo7jsa0z5bGAjnw8+UYFQWCBJbRAWPtpG1kEYRil0Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cswXgtWY0xG6YvKTRPM32z+O3mxYc3CAiwmLGtv/6mJyGgXtGV8sKegeFOWXOrR7H
	 Mt8CgyrUiha2MBWMnHiYRNh6PW6jpd7OK3unt/mAy2wWsq3V+PxL4V2thvztVCB0VX
	 gJJE//oVk7nXdB8Het/6fNwkqNfdD97Y/Co+OPuZ0NNEveij2hOzJbML4ZruZirQBM
	 7gdCkasqiJfzXhePaEEorhtZMijTPNFMmVrI9uKyATbeVslN2MnJfqaeoyoJ+qVyKo
	 4xEW1rycCV/1eLJEvyTgJIX5YoEJfHgwjqmDjyAhY+aBBGwmNMx9Uzn1SP04we0Fy8
	 iK66FCyiatALQ==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so222290a12.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 11:18:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9oWmrLZWb2EwW2C/urMsqwjqv+bKO/nJG2UvNnTMWyszU383xOd3yyLgyQjJViDu2w87F9MRX6+4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ19t6jA3hrnpmRsTuJgftGWLpSh5EmjSTcd0kxqJd6r3HSne+
	FgoCxwJciGVf5t6uCZuR930PWM8kXr87incAeqPe1ITM97CjarFNvHOtnfDxb6E866h2xPSyqnY
	RZrWuFlv5WXN+GXcfn1NSERjmvSQF97A=
X-Received: by 2002:a17:907:9628:b0:c0f:d987:444f with SMTP id
 a640c23a62f3a-c108ecf8d57mr247144966b.28.1782238691095; Tue, 23 Jun 2026
 11:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <20260618044857.69439-2-jiahao.kernel@gmail.com> <ajnB8IZrFZwbIr9P@google.com>
 <d0f05c35-457a-4b2c-6faa-7a83d4bdec01@gmail.com>
In-Reply-To: <d0f05c35-457a-4b2c-6faa-7a83d4bdec01@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 23 Jun 2026 11:17:58 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMgaqP=n6rmhnMU+qhp1Www1Y5kdbLTLX1v=fj_ybHyiw@mail.gmail.com>
X-Gm-Features: AVVi8CeWbi9xozE3IgWvakuBVZiX3iyiSg_u18BJ2jTIomReldLs6eE9A54a5PI
Message-ID: <CAO9r8zMgaqP=n6rmhnMU+qhp1Www1Y5kdbLTLX1v=fj_ybHyiw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] mm/zswap: Extend shrink_memcg() writeback capability
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93295-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61FF36B9689

> My initial thought was that if cold memory is evenly distributed across
> nodes and we are doing a large writeback, it would be better to balance
> the zswap entry writeback across all nodes rather than just draining
> node 0 first. However, since we currently lack a proper metric to
> represent hot/cold memory (such as age-based tracking), doing this
> probably doesn't make much sense right now.

Yeah let's start simple and go from there.

>
> So, perhaps we want something like this? Please correct me if I'm wrong.
>
> static long shrink_memcg(struct mem_cgroup *memcg,
>         unsigned long nr_to_scan)
> {
>    struct zswap_shrink_walk_arg walk_arg = {
>      .bytes_written = 0,
>      .encountered_page_in_swapcache = false,
>    };
>    unsigned long nr_remaining = nr_to_scan;
>    bool memcg_list_is_empty = true;
>    int nid;
>
>    if (!mem_cgroup_zswap_writeback_enabled(memcg))
>      return -ENOENT;
>
>    if (memcg && !mem_cgroup_online(memcg))
>      return -ENOENT;
>
>    for_each_node_state(nid, N_NORMAL_MEMORY) {
>      unsigned long nr_to_walk;
>
>      /*
>       * Cap the per-node scan by the current LRU length. A referenced
>       * entry is only rotated to the tail (second chance) and may be
>       * revisited within a single walk; without this cap those rotated
>       * entries could drain the shared scan budget on one node.
>       */

The comment here is a bit misleading. It's not just about draining one
node. One call to shrink_memcg() should only scan entries once. The
caller can then choose to scan the memcg again, or scan a different
one. In this case, the caller should iterate all memcgs first before
retrying memcgs again and reclaiming rotated entries.

>      nr_to_walk = min(nr_remaining,
>           list_lru_count_one(&zswap_list_lru, nid, memcg));
>      if (!nr_to_walk)
>        continue;
>      memcg_list_is_empty = false;
>
>      nr_remaining -= nr_to_walk;
>      list_lru_walk_one(&zswap_list_lru, nid, memcg,
>            &shrink_memcg_cb, &walk_arg, &nr_to_walk);
>      /* Return the unused share of the budget to the pool. */
>      nr_remaining += nr_to_walk;
>
>      /* Bail out once the whole scan budget has been spent. */

The comment is unnecessary.

>      if (!nr_remaining)
>        break;
>
>      cond_resched();

Did you observe a problem here or did you just add this due to an
abundance of caution?

>    }
>
>    if (memcg_list_is_empty)

Do we need memcg_list_is_empty? Can we just check if nr_remaining
matches nr_to_scan?

>      return -ENOENT;
>
>    return walk_arg.bytes_written;
> }
>
> Thanks,
> Hao

