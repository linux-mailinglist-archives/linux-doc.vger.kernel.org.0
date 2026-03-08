Return-Path: <linux-doc+bounces-78361-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCZjJ5CurWlu6AEAu9opvQ
	(envelope-from <linux-doc+bounces-78361-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 08 Mar 2026 18:14:56 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 014B52315F0
	for <lists+linux-doc@lfdr.de>; Sun, 08 Mar 2026 18:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BCC030000A8
	for <lists+linux-doc@lfdr.de>; Sun,  8 Mar 2026 17:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAB73491D6;
	Sun,  8 Mar 2026 17:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GdeSW8Zz"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1153321AA;
	Sun,  8 Mar 2026 17:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772990093; cv=none; b=OJAQI+dTe31LFYj+BVzM/Ml13yczbaYbFw3pAXmFZLnJjLaeqlu1K2I10XipbUI7RDMiOosf/f0Li2jktKZLfEEEVaxF4pGqp/PSN/P5AEsMiF3Sv0q/Y9PbE7sRKg6pdSWUhnxPwgGtbMeKAWI+p2gu0l8KnTXq2xoldEp0Uxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772990093; c=relaxed/simple;
	bh=NsIXoAOOSLI/fYoLQQwnCT+h9QgwJEsfGMfdhiysuoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bviws2zBLpugD92xY5O7/HS4MaCAou3HSAUb1+zA4Z/mCNuzSczJnFnKvMXDNQ3yOStw93O0XOM0QhbLz4U57v/o7sV2UXIEeTjKI1s8GJs7+TnxaQvZiZp+nLfUAimxZvN8oY5gdhjtbK80HH01bvEYFd9wXsC6AoupWhAFyOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GdeSW8Zz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8FCC116C6;
	Sun,  8 Mar 2026 17:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772990093;
	bh=NsIXoAOOSLI/fYoLQQwnCT+h9QgwJEsfGMfdhiysuoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GdeSW8ZzWUEW3QYLAZlkfyA/QfALGgQfa6yUd2CjMEJMA5UwByybMJFMCFAxN8d0e
	 DAHGlkk6XdCV6VGxo0tYUtRD0/231v6sZ7v+dxMM53eNTcvSWD9Nhx4m2ymdRjMbDA
	 A0QhxjFjT4mGaz3tRh3nMKcbHf6tVtyHtMEIttubdx01pqGsRnjegV+rYU4KO9sA8Q
	 zkYt0YLlonazo0fkh0ke+qLsBhhiwRLtl0jPd+2c0tUJI07g3xZbvPSBDmkgex3b1Y
	 rLsUYJQRCbzltXz3ZcZG8EKzPoex0V86ZHYdcpetPtqMN8NcQMEhK4xITw8lEnfQmK
	 FCwyT0aU0n2PA==
From: SeongJae Park <sj@kernel.org>
To: Aether <aethernet65535@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/mm/damon: fix typo in index.rst
Date: Sun,  8 Mar 2026 10:14:31 -0700
Message-ID: <20260308171432.209411-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAPLv50pFasDAnFMX8OgXjo2Nrn8rGhUgm1=K5aOeVyKf57Z3BQ@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 014B52315F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-78361-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.987];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Liew Rui Yan,

On Sun, 8 Mar 2026 11:05:09 +0800 Aether <aethernet65535@gmail.com> wrote:

> Hi SeongJae,
> 
> I just noticed that you already submitted the same fix for the type in
> Documentation/mm/damon/index.rst.

Yes, I unfortunately sent [1] it a few hours before your posting.

> Sorry for the duplicate!

No worry, this kind of duplication is very common in our real life!  I'm rather
sorry that I wasted your time by posting my patch too late.

> 
> I'll make sure to search the mailing list first next time before submitting a
> patch.

Such searching would be exhausting.  Please feel free to just send patches.  I
can help handling such duplications :)

Nonetheless, if you really want to avoid this kind of duplication, checking
damon/next tree [2] before starting your work could be a good practice.  The
tree contains all DAMON patches that aimed to be mainlined in near future.
Note that the tree also contains patches that not aim to be mainlined in near
future.  If you get any question about the tree, please feel free to reach out
to me.

> Thanks for the quick fix, and thanks for maintaining DAMON!

My greatest pleasure!

[1] https://lore.kernel.org/20260307195356.203753-8-sj@kernel.org
[2] https://origin.kernel.org/doc/html/latest/mm/damon/maintainer-profile.html#scm-trees


Thanks,
SJ

[...]

