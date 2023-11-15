Return-Path: <linux-doc+bounces-2255-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3E17EA288
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 19:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85E01280E70
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 18:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBC520B28;
	Mon, 13 Nov 2023 18:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="NSSUHISV"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9F42231F
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 18:04:52 +0000 (UTC)
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9051D10F4;
	Mon, 13 Nov 2023 10:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
	MIME-Version:Date:Message-ID:content-disposition;
	bh=MOpxGXC7M3/2RM/puA4CjW+qTpABv3OXAgil8PHWiTI=; b=NSSUHISV6/fM/6cNedFPeGPyfj
	+jAEJzQrv4QbZrgKF/wrEoBNjWICgovD+b5WMyCoaqSg3ugFsjX1eyWoWGkRuPJdRaVuFYOPITvBl
	Cp0lCyjvWLZ0LnAT4J2tL7YWIIutCnsdjb27wWIB8NJi0K9L+CRtFBVWRFVI+TZXCaTMe9R1eyatT
	SmyPdBl/cjYgT46J8O0N3Ay37yC55DB+voCGDaHil38MNXoi9XCXdLHhsN6PGa98mwasb/h/2diRi
	/xj2o8+AeD8R3+IQMjCvmUsYF1MnjX3SLMBw6ZfpbsEtE+PhQepbI6raOZE2SWW54IoG/6OURDR4z
	F53/0Ynw==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
	by ale.deltatee.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <logang@deltatee.com>)
	id 1r2bIj-004myt-E1; Mon, 13 Nov 2023 11:04:46 -0700
Message-ID: <20462800-3656-4415-b59f-a3cd2131febc@deltatee.com>
Date: Mon, 13 Nov 2023 11:04:44 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-CA
To: Tadeusz Struk <tstruk@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-pci@vger.kernel.org,
 linux-doc@vger.kernel.org, stable@kernel.org,
 Tadeusz Struk <tstruk@gigaio.com>
References: <6eb84bc5-dd58-4745-8e99-ccc97c10fb63@deltatee.com>
 <20231113180325.444692-1-tstruk@gmail.com>
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20231113180325.444692-1-tstruk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: tstruk@gmail.com, bhelgaas@google.com, corbet@lwn.net, linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, stable@kernel.org, tstruk@gigaio.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: Re: [PATCH v2] Documentation: PCI/P2PDMA: Remove reference to
 pci_p2pdma_map_sg()
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)



On 2023-11-13 11:03, Tadeusz Struk wrote:
> From: Tadeusz Struk <tstruk@gigaio.com>
> 
> Update Documentation/driver-api/pci/p2pdma.rst doc and
> remove references to obsolete p2pdma mapping functions.
> 
> Fixes: 0d06132fc84b ("PCI/P2PDMA: Remove pci_p2pdma_[un]map_sg()")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Tadeusz Struk <tstruk@gigaio.com>

Looks good to me, thanks!

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Logan

