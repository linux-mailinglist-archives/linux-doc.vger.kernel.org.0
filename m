Return-Path: <linux-doc+bounces-79762-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGt+EgFnuWmaDwIAu9opvQ
	(envelope-from <linux-doc+bounces-79762-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 15:36:49 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E767B2AC18C
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 15:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05A783015EFC
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 14:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE493E7151;
	Tue, 17 Mar 2026 14:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="K1rFqdUa"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C18B3E7146
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758201; cv=none; b=ir4Vx43S5zx3gSACgPjrUYWtIKWUKrtfrhpberAyBjhg5369veh3bmtS8uFmAet9h5B2Tg+XK2jYaKvFa+WVGdRTyQuON7YPAfw3AYuUerDnrh0IhkLq1+ufxj78nMpxBCSti6h4bwdvJYN/7fvhhE/hOXr5Pb8tojFibi3n2/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758201; c=relaxed/simple;
	bh=j9d7/F/ris32+IPvmbPvEkEe4I3WkNIJDmrLxKVIkg4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VQcqOG2XDg96BmecerIuMlIsjEcz18dlqAwAJYla/lkuoAttII6MIS6ycerFeyqeeGDHTlHwM3mgoQvjlEO5Sy8+MM4RHB0A0kSonCvCS6PeO0jH2UevlTmDlZJR1YEiLpkYYe2uTeZQ8xRsYhvfrX0fVn9pLH1FUykQba/KCVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=K1rFqdUa; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0F97B40C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773758194; bh=CIkkbEf5QjHSLh9Z//b+7KAfHX6jvj5XCKqA8mG/SnI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=K1rFqdUaoEubIveYxtZCq6X/bQxercIV+MC3yFGezlfk6PQCNSyv3dZvih6Eum3oQ
	 03Q/ixXZULozTSIJehWlxDW/YSkjkk3rVQlSL+yqBEhsRQYONvcULpGFy8ztEH+nFv
	 hngWSnOWncP3e7X8x28u5jVILRbYZWWZaM9n76224kLcg/zX1kdd7xvkCF6ruMR2DH
	 sQzwNXR4CawDhRMZBKSQ0iw61YYGE/RiDf9bVEov4dIwNcbiWv8iU1HgiM0g2Xld/D
	 tpJ+jRqoOPVOKOeDNfiX5xubhetyjugHF+wR+6H2zbKFjhrXkQAga7GNlRQv81oUnb
	 vtk0rN26rIIgA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0F97B40C7C;
	Tue, 17 Mar 2026 14:36:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>,
 linux-doc@vger.kernel.org
Cc: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: Re: [PATCH] Documentation/mm/hwpoison.rst: fix typos and grammar.
In-Reply-To: <20260317120614.51046-1-islamarifulshoikat@gmail.com>
References: <20260317120614.51046-1-islamarifulshoikat@gmail.com>
Date: Tue, 17 Mar 2026 08:36:33 -0600
Message-ID: <87eclied5a.fsf@trenco.lwn.net>
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
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79762-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E767B2AC18C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ariful Islam Shoikot <islamarifulshoikat@gmail.com> writes:

> Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
> ---
>  Documentation/mm/hwpoison.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/mm/hwpoison.rst b/Documentation/mm/hwpoison.rst
> index 483b72aa7c11..71b4b45c3505 100644
> --- a/Documentation/mm/hwpoison.rst
> +++ b/Documentation/mm/hwpoison.rst
> @@ -38,7 +38,7 @@ To quote the overview comment::
>  	for the mapping from a vma to a process. Since this case is expected
>  	to be rare we hope we can get away with this.
>  
> -The code consists of a the high level handler in mm/memory-failure.c,
> +The code consists of the high level handler in mm/memory-failure.c,
>  a new page poison bit and various checks in the VM to handle poisoned
>  pages.

I have applied this, thanks.

For future reference:

 - Please include a changelog describing the changes made and why
 - Run scripts/get_maintainer.pl on the patch to get the correct
   recipient list.

jon

