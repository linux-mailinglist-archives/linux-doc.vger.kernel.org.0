Return-Path: <linux-doc+bounces-93408-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yV0mFFYNPGo8jQgAu9opvQ
	(envelope-from <linux-doc+bounces-93408-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 19:01:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A68766C033B
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 19:01:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h2EM5shB;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93408-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93408-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5260C3003E9B
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 16:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65E133D6F7;
	Wed, 24 Jun 2026 16:57:40 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59956BB5B
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 16:57:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782320260; cv=none; b=SWKXamRdNXe0NkNHTu9o/0v/KDpqEVq3RsMXzTAXneBLJGykUfzy2s7oqZQS2rKUsq0Ch4fRlYlzADzcviYP8V9Erj+RzkLCaqslbdLQG1xEytZoW03DVzWEeBgbhqrjPY49lHxYQng+H60iO4kpkIQEdTC6wjLigsq8n5zyCP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782320260; c=relaxed/simple;
	bh=fOxQ4jE7u3TCnvFlOC2Ae6Pnm6PbYqfhCIaubSW8KQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pw+l+70MnHRWbIIfWR3LRMYSwEOnlJfucaCGK76LzjcoV5J729DmuBJ/Pbf8EWsIviRx1JNPznp6RjJzLPTt64DGqLyL4F7HRBLwaHGHSdZjyiAzJp3mfTA7flEXXcGORdC6nGZLEuyrrru3VcGlSlvi7yZerACx5Did0YLghV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2EM5shB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616411F00A3F
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 16:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782320259;
	bh=Pj+zfe+/Q0BE8fYRnsp9PT2NFlf9FSAYTLWiogZWvR4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h2EM5shBKdP3kHyvAcDlJcwpMMK7wevCutenACazD5lMtA7WiTsBSAdfwRfg2uO+W
	 A+UU/1/Oh502boIHFslmjDhIdw7ffNNktyq9NIgpoDhH/VcmkptIachTPSQPvRX05M
	 eFyaNMJ7lZoYWnmfURBMS2Hs1mHEiM2Oh/g4V3xLGOqe3zhAHvc+iUAZK55WMkf+5q
	 0eT/Bx6T3RFXMdf/GeRaNQNAECknJeqy9MqezDTyTUS0+v5d27ShNf94anTas16bn5
	 zPF5nAa7tv+PdhNHhbmkEW7T8U7vrxw/PbUe4mInTcA8Dc6hD6NMhqTOAnvPIAAo7y
	 muJ4A28LM0N4A==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c07ea058c1aso40490666b.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 09:57:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9UzeX1kp7BM4RNoI46+yWNrjp1GEuVmtqo0hmmWM3eoXRZazxVwazRjXko18LEwi8EgomkjNAGXj8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+om4cY9QrH/Mm+odeNUP2lYIfJi4W/8DbDbWQ4tNzTH+k4l0H
	k31pK8Xi0uW5oZXkfPlcbnCwvra/Pm83RzVhSZw+XuPB+NQUpIifNzTWZrwUctgO/F1PR+nx/9J
	3QDAK3xjphwhq2pBzmDM0BPariH0zuQ8=
X-Received: by 2002:a17:907:e110:b0:c11:f6cd:e120 with SMTP id
 a640c23a62f3a-c11f6cde17amr86990666b.25.1782320258297; Wed, 24 Jun 2026
 09:57:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
 <20260618044857.69439-2-jiahao.kernel@gmail.com> <ajnB8IZrFZwbIr9P@google.com>
 <d0f05c35-457a-4b2c-6faa-7a83d4bdec01@gmail.com> <CAO9r8zMgaqP=n6rmhnMU+qhp1Www1Y5kdbLTLX1v=fj_ybHyiw@mail.gmail.com>
 <057ea303-4c27-1a6e-08de-cce26c699097@gmail.com>
In-Reply-To: <057ea303-4c27-1a6e-08de-cce26c699097@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Wed, 24 Jun 2026 09:57:26 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMmnYkXocZ9Fb9DL_rdAHt5xtT_FLMxJD1bHcM3B4wTFw@mail.gmail.com>
X-Gm-Features: AVVi8CdkRvxUn8N-b2cW1L0eOPe_x3eeQiW3Dp7mX95Wjv4nFh_2RObAbBdbFR0
Message-ID: <CAO9r8zMmnYkXocZ9Fb9DL_rdAHt5xtT_FLMxJD1bHcM3B4wTFw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93408-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A68766C033B

>
> /*
>   * Scan up to @nr_to_scan pages across the per-node zswap LRUs of @memcg
>   * and write back the reclaimable ones.
>   *
>   * Since the second-chance algorithm rotates referenced entries to the
>   * LRU tail, the per-node scan is capped at the current LRU length so
>   * each entry is scanned at most once per call. It is up to the caller
>   * to handle retries, deciding whether to scan the next memcg to complete

Nit: "whether to scan another memcg to complete.."

>   * the full iteration, or to rescan the current memcg to drain its zswap
>   * entries.
>   *
>   * Return: The number of compressed bytes written back (>= 0), or -ENOENT
>   * if @memcg has writeback disabled, is a zombie cgroup, or has empty
>   * zswap LRUs.
>   */
> static long shrink_memcg(struct mem_cgroup *memcg, unsigned long nr_to_scan)
> {
>      struct zswap_shrink_walk_arg walk_arg = {
>          .bytes_written = 0,
>          .encountered_page_in_swapcache = false,
>      };
>      unsigned long nr_remaining = nr_to_scan;
>      int nid;
>
>      if (!mem_cgroup_zswap_writeback_enabled(memcg))
>          return -ENOENT;
>
>      /*
>       * Skip zombies because their LRUs are reparented and we would be
>       * reclaiming from the parent instead of the dead memcg.
>       */
>      if (memcg && !mem_cgroup_online(memcg))
>          return -ENOENT;
>
>      for_each_node_state(nid, N_NORMAL_MEMORY) {
>          unsigned long nr_to_walk;
>
>          /*
>           * Cap the walk at the current LRU length to ensure each entry is
>           * scanned at most once per call. Referenced entries are rotated
>           * to the tail for a second chance, and this bound prevents them
>           * from being revisited within a single call. Retries are left to
>           * the caller, which can choose to rescan the current memcg or
>           * move on to the next one.
>           */

Nit: Make this more concise since it's already explained above.

Otherwise this looks good to me, thank you!

>          nr_to_walk = min(nr_remaining,
>                   list_lru_count_one(&zswap_list_lru, nid, memcg));
>          if (!nr_to_walk)
>              continue;
>
>          nr_remaining -= nr_to_walk;
>          list_lru_walk_one(&zswap_list_lru, nid, memcg, &shrink_memcg_cb,
>                    &walk_arg, &nr_to_walk);
>          /* Return the unused share of the budget to the pool. */
>          nr_remaining += nr_to_walk;
>
>          if (!nr_remaining)
>              break;
>      }
>
>      /* Nothing was scanned: every LRU under @memcg was empty. */
>      if (nr_remaining == nr_to_scan)
>          return -ENOENT;
>
>      return walk_arg.bytes_written;
> }
>
>
> Thanks,
> Hao

