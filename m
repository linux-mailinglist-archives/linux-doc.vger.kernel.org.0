Return-Path: <linux-doc+bounces-32684-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FD79F11F0
	for <lists+linux-doc@lfdr.de>; Fri, 13 Dec 2024 17:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5919F16A4E9
	for <lists+linux-doc@lfdr.de>; Fri, 13 Dec 2024 16:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA4A1E411D;
	Fri, 13 Dec 2024 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RqKppRRD"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B531E3DFE;
	Fri, 13 Dec 2024 16:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734106860; cv=none; b=kuykCcAXrGAKDKCmCpQTV2ccvGdGCG89PVkEc8BJGH0nLZmUdkMy4vdUzHp9WqBSEsUs+l7U1gGtps7qo/SQmshdsowsQEAyaMfGC6URkq5a/q6iOOWo/tMObjx3NGgRTYeeJ4YHk8cCJCc+AyH877H5SII35cz4uTwhJNbS8Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734106860; c=relaxed/simple;
	bh=TEXPzM+iRMrHlQTH/p7rqGnDvgA0ZXfF96gnvJv5z5w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AVGGTW6xOSipqdJn7n3mXNphNPoCh8Y2HI8Ht7tSOhmc7hCMUjE0hXVL2G93BTLejqS4k91XMi0Q1cJv/POQz6EEfk+AbZXgjIjQzzpzzXskKzHboMHDcRIdacpo/jMRJG7WZYaKWwvAKZYGa4i0jEW6/5LP1FUQjskV/cc+ta4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RqKppRRD; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8C9AB403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1734106858; bh=sQluaJQRv0RcwlIkBISjIR6MBrbnfkMSzi+aShEPqfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RqKppRRDrDvkQTOGZOgHyL+6YThG2TbF12K5SOi2K6f3KuYpd831w/GHHLRFw7iHy
	 /CxtN9el01Z3R+Wd/njtlQH06Hx1rR32UK+fj9bZNGKL/xTUhb/AH+jHf0fkV4h3+l
	 fFJp4c8FXy1XvN9ki/7pmvCSSClczQZj/JJAzObwlXTSrzWA+SS5txhOWS6vxwrsQm
	 UgOSvIWtW6Zmh6vQhw7gJjxmx5up9VAdHSl1blHPgeLzhxQpA2lTyMiV5FUylO0Il3
	 d70pQ7zFWg3XWEpSD2pAxNWJr9XdeMc7qq3u/1pBU68c70Ed3MjXyXSdfHSjfCoiiF
	 m/EgQ6QCSB8xw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8C9AB403FA;
	Fri, 13 Dec 2024 16:20:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
 regressions@lists.linux.dev, linux-doc@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg KH
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 3/6] docs: 6.Followthrough.rst: interaction with
 stable wrt to regressions
In-Reply-To: <d7793d2e788e7d98a67e90f85a77d42dab1b8da1.1733825632.git.linux@leemhuis.info>
References: <cover.1733825632.git.linux@leemhuis.info>
 <d7793d2e788e7d98a67e90f85a77d42dab1b8da1.1733825632.git.linux@leemhuis.info>
Date: Fri, 13 Dec 2024 09:20:57 -0700
Message-ID: <87ed2bwo46.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> Add a few notes on how the interaction with the stable team works when
> it comes to mainline regressions that also affect stable series.
>
> This removes equivalent paragraphs from a section in
> Documentation/process/handling-regressions.rst, which will become mostly
> obsolete through this and follow-up changes.
>
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> ---
>  Documentation/process/6.Followthrough.rst     | 22 +++++++++++++++++++
>  .../process/handling-regressions.rst          | 19 ----------------
>  2 files changed, 22 insertions(+), 19 deletions(-)
>
> diff --git a/Documentation/process/6.Followthrough.rst b/Documentation/process/6.Followthrough.rst
> index f9ae3a86ee0c49..763a80d21240f0 100644
> --- a/Documentation/process/6.Followthrough.rst
> +++ b/Documentation/process/6.Followthrough.rst
> @@ -234,6 +234,28 @@ On procedure:
>     requests again should ideally come directly from maintainers or happen in
>     accordance with them.
>  
> +Regarding stable and longterm series:
> +
> + - You are free to leave handling regressions to the stable team if the problem
> +   at no point in time occurred with mainline or was fixed there already.
> +
> + - When receiving reports about regressions in recent stable or longterm kernel
> +   series, consider evaluating at least briefly if the issue might happen in
> +   current mainline as well -- and if that seems likely, take hold of the
> +   report.  If in doubt, ask the reporter to check mainline.
> +
> + - Fix regressions quickly in mainline, whenever you want to swiftly resolve one
> +   that recently made it into a mainline, stable, or longterm release; in urgent
> +   cases hence involve Linus to fast-track fixes (see above).  This route is

I'm not quite sure what that sentence is intended to say.  Might
something like s/quickly/first/ better convey the intent?  Maybe also
s/want/need/ ?

Thanks,

jon

