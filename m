Return-Path: <linux-doc+bounces-32687-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8939F1203
	for <lists+linux-doc@lfdr.de>; Fri, 13 Dec 2024 17:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE9BB188CBFB
	for <lists+linux-doc@lfdr.de>; Fri, 13 Dec 2024 16:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19E91E4106;
	Fri, 13 Dec 2024 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qXJyM87j"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D52B1E47A5;
	Fri, 13 Dec 2024 16:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734107088; cv=none; b=PI8kZHpopB+TvJG94i0+RhtCfOqxhn7ar6yifFshTrFs0NaxznNuBmGNgVKpcKCwv8e8lrYfywNnREmkkDPxFnxQY+dJCz9VyjtlkoZire1vLM1oUGzNZ4Gpy034FMxB8QkVm7tlRXfzUM3QC6XOTVMhGCyjTuar0qOzTd91IJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734107088; c=relaxed/simple;
	bh=vDy2n6+GLlsnyrG9vnR9n+Xn2UlVlbNJOWGw5dx1w0g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UR7391XAnvIznn/e42nTZz2ufn/uqv5umxpe7EaLiIPgye++xw0k74y9T2SYouQKWI5MoceLNRX5c6cyKbM1rTozTX5w0wtBv+USlt/qEPR+cnmGHRHSCT+g1jawYoOT6YzZHWE7vBrRbnZLvTkNlykkKBu5eh6ulgRfV8KbK2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qXJyM87j; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6DB1A403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1734107085; bh=p7OWvQr1zt2I+sA5TaKD6BpceFenBaKfbrqoO0W1ET8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qXJyM87jimCuwYzlURfmTfeMI887bPWgZDoOcywr0IeEStGDwwDZOyXohAN0D7uFB
	 1IjsCNxgo+OTQB8QxNaJh8CcnHCI2qb3KU5z26oK1bwDwNu+M2DmzW4I9gqxfrrnZd
	 NINFynb5b4ZPvfQ1XKPLt9aXEV9s0dl4QKuH/RVerKLbgluDmgWrC/3loA4wAaOQ5Y
	 9w2Icy1WECW851uKphtdlSlIv7Z1R4pH47yKZ16uYQzDKU9Loc6rTdbyNLv5TZvUVU
	 4XfsxdU0M2NB3J3l3lP7nA9nNWqIdkBiQn5yxioL3HqpLD5AEZ2lW606oBDI9MHG2k
	 xm39MSnFTeR3g==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6DB1A403FA;
	Fri, 13 Dec 2024 16:24:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
 regressions@lists.linux.dev, linux-doc@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg KH
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 4/6] docs: 6.Followthrough.rst: tags to use in
 regressions fixes
In-Reply-To: <5913a87f05a5fe53afb9aae151f60f83bda128e8.1733825632.git.linux@leemhuis.info>
References: <cover.1733825632.git.linux@leemhuis.info>
 <5913a87f05a5fe53afb9aae151f60f83bda128e8.1733825632.git.linux@leemhuis.info>
Date: Fri, 13 Dec 2024 09:24:44 -0700
Message-ID: <87a5czwnxv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> Add a few notes on the appropriate tags to be used in changes that fix
> regressions.
>
> This removes equivalent paragraphs from a section in
> Documentation/process/handling-regressions.rst, which will become mostly
> obsolete through this and follow-up changes.
>
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> ---
>
> Note:
>
> * Not sure if the "add a second Fixes: tag for the change that exposed
>   an earlier problem" is appropriate, but it results in the most
>   reliable solution without much overhead.
>
> * On a brief look it might seem like this changes the "participation in
>   stable is optional for mainline developers" approach. But that is not
>   the case, as the point is just kindly asking developers to take care
>   of stable inclusion.
> ---
>  Documentation/process/6.Followthrough.rst      | 16 ++++++++++++++++
>  Documentation/process/handling-regressions.rst |  7 -------
>  2 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/process/6.Followthrough.rst b/Documentation/process/6.Followthrough.rst
> index 763a80d21240f0..2ba16a71aba9b4 100644
> --- a/Documentation/process/6.Followthrough.rst
> +++ b/Documentation/process/6.Followthrough.rst
> @@ -234,6 +234,22 @@ On procedure:
>     requests again should ideally come directly from maintainers or happen in
>     accordance with them.
>  
> +On tags in the patch description of regressions fixes:

"regression" (no "s")

> + - Include the tags Documentation/process/5.Posting.rst mentions for
> +   regressions; this usually means a "Reported-by:" tag followed by "Link:" or
> +   "Closes:" tag pointing to the report as well as a "Fixes:" tag; if it's a
> +   regression a later change exposed, add a "Fixes:" tag for that one, too.
> +
> + - Did the culprit make it into a proper mainline release during the past
> +   twelve months? Or is it a recent mainline commit backported to stable or
> +   longterm releases in the past few weeks? Then you are kindly asked to ensure
> +   stable inclusion as described by Documentation/process/stable-kernel-rules.rst.
> +   Usually you want to realized thos by adding a "Cc: stable@vger.kernel.org" to

Something went a bit astray in that sentence.  "you want to do this" ?

> +   the patch description.  Note, a "Fixes:" tag alone does not guarantee a
> +   backport, as the stable team does not pick up all such changes and might
> +   silently drop them in case trouble arises.

In the past we have had subsystem maintainers who didn't want people to
put CC: stable tags into their own patches; not sure if that's still the case?

Thanks,

jon

