Return-Path: <linux-doc+bounces-75386-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHyIAQHOhGk45QMAu9opvQ
	(envelope-from <linux-doc+bounces-75386-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 18:06:09 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B29F5A65
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 18:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64835300F169
	for <lists+linux-doc@lfdr.de>; Thu,  5 Feb 2026 17:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D20425CCD;
	Thu,  5 Feb 2026 17:06:05 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA14015C158;
	Thu,  5 Feb 2026 17:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311165; cv=none; b=eUYBldfCjc8uTxzpANdY1l18TUWK2ADvLfHLVVPkt/53eEqimRpgE/DM3Nx9XG+mZ5hcwggkQGoLOqqaSPCaZR5FIwvNWvHUvC7nVgzEWUdhYQ0BnvtfUc70zF0yZw8b4Z1Bhz3rQNuilLwnwHdvNPc589wgAzlTor9Vxbl7DhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311165; c=relaxed/simple;
	bh=+ggiuJ6rgpm0PJdw5izu+TS4/QQkwT9qxIic9BaESVo=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mzoaF5UXE4c3dWpivH9001xrc9i3See99jRn7QjwZ4dw1rLPDn59p0iDF7uvrkEwGbaXQJ8ri+Zo85XrXvEymQJQn5buJJubodm8+JPE9/l+9zaRdLkpivFWpxeeHj+6LSDiOHqH5oMCJreZ7xkhk2ME9qe2VuetnwS5ZiQpOqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f6NsL2811zHnGcj;
	Fri,  6 Feb 2026 01:05:58 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 152ED40565;
	Fri,  6 Feb 2026 01:06:01 +0800 (CST)
Received: from localhost (10.48.151.164) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 5 Feb
 2026 17:05:59 +0000
Date: Thu, 5 Feb 2026 17:05:57 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>,
	<zengheng4@huawei.com>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 41/41] arm64: mpam: Add initial MPAM documentation
Message-ID: <20260205170557.00000d4d@huawei.com>
In-Reply-To: <20260203214342.584712-42-ben.horgan@arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
	<20260203214342.584712-42-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	TAGGED_FROM(0.00)[bounces-75386-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cameron@huawei.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.954];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,huawei.com:mid,arm.com:email]
X-Rspamd-Queue-Id: 72B29F5A65
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 21:43:42 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> MPAM (Memory Partitioning and Monitoring) is now exposed to user-space via
> resctrl. Add some documentation so the user knows what features to expect.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes by Ben:
> Some tidying, update for current heuristics
> ---
>  Documentation/arch/arm64/index.rst |  1 +
>  Documentation/arch/arm64/mpam.rst  | 93 ++++++++++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 Documentation/arch/arm64/mpam.rst
> 
> diff --git a/Documentation/arch/arm64/index.rst b/Documentation/arch/arm64/index.rst
> index 6a012c98bdcd..189fa760dade 100644
> --- a/Documentation/arch/arm64/index.rst
> +++ b/Documentation/arch/arm64/index.rst
> @@ -23,6 +23,7 @@ ARM64 Architecture
>      memory
>      memory-tagging-extension
>      mops
> +    mpam
>      perf
>      pointer-authentication
>      ptdump
> diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
> new file mode 100644
> index 000000000000..0769bccff25e
> --- /dev/null
> +++ b/Documentation/arch/arm64/mpam.rst
> @@ -0,0 +1,93 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +====
> +MPAM
> +====
> +
> +What is MPAM
> +============


> +  MPAM (Memory Partitioning and Monitoring) is a feature in the CPUs and memory

I've not seen this style of indenting much in rst.  I checked a few
files in this directory and it's not used in the ones I randomly picked.
+ it's not what the kernel-documentation.rst file suggests is standard
formatting.

Other than that the content looks fine to me.

Jonathan

