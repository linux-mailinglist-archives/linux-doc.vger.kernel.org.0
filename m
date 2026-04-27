Return-Path: <linux-doc+bounces-84700-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HGXILAx72mb8wAAu9opvQ
	(envelope-from <linux-doc+bounces-84700-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 11:51:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 980DD47028E
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 11:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CF993003515
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 09:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E113B27E9;
	Mon, 27 Apr 2026 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="dJ5FQ6tW"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3AF2FFDE1;
	Mon, 27 Apr 2026 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777283501; cv=none; b=slrsSUX4oWYZ9k2b46HYIKRFF9VnQOuRZCCJC92awWu3j5z4N2QNaxyhhPEqE8g5Tpc7IiaM3eOesLCUu72CT+Bf7B0g7Bc6wp6kO2ZenI0qd8JTvqoyTrJzgs5tffzeu02HM6Ql1VsKKtqrBndwKDWUpuokZEo1JYWEdjDAdAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777283501; c=relaxed/simple;
	bh=Kj6PQx4RerOpWgc0G4nt/I29ZZ1s0Mnhgll4A9+2ZFM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cZsq+m6x/irLaf49jO2mn/Ou3jWGhEbuGnsx+uQZcphc9eHq9Pi/+Rmc+x0aE5TN5cxJ25XaU5JHXpG5tUwFmcdL9M+EjirRgtCkRXHqDOELZmUlMNG0u/AxxWH3dWjQaasEkkVFxS3KDqtBcI6dbkzA8IbpNahsrQCmchoMM3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=dJ5FQ6tW; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D2FA542B3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777283499; bh=U24W61a/YNqgXNzTblTVizxNJMBlhwv2QrqYIkMe9VQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dJ5FQ6tWKgyAF6jjFtQ4OOOm4xXHPG9W6DpztzKlFulKnALB/vCJHqDaL6vYOEa6v
	 KoKEFzsJSm7fiDeXLA/0jqRZEEcgAKJyCz9IS1R0WDpTtWhOxYUWVq8oHMPHj9JgVw
	 UY/kP8z82suf68ewf3WON44ZRJ9WhRXgLd/pkLo9kjZvCLpIPjujNSmyk4jPAAQSSR
	 xUdmlsL8Z3tED1QPpjrTep5ax5O7hR77R+9QHlYUMBR7GTKUkd28hlevSrtwoxqRbz
	 3ThM6Sn+HELH9tMzOURezCwLo5TXZts0lYuNWDdudpymU47qsa1WQlE1hl43GbOnfK
	 EuxaekXVzq/cg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D2FA542B3D;
	Mon, 27 Apr 2026 09:51:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, Kees Cook
 <kees@kernel.org>, linux-kernel@vger.kernel.org
Cc: workflows@vger.kernel.org, linux-mm@kvack.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [PATCH v3 3/3] Documentation: deprecated.rst: kmalloc-family:
 mark argument as optional
In-Reply-To: <20260424175740.258522-2-manuelebner@mailbox.org>
References: <20260424174743.257951-2-manuelebner@mailbox.org>
 <20260424175740.258522-2-manuelebner@mailbox.org>
Date: Mon, 27 Apr 2026 03:51:35 -0600
Message-ID: <871pg0ras8.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 980DD47028E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84700-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email,trenco.lwn.net:mid]

Manuel Ebner <manuelebner@mailbox.org> writes:

> put the optional argument (gfp) in square brackets
> add whitespace for readability
>
> eg. ptr = kmalloc_obj(*ptr, gfp);
>  -> ptr = kmalloc_obj(*ptr [, gfp] );
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/process/deprecated.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index fed56864d036..b431993fd08e 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -392,12 +392,12 @@ allocations. For example, these open coded assignments::
>  
>  become, respectively::
>  
> -	ptr = kmalloc_obj(*ptr, gfp);
> -	ptr = kzalloc_obj(*ptr, gfp);
> -	ptr = kmalloc_objs(*ptr, count, gfp);
> -	ptr = kzalloc_objs(*ptr, count, gfp);
> -	ptr = kmalloc_flex(*ptr, flex_member, count, gfp);
> -	__auto_type ptr = kmalloc_obj(struct foo, gfp);
> +	ptr = kmalloc_obj(*ptr [, gfp] );
> +	ptr = kzalloc_obj(*ptr [, gfp] );
> +	ptr = kmalloc_objs(*ptr, count [, gfp] );
> +	ptr = kzalloc_objs(*ptr, count [, gfp] );
> +	ptr = kmalloc_flex(*ptr, flex_member, count [, gfp] );
> +	__auto_type ptr = kmalloc_obj(struct foo [, gfp] );
>  

Marking the GFP argument as optional is fine, but the documentation
should surely say what the default is.

There are, of course, other kmalloc()-related entries in that file that
could use an update, but that is a job for another time, I guess.

Thanks,

jon

