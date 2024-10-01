Return-Path: <linux-doc+bounces-26116-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C41098C1B0
	for <lists+linux-doc@lfdr.de>; Tue,  1 Oct 2024 17:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 031C71F251D3
	for <lists+linux-doc@lfdr.de>; Tue,  1 Oct 2024 15:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EE41C8FD5;
	Tue,  1 Oct 2024 15:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Qem4xKlE"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C105C33D5;
	Tue,  1 Oct 2024 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727796801; cv=none; b=o58xwWzkhT0JeOyFV8lcTl/onFnfbH/RQXtARAGCJD8kQBdwH7+y3DgtEpGoxNpQi9DY/tl5ONrfNJSWYh1ABBZrEwK4hhGvYgdkh+UbuwqNV1sByiKOrYuPwS/BJ7Dl6FYBqHyJCexsjzm83ivzcapmu6TVxUzDv/RSZtDPhLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727796801; c=relaxed/simple;
	bh=1lVJCFJ+9lC4Hqv3VxRIkpY4CSdS2wQeKYWAj0jYLFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5Kx5C9mrDTKsa3SVrSgnRLhUF7HobNrtmFe3gYswDM79n5uH+jXDs6KO0AkwHO/9MDtrel8UQ1mnMuEb4DvgEbOh1P0OylgIspPh4qaojMvEUnUfxQnc27UzpIeqRCukuVRtWRuMeQqqWZgsuwPHCYwmtxtrAMkGjIhELPQqCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Qem4xKlE; arc=none smtp.client-ip=95.215.58.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 1 Oct 2024 08:33:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727796797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gHHnd0uZqwkSQZ3+IQUAv4emjo3ZxHdL/94oWw/hsu4=;
	b=Qem4xKlEhgO/1K88KARxq3hAkKIDuwfo4RNuMWjy22ryhUhRuhefTdm6kECfRoVW2Rh8K9
	zlOxQCR/7PXZ98IkJ3oXyc4J13JB4AwOG+pGz+3obWDL+SviWYZhjG0tvdm5suZpLb8rY+
	B0lKBmpxu0DW7B3YFAVz0XToXCFYBA8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
	Shuah Khan <shuah@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Francesco Lavra <francescolavra.fl@gmail.com>,
	Miguel Luis <miguel.luis@oracle.com>
Subject: Re: [PATCH v5 4/5] KVM: selftests: Add test for PSCI SYSTEM_OFF2
Message-ID: <ZvwWM7rQd075o6nb@linux.dev>
References: <20240926184546.833516-1-dwmw2@infradead.org>
 <20240926184546.833516-5-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926184546.833516-5-dwmw2@infradead.org>
X-Migadu-Flow: FLOW_OUT

On Thu, Sep 26, 2024 at 07:37:59PM +0100, David Woodhouse wrote:
> +static void guest_test_system_off2(void)
> +{
> +	uint64_t ret;
> +
> +	/* assert that SYSTEM_OFF2 is discoverable */
> +	GUEST_ASSERT(psci_features(PSCI_1_3_FN_SYSTEM_OFF2) &
> +		     BIT(PSCI_1_3_HIBERNATE_TYPE_OFF));
> +	GUEST_ASSERT(psci_features(PSCI_1_3_FN64_SYSTEM_OFF2) &
> +		     BIT(PSCI_1_3_HIBERNATE_TYPE_OFF));
> +

Can you also assert that the guest gets INVALID_PARAMETERS if it sets
arg1 or arg2 to a reserved value?

> +	ret = psci_system_off2(PSCI_1_3_HIBERNATE_TYPE_OFF);
> +	GUEST_SYNC(ret);
> +}
> +
> +static void host_test_system_off2(void)
> +{
> +	struct kvm_vcpu *source, *target;
> +	uint64_t psci_version = 0;
> +	struct kvm_run *run;
> +	struct kvm_vm *vm;
> +
> +	vm = setup_vm(guest_test_system_off2, &source, &target);
> +	vcpu_get_reg(target, KVM_REG_ARM_PSCI_VERSION, &psci_version);
> +	TEST_ASSERT(psci_version >= PSCI_VERSION(0, 2),
> +		    "Unexpected PSCI version %lu.%lu",
> +		    PSCI_VERSION_MAJOR(psci_version),
> +		    PSCI_VERSION_MINOR(psci_version));
> +
> +	if (psci_version < PSCI_VERSION(1,3))
> +		goto skip;

I'm not following this. Is there a particular reason why we'd want to
skip for v1.2 and fail the test for anything less than that?

Just do TEST_REQUIRE(psci_version >= PSCI_VERSION(1, 3)), it makes the
requirements obvious in the case someone runs new selftests on an old
kernel.

-- 
Thanks,
Oliver

