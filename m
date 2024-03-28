Return-Path: <linux-doc+bounces-12340-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0CD880591
	for <lists+linux-doc@lfdr.de>; Tue, 19 Mar 2024 20:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48C421F22EE4
	for <lists+linux-doc@lfdr.de>; Tue, 19 Mar 2024 19:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2203A1BB;
	Tue, 19 Mar 2024 19:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YxSISsTm"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBA639FD6
	for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 19:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710877369; cv=none; b=XrNAlZJJ9eLc3QHoAUGG0T+PQvLW8UMMJMnr8rq6PnloaERr4/5R1Dlzmccd0aYIcvPIs6yF1sNZp6F51zzrvNuSAaj7Mtnk9XRuIyqMHLIWp1PsQRC9VGhB798QGyKwUJmfZCbVGNQJ44VeXGVjWWlmQ405m74CEDjoTY4yMJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710877369; c=relaxed/simple;
	bh=jxAeBP/ue5SwU8EvjYfCWkAWtNBZiIfRplhUqVWxd4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j44/aUJH69y0/RDjaMg2CPP1utzFgAxd27ewQ1ba2jAXnw1hw3YNGNgxqXgLKS7c/iC3Uxu9NLw6b4wNBD8oANT7SZ3R0OM/11OYULS+ZItYRfRysqPFoR3sdya2lj31K9h6eRSOXUzBlPwcL/hWS9m6NrKxpRE7Zwxmq5kWs6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YxSISsTm; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 19 Mar 2024 12:41:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1710877364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IB6aCiV2YaZ67DJuPPU9v2urGUP4NbT2FsdpMimeiuc=;
	b=YxSISsTmDL+ZHAqMgod7mC9czGYbnswv/tAhS17oXMH737LmaXREY8IBTr8cztDulxuOTP
	/4aVspoXv4M6YJvpKrH0eOEOIT+Zhxm24HMuuAhEiz4egIl/Si1GVKFde/upd2xq6XPfY8
	tAlTCOy9Pkru01vrxiiLy7Gs0Jin/U8=
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
	Mostafa Saleh <smostafa@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: [RFC PATCH v3 0/5] Add PSCI v1.3 SYSTEM_OFF2 support for
 hibernation
Message-ID: <Zfnpj2FShq05QZpf@linux.dev>
References: <20240319130957.1050637-1-dwmw2@infradead.org>
 <Zfmu3wnFbIGQZD-j@linux.dev>
 <9e7a6e0f9c290a4b84c5bcc8cf3d4aba3cae2be5.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e7a6e0f9c290a4b84c5bcc8cf3d4aba3cae2be5.camel@infradead.org>
X-Migadu-Flow: FLOW_OUT

On Tue, Mar 19, 2024 at 05:14:42PM +0000, David Woodhouse wrote:
> On Tue, 2024-03-19 at 08:27 -0700, Oliver Upton wrote:
> > If we're going down the route of having this PSCI call live in KVM, it
> > really deserves a test. I think you can just pile on the existing
> > psci_test selftest.
> 
> Added to
> https://git.infradead.org/users/dwmw2/linux.git/shortlog/refs/heads/psci-hibernate
> for next time.
> 
> From 8c72a78e6179bc8970edc66a85ab6bee26f581fb Mon Sep 17 00:00:00 2001
> From: David Woodhouse <dwmw@amazon.co.uk>
> Date: Tue, 19 Mar 2024 17:07:46 +0000
> Subject: [PATCH 4/8] KVM: selftests: Add test for PSCI SYSTEM_OFF2
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Looks good, thanks!

-- 
Thanks,
Oliver

