Return-Path: <linux-doc+bounces-87299-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMTuAZIpBGrfEwIAu9opvQ
	(envelope-from <linux-doc+bounces-87299-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 09:34:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6778852EB68
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 09:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C912A30A5E52
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 07:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089083D6498;
	Wed, 13 May 2026 07:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XmwXSozt"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BA83D1A8A;
	Wed, 13 May 2026 07:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778657649; cv=none; b=hvLNIEe1Xhc6YCwPxB2Q1PV6WYCOxqgyfaXRrj1Pu6TFHDzk+MgqDpEemlkS2WVz6n76lHmGnWACS+LTPcVGekck4Bg85YukUQ1iLevDZOCSN3yrpYhNDXawASflzB6itJussAjD13PKk9usG3YNZmoqFkVQJKBI+FDJDJT/G2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778657649; c=relaxed/simple;
	bh=i70caX1Yr5xAdjGQu0SXobJw2EJJdoR0JSUg6QLPi5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLeUp4Ehh4GovC1Q+xc3xo1YD/5gCRYpYrFlCYWnz/eHxpHOmi7M8yGrrYoidOSqKEMjbN0a8tLUPclv3nYrXAiz7Iu/DalSbDcr7HZykArE32nCpeRj1fKQmvKTvk0DmHmiZfief8INDQYtRNkkPJoJqu8ZlO7uYb+7ceQ1V6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XmwXSozt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB0AC2BCB7;
	Wed, 13 May 2026 07:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778657648;
	bh=i70caX1Yr5xAdjGQu0SXobJw2EJJdoR0JSUg6QLPi5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XmwXSoztVYi0JmtDTF/XDCIcWyHqle3fQy8GbLdpa7GwP7KTGVNBfb3T8L+pqoKdT
	 Jseo6mKI2e0vaGaMiw01h9ZdhNcgpKbB+2yFWnBnMlZ9mgujkMCkgSVrggkSTMZGrQ
	 ZpHTMWWa607c+IJAEvbirha6JAHVkIiSf10SoJ77c60Nw/AUFI8MkXdDKZ5Epx4uLJ
	 +ng7sEf14h+pQUidmmgiVXyql3Nqi1xKaPOSqIwRjpWnR7MUA0RwSG2BPMtlmGLeD/
	 sYZlKWzHE78JsgTUbxsz5yYPlOhD38S6iZlh480kqGJ8XKNBrw4DWHJlH2KDeQ/Sre
	 Tksnt5laoe59g==
Date: Wed, 13 May 2026 00:34:06 -0700
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v7 07/20] KVM: arm64: Set up FGT for Partitioned PMU
Message-ID: <agQpbiD8Fi6fzomf@kernel.org>
References: <20260504211813.1804997-1-coltonlewis@google.com>
 <20260504211813.1804997-8-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504211813.1804997-8-coltonlewis@google.com>
X-Rspamd-Queue-Id: 6778852EB68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87299-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oupton@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 04, 2026 at 09:18:00PM +0000, Colton Lewis wrote:
> +static void __compute_hdfgrtr(struct kvm_vcpu *vcpu)
> +{
> +	__compute_fgt(vcpu, HDFGRTR_EL2);
> +
> +	*vcpu_fgt(vcpu, HDFGRTR_EL2) |=
> +		HDFGRTR_EL2_PMOVS
> +		| HDFGRTR_EL2_PMCCFILTR_EL0
> +		| HDFGRTR_EL2_PMEVTYPERn_EL0
> +		| HDFGRTR_EL2_PMCEIDn_EL0
> +		| HDFGRTR_EL2_PMMIR_EL1;
> +}
> +

I've given this feedback at least twice already...

Operators go on the preceding line in the case of line continuations.

> +
> +/**
> + * kvm_pmu_is_partitioned() - Determine if given PMU is partitioned
> + * @pmu: Pointer to arm_pmu struct
> + *
> + * Determine if given PMU is partitioned by looking at hpmn field. The
> + * PMU is partitioned if this field is less than the number of
> + * counters in the system.
> + *
> + * Return: True if the PMU is partitioned, false otherwise
> + */
> +bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
> +{
> +	if (!pmu)
> +		return false;
> +
> +	return pmu->max_guest_counters >= 0 &&
> +		pmu->max_guest_counters <= *host_data_ptr(nr_event_counters);
> +}
> +
> +/**
> + * kvm_vcpu_pmu_is_partitioned() - Determine if given VCPU has a partitioned PMU
> + * @vcpu: Pointer to kvm_vcpu struct
> + *
> + * Determine if given VCPU has a partitioned PMU by extracting that
> + * field and passing it to :c:func:`kvm_pmu_is_partitioned`
> + *
> + * Return: True if the VCPU PMU is partitioned, false otherwise
> + */
> +bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
> +{
> +	return kvm_pmu_is_partitioned(vcpu->kvm->arch.arm_pmu) &&
> +		false;
> +}

Ok, I'm thoroughly confused about these predicates.

Whether or not a vCPU is using a partitioned PMU is a per-VM property.
This is separate from whether or not the backing arm_pmu has a range of
available counters for the guest to use.

It is entirely possible that a VM *isn't* using the partitioned PMU
feature (i.e. backed with perf events) yet the supporting arm_pmu has a
guest counter range.

 
> +#if !defined(__KVM_NVHE_HYPERVISOR__)
> +bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
> +bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu);
> +#else
> +static inline bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
> +{
> +	return false;
> +}
> +
> +static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
> +{
> +	return false;
> +}
> +#endif
> +

Don't use ifdeffery for this. Aim to have a single definition and rely
on has_vhe() to do the rest of the work.
 
Thanks,
Oliver

