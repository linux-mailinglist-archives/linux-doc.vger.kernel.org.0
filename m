Return-Path: <linux-doc+bounces-90543-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RuqhGA7+HmracQAAu9opvQ
	(envelope-from <linux-doc+bounces-90543-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 18:00:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F64630097
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 18:00:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Eh27Qgfh;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90543-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90543-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93AC2301BF62
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 15:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0AB83F1664;
	Tue,  2 Jun 2026 15:53:53 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35A43F0755;
	Tue,  2 Jun 2026 15:53:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780415633; cv=none; b=G8okET0D8a2F7XMG6gi6/vuZGb30kF4TXa+WJFB2ieafucgIKs+0jWt8KlOwqtdjIWWh/7OMAnU6543WTXWYM+xReaI/5VYkzHLytIFE3tRK/RaCg5oR8fPknX58FG4v1GDKQGSeDGvNlheEmoExBbSsD7K/plDaKa4Strchfto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780415633; c=relaxed/simple;
	bh=bPplqRqZLwULe4vwQaG/n15wR/fDHQ8TSZqe0vSiBzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McCP5TIL99Mk96tNmr2iJgoNCMW4RcArjDiOJo1MHaBESy9dKk2J7BwnSldLmnBZtp9OxCoMkq7fKQV6jz8ifowEEKHVQX7+gq2rUGSSlQGCy8Yw40rNotC67e20lbMNqfocGPpAqcfCzYslAx5/UN047YU1NXGpmwjzvG8MtAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eh27Qgfh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6981F00893;
	Tue,  2 Jun 2026 15:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780415632;
	bh=g1gxQOYwgpOrI7CcKQFX0nybbQGoJfcX1gVspJlp6G0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Eh27QgfhvW7svjtX9XwdHqJ+rCdP7BBSdRVIVnMc1Wg7O9IHCAC5GUR6nIO11Faj1
	 I/8a+n1vmleEaNXGJ5drcpYTDyxJ8s6fFiNyOt6JtIPlGYCfgsbTAtmqDQf6u2+nSq
	 79sP/Wt67eSw1KbcYcWyfNiLFqWDyoh264CLTjF+zTjfQ2/2NV0Wv90+AoQIG4t2kP
	 5cGHX35eJ8FiVRKaiyRLWqdvBk8z6+GryQaamsTO3jPSmIAOZIwUQHZ6MKD6OPhPK6
	 r18UrNY2Fwh2uPGPorFa9v9L14OQIZkjcwrxsYdTdz1uh3nsa+sfZOytlKVAog+dsq
	 VSD/fiH4NIzoA==
Date: Tue, 2 Jun 2026 16:53:44 +0100
From: Will Deacon <will@kernel.org>
To: Zeng Heng <zengheng@huaweicloud.com>
Cc: vladimir.murzin@arm.com, xuwei5@huawei.com, wangyushan12@huawei.com,
	yangyicong@hisilicon.com, maz@kernel.org, yeoreum.yun@arm.com,
	miko.lenczewski@arm.com, james.clark@linaro.org, corbet@lwn.net,
	skhan@linuxfoundation.org, kuninori.morimoto.gx@renesas.com,
	lucaswei@google.com, catalin.marinas@arm.com, broonie@kernel.org,
	lpieralisi@kernel.org, thuth@redhat.com, kevin.brodsky@arm.com,
	tongtiangen@huawei.com, oupton@kernel.org, ryan.roberts@arm.com,
	mark.rutland@arm.com, Sascha.Bischoff@arm.com,
	linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: kernel: Disable CNP on HiSilicon HIP09
Message-ID: <ah78iIqAqzfofnIG@willie-the-truck>
References: <20260601112000.1145391-1-zengheng@huaweicloud.com>
 <20260601112000.1145391-3-zengheng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601112000.1145391-3-zengheng@huaweicloud.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zengheng@huaweicloud.com,m:vladimir.murzin@arm.com,m:xuwei5@huawei.com,m:wangyushan12@huawei.com,m:yangyicong@hisilicon.com,m:maz@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:james.clark@linaro.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kuninori.morimoto.gx@renesas.com,m:lucaswei@google.com,m:catalin.marinas@arm.com,m:broonie@kernel.org,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:kevin.brodsky@arm.com,m:tongtiangen@huawei.com,m:oupton@kernel.org,m:ryan.roberts@arm.com,m:mark.rutland@arm.com,m:Sascha.Bischoff@arm.com,m:linux-arm-kernel@lists.infradead.org,m:wangkefeng.wang@huawei.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-90543-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sashiko.dev:url,willie-the-truck:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7F64630097

On Mon, Jun 01, 2026 at 07:20:00PM +0800, Zeng Heng wrote:
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index b0db946568b7..02e0ee5c948c 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -608,6 +608,14 @@ static const struct midr_range erratum_ac04_cpu_23_list[] = {
>  };
>  #endif
> 
> +#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
> +static const struct midr_range cnp_erratum_cpus[] = {
> +	MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
> +	MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
> +	{},
> +};
> +#endif

Sashiko [1] points out that this means that
CONFIG_HISILICON_ERRATUM_162100125 now affects NVIDIA parts and
vice-versa for CONFIG_NVIDIA_CARMEL_CNP_ERRATUM.

The easiest fix is probably to guard the entries in the array above with
their respective config options? Otherwise, this all looks good to me.

Will

[1] https://sashiko.dev/#/patchset/20260601112000.1145391-1-zengheng@huaweicloud.com

