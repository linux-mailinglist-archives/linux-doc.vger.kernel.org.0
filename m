Return-Path: <linux-doc+bounces-11976-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0658797E9
	for <lists+linux-doc@lfdr.de>; Tue, 12 Mar 2024 16:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E70B1C217A6
	for <lists+linux-doc@lfdr.de>; Tue, 12 Mar 2024 15:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580097C6F6;
	Tue, 12 Mar 2024 15:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O9yoOEgW"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D37F7C6D6
	for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710258448; cv=none; b=bT7CqGBKcP/HbzYpQ/WhJtAXwELMPk1IJ0YWMnGPORdTODE5OepX5lzZrKQvvz7Q9P0DaEALTq5ax+MZWx5EwH4zrhT70c2IPxOKLoWAtK/MJ8viCddsa8TOcjilU6XImXtt21arl14EBt2AKf8eqW7tx3CmrK145eKvhxXoF/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710258448; c=relaxed/simple;
	bh=d/S0Om5CP7kfBCh6KRIKk04Z6CFJhQl+MBCAURqIDMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=popnIWIb0i0D5rr2c73zdQDPBQ5I7oDCXde7gCjr4VvjVhT/1QcQKuJHCehvoIE3/M8baY4P71CVjTXV+qNsuYVhNPlO73f6H8Hx+cCuLAkbhqJy1PYz5vVDpgHp9KJ+hzl4JaCUOr6KEc5IeEpAqTX97XsSlvGq3/mCdkuNq9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O9yoOEgW; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 12 Mar 2024 08:47:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1710258444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IBHh3k3RuYYlysG4vpKtI1L13MnMBvP8xcIit+nrqtY=;
	b=O9yoOEgW8BhLzG2TDA19BQDFTvIiAOMlFuKlMxTj31EWLltBgp9M1mg2KDOdV6i1POGOOz
	iKT4+h8XoCkn5X865U1ZnNivg1fzpmCZqJKpivy/6l/qV2eUmT/FIvLTdE9E2r3XlfwLP8
	kYjxOFuqbx2cjyxgCx275UPlGHSvssI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Mostafa Saleh <smostafa@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] KVM: arm64: Add PSCI SYSTEM_OFF2 function for
 hibernation
Message-ID: <ZfB5BMfLHWhQXLZY@thinky-boi>
References: <20240312135958.727765-1-dwmw2@infradead.org>
 <20240312135958.727765-2-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312135958.727765-2-dwmw2@infradead.org>
X-Migadu-Flow: FLOW_OUT

Hi,

On Tue, Mar 12, 2024 at 01:51:28PM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The PSCI v1.3 specification (alpha) adds support for a SYSTEM_OFF2 function
> which is analogous to ACPI S4 state. This will allow hosting environments
> to determine that a guest is hibernated rather than just powered off, and
> ensure that they preserve the virtual environment appropriately to allow
> the guest to resume safely (or bump the hardware_signature in the FACS to
> trigger a clean reboot instead).
> 
> The beta version will be changed to say that PSCI_FEATURES returns a bit
> mask of the supported hibernate types, which is implemented here.

Have you considered doing the PSCI implementation in userspace? The
SMCCC filter [*] was added for this exact purpose. There are other
features being done in userspace (e.g. vCPU hotplug) built on
intercepting hypercalls, this seems to be a reasonable candidate too.

[*] https://docs.kernel.org/virt/kvm/devices/vm.html#attribute-kvm-arm-vm-smccc-filter-w-o

-- 
Thanks,
Oliver

