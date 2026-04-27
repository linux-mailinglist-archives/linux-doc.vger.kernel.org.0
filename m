Return-Path: <linux-doc+bounces-84703-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I0gOosz72mb8wAAu9opvQ
	(envelope-from <linux-doc+bounces-84703-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 11:59:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDC0470551
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 11:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED74A305E2FF
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 09:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5441F3B3C1C;
	Mon, 27 Apr 2026 09:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="g/L1rnH+"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8E03B47F1;
	Mon, 27 Apr 2026 09:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777283790; cv=none; b=reNT4p5iMd1cSbK7KYqQ8l/S7/rN0qIoU+BDKRlzfcYMbMB47/5+5KQDaqrGFJSkxUf9itmF+USjVWqczvG8/1j1cRV/aQNZ+4jZDhhs9/QF2m+R+38Ljey5aaJPx8CzDUgyC7MX7xHc1c2k9chXjPcNfGLrKNuC4ZFSaFDN7es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777283790; c=relaxed/simple;
	bh=4p+CkX6g4IgKb28YxUsjXxQe9dAaHGedQdH0CwnSM+s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KnjxjK3QbBV+kmEqkZC2OtqfmvTucMFQyNCNCHhK5Yoz9mfa1wuW5dtPuGv5kdLKL8h7OgOqwKMpLj4jCwf0XLFNk25l5Uf+x7DFMETUenkOqlSiF05GJTy+1qHqfZbQdmUVu+TdMlbzMoMReDO39+tvIsq8ehNEzpFMe8a0nJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=g/L1rnH+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0905E41098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777283788; bh=luX/+rsYl2EjYfWOTvwRSu9TJUmSoW80TPkuwNss96U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=g/L1rnH+hMWQgI/UmzyUy2/igLSI+yXNsVZ1Jz/nY61C0cMcQnAVhzx5tQr4OVfgc
	 gD3Js6bRXy1b8IPyJ+u3tdH6k/1DKzwvD6cAIv+u1w5WAC2ObKBC9jVyW+H0GnLkJa
	 pxz9RyGspoQjYhLz7v3pUsHrCp/pEojvkTJgMsfvZeD8ObyKeIKyXpgIu1K2fU+yPB
	 IkF5NgTgdCiUiW21SjsHLMM4MqNVSTlYQeaD9RgVMH/nFxraVWVzqxu5gRWtIjLlxq
	 V2tNTHyUqOceyaawPvH7/HQwaIMtVkJ9k2z1ovbGUbmv68/PgHIMQ5NVyPMrwR0+wJ
	 EmF++1nKCE9Tw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0905E41098;
	Mon, 27 Apr 2026 09:56:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ninad Naik <ninadnaik07@gmail.com>, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 skhan@linuxfoundation.org
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, me@brighamcampbell.com,
 linux-kernel-mentees@lists.linux.dev, Ninad Naik <ninadnaik07@gmail.com>
Subject: Re: [PATCH] Documentation: fix spelling mistake "stucture" ->
 "structure"
In-Reply-To: <20260419184527.779828-1-ninadnaik07@gmail.com>
References: <20260419184527.779828-1-ninadnaik07@gmail.com>
Date: Mon, 27 Apr 2026 03:56:24 -0600
Message-ID: <87se8gpvzr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 1FDC0470551
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-84703-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,brighamcampbell.com,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,goodmis.org,kernel.org,efficios.com,linuxfoundation.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid,lwn.net:dkim]

Ninad Naik <ninadnaik07@gmail.com> writes:

> Fixing a spelling mistake in Documentation/trace/histogram-design.rst.
>
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> ---
>  Documentation/trace/histogram-design.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/trace/histogram-design.rst b/Documentation/trace/histogram-design.rst
> index e92f56ebd0b5..41a726cd3536 100644
> --- a/Documentation/trace/histogram-design.rst
> +++ b/Documentation/trace/histogram-design.rst
> @@ -247,7 +247,7 @@ field's size and offset, is used to grab that subkey's data from the
>  current trace record.
>  
>  Note, the hist field function use to be a function pointer in the
> -hist_field stucture. Due to spectre mitigation, it was converted into
> +hist_field structure. Due to spectre mitigation, it was converted into
>  a fn_num and hist_fn_call() is used to call the associated hist field

Applied, thanks.

jon

