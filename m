Return-Path: <linux-doc+bounces-13185-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA92893124
	for <lists+linux-doc@lfdr.de>; Sun, 31 Mar 2024 12:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 769871C21167
	for <lists+linux-doc@lfdr.de>; Sun, 31 Mar 2024 10:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C45E76034;
	Sun, 31 Mar 2024 10:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmMMF4Fq"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F5A1C33;
	Sun, 31 Mar 2024 10:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711879249; cv=none; b=MYHpxZ2baLuuXk7FsGlgbEwUH+HAuPp9bbi7hbv7x/XUpDh68/74rZxiXEynQFIh5DFhLLVg7jnwKxSwlGUG/evRsjqJLt77mQT62Ch2KdJkgqGzpLqyJnC2eZxZ1JASoSAeRivoog4wQ2A1txbOaYZg1mf/v5qEWW7P60L9ur0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711879249; c=relaxed/simple;
	bh=8ZlEK5607Jk4tOKuXpJJJZbQBuqSIL7N3MY76VqKGds=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tQq5PggapuYJ0UGG0JZQAfZD4QGTMlk6ZJqtF5xLRvsC/wnVcyqPLprYzKCbsnvIrdAwTZUM29Zy62dABUkYeSYjBkSczJ8FvIZZT32HoGhsz3k4bZMoUz0hsi/dTBecJdH/jy0v0T/I0jd9cP65b1yiAqJAjewNCzHSD86q830=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmMMF4Fq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61394C433F1;
	Sun, 31 Mar 2024 10:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711879248;
	bh=8ZlEK5607Jk4tOKuXpJJJZbQBuqSIL7N3MY76VqKGds=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KmMMF4FqWijFeM4Mc1d+9Ubdwa3TgkbMdi6eJ6RH0MAB8zu2AokIMtuynk9zHpst7
	 sjaOhpoiX/WY/rN5CHXvjADJSyWPVAk6E29IYeTIpMKQgGbS0bjQEdOxCPRzZrHqRo
	 4I61gRbw7wBV0302LHrINBbf1Qu8jogvvPA2OPYB5Rda+tdjSWwlpUrBL94xa7zCyT
	 sxQ3fdtYh4Ed+8k8UoLlhy5wUCDdk+g9Ee0f7ZkPcpfN1U2bUQTJtR0mIKbmN2Yu8J
	 cWc12qcfmDEeapF4GLr3ETEj5czb7hk7mGI/Lk19OgAijibq+r+28/DKr5RV5kcQ3E
	 ZsOTd8Sgq5fug==
Received: from ip-185-104-136-29.ptr.icomera.net ([185.104.136.29] helo=wait-a-minute.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1rqrzY-00013r-IH;
	Sun, 31 Mar 2024 11:00:45 +0100
Date: Sun, 31 Mar 2024 11:00:41 +0100
Message-ID: <87msqesoty.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dave Martin <Dave.Martin@arm.com>,
	kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 1/5] KVM: arm64: Share all userspace hardened thread data with the hypervisor
In-Reply-To: <20240329-arm64-2023-dpisa-v6-1-ba42db6c27f3@kernel.org>
References: <20240329-arm64-2023-dpisa-v6-0-ba42db6c27f3@kernel.org>
	<20240329-arm64-2023-dpisa-v6-1-ba42db6c27f3@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/28.2
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.104.136.29
X-SA-Exim-Rcpt-To: broonie@kernel.org, catalin.marinas@arm.com, will@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, suzuki.poulose@arm.com, corbet@lwn.net, shuah@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dave.Martin@arm.com, kvmarm@lists.linux.dev, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Fri, 29 Mar 2024 00:13:42 +0000,
Mark Brown <broonie@kernel.org> wrote:
> 
> As part of the lazy FPSIMD state transitioning done by the hypervisor we
> currently share the userpsace FPSIMD state in thread->uw.fpsimd_state with
> the host. Since this struct is non-extensible userspace ABI we have to keep

Using the same representation is just pure convenience, and nothing
requires us to use the it in the kernel/hypervisor.

> the definition as is but the addition of FPMR in the 2023 dpISA means that
> we will want to share more storage with the host. To facilitate this
> refactor the current code to share the entire thread->uw rather than just
> the one field.

So this increase the required sharing with EL2 from 528 bytes to
560. Not a huge deal, but definitely moving in the wrong direction. Is
there any plans to add more stuff to this structure that wouldn't be
*directly* relevant to the hypervisor?

> 
> The large number of references to fpsimd_state make it very inconvenient
> to add an additional wrapper struct.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h       |  3 ++-
>  arch/arm64/include/asm/processor.h      |  2 +-
>  arch/arm64/kvm/fpsimd.c                 | 13 ++++++-------
>  arch/arm64/kvm/hyp/include/hyp/switch.h |  2 +-
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  4 ++--
>  5 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 9e8a496fb284..8a251f0da900 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -27,6 +27,7 @@
>  #include <asm/fpsimd.h>
>  #include <asm/kvm.h>
>  #include <asm/kvm_asm.h>
> +#include <asm/processor.h>
>  #include <asm/vncr_mapping.h>
>  
>  #define __KVM_HAVE_ARCH_INTC_INITIALIZED
> @@ -640,7 +641,7 @@ struct kvm_vcpu_arch {
>  	struct kvm_guest_debug_arch vcpu_debug_state;
>  	struct kvm_guest_debug_arch external_debug_state;
>  
> -	struct user_fpsimd_state *host_fpsimd_state;	/* hyp VA */
> +	struct thread_struct_uw *host_uw;	/* hyp VA */
>  	struct task_struct *parent_task;

Well, this is going away, and you know it.

	M.

-- 
Without deviation from the norm, progress is not possible.

