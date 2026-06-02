Return-Path: <linux-doc+bounces-90479-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDXAIpulHmq3IwAAu9opvQ
	(envelope-from <linux-doc+bounces-90479-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 11:42:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB2562BC30
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 11:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67C973086374
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 09:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B597137BE83;
	Tue,  2 Jun 2026 09:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QPhYm6gK"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7D53ABD90;
	Tue,  2 Jun 2026 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392508; cv=none; b=U607/EY/paHRG5w03qrluu0QKtUuT3U7mqFkdPex/5i/cb7niiydIpXUMHsq0hCT0DcI61M6wKp9tgSIICXw4YymHLb9MmHG1JaKC+mOlmigKaHtQdA3qrcG+nkuOigUSMH/aAu4DDawcZ4X9jk2YzLk9wL7QNWXWhQuFcF3w0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392508; c=relaxed/simple;
	bh=dZrUdnqAf9XrzV7pvUqn+kP9qXBcqosGRgnk/2w21Mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FOOXrVuS29IgfqikI2ndUc0Fp7HpgXirT3CGh//CXPJJPZtHSB1YGxeSrRHtyWUdLu5slRr5HAI24lAjaOo/NzwbtF0Sr8KjRLR4RdjEQ3Zu9yLivUGEfOBIvwNeiQCHLQT8Pv0KOMQmHVH4/VdfWfPXDsWMdfg2rCthcVUVq3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QPhYm6gK; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D10EE3532;
	Tue,  2 Jun 2026 02:28:21 -0700 (PDT)
Received: from [10.1.25.162] (e121487-lin.cambridge.arm.com [10.1.25.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD0AC3F7D8;
	Tue,  2 Jun 2026 02:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780392506; bh=dZrUdnqAf9XrzV7pvUqn+kP9qXBcqosGRgnk/2w21Mo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QPhYm6gK4mC+PEzhaxpriTDtkt9wexQpUn5bZD3nhFZ1OPU1VQxd8/DvJ7tY/23iK
	 3ru7ryoDFTi3yePlTC+aVsBG+cOKyu7AvcegU8To6luKr26XNXII3U00CXMz3R8UAD
	 Vb/IUQUHxHFDn/C0cS7hVQcTjH0r5Gog2bi94yL8=
Message-ID: <c3aa7bac-4770-4179-b433-15e421ae2e96@arm.com>
Date: Tue, 2 Jun 2026 10:28:19 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] arm64: cpufeature: Add WORKAROUND_DISABLE_CNP
 capability
To: Zeng Heng <zengheng@huaweicloud.com>, xuwei5@huawei.com,
 wangyushan12@huawei.com, yangyicong@hisilicon.com, maz@kernel.org,
 yeoreum.yun@arm.com, miko.lenczewski@arm.com, james.clark@linaro.org,
 corbet@lwn.net, skhan@linuxfoundation.org, kuninori.morimoto.gx@renesas.com,
 lucaswei@google.com, catalin.marinas@arm.com, broonie@kernel.org,
 lpieralisi@kernel.org, thuth@redhat.com, kevin.brodsky@arm.com,
 tongtiangen@huawei.com, oupton@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, will@kernel.org, Sascha.Bischoff@arm.com
Cc: linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260601112000.1145391-1-zengheng@huaweicloud.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260601112000.1145391-1-zengheng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2FB2562BC30
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90479-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.murzin@arm.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,huawei.com:email,arm.com:dkim,arm.com:mid]
X-Rspamd-Action: no action

Hi,

On 6/1/26 12:19, Zeng Heng wrote:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> v2: https://lore.kernel.org/all/20260529063132.766491-1-zengheng@huaweicloud.com/
> v1: https://lore.kernel.org/all/20260526015720.206854-1-zengheng@huaweicloud.com/
> 
> Changes in v3:
>   - Keep CONFIG_ARM64_WORKAROUND_DISABLE_CNP config and generalise
>     ARM64_WORKAROUND_DISABLE_CNP capability.
> 
> Changes in v2:
>   - Unify CNP disable workaround into ARM64_WORKAROUND_DISABLE_CNP
> 
> Zeng Heng (2):
>   arm64: cpufeature: Add WORKAROUND_DISABLE_CNP capability
>   arm64: kernel: Disable CNP on HiSilicon HIP09
> 
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 20 ++++++++++++++++++++
>  arch/arm64/include/asm/cpucaps.h            |  4 ++--
>  arch/arm64/kernel/cpu_errata.c              | 17 ++++++++++++-----
>  arch/arm64/kernel/cpufeature.c              |  2 +-
>  arch/arm64/tools/cpucaps                    |  2 +-
>  6 files changed, 38 insertions(+), 9 deletions(-)
> 
> --
> 2.43.0
> 

Thanks a lot for going the extra mile and putting everything
together! I have no further comments, but let's give others some
time to chime in.

Cheers
Vladimir

