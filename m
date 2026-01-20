Return-Path: <linux-doc+bounces-73287-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA6ZFCTHb2myMQAAu9opvQ
	(envelope-from <linux-doc+bounces-73287-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 19:19:16 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E764952E
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 19:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B7044800B5D
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 15:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DAF280330;
	Tue, 20 Jan 2026 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="TdYK7ESr"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A2F27B4E1;
	Tue, 20 Jan 2026 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923305; cv=none; b=GLxWuEyRLXXdQhpyknwQR1Jo6sOpl4OgSehAVJmTwJF1zWrkaB4a9IsB2uAqpclmKzV070httFmFQiFDOgHVmWeMTjkShrYgAY84fVCBsgFYKEUV8FXkzQ/czzdR0k2ot4OoXCnhIYJRZNaHzZp0MxwhOlZXvUMHwblQV5JZijE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923305; c=relaxed/simple;
	bh=8x1QoUrrnz1dpBESgJ2u5NzK8z4VC0YnD2SRsIR0tQc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Yi3f7M42/eaBRWB0Th859H+iToGBRweDAR3UTPgW1K4OISlVMukgYn/PSpzT5CCYpbv+q8rUJ+g45Csu4dT8W3/3dqrN4YmhrxHNwKLNVqzoUomZpYIXsVy5BSwLlNeuDZGSMIOyr4L5pySNTC0vX20cY2VqdM10uN+G3+9BgzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=TdYK7ESr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2359540C27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768923297; bh=8x1QoUrrnz1dpBESgJ2u5NzK8z4VC0YnD2SRsIR0tQc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TdYK7ESrUlblsUxfFa5EyMhgrx9w99b3nFAfzNeNE+pXcxCDzZVG1O6LY7XvRR9AF
	 cGK60Wru7Dj/EFlAnOv4R5E5Q2+4GuqdKevvymFb12QcaiKPZEcBWPFaenynI9nVvs
	 qzpM8/zDkbFox3TucUvtD/SMbwBcSH5E1Y4fsgCAWs9EglgQXfMlAXwXA/AqnWS4gY
	 cGDm2Md9ANPTd84G6cTEgVfZwCs1uBhDN7BhNMVUlhem2OoDjYkiS7mQGZjXKC2jHp
	 RUqcA+lp+u15Yy/Uk47oWtcpVB7+Bz2575TrAV3OyFO/6JKVwdzTVqX6njduG/6NfI
	 0HZYlsNS/+3+Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2359540C27;
	Tue, 20 Jan 2026 15:34:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, Akiyoshi Kurita <weibu@redadmin.org>
Cc: shibata@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: ja_JP: Start translation of submitting-patches
In-Reply-To: <6645246a-571a-4768-98e7-775e84520b2c@gmail.com>
References: <20260118032400.863320-1-weibu@redadmin.org>
 <6645246a-571a-4768-98e7-775e84520b2c@gmail.com>
Date: Tue, 20 Jan 2026 08:34:56 -0700
Message-ID: <87wm1ci9gf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-73287-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,redadmin.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lwn.net,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	DKIM_TRACE(0.00)[lwn.net:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,lwn.net:dkim]
X-Rspamd-Queue-Id: 14E764952E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Akira Yokosawa <akiyks@gmail.com> writes:

> Finally, I'm not sure if Jon would like to merge this WIP translation
> work in this early stage.

Akira, I'll defer to you on that question; when you think it's
appropriate, I'll apply it.

Thanks,

jon

