Return-Path: <linux-doc+bounces-82900-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCfnHLy512l0SAgAu9opvQ
	(envelope-from <linux-doc+bounces-82900-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 16:37:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D7D3CC190
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 16:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D51E53092E7F
	for <lists+linux-doc@lfdr.de>; Thu,  9 Apr 2026 14:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B8B3DD502;
	Thu,  9 Apr 2026 14:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UzI1M/XB"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF703DD514;
	Thu,  9 Apr 2026 14:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745035; cv=none; b=CuW+W2st758Tn77XBhBN0dJMGjh2iufUAMqRoAjPv+FGyTtcIvJdz2mTpNKySL2gOiIRyeekbbteRZFBPXQMPDyyeUR4fSc9GZnYIHmMMPV8CfF0Vxe77vPcE7GyqRFyhFr2zAZcCYKGsVLrhtCkEJX7xyrUC7oenjE/u2PHaBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745035; c=relaxed/simple;
	bh=UgnyxP644wtYINxEjlNBjbqD0RcmoqQxseU3wqO5bqU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dz4ZLfQO31MgyRz9Y9TBgAfq9DEZYUcLLufs8YP2Pzn0wYiVOkPDJ5sCgwCFQ36qZmVgrVWiKXdHGzvtzx0xW6WasO2Nfj8bHcrj0LLUZ0duGzwaI4QL1IMKYbPOGjEoWHIkY9DZAcvcBd2ySA3OoCEf5yOSl+aFDXerJ7Ciosw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UzI1M/XB; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 78F7640B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775745033; bh=qz+51zr09ryC6J49RGj7ncZ6Z1RXPexLABTUbLHqsk8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UzI1M/XB5QE0Ym2K4WGrA0WAqtwKxM4oFlLN67sg/VIC5neBRqD2gv7TnfZbZpJV3
	 C/kyBaJmwyYeZr/h1UsgR2l7M4SKOudvmZH7qgAFq1wqrJvyK69NpdQOUhEfcBc13f
	 NWACRRaWULX00UhY/vcmlzFltUfDdD8zBZJcH2Py4JVu9ElXqClclRucPuOqw5pFhk
	 lMVFLOFzIgjFSuT2F8TysGTLKIVYrkBYmpBie7EuyZYi1DYYVZynLcXDSNqdDA/nsT
	 tekgjAe3UID+bt2ymw7m3qZJokg2wZJeZR5DyLkG9Wu7cQzi62lMopGNbnc2w2HMQb
	 6N1700kVETCzA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 78F7640B2D;
	Thu,  9 Apr 2026 14:30:33 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: skhan@linuxfoundation.org, alexs@kernel.org,
 si.yanteng@linux.dev, dzm91@hust.edu.cn, carlos.bilbao@kernel.org,
 avadhut.naik@amd.com
Cc: fangqiurong <fangqiurong@kylinos.cn>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/doc: Update yield_task description in
 sched-design-CFS
In-Reply-To: <20260403055806.358921-1-user@fqr-pc>
References: <20260403055806.358921-1-user@fqr-pc>
Date: Thu, 09 Apr 2026 08:30:32 -0600
Message-ID: <871pgocik7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[trenco.lwn.net:server fail,lwn.net:server fail,user.email:server fail,kylinos.cn:server fail,sea.lore.kernel.org:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82900-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[lwn.net:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,kylinos.cn:email,trenco.lwn.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,user.email:url]
X-Rspamd-Queue-Id: C3D7D3CC190
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

fqr <user.email> writes:

> From: fangqiurong <fangqiurong@kylinos.cn>
>
> The yield_task description referenced the long-removed compat_yield
> sysctl and described the function as a dequeue/enqueue cycle. Update
> it to reflect current behavior: yielding the CPU by moving the
> current task's position back in the runqueue.
>
> Sync zh_CN and sp_SP translations.
>
> Signed-off-by: fangqiurong <fangqiurong@kylinos.cn>
> ---
>  Documentation/scheduler/sched-design-CFS.rst                | 5 ++---
>  .../translations/sp_SP/scheduler/sched-design-CFS.rst       | 6 +++---
>  .../translations/zh_CN/scheduler/sched-design-CFS.rst       | 4 ++--
>  3 files changed, 7 insertions(+), 8 deletions(-)

Applied, thanks.

Also dropped the strange user.email address in your email; you will want
to fix that before sending anything else.

jon

