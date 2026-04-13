Return-Path: <linux-doc+bounces-83254-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H14EM0A3Wk3YwkAu9opvQ
	(envelope-from <linux-doc+bounces-83254-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 16:42:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A66F3ED68F
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 16:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B80C300C57A
	for <lists+linux-doc@lfdr.de>; Mon, 13 Apr 2026 14:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D1935836C;
	Mon, 13 Apr 2026 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ox4XFWgT"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4133537D2;
	Mon, 13 Apr 2026 14:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776091328; cv=none; b=nPAwZLE7vUwE+Mr3u3KygadLaObN2njq3x5jvIdyYfIVeyh3oJfjKWwLoWHoNeluuE97waBzdYJowFBGOOvyeWdCXZ56ddXMGULUZFDyb2abxHJBf5WLfq2vDXJik/s3YTiv4sZ1YSjsD1TiZ0Ao6eQpQimI1Mid4vaV6A/wxVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776091328; c=relaxed/simple;
	bh=Vnrz228eSk/mptycnXQRjUy58RSHNsaULpU2FASTdWU=;
	h=Message-ID:Date:MIME-Version:Subject:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zx5eQpZmuh5Um7vC50lX+UV4g6FDjaVEr4DBbJXvovcXuY0p1O4H+qrHRkafPl5Y+x0D110kFXO798PRWpACtLbu8jPF3LZepjpmLIO22dR1x6U+IVdLx5mySK5PZk+pV7I9pJjLVg2u5DlNbJBE0MHn2sbDPb0hA7ZeTwvECSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ox4XFWgT; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72055357A;
	Mon, 13 Apr 2026 07:41:59 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B13E63F641;
	Mon, 13 Apr 2026 07:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776091325; bh=Vnrz228eSk/mptycnXQRjUy58RSHNsaULpU2FASTdWU=;
	h=Date:Subject:Cc:References:From:In-Reply-To:From;
	b=Ox4XFWgTjz8OIRvYE2TPsgObpjTSWquTbGbtfyBurAHNFusQmwooU6ij0WBXa7ssY
	 GnGPNXrGAkuHQvNgAPIjjezUioQbP/LC8CiCugXqLSvDv2GCQUvKx5oWqo/z7e6M+5
	 Fm8LZpzkjKkkAhAny3/DQ/+SL7TkOWMlVPTepHMQ=
Message-ID: <fa463a9a-2dff-4f2b-931e-9e0a9ac3f9c9@arm.com>
Date: Mon, 13 Apr 2026 15:41:59 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v6 00/40] arm_mpam: Add KVM/arm64 and resctrl glue code
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260313144617.3420416-1-ben.horgan@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260313144617.3420416-1-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.15 / 15.00];
	MISSING_TO(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-83254-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arm.com:dkim,arm.com:mid]
X-Rspamd-Queue-Id: 3A66F3ED68F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/26 14:45, Ben Horgan wrote:
> This version of the mpam missing pieces series sees a couple of things
> dropped or hidden. Memory bandwith utilization with free-running counters
> is dropped in preference of just always using 'mbm_event' mode (ABMC
> emulation) which simplifies the code and allows for, in the future,
> filtering by read/write traffic. So, for the interim, there is no memory
> bandwidth utilization support. CDP is hidden behind config expert as
> remount of resctrl fs could potentially lead to out of range PARTIDs being
> used and the fix requires a change in fs/resctrl. The setting of MPAM2_EL2
> (for pkvm/nvhe) is dropped as too expensive a write for not much value.
> 
> There are a couple of 'fixes' at the start of the series which address
> problems in the base driver but are only user visible due to this series.
> 
> Changelogs in patches
> 
> Thanks for all the reviewing and testing so far. Just a bit more to get this
> over the line.
> 
> There is a small build conflict with the MPAM abmc precursors series [1], which
> alters some of the resctrl arch hooks. I will shortly be posting a respin
> of that too.
> 
> [1] https://lore.kernel.org/lkml/20260225201905.3568624-1-ben.horgan@arm.com/
> 
> From James' cover letter:
> 
> This is the missing piece to make MPAM usable resctrl in user-space. This has
> shed its debugfs code and the read/write 'event configuration' for the monitors
> to make the series smaller.
> 
Thanks for all the help testing and reviewing. James has now sent a pull request to Catalin and he has picked it up.

Pull request:
https://lore.kernel.org/linux-arm-kernel/01f76011-f3c2-4dcb-b3bc-37c7d4de342e@arm.com/

branch in arm64:
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/mpam

Ben

