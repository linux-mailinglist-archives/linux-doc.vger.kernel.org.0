Return-Path: <linux-doc+bounces-33113-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDC89F5FA7
	for <lists+linux-doc@lfdr.de>; Wed, 18 Dec 2024 08:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFC5D1884D43
	for <lists+linux-doc@lfdr.de>; Wed, 18 Dec 2024 07:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC415FEED;
	Wed, 18 Dec 2024 07:49:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B108142048;
	Wed, 18 Dec 2024 07:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734508178; cv=none; b=gUbxucPvi4wRWx8kmfKDyu+v9puf+NRLvE0bg6cqWOpngjdeUEQYfwC0Onk5Cw4sDHTYTpgdAOWgYhgGcgNaWq6SGOUGWFmLU2MWO0eahbrTbZwY4RynLmNVLKBMl47k+X/UI3VJ8HwGotxvrQQVLOI6MsqiisAgkOyYwR2Suwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734508178; c=relaxed/simple;
	bh=PEOwYYF1uZB0LNOa9/HuQNLjULCoGGYdQHSJ2p+nC1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WMFfaNvbhzrjuxkfB92nPG9+f9O00Lg1ohq3jMQ7EYhMKbg+7wkSQMaETkph3JXjmXYp/u6AMHEjL3LSXPB9tXJGZmjGtlpHcfextVUtaVmYTtg5q+Sda6ZWdKADjWHUKOc8m+niPkJV26Jx8efJIuO6jfRnwJxNg6a0MQbQhaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C539FEC;
	Tue, 17 Dec 2024 23:50:04 -0800 (PST)
Received: from [10.163.50.13] (unknown [10.163.50.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C86E33F720;
	Tue, 17 Dec 2024 23:49:33 -0800 (PST)
Message-ID: <809ddd0a-3fad-4e3a-a106-070d2235b3dc@arm.com>
Date: Wed, 18 Dec 2024 13:19:31 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] docs: arm64: Document MDCR_EL3 boot requirements
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241211065425.1106683-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20241211065425.1106683-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/11/24 12:24, Anshuman Khandual wrote:
> This series adds missing MDCR_EL3 boot requirements for debug and pmu
> registers that are currently being accessed in the kernel. Please refer
> the following link for some earlier discussions on this.
> 
> https://lore.kernel.org/all/ZxfOeqyb3RvsdYbU@J2N7QTR9R3/
> 
> This series applies on v6.13-rc1
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> Anshuman Khandual (2):
>   docs: arm64: Document EL3 requirements for cpu debug architecture
>   docs: arm64: Document EL3 requirements for FEAT_PMUv3
> 
>  Documentation/arch/arm64/booting.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Gentle ping, any updates on this.

