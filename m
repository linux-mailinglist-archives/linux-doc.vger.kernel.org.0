Return-Path: <linux-doc+bounces-75381-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAyYBqrMhGk45QMAu9opvQ
	(envelope-from <linux-doc+bounces-75381-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 18:00:26 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6970FF5988
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 18:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93C0B300D95B
	for <lists+linux-doc@lfdr.de>; Thu,  5 Feb 2026 16:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3928439014;
	Thu,  5 Feb 2026 16:55:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E15243637F;
	Thu,  5 Feb 2026 16:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770310522; cv=none; b=I6uy69bG44SMeupm5nvpaeQdMzqCvyRywUJpmHDNaKg0kzsBvCVNAWPynB18ndQuGZAaqpeUBT29qdzB/dLSQLFDcM0Q/A1TFV+Pg6gHjA2X3I4j1efP4B0uw9cjCkgGvJCMrPcEUmbyM+pEOIxCVMo2MdazPkBzwOivhFKbcJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770310522; c=relaxed/simple;
	bh=J23kXA7w6ltsAG8B03VdcmQKnqvQjALSJjyzYrtDRug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdItH9iMpjm9PT3uSBqL4lblDxc2/L0n8hkNC9Z4HAh1jt/ejYUZNnUhkZzyllJnbMzR8UrOoaS36XECBGdY0tYdm7Z5Njuwz5RJwMKevKWk4ofbiEviFtHaPvrj9nrc+IT0ZiAzyXQxwGpUp7CcAq0+ezRK+xXfr7WJ/JPke3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9248A339;
	Thu,  5 Feb 2026 08:55:15 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 274163F778;
	Thu,  5 Feb 2026 08:55:16 -0800 (PST)
Date: Thu, 5 Feb 2026 16:55:13 +0000
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
	zengheng4@huawei.com, linux-doc@vger.kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: Re: [PATCH v4 09/41] arm64: mpam: Initialise and context switch the
 MPAMSM_EL1 register
Message-ID: <aYTLcdkmmzMMykYM@arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <20260203214342.584712-10-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203214342.584712-10-ben.horgan@arm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75381-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fujitsu.com:email,arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: 6970FF5988
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 09:43:10PM +0000, Ben Horgan wrote:
> The MPAMSM_EL1 sets the MPAM labels, PMG and PARTID, for loads and stores
> generated by a shared SMCU. Disable the traps so the kernel can use it and
> set it to the same configuration as the per-EL cpu MPAM configuration.
> 
> If an SMCU is not shared with other cpus then it is implementation
> defined whether the configuration from MPAMSM_EL1 is used or that from
> the appropriate MPAMy_ELx. As we set the same, PMG_D and PARTID_D,
> configuration for MPAM0_EL1, MPAM1_EL1 and MPAMSM_EL1 the resulting
> configuration is the same regardless.
> 
> The range of valid configurations for the PARTID and PMG in MPAMSM_EL1 is
> not currently specified in Arm Architectural Reference Manual but the
> architect has confirmed that it is intended to be the same as that for the
> cpu configuration in the MPAMy_ELx registers.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

