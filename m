Return-Path: <linux-doc+bounces-80324-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAdUM/EjvWmr6wIAu9opvQ
	(envelope-from <linux-doc+bounces-80324-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 11:39:45 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1CE2D8D7B
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 11:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25E01306FE00
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 10:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD74391847;
	Fri, 20 Mar 2026 10:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Wv566Dc2"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407F238CFE7;
	Fri, 20 Mar 2026 10:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003071; cv=none; b=WyuGNsWTCPrzW0o2wXltSymXaLPyM2WKjNroAsQXuiijSiFRhgXXSVJB/amzY1Qt8PtOifIZxW/8+gj0gLaEl1+15D7h60E+lZm55sYiv87KaOtUp+PipX/2v61tn/Teei7Qqp34X0TkyC8hSRKbNHe7CJ2RX7XdrqeH+bM70mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003071; c=relaxed/simple;
	bh=BOLF3RdKIDuQDZiESWLBoht92C4S3O4HWGTItBpQ4Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4IVo1nQCw/gR3EfVlLLkBLAC3Zzc4tpZcbb4spSbL8QH/j1No6xFCBzcgzt3iwFKTpmIwvoyQTDlR4EV/cXsxNRHW0+ypZcw7I4NSmICqyi7RK22kGTOkMV+UpEWwn3NbhSDoy0g0FbcbNRhSnMIeqPMPF7XYGu7YJc+KUEYyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Wv566Dc2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296BFC4CEF7;
	Fri, 20 Mar 2026 10:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774003070;
	bh=BOLF3RdKIDuQDZiESWLBoht92C4S3O4HWGTItBpQ4Mk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wv566Dc22PaN67r8dW17DCTi725N5ZIF1o226vORxMKSkNc4skdY6LgC87BN9dpg1
	 YfinT3ADOagoo7QSlt70Vj5Ua2/LcP4Q86FEsYjhzj3eFrEJzbpGm76fe6fmuUjliQ
	 SgnkvmVq93q9VWuUI9VcHSOV8YdUREvpYPemczFg=
Date: Fri, 20 Mar 2026 11:37:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4] LICENSES: Explicitly allow SPDX-FileCopyrightText
Message-ID: <2026032032-wooing-washable-7f75@gregkh>
References: <20260301143322.92894-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aab4d11a-9e46-4c6a-9e7f-cb598195b693@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aab4d11a-9e46-4c6a-9e7f-cb598195b693@oss.qualcomm.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80324-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,canonical.com,perches.com,gmail.com,vger.kernel.org,ideasonboard.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.469];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[perches.com:email,linuxfoundation.org:dkim,linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,ideasonboard.com:email]
X-Rspamd-Queue-Id: 2C1CE2D8D7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 10:47:52AM +0100, Krzysztof Kozlowski wrote:
> On 01/03/2026 15:33, Krzysztof Kozlowski wrote:
> > Sources already have SPDX-FileCopyrightText (~40 instances) and more
> > appear on the mailing list, so document that it is allowed.  On the
> > other hand SPDX defines several other tags like SPDX-FileType, so add
> > checkpatch rule to narrow desired tags only to two of them - license and
> > copyright.  That way no new tags would sneak in to the kernel unnoticed.
> > 
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Joe Perches <joe@perches.com>
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> > 
> > Other way would be to remove SPDX-FileCopyrightText from existing files
> > and disallow this, but one way or another we should be explicit about
> > it.  Otherwise people will be sending more of these and each maintainer
> > would need to make their own call.
> 
> Hey folks, any further comments here?
> 
> Is there a preference that this tag should be instead removed from the
> kernel and checkpatch should not allow it?
> 
> Honestly, I don't care about the way but I do care of having it
> defined/codified.
> 
> Best regards,
> Krzysztof

Looks sane to me, I'll take in the SPDX tree now, thanks.

greg k-h

