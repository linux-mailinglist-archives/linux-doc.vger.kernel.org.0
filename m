Return-Path: <linux-doc+bounces-84577-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1SevA8Hf7GkZdQAAu9opvQ
	(envelope-from <linux-doc+bounces-84577-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 25 Apr 2026 17:37:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E21466C4B
	for <lists+linux-doc@lfdr.de>; Sat, 25 Apr 2026 17:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F1E6300CBCA
	for <lists+linux-doc@lfdr.de>; Sat, 25 Apr 2026 15:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6968434A78F;
	Sat, 25 Apr 2026 15:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJJHnpRW"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424B340DFDC;
	Sat, 25 Apr 2026 15:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777131453; cv=none; b=UV8/357S/srOq3d9xQaToB8Rmxz0R08K5pfpVWmTgI6liIM5webcu8/9HlMYtA/9+OQFXR+sxzuNJ11HZrMCvFy2XbPTOw9pIlrrNpIfNYEPyvPyEsxQHpixakvQHFBfSLjvAl9rQN7WUeYVIJgORV3ITfu6FCu2oGl0ZVkVnw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777131453; c=relaxed/simple;
	bh=QvQvNJC7LvyQEmdZeYV/Lpf/XYhQlzkNstKvh8ss6gQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K8Qq9LZlY7jiHwgoFQRDSmDm+10YBrH5iFGjpD3DsVkAxWij6NfRdhUMOGbipjmOzXUBaU/vfOOQImv4FdjEbNhLgdIFsNsvCVO01vIE9eHrE9SHvI5LuwtdR+XBILsW3j4LF8/DC/39p8f34g/39mC1XuW4MyyOvf78XUetJDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJJHnpRW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BC1C2BCB0;
	Sat, 25 Apr 2026 15:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777131453;
	bh=QvQvNJC7LvyQEmdZeYV/Lpf/XYhQlzkNstKvh8ss6gQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dJJHnpRWXOSWFvuGVf93+nyAHul0E9HhqmZai5gxzO+EFGza1Pf97SNMO/q3hHTot
	 c0u3tQqMxX4x4cuNOJ1VoijsF494IScHpjc9LPkMxs7AihGn6Upc+nOwlvl17QByc9
	 1HuCmYY3Hr+9mjrQ7WTHVByEob9jgZGws6nZmyy1OX0u6BvZdCk8lkTaMqiP/23DgG
	 +guf2bI3P/YW4LMnYqWBDNSWSVZ4OcVHGV8iOVNyW9MYz4HocUsP1KMzW5NS8Ay/e0
	 mjmBDIqqujw5IYM0si+oINPo4NpgoWeAa0tXoInGUxflAJx0y5xEusiLhXjWNiVTlP
	 RnNsv+6Bo9wng==
From: SeongJae Park <sj@kernel.org>
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
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
Subject: Re: [PATCH v7] mm/damon: add node_eligible_mem_bp goal metric
Date: Sat, 25 Apr 2026 08:37:21 -0700
Message-ID: <20260425153723.89488-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CALa+Y16VuXb2DfeiBiE5avpEsqGVfc6DAKZWacNsu-1hD51hMQ@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 51E21466C4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84577-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,kvack.org,vger.kernel.org,linux-foundation.org,lwn.net,gmail.com,micron.com,sk.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]

On Fri, 24 Apr 2026 21:18:57 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:

> On Fri, Apr 24, 2026 at 5:39 PM SeongJae Park <sj@kernel.org> wrote:
> >
> > Hello Ravi,
> >
> >
> > This version looks good, except very trivial nits.
> 
>  Hi SJ,
> 
>   Thanks for the super quick review! Very helpful.

My pleasure!

[...]
> > So this looks good to me, except the trivial things I commented above.  Could
> > you please revision for the last time?
> 
> Will do. Summary of changes for v8:
>   1. Mention addr filters for source-node filtering in Two-Scheme
> Setup
>   2. Move implementation details to commentary area with full
> changelog
>   3. Wrap the 80-column violation in damon_commit_ctx()
>   4. Use PAGE_ALIGN_DOWN(addr + PAGE_SIZE) for alignment
>   5. Wrap damos_goal_tune_esz_bp_temporal() (81 chars)
>   6. Remove unintended damos_trace_esz() from first charge window

Sounds good, looking forward to the v8!


Thanks,
SJ

[...]

