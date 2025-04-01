Return-Path: <linux-doc+bounces-42003-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8456CA78057
	for <lists+linux-doc@lfdr.de>; Tue,  1 Apr 2025 18:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DB3F3B1117
	for <lists+linux-doc@lfdr.de>; Tue,  1 Apr 2025 16:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA5521C16A;
	Tue,  1 Apr 2025 16:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VhHBMTqE"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406011C84AB
	for <linux-doc@vger.kernel.org>; Tue,  1 Apr 2025 16:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743524135; cv=none; b=nNPHxxQv+reAfTLyne0kEyT/wWRpSKczIAzQrjz4WxveJxj0UlVf+WSvZFP0AvH2YVlak0omEhEEnY1HXZuWbiXYdcQzUeaiLFXZMq0CpthJqjzs2p2kjwhLITBIxD0P/rltL+ZpB683s/fgoEpntIHd6nzwYsLwidwN67Dk70A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743524135; c=relaxed/simple;
	bh=CjsYqDTL3Qfv7/24claUN0TyqFxxHkmk7j1EDV4/lAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4/ZWzI5GzTYtneqxCP01PCoWmf5dtNEh+9nUWCCa29x9i2axgcaQdiOiDGOwMmEVwzy8y9UcoQgd2y/m6Jky5qM/nXRNZvEV2LR9LCwfHEi9mxCq98GJJlCYfv82EhklGu/D2Ac9OTkiZb6jHezejGBWPEuDLD1DRKVrhELdRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VhHBMTqE; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 1 Apr 2025 09:15:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743524131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9DhpDvkNUPpfOH8u7g4NeRGrOLZYObi0VJk2tn4IER4=;
	b=VhHBMTqEvRt/W7d00gi4rZv5Vt1sCkI5ZjgFbjtPoY1C7HnULbeBlTPvlVAnbDMIyfrbQP
	cPq04Z8ih+Jha0ocloWyHnjO/ac7jH0NfHR2hGoGdLvpq3KA7IhBDbHJV/+up6tiMhH4/V
	QWd3mUEd3ZzAc8n9rErmjeYPnH73pfk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	corbet@lwn.net, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, shuah@kernel.org,
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
	yangyicong@hisilicon.com, tangchengchang@huawei.com
Subject: Re: [PATCH v2 5/6] arm64: Add ESR.DFSC definition of unsupported
 exclusive or atomic access
Message-ID: <Z-wRGyMrz0Tqh0CO@linux.dev>
References: <20250331094320.35226-1-yangyicong@huawei.com>
 <20250331094320.35226-6-yangyicong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331094320.35226-6-yangyicong@huawei.com>
X-Migadu-Flow: FLOW_OUT

On Mon, Mar 31, 2025 at 05:43:19PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> 0x35 indicates IMPLEMENTATION DEFINED fault for Unsupported Exclusive or
> Atomic access. Add ESR_ELx_FSC definition and corresponding wrapper.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Just squash this into the next patch. Adding a helper w/o any user
usually isn't a good idea.

Thanks,
Oliver

