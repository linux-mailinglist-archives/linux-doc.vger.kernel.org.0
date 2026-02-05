Return-Path: <linux-doc+bounces-75383-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHBILWbNhGk45QMAu9opvQ
	(envelope-from <linux-doc+bounces-75383-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 18:03:34 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 410D1F5A06
	for <lists+linux-doc@lfdr.de>; Thu, 05 Feb 2026 18:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BBBB3094A64
	for <lists+linux-doc@lfdr.de>; Thu,  5 Feb 2026 16:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB72343C05C;
	Thu,  5 Feb 2026 16:57:32 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436AC43C058;
	Thu,  5 Feb 2026 16:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770310652; cv=none; b=sduMAVf3cmFZurHf5qK33Ru3xoNILq3a8xk8fajAou96c8bc4OiqQrWIKiLxWJoyBf07dvgpvKh+KY34CAyAmraNDV+zLvlXOXKiGm7ZmZA8Ficig519ldff5CJFhluVZtSP4sObwwBfe6GNbFvS/n/6OHss5KVl6CTd8B37uvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770310652; c=relaxed/simple;
	bh=axosmnRgdCPqJk0TxU8ksakiGNy3QwbOaqXKCAF0UuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jn0iYGAxt/eckeGukNWA7dL3ZSp5QJ6xjxiskGcaQuyami8FaXActaZd7DR0QDVtlp5hNIXDSRrTFgoNNnJwrUuMiVFtGybWzB/JKL/4eC4yzv0nSY//gIvZRXAOljGhimwuHg12AX62USdd+ojRbfJlIeEapGO6nahuQBqyO4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 776D0339;
	Thu,  5 Feb 2026 08:57:25 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 308293F778;
	Thu,  5 Feb 2026 08:57:26 -0800 (PST)
Date: Thu, 5 Feb 2026 16:57:23 +0000
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
Subject: Re: [PATCH v4 41/41] arm64: mpam: Add initial MPAM documentation
Message-ID: <aYTL86PYae5w89bx@arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <20260203214342.584712-42-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203214342.584712-42-ben.horgan@arm.com>
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
	TAGGED_FROM(0.00)[bounces-75383-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 410D1F5A06
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 09:43:42PM +0000, Ben Horgan wrote:
> MPAM (Memory Partitioning and Monitoring) is now exposed to user-space via
> resctrl. Add some documentation so the user knows what features to expect.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

