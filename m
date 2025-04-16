Return-Path: <linux-doc+bounces-43237-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 976E3A8A8C1
	for <lists+linux-doc@lfdr.de>; Tue, 15 Apr 2025 22:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CEC63A8FEB
	for <lists+linux-doc@lfdr.de>; Tue, 15 Apr 2025 20:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527B624EF61;
	Tue, 15 Apr 2025 20:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qlIy1+dC"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0B624DFF1
	for <linux-doc@vger.kernel.org>; Tue, 15 Apr 2025 20:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744747381; cv=none; b=uguhFWonK4DWWEebvhzW7BpmDe/al3tXfDbfosi+TXyuemZMW1pOlgdglg4oXl8Ty07cVbgnNewpG6oeOUunHeQ31axR6kWHhGOajg3XpsVEcgPGoehRrY0eGiUsM1DqQUzIg6cSx9Ro21Sq8bSM4O69sbCsNoOJk0t1W1XpDg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744747381; c=relaxed/simple;
	bh=qD6//Kkj0pnETTvFRMsrBqIawzEcabzuCL4BTMFPipU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FIL0q7WSjWBDVx15MIyiPpZV2DOH3YYUIW5qAGdiJcAXOd+8M/dVJBTI6GOhTMI3Eh4y/1izyIa443ks/iMzWJFFLvdhwtUKnn11zw0iLtYcyR+NdHvn6tj7BKU/FL6gDkLPuOLGt24TEL1d7Qes5bJ4WsF4OZhTLsOrVpaDk/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qlIy1+dC; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <54b3a531-d550-4600-8bd2-1058c8b15023@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744747367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2yO9mrs7WLL0hWNf5rYjcWqI2uD7ZfNQPJN+bLfcwuE=;
	b=qlIy1+dCxu3lXy6dwaD2R7wAOvElaftWfQo7NuvZDBgsP/7dWFAITY+tO4QXoMm/FM6Rl2
	cRhM0ZdDcIEcvsnARCbzZAB8NljdRAxWQldvZfzS9mTkSmcbQ7M80CXMp5YXlcarbJq4P2
	cruvo8XfGZQTkYLQ1a20FlN1WnM+9FY=
Date: Tue, 15 Apr 2025 16:02:41 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [net-next PATCH v3 03/11] net: pcs: Add subsystem
To: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>
Cc: upstream@airoha.com, Christian Marangi <ansuelsmth@gmail.com>,
 linux-kernel@vger.kernel.org, Kory Maincent <kory.maincent@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
References: <20250415193323.2794214-1-sean.anderson@linux.dev>
 <20250415193323.2794214-4-sean.anderson@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250415193323.2794214-4-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/15/25 15:33, Sean Anderson wrote:
> +#else /* CONFIG_PCS */
> +static inline void pcs_put(struct device *dev, struct phylink_pcs *handle)
> +{
> +}
> +
> +static inline struct phylink_pcs *pcs_get(struct device *dev, const char *id)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline struct phylink_pcs *pcs_get_optional(struct device *dev,
> +						   const char *id)
> +{
> +	return NULL;
> +}
> +
> +static inline struct phylink_pcs
> +*pcs_get_by_fwnode(struct device *dev, struct fwnode_handle *fwnode,
> +		   const char *id)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline struct phylink_pcs
> +*pcs_get_by_fwnode_optional(struct device *dev, struct fwnode_handle *fwnode,
> +			    const char *id)
> +{
> +	return NULL;
> +}
> +
> +static inline struct phylink_pcs *pcs_get_by_dev(struct device *dev,
> +						 const struct device *pcs_dev)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
> +#endif /* PCS_H */

These should be wrapped with ERR_PTR. Will fix for v4.

--Sean

