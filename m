Return-Path: <linux-doc+bounces-29460-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D26BF9B81E3
	for <lists+linux-doc@lfdr.de>; Thu, 31 Oct 2024 18:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 104BD1C21E1D
	for <lists+linux-doc@lfdr.de>; Thu, 31 Oct 2024 17:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8371C2443;
	Thu, 31 Oct 2024 17:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XvOSQQTy"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C1C1C4614
	for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730397438; cv=none; b=Krup+Cn7tJpvDLUnkEnxebsl3wz3OuSBnjOQX0K1MJ9euoVrle37RDS4hkIDhru8R9QFBFFYwP8/BKFn+kiRpIp/MIbJczdE35XHCZVhvAtQgm1gmMziXsmxxaWsmjDervwc0nrVpbZo1rsQukEimirgacCCGXSJATZb70gEusA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730397438; c=relaxed/simple;
	bh=q1YYUodSmTodhE+D81aQ6XaJa+CaDzbe/lugFywi4Os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CAgaS4Ms5UWgoZWPXrLSL0ARl2Jl0G5YAMaKtRrFB+x9rBlOHkIcC2HcdFyxw2HwdGzVUUnNrBmf09pIT2BMfozRE7mb8mJsoUnqIGEM3QtcImmgsWn/DZpOA0BAgKnPSKQQOnkZNEb+UXdhNvU1IFVZTQk48x+chRePU1J++TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XvOSQQTy; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730397432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bWtV3C7i/G3T+slJBVyjKo2SBOT6MrCS/c6nAmcFKU8=;
	b=XvOSQQTywyn8PCw6xWHtz1OrMtjHLRWt92nbzaZvZKYHrN31c8h6b8bI7KThzcdghDdNWP
	YYuFi56kPBEGeWUalckQgnAzJVNB2STUmA84eliFRc3Rq7w4FovNH2mvo1MqIcxGuF6HRB
	hIv2QMaIVOKAYrQ9wt2bRNq0OqomD7w=
From: Oliver Upton <oliver.upton@linux.dev>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pavel Machek <pavel@ucw.cz>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Will Deacon <will@kernel.org>,
	Len Brown <len.brown@intel.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	kvmarm@lists.linux.dev,
	David Woodhouse <dwmw@amazon.co.uk>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Francesco Lavra <francescolavra.fl@gmail.com>,
	linux-pm@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	kvm@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Luis <miguel.luis@oracle.com>,
	linux-kernel@vger.kernel.org,
	James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-doc@vger.kernel.org,
	Zenghui Yu <yuzenghui@huawei.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Oliver Upton <oliver.upton@linux.dev>
Subject: Re: (subset) [PATCH v6 0/6] Add PSCI v1.3 SYSTEM_OFF2 support for hibernation
Date: Thu, 31 Oct 2024 17:56:58 +0000
Message-ID: <173039739006.2928363.16193131105108954688.b4-ty@linux.dev>
In-Reply-To: <20241019172459.2241939-1-dwmw2@infradead.org>
References: <20241019172459.2241939-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Sat, 19 Oct 2024 18:15:41 +0100, David Woodhouse wrote:
> The PSCI v1.3 spec (https://developer.arm.com/documentation/den0022)
> adds support for a SYSTEM_OFF2 function enabling a HIBERNATE_OFF state
> which is analogous to ACPI S4. This will allow hosting environments to
> determine that a guest is hibernated rather than just powered off, and
> ensure that they preserve the virtual environment appropriately to
> allow the guest to resume safely (or bump the hardware_signature in the
> FACS to trigger a clean reboot instead).
> 
> [...]

Thanks Catalin for the ack, as promised:

Applied to kvmarm/next, thanks!

[6/6] arm64: Use SYSTEM_OFF2 PSCI call to power off for hibernate
      https://git.kernel.org/kvmarm/kvmarm/c/3e251afaec9a

--
Best,
Oliver

