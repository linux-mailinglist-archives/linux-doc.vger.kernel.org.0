Return-Path: <linux-doc+bounces-33344-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC219F8006
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 17:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6558C1889A30
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2024 16:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C88322619A;
	Thu, 19 Dec 2024 16:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1y9GpGu"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01AE2AE96;
	Thu, 19 Dec 2024 16:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734626263; cv=none; b=XUbzGzQMTgnRcxvN8D1h/RgU61Ubfb30MUpr+aQA8irN/vIKidpfY2qRZFje5zlc5IXnoGChVs5Kh5utnCf6ayGsvy4qRugkeX1wVw1/CZ1U/OgFadGK4B4yDOVYVB56ugshBSX+LGlAYA9xNhemc58LrwNc5MXHAXLEr/9QH+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734626263; c=relaxed/simple;
	bh=EDefhr+82fJbRgYXE5hYeauAAvr+YHKOyCh5/nvtES8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKs1d98vISfCDXTGDs2Q5xk+INISLfol8KtBck7W2R85TjHGXIyFUpcMm3HEVsqLRrgqUQfSS+i2BDZfoDhqrC3sgGzR0SveQf1gIic5DfvyD+KKUKYgwzS9cNKyn+LAxM+pF2Row9W7vC1WvJDsRsUxf/tqRJCMfcTZUQJPPYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1y9GpGu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BECC4CECE;
	Thu, 19 Dec 2024 16:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734626262;
	bh=EDefhr+82fJbRgYXE5hYeauAAvr+YHKOyCh5/nvtES8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1y9GpGuL1fWahJnlbpJHQdsMRxJFEK4KZrC8kBjYXmx/0e1/SCdb29c4SxCZcWnM
	 55tiqWJBaClPYHQJaELNouhJILty3MQy2clsZJ3CsypktKSAUDn2KtN+6w2fKGMAo9
	 qTYmzXYVrYULvu3Q+W2apG9Kk/ecYfJ/DetIv9STDugdAak61GdBDQYL06qHnCWdUI
	 jt5qiKFB6CKlF4ja7JTsthcxeF2NYpMMyWfzsP+ZcPnXRqpIDENiTJSWytTRZTCMNF
	 1m4iMbb2lLn8x4L+iFtlc+bUFK+lRbStGdpzXxEkhgtOlBMdr/RLFuHZBXu05aQ70g
	 cUcSvhd1mifXQ==
Date: Thu, 19 Dec 2024 16:37:37 +0000
From: Will Deacon <will@kernel.org>
To: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
Cc: ryan.roberts@arm.com, catalin.marinas@arm.com, corbet@lwn.net,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [RESEND RFC PATCH v1 5/5] arm64/mm: Elide tlbi in
 contpte_convert() under BBML2
Message-ID: <20241219163736.GG24724@willie-the-truck>
References: <20241211160218.41404-1-miko.lenczewski@arm.com>
 <20241211160218.41404-6-miko.lenczewski@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241211160218.41404-6-miko.lenczewski@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Dec 11, 2024 at 04:01:41PM +0000, Mikołaj Lenczewski wrote:
> If we support BBM level 2, we can potentially avoid an intermediate
> TLB invalidation, as hardware is capable of managing the TLB itself
> in this situation. Hardware will either silently clear out the
> offending entry, or will take a TLB Conflict Abort Exception.
> 
> Note that such aborts should not occur on Arm hardware and indeed
> were not seen on any of the benchmarked systems.
> 
> Eliding the invalidation results in a 12% improvement on a
> microbenchmark which targeted the worst case of contpte_convert(), which
> represents an 80% reduction in the overhead of contpte_convert().

Can you run something more indicative of real world performance than a
targetted microbenchmark please?

Will

