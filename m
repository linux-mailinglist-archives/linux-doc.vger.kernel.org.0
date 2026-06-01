Return-Path: <linux-doc+bounces-90382-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEMlBK7UHWq6fAkAu9opvQ
	(envelope-from <linux-doc+bounces-90382-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 20:51:26 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B1062447B
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 20:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04322302B81D
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 18:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E1F357CF9;
	Mon,  1 Jun 2026 18:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KfZ+S+kH"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935082D9ECB;
	Mon,  1 Jun 2026 18:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339860; cv=none; b=cCtYKnY9e5aZanGSrClwC3X0SHpyxDouuS6ljGERGZfKeBojkyX5AGj+KLCNWEe8PehGteFVbN9YTvo8ucP7razGO6TYIX4sdowtiqL7v3DgUT9cnD0NNxiD0jvErq3Xy2Y4pbseuvDbLnsHlIWzTDO9h5Wv6JHaB3YU4A0PNpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339860; c=relaxed/simple;
	bh=sjhMWLY2X66jnkBpJNbsKMlSNOyMgDfLFmXx+GoclsU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cIPuunt8ZdUppuVVvpXkB8FDU7wM+s5X/ASssysYQ9JbRAd4ZHcLOJr/u17SrS/QbPJoPZ8yihzrhYjzHUdPBJsxG1MwpdPFKegTmcivQYIFU7VJI2yrgRHt9n09V6oAWmY0zywO4A3X0gpnkijemYeg66rpGV3MQZpsvPiD4bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KfZ+S+kH; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 232C540E49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780339859; bh=WkUfDl5bKWbgs3ZFEXav/OdjRJMGss+XTylmXnNWa0Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KfZ+S+kH3M3e3st+61r1DfEoC4GRjq2sAuBKpL2GzQOOXjK7E/gFbzisFKtsQBJkk
	 O6gW9Qi8o2XsULJvvaMbmRh0U5wVVW1eYkpGS1y5rh+5E7yPCL/GSfqcNoTo7X492o
	 fbtnX3V1piSJxjWgKBqi1nyES/FNZBDoxdJbFSxSmBlYrRQRdsArBKbI9Umea7/SrP
	 GSQoSzwmwKhE3kQTJnTUI/xiRXoVYs8JEeDOXcNeTl7mIHSHQN819jHq/4gupIgVji
	 zKVe8UUMAxJw0gB1Gg9J7v4YUfST0RCfpnwRhD63MIYRoxtsBtECTMoYbB0soDtdSD
	 KxqnxTHDALVyA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 232C540E49;
	Mon,  1 Jun 2026 18:50:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Zhan Xusheng
 <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH] docs: changes.rst: restore pahole 1.26 minimum
 (regressed by sort)
In-Reply-To: <20260526022033.1301884-1-zhanxusheng@xiaomi.com>
References: <20260526022033.1301884-1-zhanxusheng@xiaomi.com>
Date: Mon, 01 Jun 2026 12:50:58 -0600
Message-ID: <87bjdu9jsd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90382-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,trenco.lwn.net:mid,xiaomi.com:email]
X-Rspamd-Queue-Id: 79B1062447B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Zhan Xusheng <zhanxusheng1024@gmail.com> writes:

> Commit 9edd04c4189e ("docs: Raise minimum pahole version to 1.26 for
> KF_IMPLICIT_ARGS kfuncs") raised the minimum required pahole version
> from 1.22 to 1.26 in the requirements table and added a paragraph
> explaining the failure mode for distributions still shipping pahole
> v1.25 (e.g. Ubuntu 24.04 LTS).
>
> The next day, commit ece7e57afd51 ("docs: changes.rst and ver_linux:
> sort the lists") came through a different tree (docs vs sched_ext) and
> re-flowed the table alphabetically, but its base did not include
> 9edd04c4189e.  When the two commits met in mainline, the textual rewrite
> of the table won and the version bump was lost.  The added "Since Linux
> 7.0..." paragraph also disappeared.
>
> The result is that changes.rst on master (v7.1-rc5) lists pahole 1.22
> again, even though sched_ext kfuncs annotated with KF_IMPLICIT_ARGS
> genuinely require v1.26 to produce a correct vmlinux BTF.  Users on
> distributions with pahole v1.25 hit "func_proto incompatible with
> vmlinux" when loading any sched_ext BPF program (scx_simple,
> scx_qmap, ...) and have no documentation pointing them at the version
> gap.
>
> Restore both changes from 9edd04c4189e.
>
> Fixes: ece7e57afd51 ("docs: changes.rst and ver_linux: sort the lists")
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>  Documentation/process/changes.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Oops, that is not good.  Thanks for catching that; fix applied.

jon

