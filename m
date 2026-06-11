Return-Path: <linux-doc+bounces-91892-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k0A3GlwKKmrthgMAu9opvQ
	(envelope-from <linux-doc+bounces-91892-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 03:07:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD69666D974
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 03:07:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=aosc.io header.s=default header.b=twMZOShY;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91892-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91892-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=aosc.io;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D161303853B
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 01:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD631DC1AB;
	Thu, 11 Jun 2026 01:07:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF05814BF92
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 01:07:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781140057; cv=none; b=CyL8iJUf81RXS/gPtvfo9Xd9N0D3nZyjWQsmHwRl+yL9R/ULCzWfWfr3tmMIuuVbFAul7pkVTlxUTDRYB3QkuWItcZJN2iqOIKw/rcEBP26FGJWcXZMW2BezisndWchLILkSa2e1Q6rTghRSUMJ3JXb1bXidI7mDqLEJ8lOCR7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781140057; c=relaxed/simple;
	bh=wcUExsndoOlvj/KV7BBmXF9Xwy2u2NkpBQ2daipBiOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Od2HQS/5H96TNg5qWmKilrXTIFigA+CARRaTWvq7MVm1LT0/JNYqp9nyBarJe5AwSodWbRb3R6LPZVlHrtNs1GfWEnx+U0oi6Zqs3JMgfy8dJP1JnReIzgekIIrbAIjdlv3BlAu1cW/ijE3QbXdGCYxbTYcW5ebFmgPqp3kw9N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=twMZOShY; arc=none smtp.client-ip=159.100.241.64
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.154])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id EAB4520063
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 01:07:33 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id D7EC5201E3;
	Thu, 11 Jun 2026 01:07:25 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id A9AAF4007E;
	Thu, 11 Jun 2026 01:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1781140043; bh=wcUExsndoOlvj/KV7BBmXF9Xwy2u2NkpBQ2daipBiOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=twMZOShYoIsore+E0/GaPVxD7xR2s9Rxe0/GVdmDYGEQTd2TSxWbMK5C85G/nC+TG
	 j0TE26gtzj/C+/KEudOYQMM8Bbc9q1GXrIWzDiB8T3djA7ViQlF/MmJYFYHLvK4CuP
	 PFIz6+ZHnovHorvU/kNxtEB1qTSzFDr+XtDBuaPU=
Received: from [172.20.30.22] (unknown [223.160.130.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 54EF44100F;
	Thu, 11 Jun 2026 01:07:20 +0000 (UTC)
Message-ID: <5ecb345b-2151-4a74-86e7-5544e268503d@aosc.io>
Date: Thu, 11 Jun 2026 09:07:16 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: fix CONFIG_CONPAT typo for CONFIG_COMPAT
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Dongliang Mu <dzm91@hust.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>,
 Kees Cook <kees@kernel.org>, linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>
References: <20260610231836.186610-1-enelsonmoore@gmail.com>
Content-Language: en-US
From: WangYuli <wangyuli@aosc.io>
In-Reply-To: <20260610231836.186610-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[aosc.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[aosc.io:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-91892-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[aosc.io:+];
	FORGED_SENDER(0.00)[wangyuli@aosc.io,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:enelsonmoore@gmail.com,m:dzm91@hust.edu.cn,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:linux-doc@vger.kernel.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:corbet@lwn.net,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,hust.edu.cn,linuxfoundation.org,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangyuli@aosc.io,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	SINGLE_SHORT_PART(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD69666D974

Reviewed-by: WangYuli <wangyl5933@chinaunicom.cn>

