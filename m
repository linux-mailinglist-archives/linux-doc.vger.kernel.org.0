Return-Path: <linux-doc+bounces-1391-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FA17DBE49
	for <lists+linux-doc@lfdr.de>; Mon, 30 Oct 2023 17:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 844ADB20C24
	for <lists+linux-doc@lfdr.de>; Mon, 30 Oct 2023 16:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8C818C3B;
	Mon, 30 Oct 2023 16:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VlIQ4m6G"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB99118B10
	for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 16:53:16 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29ADCF1;
	Mon, 30 Oct 2023 09:53:13 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 57AED377;
	Mon, 30 Oct 2023 16:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 57AED377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1698684793; bh=QRgAQrH62j72CYNaUq0Va4PHddd9yeJq/c0nZSGCl18=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VlIQ4m6GMC9A9wm4x6Q4yiBb10yt7WmKGqvrkrY1o4P2bNUPfhCGd73CEBEuJd6+j
	 ObpQyw5M9JoNTKJ2hxSqf3QVFCFq4RpPwVMJH4D7yAkFChgZyCcwB52/JqexxsND4r
	 K+Mp6tpToHsOpq61JtByWWHxEWbt7u/d9IpMV7M+Iw20H9LYzhh15dJljifbpmXRvw
	 2fGUo+fSPNqwwG1LN5bjmaSGIYRJbswJzND4XFqTezBzXuJpyfHYEnhy/AzfPqL4tV
	 BrO//5IZl6SG/B9VVtgVn8oH6GV32Hma/ay/js1HCN6OgawbWEMcgbz7gKjEvjWJL8
	 X4FT/P5MR5QXA==
From: Jonathan Corbet <corbet@lwn.net>
To: Yujie Liu <yujie.liu@intel.com>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Swarup Laxman Kotiaklapudi
 <swarupkotikalapudi@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] scripts/kernel-doc: Fix the regex for matching -Werror
 flag
In-Reply-To: <20231030085404.3343403-1-yujie.liu@intel.com>
References: <20231030085404.3343403-1-yujie.liu@intel.com>
Date: Mon, 30 Oct 2023 10:53:12 -0600
Message-ID: <87il6o3vd3.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yujie Liu <yujie.liu@intel.com> writes:

> Swarup reported a "make htmldocs" warning:
>
>   Variable length lookbehind is experimental in regex;
>   marked by <-- HERE in m/(?<=^|\s)-Werror(?=$|\s)
>   <-- HERE / at ./scripts/kernel-doc line 188.
>
> Akira managed to reproduce it by perl v5.34.0.
>
> On second thought, it is not necessary to have the complicated
> "lookahead and lookbehind" things, and the regex can be simplified.
>
> Generally, the kernel-doc warnings should be considered as errors only
> when "-Werror" flag is set in KCFLAGS, but not when
> "-Werror=<diagnostic-type>" is set, which means there needs to be a
> space or start of string before "-Werror", and a space or end of string
> after "-Werror".
>
> The following cases have been tested to work as expected:
>
> * kernel-doc warnings are considered as errors:
>
>   $ KCFLAGS="-Werror" make W=1
>   $ KCFLAGS="-Wcomment -Werror" make W=1
>   $ KCFLAGS="-Werror -Wundef" make W=1
>   $ KCFLAGS="-Wcomment -Werror -Wundef" make W=1
>
> * kernel-doc warnings remain as warnings:
>
>   $ KCFLAGS="-Werror=return-type" make W=1
>   $ KCFLAGS="-Wcomment -Werror=return-type" make W=1
>   $ KCFLAGS="-Werror=return-type -Wundef" make W=1
>   $ KCFLAGS="-Wcomment -Werror=return-type -Wundef" make W=1
>
> The "Variable length lookbehind is experimental in regex" warning is
> also resolved by this patch.
>
> Fixes: 91f950e8b9d8 ("scripts/kernel-doc: match -Werror flag strictly")
> Reported-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> Cc: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Yujie Liu <yujie.liu@intel.com>
> ---
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index d660e1f4b483..08a3e603db19 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -185,7 +185,7 @@ if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1') {
>  if (defined($ENV{'KCFLAGS'})) {
>  	my $kcflags = "$ENV{'KCFLAGS'}";
>  
> -	if ($kcflags =~ /(?<=^|\s)-Werror(?=$|\s)/) {
> +	if ($kcflags =~ /(\s|^)-Werror(\s|$)/) {
>  		$Werror = 1;

OK, I've applied this one and will sneak it into the 6.7 pull request,
thanks.

jon

