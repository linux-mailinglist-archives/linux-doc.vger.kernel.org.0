Return-Path: <linux-doc+bounces-77321-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNEUGpLOoWn3wQQAu9opvQ
	(envelope-from <linux-doc+bounces-77321-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 18:04:18 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A231BB29D
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 18:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC901300D0E7
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 17:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A70E346A06;
	Fri, 27 Feb 2026 17:04:10 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577DE332903;
	Fri, 27 Feb 2026 17:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772211850; cv=none; b=IXrJoS4xtTkxFZosu/33N/MiwKXp8SIIdUcw56n1kVWFA9barS8rAcc7Pu+f+wANX3OwdQtQs0W2kBrGDclha44rlXEcB/zg83xLwvYDhFP0T5KRW3IiEXEsK+KnnF04QlI6m1NVuo57BGArQvW69Ks/fYerCxbVQP/zDEo/9Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772211850; c=relaxed/simple;
	bh=k7qGFv2TnDZxF63BSsh/tQM8hrU5ZueyqeqiDCPZNAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxcY1xheD5sxLQMrlI1oHVwF8TRRVewIiFwz2vvoe1B1zViaJbeAv0dKe/Poh48Up4bczSOlADwQfbBL5a0dkDAi+7yot96+GgITsi7KQXItee08SYIO0ZnQZay3/nAZle4MF5r0XX4pOIaxhOKSqOAHaw9WufTG43eL9sVz9g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AE9D14BF;
	Fri, 27 Feb 2026 09:04:02 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD8263F73B;
	Fri, 27 Feb 2026 09:04:03 -0800 (PST)
Date: Fri, 27 Feb 2026 17:04:01 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
	dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
	fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
	jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	peternewman@google.com, punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com, reinette.chatre@intel.com,
	rohit.mathew@arm.com, scott@os.amperecomputing.com,
	sdonthineni@nvidia.com, tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com, will@kernel.org, corbet@lwn.net,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
	zengheng4@huawei.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 00/41] arm_mpam: Add KVM/arm64 and resctrl glue code
Message-ID: <aaHOgZFWnjMHNirr@arm.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
 <6051a508-1e77-4216-9b41-4b93b21c18c3@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6051a508-1e77-4216-9b41-4b93b21c18c3@arm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77321-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F2A231BB29D
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 09:10:08PM +0000, Ben Horgan wrote:
> On 2/24/26 17:56, Ben Horgan wrote:
> > The main change in this version of the mpam missing pieces series is to
> > update the cdp emulation to match the resctrl interface. L2 and L3
> > resources can now enable cdp separately. Cdp can't be hidden correctly for
> > memory bandwidth allocation, as max per partid can't be emulated with more
> > partids, and so we hide this completely when cdp is enabled. There is a little
> > restructuring and a few smaller changes.
> > 
> > Changelogs in patches
> > 
> > It would be great to get this series merged this cycle. For that we'll need
> > more testing and reviewing. Thanks!
> > 
> 
> There is a small build conflict with resctrl abmc precursors, [1]. The
> last patch of that series applies on top of this series and if the abmc
> precursors go first that patch should go with this series to fix the
> build. Alternatively, if it's obvious ahead of time it can be squashed
> into pathc 33 with the other empty resctrl arch hooks.
> 
> [1]
> https://lore.kernel.org/lkml/20260225201905.3568624-5-ben.horgan@arm.com/

Typically we resolve these by having the first three patches in the
above series on a stable branch (could be tip as it touches x86) and we
can base the 41 patches here on top, together with the last one from the
abmc series.

Alternatively, happy to take them all via the arm64 tree as long as
Reinette/Tony are ok with this and ack the abmc patches.

-- 
Catalin

