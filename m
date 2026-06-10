Return-Path: <linux-doc+bounces-91887-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7sckGXjxKWrCfwMAu9opvQ
	(envelope-from <linux-doc+bounces-91887-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 01:21:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 426B266D5AF
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2026 01:21:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=U3qJBmhZ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91887-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91887-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E4CE0300BD65
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 23:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41D73603DA;
	Wed, 10 Jun 2026 23:21:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1675F299A82;
	Wed, 10 Jun 2026 23:21:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781133681; cv=none; b=PP8/v77ABocUx6Zx/mH9Zb1rATWR1++xb36J5kqxy26wGiQLJojgh0fai3R7LgTvCiSBcHzPqnUHoO47Ufh8HI/9w31fEzRvPcucLLxyhJ4O7RKth9fxu6h6ef42+YjaadNoTrEY2xBuGUU5w5gohHFgnrO/imHnLnshKzYPXkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781133681; c=relaxed/simple;
	bh=0ADfnQ8czZLpWCsiojUzxdOuhYUqCYDerD2scETEEgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSR8pQCTzrYdU045Wjn3JHdZNrFHEFsa2GzDl+s+WumFEoSuYUhb6catpF9EcKq87epQRXRxj9P/fZeJAihdQqT6ZTmB7Rshj6pPW3PENJ2xY7ChUAIaDq1CRE6eVB7vsZgywlfL5mSoAh91wrAmk2V44xI9Yz4UAoAUnlGKPRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=U3qJBmhZ; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=9wCKYk9ipCH/BA7MdLEIq6BkUVsdEsoO78w2x/7sZ2o=; b=U3qJBmhZf9CRxCeA9tY1a8rgQK
	VvNBvitBupG4j41A1Ykgftr3bSAm13ZJ0N4DoyA6EgcFfHoTyGTgf8MuPFhEJZ4m9+yAQC6GFN+0F
	4eYxlOSCkUY77IiU3VRCOxJ4e4USN+ibwSWtegvdo8Szvr3bac1IP0a7K55skCtAYL0lVB6ZPzBij
	+4cAGwMm1CCKcvgjGXt424jkhsEIhvieJf+HCnTRRxv1grn1ByCaUJasJDvzgsHlgeUQAULnTnKXm
	TmLpaw9y0Fx0kGpVnJVnsyF40yPZN68nSv0J7V1dhsXi79IA5S3d26gLRYcNvvt4cnNTCC/x7XnR6
	ivK9G/5w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXSEX-00000008Sdk-3Vuf;
	Wed, 10 Jun 2026 23:21:17 +0000
Message-ID: <cf1a1f6d-df63-45cd-b73a-cd3e26f2ce4a@infradead.org>
Date: Wed, 10 Jun 2026 16:21:15 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] Documentation: PCI: Add documentation for DOE
 endpoint support
To: Aksh Garg <a-garg7@ti.com>, linux-pci@vger.kernel.org,
 linux-doc@vger.kernel.org, mani@kernel.org, kwilczynski@kernel.org,
 bhelgaas@google.com, corbet@lwn.net, kishon@kernel.org,
 skhan@linuxfoundation.org, lukas@wunner.de, cassel@kernel.org,
 alistair@alistair23.me
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 s-vadapalli@ti.com, danishanwar@ti.com, srk@ti.com
References: <20260610100256.1889111-1-a-garg7@ti.com>
 <20260610100256.1889111-5-a-garg7@ti.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260610100256.1889111-5-a-garg7@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91887-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:a-garg7@ti.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:mani@kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:corbet@lwn.net,m:kishon@kernel.org,m:skhan@linuxfoundation.org,m:lukas@wunner.de,m:cassel@kernel.org,m:alistair@alistair23.me,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:s-vadapalli@ti.com,m:danishanwar@ti.com,m:srk@ti.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 426B266D5AF



On 6/10/26 3:02 AM, Aksh Garg wrote:
> Document the architecture and implementation details for the Data Object
> Exchange (DOE) framework for PCIe Endpoint devices.
> 
> Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Aksh Garg <a-garg7@ti.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
> 
> Changes from v4 to v5:
> - Updated the DOE Abort handling setion.
> 
> Changes from v3 to v4:
> - Updated the maximum size of the DOE object from 256KB to 1MB,
>   as per PCIe spec.
> - Updated the DOE setup and cleanup sections.
> 
> Changes from v2 to v3:
> - Rebased on 7.1-rc1.
> 
> Changes since v1:
> - Squashed the patches [1] and [2], and moved the documentation file
>   to Documentation/PCI/endpoint/pci-endpoint-doe.rst to match the existing
>   naming scheme, as suggested by Niklas Cassel
> - Updated the documentation as per the design and implementaion changes
>   made to previous patches in this series:
>   * Updated for static protocol array instead of dynamic registration
>   * Documented asynchronous callback model
>   * Updated request/response flow with new callback signature
>   * Updated memory ownership: DOE core frees request, driver frees response
>   * Updated initialization and cleanup sections for new APIs
> 
> v4: https://lore.kernel.org/all/20260522052434.802034-5-a-garg7@ti.com/
> v3: https://lore.kernel.org/all/20260427051725.223704-5-a-garg7@ti.com/
> v2: https://lore.kernel.org/all/20260401073022.215805-5-a-garg7@ti.com/
> v1: [1] https://lore.kernel.org/all/20260213123603.420941-2-a-garg7@ti.com/
>     [2] https://lore.kernel.org/all/20260213123603.420941-5-a-garg7@ti.com/
> 
>  Documentation/PCI/endpoint/index.rst          |   1 +
>  .../PCI/endpoint/pci-endpoint-doe.rst         | 333 ++++++++++++++++++
>  2 files changed, 334 insertions(+)
>  create mode 100644 Documentation/PCI/endpoint/pci-endpoint-doe.rst


-- 
~Randy

