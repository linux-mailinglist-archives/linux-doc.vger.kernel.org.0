Return-Path: <linux-doc+bounces-84678-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGl+IxkJ72n14QAAu9opvQ
	(envelope-from <linux-doc+bounces-84678-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 08:58:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E82F46DF14
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 08:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FEF930753BA
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 06:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C1639022B;
	Mon, 27 Apr 2026 06:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TSDvVByU"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CB739021A;
	Mon, 27 Apr 2026 06:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777272813; cv=none; b=ktI2QwDKWs7T1qqWu4EjCzIVpXFrnvaUMIkA7T3yfhCzdtMp4qVQJXEQaVn6N1LcOrNJk5lqakr6igvri/96+2JHlgaeYK6ma3xuLL+deh/h4tnpPiVZBZZW2VH/LiScEtXHgbyQRVhOzjuEfOWur0QMQ4RfFvEWS9Ji7AfiA5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777272813; c=relaxed/simple;
	bh=890ee2WIAhjqI3oDPRvaOKgFzFUsMQwVAfSk0a+FCeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRmCsDJHjATt809tevTIwaYqqMadjyCEDtP+LZCx8gOuPo0LEMcA7HA3T4sH4BfpCa8drKFSrJ89Gd8z6SUqJEYS/kmGrvJxIyeEz9goFvlVmLMVwuLF+kmOMB+lxjvCtCDTEVd9ujxh4NBpGVEetNgoOsvrRzR2Ocmb0jKFLxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TSDvVByU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C16C19425;
	Mon, 27 Apr 2026 06:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777272812;
	bh=890ee2WIAhjqI3oDPRvaOKgFzFUsMQwVAfSk0a+FCeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TSDvVByUmBtWQJpIPY32dgpRtW5XlQveXSPXq0PKU59u2zyBASZfQ8kbuUfA99met
	 XPVou/62YnE1y8bb3yguoGGUxykrUFsXBwgEjEQnJiwI3iG1NPT+JzQEw0FQ72Ek66
	 PIyP8uYkplDbtY4NlBr/pPZdLHewuI/wTdE+l3WM8naJoRtfRMrxgHxpOxjyCncUGX
	 sPPzrGBpIavCk6/bnrAxZ7KnTIjZOH2Vb5agkOzia00N+d6un3lFnXPqlxRVlUR3T2
	 /buSSa09RVO0D5okIQxkKHIZQjfmT4IM2nzM/uVV/g+sqv5fO+kLnDnRc2FWToA3Xf
	 Fkmd72n/xXj6w==
Date: Mon, 27 Apr 2026 08:53:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, soc@lists.linux.dev, 
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 2/6] ARM: zte: Add zx297520v3 platform support
Message-ID: <20260427-married-overjoyed-panther-c773c1@quoll>
References: <20260426-send-v6-0-d49efa72bb09@gmail.com>
 <20260426-send-v6-2-d49efa72bb09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260426-send-v6-2-d49efa72bb09@gmail.com>
X-Rspamd-Queue-Id: 2E82F46DF14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84678-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

On Sun, Apr 26, 2026 at 02:54:15PM +0300, Stefan D=C3=B6singer wrote:
> diff --git a/arch/arm/mach-zte/Kconfig b/arch/arm/mach-zte/Kconfig
> new file mode 100644
> index 000000000000..2e3abee94994
> --- /dev/null
> +++ b/arch/arm/mach-zte/Kconfig
> @@ -0,0 +1,26 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menuconfig ARCH_ZTE
> +	bool "ZTE zx family"
> +	depends on ARCH_MULTI_V7
> +	help
> +	  Support for ZTE zx-based family of processors.
> +
> +if ARCH_ZTE
> +
> +config SOC_ZX297520V3
> +	default y if ARCH_ZTE
> +	bool "zx297520v3"

"bool" should be the first line in the entry.

Also say something a bit more useful, e.g. "zx297520v3 SoC" becuase
unfortunately the model number looks too close to random set of
characters.

Rest seems fine:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


