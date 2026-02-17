Return-Path: <linux-doc+bounces-76131-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ES6NkNIlGn0BwIAu9opvQ
	(envelope-from <linux-doc+bounces-76131-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Feb 2026 11:51:47 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAAC14B042
	for <lists+linux-doc@lfdr.de>; Tue, 17 Feb 2026 11:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CA5F3006B16
	for <lists+linux-doc@lfdr.de>; Tue, 17 Feb 2026 10:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C18329389;
	Tue, 17 Feb 2026 10:51:29 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5061F280A5A;
	Tue, 17 Feb 2026 10:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771325489; cv=none; b=EkHXBoU6yCnGui8/G/RdhGybZMnH+XY6oLFEG0OmtGv6Dkx2WBRIRisAoz3yyugmNJzyTCgiKm0CrW03XNCC1RN+9tcfdd4qeSaK96W/laL22VCv9c2Z8764AFhiwW7Cyru7uvdcnmPB5ajapyqnLI07obndXT0HjI1ngwbjA+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771325489; c=relaxed/simple;
	bh=ASroJy2JepIWcCN+Ph0SP2rPHYff+IO9iS+A06ZDd2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdCHz56vzCXVOkSQ414r+F+EEHMiD+zyKz9CKGYliAqlcGhDIk0nC8A/3Wm4PM+UKETKiblie62ZbkzWjmCRQLCr3gH0CTAuivUTttwxLGWeb1Pl8/UUVixxpvHWEJ0OjjJWTMXhJAvUdAy5YAQpDnuwsu9eB7yrN2HBOdOzNv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2118BC4CEF7;
	Tue, 17 Feb 2026 10:51:26 +0000 (UTC)
Date: Tue, 17 Feb 2026 10:51:24 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: =?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>
Cc: will@kernel.org, suzuki.poulose@arm.com, maz@kernel.org, corbet@lwn.net,
	yee.lee@mediatek.com, ascull@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] arm64: Optionally disable EL0 MTE via command-line
Message-ID: <aZRIHZ2Wq81S-FZY@arm.com>
References: <plslbeuzfag5dfizunxmhyw5axxbuz7r3jdlhjluzdwrm4rtzk@bm5xmxzmy6v3>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <plslbeuzfag5dfizunxmhyw5axxbuz7r3jdlhjluzdwrm4rtzk@bm5xmxzmy6v3>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76131-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7DAAC14B042
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 12:51:07PM +0100, Pierre-Clément Tosi wrote:
> Although it is currently possible to fully disable MTE on MTE-capable
> CPUs (with arm64.nomte or id_aa64pfr1.mte=0) and to only use MTE in
> userspace (with kasan=off), there is no way to limit the use of MTE to
> the kernel because CPU capabilities are traditionally exposed directly
> to userspace.
> 
> To address this, introduce a new cmdline argument (inspired by the
> existing arm64.nomte) to only expose the MTE capability of the CPU to
> the kernel. Combined with KASAN, this results in only the kernel using
> the feature, while HWCAP2_MTE and the corresponding MSR ID_AA64PFR1_EL1
> field are hidden from userspace.
[...]
> +	arm64.nomte_el0	[ARM64] Unconditionally disable Memory Tagging Extension
> +			support for userspace

Why would we need this? It's a user-space choice whether it uses MTE or
not. It's not like the kernel is forcing it onto the user processes.

-- 
Catalin

