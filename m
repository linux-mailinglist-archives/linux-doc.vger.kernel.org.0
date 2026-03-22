Return-Path: <linux-doc+bounces-80580-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFW6NVRXwGmXGgQAu9opvQ
	(envelope-from <linux-doc+bounces-80580-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 21:55:48 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5A52EAC78
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 21:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B41873009537
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 20:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0621B37BE7F;
	Sun, 22 Mar 2026 20:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WY/tF6tN"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CED37D13E;
	Sun, 22 Mar 2026 20:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774212945; cv=none; b=WuJ+eBCKRr7yzNi9Oev4AI8G3fNuo1bwdoN3j0qUe4Ha4OwqFUpnqwPfAPKSw55lIoaKG1nwcb3wWhmBJWzk9xWVh6299M4apVZOkOJIdJOPRh2psYLMMKEsyXUTxySEddTDHGRo8D4TsUPjtFLd+l81H1yFknkoO5QXDfovTgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774212945; c=relaxed/simple;
	bh=IbE8kkvajd51Ibyhpa8/n3i1gb1StWjUlN3RkdaNvP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gnvMRbKSUNU+OlAPAahrOVhW3XtmupXBCX6qhDMgDJLK0hLzmcDcXuX2pxes0+ayyNZKDWLCXK/Qk1Cj1L1tmbjvDQkLJJI6UTuWnzHwTX0FqrErQbJZ9hCuDPYZJX3CnuRqkcAN0TdropA4moHpSa588vAy2uaJzt4A+tC6d6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WY/tF6tN; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0E832411EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774212944; bh=7tYXKxUzJE3bdobzywM4oKr0jM4HKS6+lTz1moorohU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WY/tF6tNtZyM8o+N/vKhYYh9tZHXC+Qg1Fr4yicsbLYrPq7jP1Co3VOhjXjVskEmC
	 NJkiAlddLuTO4FyaBaMxukC2IJdqORM9x1bBlfjzlarijITP+BtiAmR91T3ZS9mX3Z
	 LMxYsiSdnQSWbAHhcBQI2YHUyv0j12yqDYwKuyCcIEFPx3wxyjVz4VvnQQaSkTpV1Z
	 ss2WAWWgCSe4T/hz/qTqh3kSL5L0F5eFS5X+ckSg1DpN4W/TEoaM0Jy1/+rWuN659J
	 zcDfBtEooPVQguCQmdV5/N0wp3imOhS1zphc1jIgFQdrutcD6GU7K6euaxwRklF+xx
	 gEV/XWXhYv6jA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0E832411EA;
	Sun, 22 Mar 2026 20:55:43 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: LIU Haoyang <tttturtleruss@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Dongliang Mu
 <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>
Cc: LIU Haoyang <tttturtleruss@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/docs/checktransupdate.py: fix missing prefix in
 f-string
In-Reply-To: <20260308104135.9037-1-tttturtleruss@gmail.com>
References: <20260308104135.9037-1-tttturtleruss@gmail.com>
Date: Sun, 22 Mar 2026 14:55:43 -0600
Message-ID: <87a4vzd1o0.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-80580-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,hust.edu.cn,linux.dev];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,trenco.lwn.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checktransupdate.py:url]
X-Rspamd-Queue-Id: 3C5A52EAC78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

LIU Haoyang <tttturtleruss@gmail.com> writes:

> Add a f prefix to f-string in checktransupdate.py.
>
> Fixes: 63e96ce050e5 ("scripts: fix all issues reported by pylint")
> Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>
> ---
>  tools/docs/checktransupdate.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/docs/checktransupdate.py b/tools/docs/checktransupdate.py
> index e894652369a5..bf735562aeeb 100755
> --- a/tools/docs/checktransupdate.py
> +++ b/tools/docs/checktransupdate.py
> @@ -131,7 +131,7 @@ def check_per_file(file_path):
>      opath = get_origin_path(file_path)
>  
>      if not os.path.isfile(opath):
> -        logging.error("Cannot find the origin path for {file_path}")
> +        logging.error(f"Cannot find the origin path for {file_path}")
>          return

Applied, thanks.

jon

