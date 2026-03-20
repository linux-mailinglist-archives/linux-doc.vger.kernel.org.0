Return-Path: <linux-doc+bounces-80356-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHcsJO5hvWlF9gIAu9opvQ
	(envelope-from <linux-doc+bounces-80356-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 16:04:14 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2233E2DC435
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 16:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 93F0930AAFF6
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 14:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B064359A9B;
	Fri, 20 Mar 2026 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NH0QAtEL"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282EE282F06;
	Fri, 20 Mar 2026 14:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018281; cv=none; b=rF4Esm/VdgibdIQTFg+xme1pdklauwQdTn6aZ91f1hCcr+gdYmzvwEdb8AHGRscWcbwrTJhLGvuUFQtmQnjxNsvrzhUZoGp3s6r6MzW8U3GyloZM4tk+7LHj00u31iaqW+RdKh4iBkVkavchxUnhj84DXLojOGVty2wwrN0a7aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018281; c=relaxed/simple;
	bh=BRLCjsYp/OSdtKDfU9Ghzw6aJ4iOYpw1n+juPU6+/Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kSXu07TRkSACYH+NjJZTncwxcCpf0WYOB5mIXcvQJWiI612fkwpdqi7kI00QJm8hxLaiywsoC7XrNLPUIOjEwOeBmUf83GRi3qD7qMheUzR9EbV14LcP9E+Xz3tVgFPd8NI9v8GLSJ7g7l63rzQVPY3iaAIiro8GOK1gfizPHbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NH0QAtEL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1636C2BCAF;
	Fri, 20 Mar 2026 14:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774018280;
	bh=BRLCjsYp/OSdtKDfU9Ghzw6aJ4iOYpw1n+juPU6+/Vc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NH0QAtELB4v6jLFw8JsoLyBxlKe6/9q6TmleL3TvXy5G6jXfJnZuzfWgPulPWA1rL
	 2W0NUx28emQVlz1REcT5GV1KBSMe7SIU7loEHRb6vSMJ6E7PBuiKxdGqvPzEYDI+2H
	 SHpdXQV0HQTgtUrH/OBY9ZXuLZLkZcnyjPkGB0UfBaVv3aHT4cNxs015FqtdAELF4w
	 rZkIohTiAJMyeHXkvdVZbCNmOyk8NHrjBwd829Ula+EhMvb70oeY0R2z90yAnkj8xA
	 m6W0QKPEdaM8x5q2qIfs8LQN5wfDUufkOygjjXmdxdFXaNZoNHKTMLJCP9nWRTPZiq
	 UA8o7yywDc/+w==
From: SeongJae Park <sj@kernel.org>
To: Liew Rui Yan <aethernet65535@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] Docs/mm/damon: document min_nr_regions constraint and rationale
Date: Fri, 20 Mar 2026 07:51:18 -0700
Message-ID: <20260320145119.91960-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320054145.213945-1-aethernet65535@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80356-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2233E2DC435
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 20 Mar 2026 13:41:45 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:

> Hi SeongJae,
> 
> I'm sorry for the noise; please ignore my previous reply. I accidentally
> sent the commit message instead of my intended message.

No problem!

> 
> What I wanted to ask is regarding tasks 3 and 4 from our earlier plan
> [1]: should I wait to start both of them later? Or is it only task 3
> that needs to wait until your fix is merged or abandoned?

I want only task 3 to wait :)

> 
> Also, I'm preparing to post an RFC patch for 'damon_hot_score'
> optimization soon. It aims to provide a significant performance
> improvement.

Thank you, I'll check!

> 
> [1] https://lore.kernel.org/damon/20260319151528.86490-1-sj@kernel.org/T/#t

FYI, you don't really need to add the 'damon/' and '/T/#t' part on the link.


Thanks,
SJ

[...]

