Return-Path: <linux-doc+bounces-74781-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZoizCfBdfmkjXwIAu9opvQ
	(envelope-from <linux-doc+bounces-74781-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 31 Jan 2026 20:54:24 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9A8C3BDE
	for <lists+linux-doc@lfdr.de>; Sat, 31 Jan 2026 20:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A25C5300FEF8
	for <lists+linux-doc@lfdr.de>; Sat, 31 Jan 2026 19:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613E236BCEC;
	Sat, 31 Jan 2026 19:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmUnRFIC"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376962D063E;
	Sat, 31 Jan 2026 19:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769889259; cv=none; b=f95hX2xnxe677cqNjfvG5BL7P1BlmJgMhpA5zn5X0pNh7rBKPIFQ/V/lt2U6JTltkohR03NO478YuciiSu5i08Rgp7IodppO4OEAvqlh3fawDO14X8SMGHJ8fE0TT/tGtys8MyFvdd7Dccmh0CIgOpm+SbLRFhe7a3NVtt+4wIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769889259; c=relaxed/simple;
	bh=N8vKGMyccUxrYrqp4qY0jWMxA5NCQ/73rs9xDcCS5Y4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mA/hULdMYD7gjHs2TaxInNlkp2snC7M86O5D9Vx4HPwbgb+bn685SzTqAGs/Ho95+Dh0BKYgyNGzEbbElURY89utKTribttm7kKn7TaTZ/l1mC7Z3n0qiSNJmXc1gaf4sdlj1yrQ7ReXm/oM8gNmsTT+U+rpJ6hi+5wpri4rvLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmUnRFIC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E10C4CEF1;
	Sat, 31 Jan 2026 19:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769889258;
	bh=N8vKGMyccUxrYrqp4qY0jWMxA5NCQ/73rs9xDcCS5Y4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pmUnRFIChWDWwhJxLVO7VzYaEr21cBFNt5vFZXdhn4hObmhuEZeGNgIE2xBQtHO7Y
	 d5ZZJ7TXwa7VPq234F5zPHdhKgUlTj0F+0IB6tVM5myIW687yeM9UYiF/m32ANpAEP
	 i+RYt6T6RcWdWDvIexlbj83YEY+wcLLYzL3yzOtv+U3B0xbla+LlXYGAaZmdpplDyS
	 z3qmrmg1fjO0e5X3z3s4NyZEP6dff+b6jLa6wJBKD1rm5QpzIqap+czcoXm6ESQXFa
	 k1SFj6BWJjtYmzDUEuDMdL2RlDRBGJxjVAB8h1wYuR/HiksHxVR0twjwIrzLcIrIcj
	 L2J4bDpA4UaYw==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Ravi Jonnalagadda <ravis.opensrc@gmail.com>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com
Subject: Re: [RFC PATCH v2 0/3] mm/damon: Introduce node_target_mem_bp Quota Goal Metric
Date: Sat, 31 Jan 2026 11:54:07 -0800
Message-ID: <20260131195408.66514-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260130014807.51302-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,kvack.org,vger.kernel.org,linux-foundation.org,lwn.net,micron.com,sk.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-74781-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6D9A8C3BDE
X-Rspamd-Action: no action

On Thu, 29 Jan 2026 17:48:06 -0800 SeongJae Park <sj@kernel.org> wrote:

> On Thu, 29 Jan 2026 13:58:11 -0800 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:
> 
> > This series introduces a new DAMON quota goal metric, `node_target_mem_bp`,
> > designed for controlling memory migration in heterogeneous memory systems
> > (e.g., DRAM and CXL memory tiering).
> > 
> > v1: https://lore.kernel.org/linux-mm/20260123045733.6954-1-ravis.opensrc@gmail.com/T/#u
[...]
>     Context 0: monitors node 0, migrate_hot -> node 1
>       goal: node_ineligible_mem_bp, nid=0, target=4000
> 
>     Context 1: monitors node 1, migrate_hot -> node 0
>       goal: node_target_mem_bp, nid=0, target=6000

In offline, Ravi enlightened me that using a single context with two schemes
instead of the above two contexts setup can be more efficienct and useful.  I
agree that.  It will be able to only single kdamond, and there could be more
flexible use cases that can use the whole-memory access pattern.

That is, we can use single context with the two schemes, but adding a core
layer DAMOS filters for applying the schemes to only memory of node 0 and node
1, respectively.  Similar for memory tiering use cases.

But I was recommending the multi contexts approach to people because the
current implementation of DAMOS is not efficient when both quota and core layer
filters are used.  I was actually working on making it improved, and just
posted an RFC patch series [1].  After the patches are merged, hopefully the
single context approach will be useful and effcient enough for varying use
cases including the memory tiering.

[1] https://lore.kernel.org/20260131194145.66286-1-sj@kernel.org


Thanks,
SJ

[...]

