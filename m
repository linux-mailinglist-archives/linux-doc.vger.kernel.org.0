Return-Path: <linux-doc+bounces-90387-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN1VFsjYHWpsfQkAu9opvQ
	(envelope-from <linux-doc+bounces-90387-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 21:08:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9D66246CF
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 21:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C725304C8BB
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 19:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D49356746;
	Mon,  1 Jun 2026 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Lo/+Tjsj"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2450B35AC3C;
	Mon,  1 Jun 2026 19:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780340606; cv=none; b=gC4xmOmbY/fIXh1IGgSR2lglT+IwaQql/eNwyBxqIoC56UFzbfWd/aAsdz1PCB4kHlC3FYfS2YP45HaQgrpsGJTXhOLTJRG3FVe8/2VRtby5+XAdQipQyyI2kBL6BKeWzVt447eHR7dQyoZHvw32vOBtZ2MAhNj+nfoHo2h6LVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780340606; c=relaxed/simple;
	bh=Xy4hlY0vc8Y/1Bgjg3VPJmT0/ndZEGMNkyDTQCQA7n0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i3C70gd71RxnyvQrgMt6VIXdqQS3gjz4DT4FcqHSz5itJE23+8fAc/aaMtt4ogLuyVk+K3kU6o8d7pG5rtYb1CzfUBdCHTiSUDw/iC1tcLVPmohQIjksNuse6tzDQadxZi66cBhAnFfDZ/Y6yd8lqXuKg30lfPOtvhe9YZ5X5Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Lo/+Tjsj; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2586E40E49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780340604; bh=vPUhMWvV+3Qn87/+MO1lptRZFgblDPHPj7D/5ZC5G8M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Lo/+TjsjPgy6jWN45sBLTTo8agfY8DOwGCN5eOF8dVO7XJY1HJ0xgz6LKYq7U4e6E
	 RJPn7hJn8WSeDG7EULxiS34j7Z/yd+4nSAxNbgW/xU6qAwdKcetIylBW9aUuPD4ZwA
	 ODdL33xxgAZ5W1eDOmUTqTeub14rKkbETSy50Z9q/SjzbPqxHPXzXVQkSwetyIN3h4
	 BjZOw/ajZUaombkfuFhBpC20yqAv2Y3YmPVgpR1SpibtleL6iF2p1pCzx3qN6Nx7d0
	 IdobAUPAs7qqH+A0JondVF36X9WEPBUNc2cm59pIT1OBnhjhIAY6HxJLSgR9Qg+6Q3
	 pT5JjOuAm2SQA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2586E40E49;
	Mon,  1 Jun 2026 19:03:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: Re: [PATCH v1] docs: sonypi: Fix stale header file path
In-Reply-To: <20260531135850.4113774-1-costa.shul@redhat.com>
References: <20260531135850.4113774-1-costa.shul@redhat.com>
Date: Mon, 01 Jun 2026 13:03:23 -0600
Message-ID: <87tsrm84n8.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90387-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,trenco.lwn.net:mid,lwn.net:dkim]
X-Rspamd-Queue-Id: AE9D66246CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Costa Shulyupin <costa.shul@redhat.com> writes:

> The sonypi.h header was moved from drivers/char/ to
> include/linux/. Update the reference.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/admin-guide/laptops/sonypi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/laptops/sonypi.rst b/Documentation/admin-guide/laptops/sonypi.rst
> index 7541f56e0007..fb8f4a30ddce 100644
> --- a/Documentation/admin-guide/laptops/sonypi.rst
> +++ b/Documentation/admin-guide/laptops/sonypi.rst
> @@ -89,7 +89,7 @@ statically linked into the kernel). Those options are:
>  			set to 0xffffffff, meaning that all possible events
>  			will be tried. You can use the following bits to
>  			construct your own event mask (from
> -			drivers/char/sonypi.h)::
> +			include/linux/sonypi.h)::
>  

I suspect this driver has not been used in a long time, but as long as
it's around the documentation should at least not be obviously wrong.
Applied, thanks.

jon

