Return-Path: <linux-doc+bounces-29214-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D34DA9B6533
	for <lists+linux-doc@lfdr.de>; Wed, 30 Oct 2024 15:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04E6F1C22136
	for <lists+linux-doc@lfdr.de>; Wed, 30 Oct 2024 14:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDC61EF0AB;
	Wed, 30 Oct 2024 14:05:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66341EF082;
	Wed, 30 Oct 2024 14:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730297143; cv=none; b=mGOumXbwBl72kWT9Mixs1HRwc71QtjXxne2zfUt8RprcI5pETocXe5ok+2e3wE9EGlDuKbhdYszU/f0aKiKej00pZwU9ieDMF308VejWFywYXoqUs3w0lMKHQyGjLAy5rWQU1uOyyL4ym0KBRl+8ot7MSPWvnMwrHnE/xMxxr+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730297143; c=relaxed/simple;
	bh=T9ndz9x9yf6p+48jr9FN1ckrPa3Z+mgOLevKiNplWgw=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h8FfZW7Fpk6ie0izCIWq5Qf9kEqxYx+ZAPPLrkD1Qfss5TaxNxswCc2qpLt2t5mZlgzEzaVj2CkmCw752SswqpGHaz9AKDvR5HQ7VAJ+c1bXK1ysioM8ksBRiJ0m8LTgzec+tUeQAzKQaM0vqitxf3+fvAcbk9doNG9U1jrgSPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xdpk81W2Lz6K6hs;
	Wed, 30 Oct 2024 22:03:12 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 68104140593;
	Wed, 30 Oct 2024 22:05:37 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 30 Oct
 2024 15:05:36 +0100
Date: Wed, 30 Oct 2024 14:05:35 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: <ira.weiny@intel.com>
CC: Dave Jiang <dave.jiang@intel.com>, Fan Ni <fan.ni@samsung.com>, "Navneet
 Singh" <navneet.singh@intel.com>, Jonathan Corbet <corbet@lwn.net>, "Andrew
 Morton" <akpm@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>, "Alison Schofield"
	<alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>,
	<linux-cxl@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<nvdimm@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Kees Cook
	<kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	<linux-hardening@vger.kernel.org>
Subject: Re: [PATCH v5 08/27] cxl/mem: Read dynamic capacity configuration
 from the device
Message-ID: <20241030140535.000009ca@Huawei.com>
In-Reply-To: <20241029-dcd-type2-upstream-v5-8-8739cb67c374@intel.com>
References: <20241029-dcd-type2-upstream-v5-0-8739cb67c374@intel.com>
	<20241029-dcd-type2-upstream-v5-8-8739cb67c374@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Tue, 29 Oct 2024 15:34:43 -0500
ira.weiny@intel.com wrote:

> From: Navneet Singh <navneet.singh@intel.com>
> 
> Devices which optionally support Dynamic Capacity (DC) are configured
> via mailbox commands.  CXL 3.1 requires the host to issue the Get DC
> Configuration command in order to properly configure DCDs.  Without the
> Get DC Configuration command DCD can't be supported.
> 
> Implement the DC mailbox commands as specified in CXL 3.1 section
> 8.2.9.9.9 (opcodes 48XXh) to read and store the DCD configuration
> information.  Disable DCD if DCD is not supported.  Leverage the Get DC
> Configuration command supported bit to indicate if DCD is supported.
> 
> Linux has no use for the trailing fields of the Get Dynamic Capacity
> Configuration Output Payload (Total number of supported extents, number
> of available extents, total number of supported tags, and number of
> available tags).  Avoid defining those fields to use the more useful
> dynamic C array.
> 
> Cc: Li, Ming <ming4.li@intel.com>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Navneet Singh <navneet.singh@intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Co-developed-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
I'll assume you'll fix the typo the bot found.

> +
> +/* See CXL 3.1 Table 8-164 get dynamic capacity config Output Payload */
> +struct cxl_mbox_get_dc_config_out {
> +	u8 avail_region_count;
> +	u8 regions_returned;
> +	u8 rsvd[6];
> +	/* See CXL 3.1 Table 8-165 */
> +	struct cxl_dc_region_config {
> +		__le64 region_base;
> +		__le64 region_decode_length;
> +		__le64 region_length;
> +		__le64 region_block_size;
> +		__le32 region_dsmad_handle;
> +		u8 flags;
> +		u8 rsvd[3];
> +	} __packed region[] __counted_by(regions_retunred);
returned

> +	/* Trailing fields unused */
> +} __packed;

