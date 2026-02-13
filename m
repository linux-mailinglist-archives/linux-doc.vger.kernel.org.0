Return-Path: <linux-doc+bounces-75985-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFHgCs8lj2lNKAEAu9opvQ
	(envelope-from <linux-doc+bounces-75985-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 13 Feb 2026 14:23:27 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8693E136594
	for <lists+linux-doc@lfdr.de>; Fri, 13 Feb 2026 14:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4ED330BF77D
	for <lists+linux-doc@lfdr.de>; Fri, 13 Feb 2026 13:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106FF361655;
	Fri, 13 Feb 2026 13:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALpCMQrr"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A0E361653;
	Fri, 13 Feb 2026 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770988898; cv=none; b=hidzw3nUkrBHpl/7wKkaGrciy6t6PBn5aZszisXvvKvhZrBdUMr9oTnYMnQzlMujXVUI6dEWEqUCejLSwuFv4S03jcvmXSF4+IGy1wOcoW7H1ZDwY8KJg6hoePw1pkVULWoiQz+ycXAQ3fQQRs+yfJTWlR5VWKpID9GOHqTvI0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770988898; c=relaxed/simple;
	bh=kyXJnbWHtVqYzU5oI/WdyhgLoBcZVbYqrHuJ3jB/U4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xqcw1HunV3TrDRkqnvpgRWbFrchVfyznl77ZWl3Uby3tkkAJsqQX349Wvw1ZNUmK11zqfZmq2WJzai6MyyVoAPpMWVwZ4Nm0jDlv/J+O/cNuc5AoK8NJmQpgsRGdtVLJ2qHlNGZMXufDZLWrQ7sR6nWpxxUw9rQ2NXY8B8hgepo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALpCMQrr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D84C116C6;
	Fri, 13 Feb 2026 13:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770988897;
	bh=kyXJnbWHtVqYzU5oI/WdyhgLoBcZVbYqrHuJ3jB/U4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALpCMQrr0ThiCKs5Z2kZgO7LXj0dgJ+wuLIhhja7r5of6AI9dLP3rLHsUr3UWi4DV
	 479gca9of6f3glzP0Awfxi47pk5N06aQzyThnY0HixbhHuvPdkUbpA719YPbYMqMXv
	 +yDG/jXwOtV0gxJQ88fqbUspNyFkARcaNDTV5//2g+WkT3s1mGzU8CQAEDFfJQGbRe
	 nPQjoRSXyqMKD/R0wRAJlGTO8LVbb0zPLzFpRE/NIH4ZKBkQrn++RTdVP8AZ0kv8Kt
	 A0htIRChPUaDEd3wyfRcto1mam6BqtSXcAvSMYEq6QwNOKbFQR7uKs/+0K+BmIbqy6
	 paPpSfliixIFg==
Date: Fri, 13 Feb 2026 14:21:32 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Aksh Garg <a-garg7@ti.com>
Cc: linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
	bhelgaas@google.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, s-vadapalli@ti.com,
	danishanwar@ti.com, srk@ti.com
Subject: Re: [RFC PATCH 3/4] PCI/DOE: Add DOE mailbox support for endpoint
 functions
Message-ID: <aY8lXB5JB3ffiUlK@fedora>
References: <20260213123603.420941-1-a-garg7@ti.com>
 <20260213123603.420941-4-a-garg7@ti.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213123603.420941-4-a-garg7@ti.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75985-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8693E136594
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 06:06:02PM +0530, Aksh Garg wrote:

(snip)

> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> index e3f848ffb52a..2a57a314054c 100644
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -146,6 +146,20 @@ config PCI_DOE
>  	  Say Y here if you want be able to communicate with PCIe DOE
>  	  mailboxes.
>  
> +config PCI_DOE_EP
> +	bool "PCI Endpoint Data Object Exchange (DOE) support"
> +	depends on PCI_ENDPOINT
> +	help
> +	  This enables support for Data Object Exchange (DOE) protocol
> +	  on PCI Endpoint controllers. It provides a communication
> +	  mechanism through mailboxes, primarily used for PCIe security
> +	  features.
> +
> +	  Say Y here if you want be able to communicate using PCIe DOE
> +	  mailboxes.
> +
> +	  If unsure, say N.
> +

I think this new Kconfig should live in:
drivers/pci/endpoint/Kconfig


Kind regards,
Niklas

