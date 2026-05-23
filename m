Return-Path: <linux-doc+bounces-89162-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id C9ZWDu8JEWr5ggYAu9opvQ
	(envelope-from <linux-doc+bounces-89162-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 23 May 2026 03:59:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E4A5BC6C0
	for <lists+linux-doc@lfdr.de>; Sat, 23 May 2026 03:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D8793012E84
	for <lists+linux-doc@lfdr.de>; Sat, 23 May 2026 01:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC99265623;
	Sat, 23 May 2026 01:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5mcvlCt"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE115FDA7;
	Sat, 23 May 2026 01:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779501547; cv=none; b=AvZy/oPYOBC43ARXjKSRUDj3+r/mmvSFjXGxswY4ERS64TB9hinhKITYQ7ZVNbOXCNmno28HKJthfWMnbIwJCyC9dKVvH3ReKwOSph07TobIG+3p7sVicKgKnC5R9Ty97c+EOb94JFh8+9DQ0m5jlS6Nn7f3X4U1XZrYWNo8+eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779501547; c=relaxed/simple;
	bh=A9v+jzwa5clEjXQvVx0h/zrX8qgi5QtC45OxsVBQtJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyQOch2SuX2LluN8+2sZb87kMVu+VKzgIrIhptq+qQk0WoITjm4Dp2w+yp4C6t+OGpEBIlAk77Kg4DB0rlm2fsZ+kJk5xTElm3EvWq1NXiQkdbTcw98aWMWoq0dEudYA0z1K58siE32OUfb3s1kC+4pcUiQv7xCBjNuyY2A7TCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5mcvlCt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1BA1F000E9;
	Sat, 23 May 2026 01:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779501545;
	bh=cVBzmOhRiv2foSpwE+k+Mhzsd0rAm6OOVI69ubk7/Kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O5mcvlCtLT6pcSEzbM7VOeiYbiWyUs87hX2WxEscOTmgapdz23+WbTET3Je5eDQwC
	 oQYXhKDFES50F01o/EO4A4SuyfQSN8tNS5qTdXfsgm/UHLsMuUb7ocUuCz1rNo37ej
	 y+6H/vEstqnPu2Yaub8GeiRnKu5k09yHbkvVxYyvjRwVykkSawQhwLyYO5ut8mTdlH
	 +Kvi37xKcu4GGZPSDbvUlgg67reUsu3qUnPHddlPE08DosHV4PmHL/o05hcWlaCfSv
	 069Xc3EMhJDClztus+wz4Gpk3xTetqXb53mHgYDfWqsRjbFi4FXkrbcjFRPyz2emMZ
	 ntkBbYDoT9kRw==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>,
	"Liam R. Howlett" <liam@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 2/2] Docs/admin-guide/mm/damon/usage: clarify current_value of quota goals
Date: Fri, 22 May 2026 18:58:57 -0700
Message-ID: <20260523015858.87146-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260522020004.86551-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89162-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lnu.edu.ua:email]
X-Rspamd-Queue-Id: 83E4A5BC6C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 19:00:03 -0700 SeongJae Park <sj@kernel.org> wrote:

> On Thu, 21 May 2026 23:20:20 +0300 Maksym Shcherba <maksym.shcherba@lnu.edu.ua> wrote:
> 
> > The sysfs interface for DAMON quota goals includes a `current_value` file.
> > This file is not updated by the kernel and only serves to receive user
> > input.
> > 
> > Clarify in the documentation that the kernel does not update
> > `current_value`, and that reading it only has meaning when `target_metric`
> > is set to `user_input`.
> > 
> > While at it, fix missing commas in the goal files list.
> 
> Nice!  Thank you for doing these!
> 
> > 
> > Assisted-by: Antigravity:Gemini-3.1-Pro
> > Signed-off-by: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
> 
> Reviewed-by: SeongJae Park <sj@kernel.org>

FYI, this patch is applied to damon/next [1] tree.  If this patch is not added
to mm.git in short term (~1 week?), I will ask mm.git maintainer (Andrew
Morton) to pick this.  So, no action from your side is needed for now.  If it
seems I also forgot doing that or you cannot wait for my action, please feel
free to directly ask that to Andrew.

[1] https://origin.kernel.org/doc/html/latest/mm/damon/maintainer-profile.html#scm-trees


Thanks,
SJ

[...]

