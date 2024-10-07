Return-Path: <linux-doc+bounces-26676-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1F6993491
	for <lists+linux-doc@lfdr.de>; Mon,  7 Oct 2024 19:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A92841C23BA4
	for <lists+linux-doc@lfdr.de>; Mon,  7 Oct 2024 17:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B74F2AD05;
	Mon,  7 Oct 2024 17:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="l4KxShK2"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8A54206B;
	Mon,  7 Oct 2024 17:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728321312; cv=none; b=OO9T+QV41sY/IdIMXxlp2oFbWbrOstiuarrutwQXMw2yP2A1Lp5DpPt9U/feQTzQ81I9w+NURoAF2dHua9GRo08j+ej74sS/t8/IyCLjU9AzeOug99ygLgn/vGp1h7GYGVBtJKC7txmpnrG2Lb58327MH6VXA8IgDfTtqVX1WXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728321312; c=relaxed/simple;
	bh=00mryIRBvibRHOqXTg3rORxCVqOmCM8JQ/HjF0QejAA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hhck3p+a0cw6bz4wh/MloJbZovTzO3G5x99IchAPa5ucTNe6zGGtrijwIhT8TWgVkYvKfn/qaoMFhMnUPpnZ2NisaqO8xjGOik6vK1fCFbe9HRjqU/k27sAwYn3C/HvU71+Tb3s9JmRaZELzpaCjv+Y8Du9s6Wv+pOFRusHLYRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=l4KxShK2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3C63A42B38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1728321310; bh=IIY8m2TRYmRTYNrUvNLs7VtH3uwBH7HpUvyATNHs+hA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l4KxShK2kO2zPj06K2dkJy4DLOgUNHyo7SJZcBM49iUfC5NRn8kKhuxwrKSfnUfdR
	 +t7qN8XBaNfzkM3RA4EPZcLHRCSsJkkndGRbdEvayC4aDUE+Yf40nHfIz3X3pCoBne
	 2J39xwxiS7DelLCMCK6YJN2hk3ELN1LQ99q0orPVnYChTy3xyGm5WrazpEGBEP+6Us
	 ykJ07y5K5r1xD1FRmxXdDGoz03fxaI6Pq/QGmUhXufB/Go7tS1XJ2lOlf/F6ZvAOPa
	 K2Ehx0uJkSieXe7dkHQErjKYHVaXbhGkjAFKZ5co4q/6pPtQqwmK03Nvha95CFgUOJ
	 ZVWJR/WWvsgMw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3C63A42B38;
	Mon,  7 Oct 2024 17:15:10 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Lucas De Marchi <lucas.demarchi@intel.com>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] Documentation: core-api/cpuhotplug: Fix missing prefix
In-Reply-To: <20240927185229.2362599-1-lucas.demarchi@intel.com>
References: <20240927185229.2362599-1-lucas.demarchi@intel.com>
Date: Mon, 07 Oct 2024 11:15:09 -0600
Message-ID: <875xq3kf6q.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lucas De Marchi <lucas.demarchi@intel.com> writes:

> Add the missing cpuhp_ prefix in cpuhp_remove_multi_state().
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  Documentation/core-api/cpu_hotplug.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
> index dcb0e379e5e8..33e8e80b5e00 100644
> --- a/Documentation/core-api/cpu_hotplug.rst
> +++ b/Documentation/core-api/cpu_hotplug.rst
> @@ -616,7 +616,7 @@ ONLINE section for notifications on online and offline operation::
>     ....
>     cpuhp_remove_instance(state, &inst2->node);
>     ....
> -   remove_multi_state(state);
> +   cpuhp_remove_multi_state(state);

Applied, thanks.

jon

