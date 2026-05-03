Return-Path: <linux-doc+bounces-85575-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NHPFJ9u92kXhwIAu9opvQ
	(envelope-from <linux-doc+bounces-85575-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 17:49:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0934B6523
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 17:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B273D300A380
	for <lists+linux-doc@lfdr.de>; Sun,  3 May 2026 15:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0748F39659A;
	Sun,  3 May 2026 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XzNZnuWO"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE04E37D108;
	Sun,  3 May 2026 15:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777823386; cv=none; b=GdHczF/NkgMuJ1olxqRLR6LXKcqi23wkDZgQQLo4GYS7a95wgRg3kGV1wHe3u9o9IJMD/Aowms+Dyw7mfY6phsnXsU2qWUCLKSisxY+ghHwmJakAUH99DFV91J0S8QW2UPfge9nCsDMkKXEX5a1uXwIgZN04z/keC9hHBpzdHs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777823386; c=relaxed/simple;
	bh=RDxXyby5jaTtmik7CmFLeKp/NnpDI0QYF//KGQkZcP0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JE+WXKhhv62aYmv8/qskIS0MBHyGLYaw43QRkUpndkLC64InXo6B+ptoyfthwA2S9wLF83Z/VmnSKy/+PyWUleyMMaZ0Tsm5/kHuKYSq/h4S+wJeEq2PKXXrT0iIKqM971+fLt+oEZ39WyKbswgg9dSn/ymgRh43pUcsgAaJSOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XzNZnuWO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 79A9541084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777823385; bh=eUBtAkliWo7i/sWVQgdPYh5z/4C4V+lwPevehSBP+nY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XzNZnuWOaLrDGZPmdknv8VRbuHLT3VllHLzEnVWBPAk9UORi8sVvmJ3b+pFgJdn36
	 reK7NjyFWnX5GRYo6Pf9lBFBdSXzzrl6flyBP/5xMWWUo1/yLlJqRYulIV6jiB53ue
	 Cw4H3KQkuTw4QZbOVm1KMrjRDvVoSW60ZZdMpUlC8esU8JfT1+QzjA4BrsaiyRutHI
	 rOwAFZp44GoZifu/HtcWATteUeQU7VhxEOVxD0+lq5F93AkLt0FyGAwHz4xVMCGwKz
	 +2ZODrVjLQXSHcB/mFL6C0vNIVR4Q36uoKTaD4wSWn/m2GnpmiNRaPXcLrmtDgajUc
	 RNPkAbo0iteYw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 79A9541084;
	Sun,  3 May 2026 15:49:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Albert Ou
 <aou@eecs.berkeley.edu>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, workflows@vger.kernel.org, Alexandre
 Ghiti <alex@ghiti.fr>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, Dan Williams <djbw@kernel.org>
Subject: Re: [PATCH v4 00/10] Auto-generate maintainer profile entries
In-Reply-To: <cover.1777295258.git.mchehab+huawei@kernel.org>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
Date: Sun, 03 May 2026 09:49:41 -0600
Message-ID: <87lde0bii2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 6E0934B6523
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85575-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,trenco.lwn.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This is basically the same patch series I sent during the merge
> window, rebased on the top of post 7.1-rc1 docs-next branch.
> It is tested both with and without O=DOCS.
>
> It contains just one extra trivial patch adding a missing SPDX
> header, and, on v4, I dropped two patches touching MAINTAINERS,
> as those aren't needed anymore.
>
> This patch series change the way maintainer entry profile links
> are added to the documentation. Instead of having an entry for
> each of them at an ReST file, get them from MAINTAINERS content.
>
> That should likely make easier to maintain, as there will be a single
> point to place all such profiles.
>
> The output is a per-subsystem sorted (*) series of links shown as a
> list like this:
>
>     - Arm And Arm64 Soc Sub-Architectures (Common Parts)
>     - Arm/Samsung S3C, S5P And Exynos Arm Architectures
>     - Arm/Tesla Fsd Soc Support
>     ...
>     - Xfs Filesystem
>
> Please notice that the series is doing one logical change per patch.
> I could have merged some changes altogether, but I opted doing it
> in small steps to help reviews. If you prefer, feel free to merge
> maintainers_include changes on merge.
>
> There is one interesting side effect of this series: there is no
> need to add rst files containing profiles inside a TOC tree: Just
> creating the file anywhere inside Documentation and adding a P entry
> is enough. Adding them to a TOC won't hurt.

One thing I kind of dislike about these magic mechanisms is that we end
up with a single, essentially unsorted list of stuff that readers have
to go digging their way through.  It would be nice if we could somehow
apply a bit of structure; as the number of these handbooks grows, our
readers would appreciate it.

Oh well, one can always hope.  Meanwhile, this seems useful, I've
applied it.

Thanks,

jon

