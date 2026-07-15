Return-Path: <linux-doc+bounces-96893-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ov7rMXUPV2oSEwEAu9opvQ
	(envelope-from <linux-doc+bounces-96893-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 06:41:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA5E75A7F2
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 06:41:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux-foundation.org header.s=korg header.b=W2reuqY6;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96893-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96893-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 951E1301B000
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 04:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D683B2FC0;
	Wed, 15 Jul 2026 04:41:24 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063493B42EB;
	Wed, 15 Jul 2026 04:41:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784090484; cv=none; b=iWnxjPOIVhQ1ijOIMPuoKrRTcQPPwJLrCe5s/AdwL4W77ACnwU0DsMlmilxI4KrFKtBVX3Pw4zcMFqmYsCtbiQnNoOBqFHEXF4MDDJkVpVjPVLgNf1H0G4F5/NUYeqUmU7fnb0foFPo1+iO2WqLTvMwWG9L3ZITtQBkME2on4p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784090484; c=relaxed/simple;
	bh=c84O1i+DMJAEkO1hCNo5FEK6WcGpoxdtxC6E0RCnP0I=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PUXDDy0iRd9Sc2XgDj5dGYzThhKzBOOp64aH8egKieYQhEAlB3iFg9X3VmCwzWi4fa4eXFdnvMEzsuYzW+Msrj13FOSzO7YQxXSzTOeUEpyBJ8gA4EF8CTuy5KAoNoJB1uTEtMGhZAkNyY0h9Fw00qT8Iqzd0sC9tXkm7KFtky4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W2reuqY6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6DD1F000E9;
	Wed, 15 Jul 2026 04:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1784090482;
	bh=VXT4Aj8D0nBxWmP7AWbFJoCX0BgnTx7n4mqxGFSGxfY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=W2reuqY69WB9XdpPaCi4jiKfr5TQa2U+kzxJO7K9J0f3qhx7/IjmjTrR6e5qJyFE8
	 rm7HTdJqCChCdcMmL5cSFb+G6XX9EssXM6dN8TNTHvIdwczwXpEatn9/1Nlwr7siTF
	 mNm3eenCcrMwaXPZvYdLTxgsfQk1ibJvQh/DbA9A=
Date: Tue, 14 Jul 2026 21:41:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nico Pache <npache@redhat.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 0/7] mm/khugepaged: several cleanups
Message-Id: <20260714214121.090238f5f0f318f8d82cbaa2@linux-foundation.org>
In-Reply-To: <20260715025941.1571316-1-npache@redhat.com>
References: <20260715025941.1571316-1-npache@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:npache@redhat.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:david@kernel.org,m:ljs@kernel.org,m:ziy@nvidia.com,m:baolin.wang@linux.alibaba.com,m:liam@infradead.org,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:usama.arif@linux.dev,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[linux-foundation.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-96893-lists,linux-doc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sashiko.dev:url,vger.kernel.org:from_smtp,linux-foundation.org:from_mime,linux-foundation.org:dkim,linux-foundation.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BA5E75A7F2

On Tue, 14 Jul 2026 20:59:29 -0600 Nico Pache <npache@redhat.com> wrote:

> The following changes stem from a number of reviews during my khugepaged
> mTHP support series [1]. Some of these are minor code cleanups, issues or
> reviews that we decided to deferred to a followup series, or in the case
> of the more major patch of the series, changes [2] Lance Yang attempted
> while my series was in-flight and we decided to wait till later to try.
> 
> The first 3 patches introduce helper functions to increase code reuse and
> readability. This includes a per-scan state clearing function, extracting
> the young page check into a helper, and a count_collapse_event() function
> to reduce a repetative pattern used across mTHP collapse.
> 
> The 4th patch was the byproduct of me throwing Claude at all the
> comments in khugepaged verifying and looking for any outdated info.
> 
> The 5th patch is based on Lance Yang's commit series [2] trying to extract
> the PTE state checking into a helper function. This required a bit of
> rewriting due to differences after mTHP collapse was introduced. I also
> took into account the changes requested during his patches review cycle.
> 
> The remaining 2 patches were review points during my mTHP series that we
> agreed can be deferred to a later series.
> 
> Thank you to those whos reviews and work I leveraged to achieve these
> cleanups.

Sashiko seems to have a good point about [5/7]:
	https://sashiko.dev/#/patchset/20260715025941.1571316-1-npache@redhat.com

