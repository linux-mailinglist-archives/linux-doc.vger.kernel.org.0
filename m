Return-Path: <linux-doc+bounces-87873-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKZhMKukCGpVzQMAu9opvQ
	(envelope-from <linux-doc+bounces-87873-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 19:08:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5F455CC3D
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 19:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62D32300B9D5
	for <lists+linux-doc@lfdr.de>; Sat, 16 May 2026 17:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E0130EF63;
	Sat, 16 May 2026 17:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWcZta16"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4682381AF;
	Sat, 16 May 2026 17:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778951336; cv=none; b=ZuwAlP9OB7CWIz7SzTnOwj5L/JyLlVFZmFUnN2kphJzggnoYw7brXqlrYiz2t3w+AuELQ0nwZDYIdslSIb4jlHbbk3L+zBR2cGFcsOpEpQwwqN0QS8T46gXR6fj4S0QqrLQwOmdC9u8n9pI9M1YWsFf16oiBzdq20nH2LewNhNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778951336; c=relaxed/simple;
	bh=BKQDoDJsXC439gUolHkssDteieDPq4StZKKZEfqYp3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CCnHYTABooWNotkHd8BLXz6S4OcBILffsrzEk3pf6R0Afx7W/rPbouFVKxMxdu20UzVvndoGAIbEaapfwVgJb8/dlbwB67Haga2EX9+sf+Kg9w53Rg6skbFAGZdNNpEdtEN1GVNvPnOfPIKmn+Dp6gi0d1St9PiOqNxLy9MQ0KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWcZta16; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A25FC19425;
	Sat, 16 May 2026 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778951336;
	bh=BKQDoDJsXC439gUolHkssDteieDPq4StZKKZEfqYp3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gWcZta16u/92H3aK2QjZQO3xAoa+TkIkwQDbEdzLFkd9A9rMwW2BkF7ciNWSo5AnJ
	 X9RKfj4S+e5yCwow6MLU12oY5LI7ccmoLaNE13KqBuJ7eo/KQaPr7hz9N5++ho3GNC
	 Xj5mol82GI6pP3R7uY9zSTSNNuNOObOfYtwlmralmQtONdxvENwEb+tglaJXqmBIsd
	 tHGS96TH2F0jduPUeqUDG/y84G/WOo7QlXHEbe7/L//6sAhzJuCvE8xOfoRCu9VEBC
	 88jdSwOqwvius+kNtzcTeF2lvrt1T/QFqeox52dWdajzEBWPTBs5muYBjDexcluapy
	 KFPkCFkfwAqrg==
From: SeongJae Park <sj@kernel.org>
To: Cheesecake <cheesecake2960@icloud.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: fix typos in design.rst
Date: Sat, 16 May 2026 10:08:46 -0700
Message-ID: <20260516170847.146524-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260516093552.8404-1-cheesecake2960@icloud.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2A5F455CC3D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87873-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[icloud.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,icloud.com:email]
X-Rspamd-Action: no action

Hello Cheesecake,

Thank you for this patch!

For the consistency, let's use 'Docs/mm/damon/design:' as the prefix of the
subject.  E.g., Docs/mm/damon/design: fix three typos

On Sat, 16 May 2026 18:35:37 +0900 Cheesecake <cheesecake2960@icloud.com> wrote:

> L140: "unsinged" -> "unsigned"
> L371: "sampleing" -> "sampling"
> L387: "multipled" -> "multiplied"

Thank you for finding and fixing these!

> 
> Signed-off-by: Cheesecake <cheesecake2960@icloud.com>

Is Cheesecake your real name or known identity?  We don't allow anonymous
contributions [1], and mm community prefer to use real names.

[...]

The file changes look good.

Could you please send v2 of this patch with changed subject and the name (if
Cheesecake is not your real name or known identity)?

[1] https://docs.kernel.org/process/submitting-patches.html#developer-s-certificate-of-origin-1-1


Thanks,
SJ

