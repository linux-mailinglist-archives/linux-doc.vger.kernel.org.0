Return-Path: <linux-doc+bounces-94237-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7BoGFBseRGr9ogoAu9opvQ
	(envelope-from <linux-doc+bounces-94237-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:50:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8ED6E7A8D
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:50:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=fx2Vf3rl;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94237-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94237-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B01503023E03
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 19:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1E445104C;
	Tue, 30 Jun 2026 19:50:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79C2382F3C;
	Tue, 30 Jun 2026 19:50:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782849046; cv=none; b=rQ7+n4QFnT17sVPOUyc/8/tqOy6Wy5foyxs1JqZrkZxIyUUciyiBM8nF+6FrAAyHffcUEMOmgPSqB1/hhJg12XFT+i0PkUEZQ77onGQSl4TKZFEtx5KRxKMoTEmp4hqqJgJwBQdoWwgks8CK1fNNjvTvEseUl/SHq9FQ4lmJYJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782849046; c=relaxed/simple;
	bh=srXstzmEEjAxWvloY0XnSO33Y2b5qttxe6MyS6qGobw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TaS8HO0H3oItdgGJWoJjNSsia2iRlfnPan8O1VhJPJLm+JFnjGIZvqYYaKlAW092Ot4TeNcn0O1JZ/KzANZ3Khs/e5lap7MkH6pJWdBYcwZ0/uJpkvwhQi+qmXZUttjnPqbDpfeFdpduEK1NTyHiD9AUpmrqN8ijcl5Vx+ElQ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fx2Vf3rl; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0986140E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782849045; bh=GgWw1iMGZlmw329dKAp+I9bQDEQmLl+BK1IBgUY78sQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fx2Vf3rlHILOjDrdcLRSEZILDQQJBxnLpY8WuANb3MdhI8GuVHsaq/0UKypFq38Te
	 e4cmbSkjkD6x1RxUHsn9zaEtew3ChHvcfp/0a8io4lQaoykZy/nfCirZGLDqa/mknE
	 fUmzG4UuRqgp3aZ1keW4Mw69LXc2KDB2oEwrgr21floUX6fif+7TQ4qNXAJPhBlrbR
	 xTJTBUXaTvYjD0bKALrTzSlcgAMuSZNtoK/C1Gm7AUA2wWop/mwhV2ocTcicg9b3o+
	 xfeUcAEx1scbP58b/0BRSLj8J+HN9zFeY82oqO5CSRkSzaaeZENAcgjAy46rkbte9N
	 CsxpLn2ixyG4w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0986140E27;
	Tue, 30 Jun 2026 19:50:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yousef Alhouseen <alhouseenyousef@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: Re: [PATCH] docs: kdoc: fix troff output description typo
In-Reply-To: <20260624122448.4853-1-alhouseenyousef@gmail.com>
References: <20260624122448.4853-1-alhouseenyousef@gmail.com>
Date: Tue, 30 Jun 2026 13:50:44 -0600
Message-ID: <87o6grrenf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94237-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alhouseenyousef@gmail.com,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,lwn.net:from_mime,vger.kernel.org:from_smtp,trenco.lwn.net:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB8ED6E7A8D

Yousef Alhouseen <alhouseenyousef@gmail.com> writes:

> Fix a typo in the ManFormat documentation string that describes the
> generated troff title header fields.
>
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  tools/lib/python/kdoc/kdoc_output.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
> index de107ab4a..618b0d765 100644
> --- a/tools/lib/python/kdoc/kdoc_output.py
> +++ b/tools/lib/python/kdoc/kdoc_output.py
> @@ -624,7 +624,7 @@ class ManFormat(OutputFormat):
>      ``manual``
>          Defaults to ``Kernel API Manual``.
>  
> -    The above controls the output of teh corresponding fields on troff
> +    The above controls the output of the corresponding fields on troff
>      title headers, which will be filled like this::

Applied, thanks.

jon

