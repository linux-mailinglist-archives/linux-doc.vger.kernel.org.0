Return-Path: <linux-doc+bounces-94627-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xm19MqGBRmoNXgsAu9opvQ
	(envelope-from <linux-doc+bounces-94627-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 17:20:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7356F9511
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 17:20:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=U0rBu8OY;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94627-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94627-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C95BC305E4AD
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 15:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA3530B50D;
	Thu,  2 Jul 2026 15:19:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F810433E9D;
	Thu,  2 Jul 2026 15:19:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005586; cv=none; b=VuKBcsRDeN6bscKdmO027FBRvyA5j9BD/9dwx/qD//ZG30RqW2xoj7PaDV7SueJ6YaG1QuVtSI1qnDMRZfi6naz4o1aAoBFD2BErvIfsADRWGE0TPy6x40FwMws5R9VJX7hsI6S8XXPPPDAENhjI3lyp46+qJk3tBzscS3dCLQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005586; c=relaxed/simple;
	bh=7LQRtqPEi0UprWVsXRrjibYefSmOXkkL0SA/IYXRMXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkiqqKneZ4LXX5s2ZXhpRAqH7ZfNrHVvq5fg+a4HIY+SeGjhvCLlS99WLSJXEEPXLBiaiPLaSuOwtOjJDrnZ8l0sjJekmGSCRe4l24FWofAqUvFKlIrTy5fL6OXsaBKBSEru9072AWkFzn/sEB6UZRZCu5JAIGfv9o3KIvoCZ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=U0rBu8OY; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1AA3359D;
	Thu,  2 Jul 2026 08:19:38 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9734D3F85F;
	Thu,  2 Jul 2026 08:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783005583; bh=7LQRtqPEi0UprWVsXRrjibYefSmOXkkL0SA/IYXRMXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U0rBu8OY33nBMMW0XMvMDf8xcfzxlbquTVoZGK9qIIXQzKeuLzyOrulpWq4HbBm+v
	 NOjmPuuGaWv6vY/2c20YRBjMgwUOgKbuombOqZoQMIOwqQ2hJTHjhXOcaAoNHvDRet
	 2gX44srtdQ9GN+KunXuDXgS61ZDzJ65wpdtlUp+k=
Date: Thu, 2 Jul 2026 16:19:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: Document missing bitfields in
 cpu-feature-registers.rst
Message-ID: <akaBjGtESDv_x6Ds@arm.com>
References: <20260522-arm64-cpu-ftr-regs-v1-0-19775b40faf0@kernel.org>
 <20260522-arm64-cpu-ftr-regs-v1-2-19775b40faf0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-arm64-cpu-ftr-regs-v1-2-19775b40faf0@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[arm.com:+];
	TAGGED_FROM(0.00)[bounces-94627-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:will@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:peter.maydell@linaro.org,m:joey.gouly@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,arm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C7356F9511

On Fri, May 22, 2026 at 06:58:38PM +0100, Mark Brown wrote:
> --- a/Documentation/arch/arm64/cpu-feature-registers.rst
> +++ b/Documentation/arch/arm64/cpu-feature-registers.rst
> @@ -113,6 +113,30 @@ infrastructure:
>  4. List of registers with visible features
>  -------------------------------------------
>  
> +  ID_AA6FPFR0_EL1 - Floating Point feature ID register 0

That's missing a '4' in '64'.

> +  ID_AA6SMFR0_EL1 - SME feature ID register 0

Same here.

-- 
Catalin

