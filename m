Return-Path: <linux-doc+bounces-86606-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM6KK/ER/2lU1wAAu9opvQ
	(envelope-from <linux-doc+bounces-86606-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 12:52:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D46014FF649
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 12:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 805CD300DE1D
	for <lists+linux-doc@lfdr.de>; Sat,  9 May 2026 10:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05A132AAB5;
	Sat,  9 May 2026 10:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOCOg8mK"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C49D2F8EB0;
	Sat,  9 May 2026 10:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778323949; cv=none; b=cgfq9JJZsX7TdZ4e+GyJ4cstMpI4ljumcecPd58HW1rN1afgEZIvj5K53aswbziMHCG4gaxEU1LUW1Q+WTFDeYU2IWxzA6xii3Z6lh3rtBqICpGOyz98KsOKG5+ODtFiC8q2mvu2HZZMsXUMJqSkHmN32Cl+/A/H5WGXVA8lcK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778323949; c=relaxed/simple;
	bh=3i7Cw3EoeN0KEWZOioivxGUrtt5OUv4yp2WpCaWB9zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHlj19z1LF9qPaEs/m84l5q7cqHu0qrIVajjngEPfwurFHrK2a8aFoejenCPSiYDErTlhJgwK8OVSc8bFkjuQSuvOxaeb34gYQBpZa4RMfjcuMnzsYJUD6FeeKn1Im3kb/z13aox9MecfycbpsQRW7qOO08Hv2SKlUMpWX6/4Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOCOg8mK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28682C2BCF6;
	Sat,  9 May 2026 10:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778323949;
	bh=3i7Cw3EoeN0KEWZOioivxGUrtt5OUv4yp2WpCaWB9zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOCOg8mKP2NnjbV6BfTqVNsCTSwc5cH2Hmqc/PmjYE4OUahUETxOAV+G9qXCjSsgm
	 yS4WVMfkIimFKyEbR9TmA2ZSSpfWv5/CwyoiWhvJpKfnrsC1to5FaMo1wjKJEK+SF8
	 DhIyHEY/gEjInNBPyr++/ejHRJcDOb9miN+fpulRTWTo3A592kM07aff1s+Ddzxgi3
	 +MgiFzOA3mIJSWC8YeZ7VRCs5dTYjlen36osbTNsC0SOHS+Q4OvmNtZXVZHvZGRhZC
	 uZzEPxXtxy7a98AjhXRdkmTJRJtOC2FQ+h83rNm5DEl1k/1msUP/N1TjCUmEC1OEAJ
	 srQVP/wK2YpaA==
Date: Sat, 9 May 2026 13:52:22 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: greg@kroah.com, Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org, security@kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Documentation: security-bugs: new updates
 covering triage and AI
Message-ID: <20260509105222.GA15586@unreal>
References: <20260509094755.2838-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509094755.2838-1-w@1wt.eu>
X-Rspamd-Queue-Id: D46014FF649
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86606-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 11:47:52AM +0200, Willy Tarreau wrote:
> This series tries to translate recent discussions on the security list
> on how to better handle reports. It details:
>   - when not to Cc: the security list
>   - what classes of bugs do not need to be handled privately
>   - minimum requirements for AI-assisted reports
> 
> As usual, this is probably perfectible but can already help in the short
> term as we can point it to reporters, so barring any strong disagreement,
> better continue to proceed in small incremental improvements and observe
> the effects.
> 
> Thanks!
> Willy

<...>

>   - Leon, I kept your reviewed-by since changes are very minimal and
>     didn't change the initial spirit.

Thanks. The intent is the same, and I'm not the right person to argue over
the precise wording anyway.

