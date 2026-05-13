Return-Path: <linux-doc+bounces-87301-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JmgG2AsBGodFAIAu9opvQ
	(envelope-from <linux-doc+bounces-87301-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 09:46:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FED52EE9E
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 09:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5992630191A6
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 07:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C5337F013;
	Wed, 13 May 2026 07:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcmzwXJo"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D9223EA89;
	Wed, 13 May 2026 07:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658357; cv=none; b=sgoxXXmGYcuy3S1SeHGuyDRMveivpA964IUzb9Zg5tYqnxxV7muvCVEL8jeo5dOjK0y4bIwy9qX5XZ20Tzetd+4I/u5lxicWOOejpHVjnCqEI5xnTJ8kMDWke2ycmQ0tpCNx8frKA54JDcgKbaS9PdZmdGIUxt6fwZGw5CPoRE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658357; c=relaxed/simple;
	bh=4LEL2I02ZNcYBvdRSq6ZKXzxViElK+3D8okdJW4tWaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDZEMErrMy9bZkLoQrXs1m2PZqgELBVvYB6fRz8mfmotP9KHvuY92+egjQsDHuy42cX7Z4gCUeDoS8dA3GXQToqlzktIznW5erSGbaHBIPP6Xf5jh6DutFj1xiFDDssIKmpR13Apwdc3x+xoHFfpMRlLiZcmj1GJGuj7mBYYWJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcmzwXJo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E23C2BCB7;
	Wed, 13 May 2026 07:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778658357;
	bh=4LEL2I02ZNcYBvdRSq6ZKXzxViElK+3D8okdJW4tWaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JcmzwXJoOLz0s9/QXfUAL87bTvpMBs+SpVCsKRsXEsJPMUgjJ+74KkiMp315a4v4u
	 N8HSvEa/jlN8MMNHG4YgW4hGjEC2CZykvVEBTh7PSfzwLybzsJYdPrBbit2g2e3j1Q
	 Q1Y4a8+8LZKppLGWhI6TAf/e3SPIhpFcY7ZxdhsBv3tcSPVKb6orlxt8Gn83IuftPd
	 XJIXUnazS71GUEOT0jtvA+IpCEG5zwk8AIqSxYjla909ZkQ3RJRhFTSah/HHutKGfy
	 Fr/OPxJvx76L5Lic6jk1UoSQThATSTwac24yXFynsEF2/00LZyrw5sg8b/9t13lIec
	 URFGDSi9SzN4A==
Date: Wed, 13 May 2026 00:45:55 -0700
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
Subject: Re: [PATCH v7 08/20] KVM: arm64: Add Partitioned PMU register trap
 handlers
Message-ID: <agQsM7XFsbxbFRLO@kernel.org>
References: <20260504211813.1804997-1-coltonlewis@google.com>
 <20260504211813.1804997-9-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504211813.1804997-9-coltonlewis@google.com>
X-Rspamd-Queue-Id: D9FED52EE9E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87301-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oupton@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 04, 2026 at 09:18:01PM +0000, Colton Lewis wrote:
> We may want a partitioned PMU but not have FEAT_FGT to untrap the
> specific registers that would normally be untrapped. Add handling for
> those trapped register accesses that does the right thing if the PMU
> is partitioned.
> 
> For registers that shouldn't be written to hardware because they
> require special handling (PMEVTYPER and PMOVS), write to the virtual
> register. A later patch will ensure these are handled correctly at
> vcpu_load time.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>

I'd prefer an approach that provides a single accessor helper that takes
a vcpu_sysreg enum as an argument and internally handles the dispatch
between partitioned and emulated PMUs. That goes for all of the PMU
sysregs.

This will help you reuse some of the PMU emuation code that you'll still
need for things like nested...

Thanks,
Oliver

