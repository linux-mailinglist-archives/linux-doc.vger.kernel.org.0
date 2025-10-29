Return-Path: <linux-doc+bounces-64886-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F375C19A5F
	for <lists+linux-doc@lfdr.de>; Wed, 29 Oct 2025 11:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C1DE4E1728
	for <lists+linux-doc@lfdr.de>; Wed, 29 Oct 2025 10:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7712FB998;
	Wed, 29 Oct 2025 10:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="E7pGT2rO"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150892F9D8C
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 10:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761733243; cv=none; b=dnD8VQJX/uefCX6nZkpqhMkK4x/vGqU9X79r9nhVsqUYPiMEjECl+nW4iuhlvWUwYxuM7hdSDeLEzIFS7AJVcBlRIcsff7Odv8ZjJWqb1G8mOLaGSk3mRcvCFaITbU9SEGPm5aPJG9/axCvbm+u14wnnRy3TsJxnyjCLWG2u9d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761733243; c=relaxed/simple;
	bh=tZH2MFQROUgThRcgEuFL8l07GBDwuI8QzuO8RFhtbQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PMEhpsXxzcTEMPHOa5sFKHTJL0uzEKM3W342Svdp3adEazHIBthUkIOKk5gGeOU82eJeMw3YLzeUsWS7IVS95GPDK0QjIM82NP25Mpcawm0qQX2Z57evA464oJpQ3OCmU4OufTHXNhPWGhKNFKEnFWCl0c9QQyC74U7JhWp+ZbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=E7pGT2rO; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <2e878c19-077c-4e2f-8065-fe62296a5094@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761733237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gDaiTXQP14JHHPE0XuBOV5J1pUUU1Y9JQ/SRe31gCyM=;
	b=E7pGT2rOm0PcEZwQbY1pJuZOdvTDSsj+swA8Fqk9SUHQm5uVtb5uUb5qPgaLo3jIB3PF/H
	sUt8/Gr/s7eZxJc7I36CeZ/wE+C8X/+czTNmqSwL3EXC5obrIE8+N24aK6TLuevN6PQqoA
	WuMH5ANcKD2Svaw2B2nSuPRmFBz+Pko=
Date: Wed, 29 Oct 2025 10:20:29 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next 1/2] dpll: add phase-adjust-gran pin attribute
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Michal Schmidt <mschmidt@redhat.com>, Petr Oros <poros@redhat.com>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251024144927.587097-1-ivecera@redhat.com>
 <20251024144927.587097-2-ivecera@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20251024144927.587097-2-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 24/10/2025 15:49, Ivan Vecera wrote:
> Phase-adjust values are currently limited by a min-max range. Some
> hardware requires, for certain pin types, that values be multiples of
> a specific granularity, as in the zl3073x driver.
> 
> Add a `phase-adjust-gran` pin attribute and an appropriate field in
> dpll_pin_properties. If set by the driver, use its value to validate
> user-provided phase-adjust values.
> 
> Reviewed-by: Michal Schmidt <mschmidt@redhat.com>
> Reviewed-by: Petr Oros <poros@redhat.com>
> Tested-by: Prathosh Satish <Prathosh.Satish@microchip.com>
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   Documentation/driver-api/dpll.rst     | 36 +++++++++++++++------------
>   Documentation/netlink/specs/dpll.yaml |  7 ++++++
>   drivers/dpll/dpll_netlink.c           | 12 ++++++++-
>   include/linux/dpll.h                  |  1 +
>   include/uapi/linux/dpll.h             |  1 +
>   5 files changed, 40 insertions(+), 17 deletions(-)
> 
> @@ -1261,7 +1265,13 @@ dpll_pin_phase_adj_set(struct dpll_pin *pin, struct nlattr *phase_adj_attr,
>   	if (phase_adj > pin->prop.phase_range.max ||
>   	    phase_adj < pin->prop.phase_range.min) {
>   		NL_SET_ERR_MSG_ATTR(extack, phase_adj_attr,
> -				    "phase adjust value not supported");
> +				    "phase adjust value of out range");
> +		return -EINVAL;
> +	}
> +	if (pin->prop.phase_gran && phase_adj % pin->prop.phase_gran) {
> +		NL_SET_ERR_MSG_ATTR_FMT(extack, phase_adj_attr,
> +					"phase adjust value not multiple of %u",
> +					pin->prop.phase_gran);

That is pretty strict on the uAPI input. Maybe it's better to allow any
value, but report back the one that is really applied based on driver's
understanding of hardware? I mean the driver is doing some math before
applying the math, it can potentially round any value to the closest
acceptable and report it back?

>   		return -EINVAL;
>   	}
>   

