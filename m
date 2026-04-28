Return-Path: <linux-doc+bounces-84966-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BxQO4ay8GnsXQEAu9opvQ
	(envelope-from <linux-doc+bounces-84966-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 15:13:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 508294859DB
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 15:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1559F3076477
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 13:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4506642DFE9;
	Tue, 28 Apr 2026 12:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="itAPx/r+"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064793F65F1;
	Tue, 28 Apr 2026 12:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381050; cv=none; b=hQlgQ+DRFDDWJZhEoprFw91uqEWqujY5/Y5hzGDcgo9aEo9KWxqKuBqn4dQvIFYyG/zNpko8hCkNX8PEmNimKAL+nQ3Yi2Ui7gm5/d+Oz0GWp+vDVemk/7VWL6MZP6cBfkPB/CWiLt5kNSfTp7CvpFZ2aMbE/h/tRquYtfaKQ3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381050; c=relaxed/simple;
	bh=aUf61xyXEbsGC0AtdwUhpQw6NaGJQL89ZzqyewN5EF4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ihdask7rYobjeBCLByztlWS56dsr8y97S3B9Hbhwwx3A3W6xbAFnbh/xyUHCHw/TDRBVFda/3c61n7OiveSHlSjBqKd8kCzQy5Q96xOFQsLfZtOvBq6mdBtrqQP02c0WLgx6WzYkdSsqWECJ6nK2lh6iyfakCp6Uxq9GWKFVmXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=itAPx/r+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B9C9141560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777381046; bh=agh0BLn/BAWojBe08ajvmZB6iYzuf5WYtT6Ppff2jOg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=itAPx/r+FFyc9VwyejIK2RBN1zh7wnjLNy2qd5ZgqnqZtpzms5q01RbtX95Dtw17l
	 ckAQLDG0gB96CEB6j8dfPa6IRFY7S5KsIIRbeX+yYOGyXREs9FqoqwoBetsTTHECPY
	 kCgiJJ/wxeHsI4FoPcguCgb7oAuPv0yeSRGp9Q4NFRsFXTG8rog2kxCPB2LDUKkBg7
	 ilD6Ovm+EPlfpnWg1RK8XbbXplSibrKyusb7uLCPoD6hbukRViVTs7y6H1DIT9Mdfs
	 R6HXsYz8nV56v3tCJ9KnSZVFLeKKl2tFRUexkXk0F4tK7AaEZ7S4Lk/zP/7dKDgFkp
	 VdxOXRNtQdDng==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B9C9141560;
	Tue, 28 Apr 2026 12:57:25 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ilai Levin <levinilai972@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ilai Levin <levinilai972@gmail.com>, Marc
 Zyngier <maz@kernel.org>
Subject: Re: [PATCH] docs: driver-api: eisa: add SPDX license identifier
In-Reply-To: <20260428124555.102039-1-levinilai972@gmail.com>
References: <20260428124555.102039-1-levinilai972@gmail.com>
Date: Tue, 28 Apr 2026 06:57:22 -0600
Message-ID: <871pfzmedp.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 508294859DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-84966-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid,lwn.net:dkim]

Ilai Levin <levinilai972@gmail.com> writes:

> Add the missing SPDX-License-Identifier tag to the eisa.rst
> documentation file.
>
> Signed-off-by: Ilai Levin <levinilai972@gmail.com>
> ---
>  Documentation/driver-api/eisa.rst | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/driver-api/eisa.rst b/Documentation/driver-api/eisa.rst
> index 3563e5f7e..e98b21b60 100644
> --- a/Documentation/driver-api/eisa.rst
> +++ b/Documentation/driver-api/eisa.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +

This is probably just fine, but it's worth asking the original author
(copied) whether that was the intent; we can't just slap an arbitrary
license onto the work of others.

(One could also ask whether we need this document at all in 2026, but
that is a separate question...:)

Thanks,

jon

