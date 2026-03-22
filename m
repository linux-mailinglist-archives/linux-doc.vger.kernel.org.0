Return-Path: <linux-doc+bounces-80578-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPCmJ8pWwGl4GgQAu9opvQ
	(envelope-from <linux-doc+bounces-80578-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 21:53:30 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C372EAC59
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 21:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 760EF3008D3C
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 20:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5531333F5BC;
	Sun, 22 Mar 2026 20:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="BCh0PH0I"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D1927FD44;
	Sun, 22 Mar 2026 20:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774212798; cv=none; b=L0K9Dgm+JHX6w98bubYOOA8TnrUPT+DhiDBjRklLQCKUlUAn1Ve9KMWp1Lo2O/R6vyrEu2bTu2irN/cI8YuAczt0SU+OyEyPPVCOZkBBUYrpjH25OIX19iNmbphUs7xw7KS+dLFXDRoFiY7+oKJbAuIze5q6UVz41uQIy09Fvgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774212798; c=relaxed/simple;
	bh=K0TseoDJfj27TeW0hgJksRfZnKDKiZEvDxfbBoR3eoc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FoVrMDETzOUlkRllBrqh8NvKRONgBuT5/LAEOE5vRCx4NSf9ZDfO9/KaYlL7VntqE15owfNcUaeBtTZTggJTbl7a7QDym1sW+zksVmhlDm0ZVkf/luaec42g/mT3FK6ziQ95ZrazHpHEoOKZ4CpqZJ5uMww+/xhRzqr74uD+NMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=BCh0PH0I; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7C584411E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774212796; bh=kVFwZCuR+IoKjLPlwhT5pETmVhvtzHuWlvUbqLlgWcE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BCh0PH0IHbUg8eX75GyRTzUezQxD/l+Ls7aEQLTgoZ1mYOyEQZH7jfZ1Fqx+Ut+nF
	 e33y36EksZ0s6Ykw0dOMhSRzne2dUpRbrHukkwVeLIfAbvEni+CwwADxaXFJ0nqY67
	 SDnVzKEkgHbv7WT+Y+iCbHDbOKdT99a/JFZCK0WzDvpuCJtt2/ZVMJZ3GVsBi5w7Pe
	 7MvynNEyemTOxzAdDm2pLihZft0N0w5H3ys2+p2M+PhaXEZrzziXHPH0hBo2RvsmoT
	 ZykpwF4PwZ5DZl6YrMxvy2bbcH1cs90azjaCq14IpC/nm9g9euA12NXQrZkxomzDVl
	 vJtq4uUVqy3aA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7C584411E2;
	Sun, 22 Mar 2026 20:53:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
 cocci@inria.fr, Nicolas Palix <nicolas.palix@imag.fr>, Hu Haowen
 <2023002089@link.tyut.edu.cn>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Federico Vaga
 <federico.vaga@vaga.pv.it>, Carlos Bilbao <carlos.bilbao@kernel.org>,
 Avadhut Naik <avadhut.naik@amd.com>, LIU Haoyang <tttturtleruss@gmail.com>
Subject: Re: [PATCH v2] coccinelle: update Coccinelle URL
In-Reply-To: <20260310121431.362091-1-Julia.Lawall@inria.fr>
References: <20260310121431.362091-1-Julia.Lawall@inria.fr>
Date: Sun, 22 Mar 2026 14:53:15 -0600
Message-ID: <87ikand1s4.fsf@trenco.lwn.net>
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
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,inria.fr,imag.fr,link.tyut.edu.cn,kernel.org,linux.dev,hust.edu.cn,vaga.pv.it,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80578-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,inria.fr:email,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: F2C372EAC59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Julia Lawall <Julia.Lawall@inria.fr> writes:

> The LIP6 URL no longer functions.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>
> v2: corrected the character encoding, no other changes
>
>  Documentation/dev-tools/coccinelle.rst                |    2 +-
>  Documentation/translations/it_IT/process/4.Coding.rst |    3 ++-
>  Documentation/translations/sp_SP/process/4.Coding.rst |    3 ++-
>  Documentation/translations/zh_CN/process/4.Coding.rst |    2 +-
>  Documentation/translations/zh_TW/process/4.Coding.rst |    2 +-
>  5 files changed, 7 insertions(+), 5 deletions(-)

Applied, thanks.

jon

