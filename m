Return-Path: <linux-doc+bounces-94030-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1i+NOZ2aQmoS+gkAu9opvQ
	(envelope-from <linux-doc+bounces-94030-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 18:17:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEB66DD3A9
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 18:17:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=mQG1kmuj;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94030-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94030-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19DB630D64DE
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 16:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DC1441024;
	Mon, 29 Jun 2026 16:06:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A93439003;
	Mon, 29 Jun 2026 16:06:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782749216; cv=none; b=qos6HOz0s7ejnIX0sKtuJgGfYCTWNkR4VxYjUfwmRPhqkvBspD+sTpZfbEb5FObGz3DA0cOpXlXdOBWFlr1udYe2n61O6aQfWpM6dudFYc7O7zvpAZOWY0HeA6/2RSUD+WXs05lyr+MUO2JxwyhkLiDyIgX+KE7NvX0qxiALYws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782749216; c=relaxed/simple;
	bh=AMeOdr1RQTRrK55t85RF/4Rg0vyplpjJJxjfAf7Gz9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cKvX9pCobI1BxImbiTaG+OTQ6dz5K4+DRPnxQ9U4k0gcjS1xBWpqYOxX3oR3sE8ZL6elhMnHU8JpyeKer5hPPdOSNI5C+vlUUhnboz0IconxACpnly2dKuLujwHFpOvScTCzcpPU3lHv+RChaaEt1RT6UivgFhFn5C6Xa8x5/1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQG1kmuj; arc=none smtp.client-ip=192.198.163.12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782749215; x=1814285215;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AMeOdr1RQTRrK55t85RF/4Rg0vyplpjJJxjfAf7Gz9c=;
  b=mQG1kmujwNdd/MDw3nwLXppdX4MFSHXWIfbyenCwAi4Q1hSWI/WmPU6A
   mdSxSNqOQ7zEosh2rz5+YsJRBMahjm5YZx4ze16jNBZMA/3C5tvQc27sT
   yVVKQbksP8wxksp94KGXoxDeLpNeFuc5mWSUFg9eRGckln8cGpNEeRRrM
   mJZZxsBArvuKDC2DX9Ns/Xx5P+4qOraIskufoqlEgMbfc0aUH/nbcawLp
   Qaz7sCd5whp9H3y3XJCi2zke7e/uN9DkbCO5TqIUwyTsAQjSMIXm5pLG7
   0YiL4t1SOtndvmzdcOj/19bvrdaZfa7clTmgBJpNJc0ZVKn2r+OnNJNwS
   A==;
X-CSE-ConnectionGUID: Hs6NO935ReW7SKrv8TsS7w==
X-CSE-MsgGUID: LtBkKcrFTfmHcjJ2c9Jsxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87285131"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="87285131"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 09:06:54 -0700
X-CSE-ConnectionGUID: /uqrSg/7QH+1XeeU+hZ6rg==
X-CSE-MsgGUID: 5I/DrM6NSCKJvZWKgtt8fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="256917555"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO [10.125.109.194]) ([10.125.109.194])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 09:06:53 -0700
Message-ID: <cda08444-02e7-45f9-a71a-925f88516183@intel.com>
Date: Mon, 29 Jun 2026 09:06:52 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cxl: docs/linux/dax-driver - fix typos
To: Zenghui Yu <zenghui.yu@linux.dev>, linux-cxl@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dave@stgolabs.net, jic23@kernel.org, alison.schofield@intel.com,
 vishal.l.verma@intel.com, ira.weiny@intel.com, djbw@kernel.org,
 gourry@gourry.net, corbet@lwn.net, skhan@linuxfoundation.org
References: <20260614161458.88942-1-zenghui.yu@linux.dev>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20260614161458.88942-1-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zenghui.yu@linux.dev,m:linux-cxl@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dave@stgolabs.net,m:jic23@kernel.org,m:alison.schofield@intel.com,m:vishal.l.verma@intel.com,m:ira.weiny@intel.com,m:djbw@kernel.org,m:gourry@gourry.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.jiang@intel.com,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94030-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.jiang@intel.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EEB66DD3A9



On 6/14/26 9:14 AM, Zenghui Yu wrote:
> Fix two obvious typos in the "kmem conversion" section.
> 
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>

Applied to cxl/next
a667f1eb71a7


> ---
>  Documentation/driver-api/cxl/linux/dax-driver.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/cxl/linux/dax-driver.rst b/Documentation/driver-api/cxl/linux/dax-driver.rst
> index 10d953a2167b..72c85a0f8606 100644
> --- a/Documentation/driver-api/cxl/linux/dax-driver.rst
> +++ b/Documentation/driver-api/cxl/linux/dax-driver.rst
> @@ -35,9 +35,9 @@ will be exposed to the kernel page allocator in the user-selected memory
>  zone.
>  
>  The :code:`memmap_on_memory` setting (both global and DAX device local)
> -dictates where the kernell will allocate the :code:`struct folio` descriptors
> +dictates where the kernel will allocate the :code:`struct folio` descriptors
>  for this memory will come from.  If :code:`memmap_on_memory` is set, memory
>  hotplug will set aside a portion of the memory block capacity to allocate
>  folios. If unset, the memory is allocated via a normal :code:`GFP_KERNEL`
> -allocation - and as a result will most likely land on the local NUM node of the
> +allocation - and as a result will most likely land on the local NUMA node of the
>  CPU executing the hotplug operation.


