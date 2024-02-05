Return-Path: <linux-doc+bounces-8426-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3360284A094
	for <lists+linux-doc@lfdr.de>; Mon,  5 Feb 2024 18:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 658C81C221EB
	for <lists+linux-doc@lfdr.de>; Mon,  5 Feb 2024 17:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3CB1D69D;
	Mon,  5 Feb 2024 17:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nidtQxCV"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D07482E1;
	Mon,  5 Feb 2024 17:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707153773; cv=none; b=EOvdWW2RTNamOSu6HolYkcC0a6hFf5hLPOreV5gn58ZTZ1QbqW66Y82og/k8VW9Zb1UWGIeYQx/Tu90Q7jtTbmSeBCVrqfaO6gm842WD/L10UAhCqRggYL4VcueFtfG8BFhwB0kCS6gST5PR3kEReztZFED4E8oC85OrQdXZ8Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707153773; c=relaxed/simple;
	bh=hIRSfmrQg0Rn/nYcx47/cZU9CRerlJJPETPX4UA4gqQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PEhqNZuPg0sGYNFCirovhZHiSyJZ+G/H9/2PLauDstRDOuZeJzgIl/eeo0XnjEQK+qIKIgemyiTdh2KkR1NiLQnM/wqoy5oq8ExYBWEFlh8qqUmYpfiSiKcQgW8CwOcWmjURBWxWeeQSYl99jykW4mN8ZuMeioZN3P3i4gCuRAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nidtQxCV; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6E1FE47A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1707153771; bh=MCk4AMP7OTPhC5gw4fooEf9VsrtizbEaHd64UMSzPt8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nidtQxCVgS1Mjo9RVySalTR77hYfvnkqTIjGHxtiKlU/1cDSm3p+kNOJpsmFmxwzp
	 FnkQ8OAuJlzWlPk6boNxi/z7m58tPeDSQodCpzOjysPfZuTee6EeKBKUVtpBq8/spl
	 M8ySiAWlTIkxn09KJzTmBLXniXHvh0VQPpE6DMfYLlY5Bw5Gf2XGGKSmYhdhtCMveo
	 deBPQ8chsER//FIC+gBHGbrL2UUGsVjnMc6DISV4uGOk4nGEwuVLs5a6w4RVC+XVqJ
	 lSTEg5BaqxXHFif8B8JZp4hcJCsKhUoYkNHwnVmkxuu8B8H6f2iYE7NQvlGmjA9mdI
	 EYnPUtIt/d9PA==
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6E1FE47A9F;
	Mon,  5 Feb 2024 17:22:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Blum <thorsten.blum@toblux.com>
Subject: Re: [PATCH] Documentation: coding-style: Update syntax highlighting
 for code-blocks
In-Reply-To: <20240203223926.5077-1-thorsten.blum@toblux.com>
References: <20240203223926.5077-1-thorsten.blum@toblux.com>
Date: Mon, 05 Feb 2024 10:22:50 -0700
Message-ID: <87cytavn9x.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Blum <thorsten.blum@toblux.com> writes:

> Use c and elisp instead of none in code-blocks
>
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---
>  Documentation/process/coding-style.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index c48382c6b477..a75c7044d8b7 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -203,7 +203,7 @@ Do not unnecessarily use braces where a single statement will do.
>  
>  and
>  
> -.. code-block:: none
> +.. code-block:: c
>  
>  	if (condition)
>  		do_this();
> @@ -660,7 +660,7 @@ make a good program).
>  So, you can either get rid of GNU emacs, or change it to use saner
>  values.  To do the latter, you can stick the following in your .emacs file:
>  
> -.. code-block:: none
> +.. code-block:: elisp

Applied, thanks.

jon

