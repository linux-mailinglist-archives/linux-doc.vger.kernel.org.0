Return-Path: <linux-doc+bounces-96311-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id COTlGwhCUWqHBQMAu9opvQ
	(envelope-from <linux-doc+bounces-96311-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:03:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF5573D822
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:03:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b="hR1vOXq/";
	dmarc=pass (policy=none) header.from=lwn.net;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96311-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96311-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69542300B452
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 19:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C760B37B409;
	Fri, 10 Jul 2026 19:03:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB8023C39A;
	Fri, 10 Jul 2026 19:03:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710211; cv=none; b=THP/2w6ui8YSPpqeBAgOyeH8kQmwAZmdgj1o5B3/GB4nvWNbdcPtaGhWxfVtg5f83Vl/gTUI2gWqYj46OkhZywVFiOSjKjiIHveVSRFg3Kx/AERlr/lyPnb9CkKgbDbHPVS6ixnFmg+Z/tZb8wDoiL3K+Z/MO/mij1eX4HajKXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710211; c=relaxed/simple;
	bh=dVIykRxThZIfdpc3Oj9KiX+eT3O97dJH2yOHO9xm+e0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pu8L+0ogiWu+0ThUAryGYrWKhvXSA9WlGcaWZ2VsOfZRPaVoh6jpvFB0iEtFtUpn1jDOFYdVDDDrPsg4U/G+KIJ5FBMejtonAdnKsM3NUcnfVWRgZfQzzaWtUDAYn6zZIop6ik8lWZ0KX7Nn/xloWWD/CRz164QsBo6YtPC9hgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hR1vOXq/; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DF721415A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783710209; bh=8AGFxNLm+aqGmTBTs4iRTx1ZGg3Jvylh4ASaOUEjDl8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hR1vOXq/ugnc3LCxbBiiZpVSyics/HMDVV/gob4eKmzmEDf9S8TAd/shFen8NOJFM
	 1x3H9oU/bHJpXFPDVn+NUlFeW5aziS+cOq0y5NaUsT8JeTsP3UnF0jMKvMAeHLasvR
	 ZWuU2VLpRvaloVNSS7FKkeRD0iawI+a3nlboFej59fqhJRgmTnfbqD0iLPsWH/PyGW
	 rznlNxIm+xeuAuQZ3GlthHfn0cUWA43zEmTF2a/GsNiu+gKUBNHyynS6LlREIp1XRm
	 BShzAd3oeh82mQDLusGBaylAgnrNKY4xmHq6oHiNePODFlgi7lbV+4899y4pz1AgsE
	 SMzlfrWAQeIYw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DF721415A7;
	Fri, 10 Jul 2026 19:03:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Docs: list: Fix bracket
In-Reply-To: <20260709115008.387869-3-manuelebner@mailbox.org>
References: <20260709115008.387869-3-manuelebner@mailbox.org>
Date: Fri, 10 Jul 2026 13:03:28 -0600
Message-ID: <87y0filla7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96311-lists,linux-doc=lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEF5573D822

Manuel Ebner <manuelebner@mailbox.org> writes:

> Add missing ')' to sentence.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/core-api/list.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
> index 479aa91cc395..df8b078bb366 100644
> --- a/Documentation/core-api/list.rst
> +++ b/Documentation/core-api/list.rst
> @@ -458,7 +458,7 @@ The list_move() and list_move_tail() functions can be used to move an entry
>  from one list to another, to either the start or end respectively.
>  
>  In the following example, we'll assume we start with two lists ("clowns" and
> -"sidewalk" in the following initial state "State 0"::
> +"sidewalk") in the following initial state "State 0"::
>  
Applied, thanks.

jon

