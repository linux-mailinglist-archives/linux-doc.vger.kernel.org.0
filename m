Return-Path: <linux-doc+bounces-77471-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iI8fKKVFpGnpbwUAu9opvQ
	(envelope-from <linux-doc+bounces-77471-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 01 Mar 2026 14:56:53 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E791D00C4
	for <lists+linux-doc@lfdr.de>; Sun, 01 Mar 2026 14:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05292300DCEE
	for <lists+linux-doc@lfdr.de>; Sun,  1 Mar 2026 13:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD0C1F30BB;
	Sun,  1 Mar 2026 13:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ost9RC1A"
X-Original-To: linux-doc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F394175A6A;
	Sun,  1 Mar 2026 13:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772372988; cv=none; b=NFPJ1/UoYXwzocj3JsrmlCwmaSxhcCcNpREXtXIMro3AUKoc/lfGWnBsOFAesTwi0F9XnBaXBT143s4Yj3K+Tdq3h/8bki47aRmITwfA6ziOnjQAHV9+7RDVraTWflvTBVM2HHWm3YEPjyCpGR09rYcpobqsANQ5/gFtYRf2rGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772372988; c=relaxed/simple;
	bh=9+mco2L7nEbj0YdhHWj8zZplxBxRp1DcVoCy3qeogwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFKfqrFn7Nns64OtRgx79iC4te9+Mq17WsM7Y9OYvagdQ4wUBmfzEsdfSfCsW5xht1PURG3qdn8mYBK8Xj9MXp11M3hKHUCNfr4TNS63Kp3Cx3wSRDdc/0cnjhVbsyM7AN745Pdke/JEnB9ZAI5LPs3AqfL7ZlYZieYI+S1yJ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ost9RC1A; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [83.245.248.187])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 45AD656D;
	Sun,  1 Mar 2026 14:48:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772372923;
	bh=9+mco2L7nEbj0YdhHWj8zZplxBxRp1DcVoCy3qeogwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ost9RC1AoEHdxM+P9Gg1dhUvuj4FkMbTMlIf03TI621wrJ8dFDYR40/CAWVfnEmK8
	 WAGpqMe3aXeD0CNtPxJSuwh9MDqmPeQP+x0ubHr5gP626opTFy4t3pDwz6tjKINPdC
	 hLQ3eziXcwmFIML4wvuIPr2LpmRJggr4w2PDmeuc=
Date: Sun, 1 Mar 2026 14:49:39 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] LICENSES: Explicitly allow SPDX-FileCopyrightText
Message-ID: <20260301134939.GA2879901@killaraus.ideasonboard.com>
References: <20260301134054.44229-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260301134054.44229-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [8.84 / 15.00];
	URIBL_BLACK(7.50)[perches.com:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-77471-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[ideasonboard.com:s=mail];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lwn.net,canonical.com,perches.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-doc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[ideasonboard.com,none];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.815];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[perches.com:email,linuxfoundation.org:email,ideasonboard.com:email,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 34E791D00C4
X-Rspamd-Action: add header
X-Spam: Yes

On Sun, Mar 01, 2026 at 02:40:55PM +0100, Krzysztof Kozlowski wrote:
> Sources already have SPDX-FileCopyrightText (~40 instances) and more
> appear on the mailing list, so document that it is allowed.  On the
> other hand SPDX defines several other tags like SPDX-FileType, so add
> checkpatch rule to narrow desired tags only to two of them - license and
> copyright.  That way no new tags would sneak in to the kernel unnoticed.
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Joe Perches <joe@perches.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Other way would be to remove SPDX-FileCopyrightText from existing files
> and disallow this, but one way or another we should be explicit about
> it.  Otherwise people will be sending more of these and each maintainer
> would need to make their own call.

Ack.

> Changes in v3:
> 1. Typo "or multiple"
> 
> Changes in v2:
> 1. Doc adjustments based on feedback from Greg and Laurent.
> 2. "unused" -> "unsupported"
> 3. Drop redundant blank line
> ---
>  Documentation/process/license-rules.rst | 7 +++++--
>  scripts/checkpatch.pl                   | 8 ++++++++
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/process/license-rules.rst b/Documentation/process/license-rules.rst
> index 59a7832df7d0..b0176bb8a465 100644
> --- a/Documentation/process/license-rules.rst
> +++ b/Documentation/process/license-rules.rst
> @@ -63,8 +63,11 @@ License identifier syntax
>     The SPDX license identifier in kernel files shall be added at the first
>     possible line in a file which can contain a comment.  For the majority
>     of files this is the first line, except for scripts which require the
> -   '#!PATH_TO_INTERPRETER' in the first line.  For those scripts the SPDX
> -   identifier goes into the second line.
> +   '#!PATH_TO_INTERPRETER' in the first line.  For those scripts, the SPDX
> +   license identifier goes into the second line.
> +
> +   The license identifier line can then be followed by one or multiple
> +   SPDX-FileCopyrightText lines if desired.
>  
>  |
>  
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index bec7930cdd66..e317cf2ffc58 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3856,6 +3856,14 @@ sub process {
>  			     "Misplaced SPDX-License-Identifier tag - use line $checklicenseline instead\n" . $herecurr);
>  		}
>  
> +# check for unsupported SPDX file tags
> +		if ($rawline =~ /\bSPDX-.*:/ &&
> +		    $rawline !~ /\bSPDX-License-Identifier:/ &&
> +		    $rawline !~ /\bSPDX-FileCopyrightText:/) {
> +			WARN("SPDX_LICENSE_TAG",
> +			     "Unsupported SPDX tag\n" . $herecurr);

I'd write "nonallowed" instead of "unsupported", possibly because I may
not be familiar with the usage of "supported" in this acceptation. With
or without that change,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		}
> +
>  # line length limit (with some exclusions)
>  #
>  # There are a few types of lines that may extend beyond $max_line_length:

-- 
Regards,

Laurent Pinchart

