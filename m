Return-Path: <linux-doc+bounces-83292-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VG4fDyN+3WkVfAkAu9opvQ
	(envelope-from <linux-doc+bounces-83292-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 01:37:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDA93F4451
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 01:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A88CD303789A
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 23:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01DD3502AA;
	Mon, 13 Apr 2026 23:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="Q1oEpO7V"
X-Original-To: linux-doc@vger.kernel.org
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619482D12F3;
	Mon, 13 Apr 2026 23:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776123422; cv=none; b=cYSyafPArgkZ0d6qF6jMV8MfRtU6VHJ1dw2BJGE/erNOgtGhgRv2WI8f1836k7zzMyxT6RKJaikVbzG0Y7wx+lUfBeRLsk5DDQln3/+kfTiVR2A/x5beIVt8hjLmiAE3LxbyO5cvSTX5RoEU6140oAGz2AT2VrYz5IJ9aCqqU4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776123422; c=relaxed/simple;
	bh=1qON6nN6I6mjHxeF1D24BeA6LeZXtx0KXnfAONyyLog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OjxMcV7s8DpLFz6mwxKVd6SfaDGMkPGJQQQsRDKG31ILjyUeLwSKlEdA+TPmoHaXhFHqrRxquci7sP5OS76fZE//McPbAIfg/L5lbqeujQwmJPf3kUDBra+j6+TAm4Ct9VQdbcgkgK3LNvp3S9MPDLmxyrfLRtYRw/StBwb0foU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=Q1oEpO7V; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fvkMc6B8qzlkQLy;
	Mon, 13 Apr 2026 23:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1776123417; x=1778715418; bh=RCIEBXNPQc3m0daKji38J1ix
	CmVmyTO5tqcADRmgu1w=; b=Q1oEpO7VpHrksrNUOSQjDk44Cop31yMmp+ygTPba
	zKlQgXWqdcCXmODfisujwUSQmZfl+UHAi4q6prXKDl12RO19hH+Lo5VaLPloOY1H
	8SKbOIqGaCny/gYwB/iZj2cAXiKgpSqnCwCBIT62y6COLgn+UnycyMcOHLufcd6B
	oJp3B05Q++kOv0I9nchP6R/B9GNQYPneucKGnEVhlaG0xiOKryieWKQhdwyNChlu
	dXhkmPfC/zu9MgMo0IyiUtxf2PL7eh0Gp3sXNK7v5HK+QCI9qn2LJrbKtxPDWP7c
	6wVlJvXE444AFSHQusGYchrSTg6Ummu0MOCbZCUk1IcatQ==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id QRDTH-eElrft; Mon, 13 Apr 2026 23:36:57 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fvkMW2dSpzlfc9G;
	Mon, 13 Apr 2026 23:36:54 +0000 (UTC)
Message-ID: <3b5ec088-d8a6-4ff6-beec-f499e24ba1c1@acm.org>
Date: Mon, 13 Apr 2026 16:36:52 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: xforms_lists: allow __maybe_unused in func
 parameters
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260411233526.3909303-1-rdunlap@infradead.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260411233526.3909303-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83292-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[acm.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,acm.org:dkim,acm.org:email,acm.org:mid]
X-Rspamd-Queue-Id: 2BDA93F4451
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/11/26 4:35 PM, Randy Dunlap wrote:
> --- linext-2026-0410.orig/tools/lib/python/kdoc/xforms_lists.py
> +++ linext-2026-0410/tools/lib/python/kdoc/xforms_lists.py
> @@ -93,6 +93,7 @@ class CTransforms:
>           (CMatch("__weak"), ""),
>           (CMatch("__sched"), ""),
>           (CMatch("__always_unused"), ""),
> +        (CMatch("__maybe_unused"), ""),
>           (CMatch("__printf"), ""),
>           (CMatch("__(?:re)?alloc_size"), ""),
>           (CMatch("__diagnose_as"), ""),

Thanks!

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


