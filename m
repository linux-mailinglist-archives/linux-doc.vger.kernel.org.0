Return-Path: <linux-doc+bounces-84983-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKVFETfR8GnDYwEAu9opvQ
	(envelope-from <linux-doc+bounces-84983-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 17:24:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C63487C42
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 17:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C1641301787C
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 15:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FD13B0ADA;
	Tue, 28 Apr 2026 15:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSMNQjLt"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F008E3AEF20;
	Tue, 28 Apr 2026 15:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777389876; cv=none; b=Qjbn5RuNxHV0aJ4kGvnnaYu2cseNdhEe+qNn1y9ewaQQDh8fEWRfwgxa05cFpRyW/EMTKnSB4Hwo5zaeU4YB/Gj3QTa/w4igUj5HwlWbawA0/L1uJvJF5e7LnHfaxbPD0CzK+5FWAbxTEihVwIctStvpBQjqY+a9VXHpvstIdDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777389876; c=relaxed/simple;
	bh=fr/tHmzNTkk/OXH8pUHVXJSnE5ydLpCRkC0pcGdssWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k8VU2ETBJYg+Hq1fhWgShjQuLlsHCDqJwffhPnI8CY2Y1TGOYpgX6r79fHayiBMQKXEQk3nhkdagultECyU1n8kHc8DNNSsLvWagvC31ODA+F9oZTBfjQYIrR75OjyHKltWhyHwO1w8WQ4TQJfY0rDc2rrn5xy51ZM+N/9LAv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSMNQjLt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4ABCC2BCAF;
	Tue, 28 Apr 2026 15:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777389875;
	bh=fr/tHmzNTkk/OXH8pUHVXJSnE5ydLpCRkC0pcGdssWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tSMNQjLtSoXFNyCgm2wvc8eGNOP4NeBV9NZcV/XrVIib6Z9f8/tfJffjfvB8sKFYd
	 STyJPHytDTqo1Bt/xjBXWzeAZji45aqvCmQn5M56VtflBesWmRin5y6bnruoqXyoEy
	 JJ1k8sMu0B56WF7UhBV6Z01OcL1blMBFkEskJFuf1d0T4cTRwmbrp9/TPb51BrDLy3
	 tsyH2PsD6PmXnuEGfX5L1Wg08A9dgX55HtjWkyynMyrURPWbUvvLi7/V0MeEdwgL/P
	 TdBR581p0YYiVJFnF7NPa85gd59pXY9iy+HtLNi4WRNn8ZvU57TxmoeDYzVIsXTcgI
	 q5k9YALgCwVWA==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@davidgow.net>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	damon@lists.linux.dev,
	kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 00/11] mm/damon: introduce DAMOS failed region quota charge ratio
Date: Tue, 28 Apr 2026 08:24:24 -0700
Message-ID: <20260428152424.125760-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260428074837.5fb02e0210ebabf160506a80@linux-foundation.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C3C63487C42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84983-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email,linux.dev:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hello Andrew,

On Tue, 28 Apr 2026 07:48:37 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Mon, 27 Apr 2026 18:33:49 -0700 SeongJae Park <sj@kernel.org> wrote:
> 
> > TL; DR: Let users set different DAMOS quota charge ratios for DAMOS
> > action failed regions, for deterministic and consistent DAMOS action
> > progress.
> 
> Add, thanks.
> 
> As mentioned provately, Sashiko claims to have found things which it
> didn't see in the RFC.
> 
> 	https://sashiko.dev/#/patchset/20260428013402.115171-1-sj@kernel.org

TL; DR: I find no blocker for this patch series from the Sashiko reviews.

Now sashiko replies its reviews for DAMON patches to authors and
damon@lists.linux.dev.  So I replied [1,2,3] my review of the reviews to those
on damon@lists.linux.dev mailing list.  As I mentioned on the TL;DR, I find no
blocker for this series.

And I think you didn't see those because those are sent to only authors and
damon@lists.linux.dev.

I nowadays reply-all to original recipients only if Sashiko found a blocker.  I
will also add short notice for non-RFC patches if Sashiko found zero issue.
Let me know if you want a different approach.

If it helps, maybe I can also ask Sashiko to send the DAMON patch review mails
to you together.  Let me know if you want that.

[1] https://lore.kernel.org/20260428032324.115663-1-sj@kernel.org
[2] https://lore.kernel.org/20260428033833.115866-1-sj@kernel.org
[3] https://lore.kernel.org/20260428034139.115984-1-sj@kernel.org


Thanks,
SJ

