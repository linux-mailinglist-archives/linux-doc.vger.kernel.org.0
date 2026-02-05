Return-Path: <linux-doc+bounces-75365-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2rXyHF7DhGll5QMAu9opvQ
	(envelope-from <linux-doc+bounces-75365-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 17:20:46 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5C7F5260
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 17:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83E6D3014843
	for <lists+linux-doc@lfdr.de>; Thu,  5 Feb 2026 16:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F71D436361;
	Thu,  5 Feb 2026 16:20:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF92B1A9FBA;
	Thu,  5 Feb 2026 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770308443; cv=none; b=QfCkxE2aiZsBVOPaI37NjnEoa2I0ZaC65uEfm+mHWzuipQbfRa9vgRHg76g6EdfIBG+i6LgVmgje71rh9WD178d9wt22sEgKdplKMHVIMuam+PrXM57YEsxLRQk6aAzfB2/P8iai55IA/qxvUJiIrrHytJVkfuST7gtWSuDzzx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770308443; c=relaxed/simple;
	bh=3j9lC1ezcq1o4I4TKi+RkA8i98PkQhrH+eBR1wizp9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N41WkGFs9T8lvhq0fxqnDr2FbFvnUzZWzi6TECjDclFgPi3YMsGM6hBv+YnxDQtF/xOdwSgocGG8rFX8rAfGXgsUjQQf8sZIYubBo6z0tH9cr8ltLNrX1yUTP83g6fqgC2DSkK2JpnPgWGexpMu6qOru2tM0UgpVEfzaYS1rIRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC098339;
	Thu,  5 Feb 2026 08:20:35 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85D6C3F632;
	Thu,  5 Feb 2026 08:20:36 -0800 (PST)
Date: Thu, 5 Feb 2026 16:20:33 +0000
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
Subject: Re: [PATCH v4 05/41] arm64: mpam: Re-initialise MPAM regs when CPU
 comes online
Message-ID: <aYTDUStE3RJp_ht4@arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <20260203214342.584712-6-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203214342.584712-6-ben.horgan@arm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75365-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:mid,arm.com:email,fujitsu.com:email]
X-Rspamd-Queue-Id: DB5C7F5260
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 09:43:06PM +0000, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Now that the MPAM system registers are expected to have values that change,
> reprogram them based on the previous value when a CPU is brought online.
> 
> Previously MPAM's 'default PARTID' of 0 was always used for MPAM in
> kernel-space as this is the PARTID that hardware guarantees to
> reset. Because there are a limited number of PARTID, this value is exposed
> to user-space, meaning resctrl changes to the resctrl default group would
> also affect kernel threads.  Instead, use the task's PARTID value for
> kernel work on behalf of user-space too. The default of 0 is kept for both
> user-space and kernel-space when MPAM is not enabled.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

