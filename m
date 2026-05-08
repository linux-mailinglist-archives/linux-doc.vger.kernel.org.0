Return-Path: <linux-doc+bounces-86463-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZiX/DZEC/mlYmAAAu9opvQ
	(envelope-from <linux-doc+bounces-86463-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 17:34:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B365C4F8C1F
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 17:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 045D3302A078
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2026 15:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7FB2E62B5;
	Fri,  8 May 2026 15:31:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA592C08DC;
	Fri,  8 May 2026 15:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254302; cv=none; b=Vx6i5WBIycRxYyJFc9481/pMmaDQBe4igISQ8LFHIsadhV16ZHB+7Y/2pVYWZ0n6dDegk5QAqBgxwdUjllT4gHy6UnBLL8LDsIiTXNu6wUAuCmDoKzhykaCNXyfX7zQcln2yvVVEICTJ5XuvjJ1/PxkJz7eA5VjsTApHbPzFJ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254302; c=relaxed/simple;
	bh=B93HGRYlogRANdiwRXj7Wa5iPe8YOMmm8q91f0f1mEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9WzkT8UvRLexdd1FaZrw2DU/hWilPTNSOGoLm9iW1wyzM+uXzVCapIeq2JmZPgszDwpJo64yloPf4iwFCLSBu8tr+lkAV5NFfP0cFzXkxkmCKjI4hY9DZqE2fU41ST5G1vaaju2dcyLtSmFwz5rjbMpZ0CyZmxE2PEcKyzoKmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99BBCC2BCB0;
	Fri,  8 May 2026 15:31:41 +0000 (UTC)
Date: Fri, 8 May 2026 17:31:39 +0200
From: Greg KH <greg@kroah.com>
To: Willy Tarreau <w@1wt.eu>
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] Documentation: security-bugs: do not
 systematically Cc the security team
Message-ID: <2026050834-reliant-gangly-7a00@gregkh>
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-2-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503113506.5710-2-w@1wt.eu>
X-Rspamd-Queue-Id: B365C4F8C1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[kroah.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86463-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[greg@kroah.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email,1wt.eu:email]
X-Rspamd-Action: no action

On Sun, May 03, 2026 at 01:35:04PM +0200, Willy Tarreau wrote:
> With the increase of automated reports, the security team is dealing
> with way more messages than really needed. The reporting process works
> well with most teams so there is no need to systematically involve the
> security team in reports.
> 
> Let's suggest to keep it for small lists of recipients and new reporters
> only. This should continue to cover the risk of lost messages while
> reducing the volume from prolific reporters.
> 
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  Documentation/process/security-bugs.rst | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
> index 27b028e858610..6dc525858125e 100644
> --- a/Documentation/process/security-bugs.rst
> +++ b/Documentation/process/security-bugs.rst
> @@ -148,7 +148,15 @@ run additional tests.  Reports where the reporter does not respond promptly
>  or cannot effectively discuss their findings may be abandoned if the
>  communication does not quickly improve.
>  
> -The report must be sent to maintainers, with the security team in ``Cc:``.
> +The report must be sent to maintainers.  If there are two or fewer
> +recipients in your message, you must also always Cc: the Linux kernel
> +security team who will ensure the message is delivered to the proper
> +people, and will be able to assist small maintainer teams with processes
> +they may not be familiar with.  For larger teams, Cc: the Linux kernel
> +security team for your first few reports or when seeking specific help,
> +such as when resending a message which got no response within a week.
> +Once you have become comfortable with the process for a few reports, it is
> +no longer necessary to Cc: the security list when sending to large teams.
>  The Linux kernel security team can be contacted by email at
>  <security@kernel.org>.  This is a private list of security officers
>  who will help verify the bug report and assist developers working on a fix.
> -- 
> 2.52.0
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

