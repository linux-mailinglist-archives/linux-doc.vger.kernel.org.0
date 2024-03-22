Return-Path: <linux-doc+bounces-12569-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 016E888702B
	for <lists+linux-doc@lfdr.de>; Fri, 22 Mar 2024 17:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 334711C22A41
	for <lists+linux-doc@lfdr.de>; Fri, 22 Mar 2024 16:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC01C56B61;
	Fri, 22 Mar 2024 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmV2lbD8"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8652A55C26;
	Fri, 22 Mar 2024 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711123336; cv=none; b=KWu4diiDc996oYNK0XhntUbwrSlXfLlp7CoyNHgtz3xLRO10EnK69PcnFO8J5R9grl097zzEG/otSD3d1t2kR4Xo0PA62zYcDW24M+f53TGLyOrJui/vOf6rlhLH6iM/fLMCyvxYhKOJ/4n770j6ZFa8vvRz0w8B/IA87CtBt4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711123336; c=relaxed/simple;
	bh=aoF4dmwFvyElelkcyMu8PBXHligJrfzMuWeep9NvMbE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o++SgCsi1gVOqrHHhuslc+4blCyIZ/pJESI3B9ed5GLVh8AqZeJEGSP84Y/EpayIofmsSgbimmEmUWEouizamzLhBxcqfFCjKRhs4TKX0BaalchySLSq9kzQPvYXjCWPiBvXDN6kKImCMSa6I6Fg9VTqKM2DHcAEoeL+e2AFdx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmV2lbD8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029EEC43390;
	Fri, 22 Mar 2024 16:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711123336;
	bh=aoF4dmwFvyElelkcyMu8PBXHligJrfzMuWeep9NvMbE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jmV2lbD8c9m4XS0wNhC398FxSmiqjv7s7Bi+bn9P468s7vuNLU2ruoJ3MPBccLCWs
	 rgwR/pvDFZf1bWj6jd0Dhd4gZ+9bGE3/APLKNs/Iz9t5EVO+9zTe7NInnlSLFwKNSZ
	 2W8bmvrhS3UOcgseDjzYAtGUKnv56maI6uA8aFjAG2gdnlMhDvIwIH4t4hM/J6SJzU
	 r/BuncZ/jwB6zYWPobFYoj5YxFXNaz7o1HU+Ndw1WKVgcghEDT7KTWf77RYOFGopG3
	 QJC8nmcK+OiFRLvPxkAuADC7fJND5aBOwvL6kB9t1Cb8eXSZLedn73exd+6T3u8RJ0
	 lp62WtpQCKA6Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1rnhLR-00EYDl-8X;
	Fri, 22 Mar 2024 16:02:13 +0000
Date: Fri, 22 Mar 2024 16:02:12 +0000
Message-ID: <86jzluz24b.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <len.brown@intel.com>,
	Pavel Machek <pavel@ucw.cz>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Mostafa Saleh <smostafa@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [RFC PATCH v3 5/5] arm64: Use SYSTEM_OFF2 PSCI call to power off for hibernate
In-Reply-To: <20240319130957.1050637-6-dwmw2@infradead.org>
References: <20240319130957.1050637-1-dwmw2@infradead.org>
	<20240319130957.1050637-6-dwmw2@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, oliver.upton@linux.dev, james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, lpieralisi@kernel.org, rafael@kernel.org, len.brown@intel.com, pavel@ucw.cz, dwmw@amazon.co.uk, smostafa@google.com, jean-philippe@linaro.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-pm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Tue, 19 Mar 2024 12:59:06 +0000,
David Woodhouse <dwmw2@infradead.org> wrote:

[...]

> +static void __init psci_init_system_off2(void)
> +{
> +	int ret;
> +
> +	ret = psci_features(PSCI_FN_NATIVE(1_3, SYSTEM_OFF2));
> +
> +	if (ret != PSCI_RET_NOT_SUPPORTED)
> +		psci_system_off2_supported = true;

It'd be worth considering the (slightly broken) case where SYSTEM_OFF2
is supported, but HIBERNATE_OFF is not set in the response, as the
spec doesn't say that this bit is mandatory (it seems legal to
implement SYSTEM_OFF2 without any hibernate type, making it similar to
SYSTEM_OFF).

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

