Return-Path: <linux-doc+bounces-94861-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V7FFF0jaR2pFgQAAu9opvQ
	(envelope-from <linux-doc+bounces-94861-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 17:50:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCAE70401F
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 17:50:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AoOES56d;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94861-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94861-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1152C301051A
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 15:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697EF23535E;
	Fri,  3 Jul 2026 15:46:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4C7233939;
	Fri,  3 Jul 2026 15:46:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093605; cv=none; b=uzYN/ZkUUMWPWee0xYMLAWQVV5NRsHu/OnctaXRHJDcPcGdyT5zoPc3AJY3BsVz8sCFqLY3GCztpTxjJzZs6Rw9lO9MxAhO3qPH4ez5Y3NW8unWXFHDO1K/vyzftzWxJdg0Ma/EB0jC9XzwolOXa2Gzzu7VRTRBVSzGsi0X8JqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093605; c=relaxed/simple;
	bh=t2AV7XvvIaSrSiyF522MIYBAWjerm4xqXkStHEWoaSM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NvI8hyrq8jXzSuXoNTDLNMirqASKQ87Da5ZeT7Rg2DHV1wCjP6yoJVBotnCGU7A5mqDn2g2Vg0h8CiVE/2IfJqqkUPiI8OHwf3/92NrjA0oAIf7rPSujIq1rKy2q9xs/BF/cUXOgFZDg2zy3bKiYnB6P5Ye74X5mAYTm7LUwQuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AoOES56d; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401CA1F000E9;
	Fri,  3 Jul 2026 15:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783093604;
	bh=YhZWGxWhXrmGtv1Mo6NdNVEfe08treNo/Ic1lUDyxno=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=AoOES56d56RyiBtDDRA+nxLwWpZllHV4dN+hQtfk68odoUKs+HRSGxt/1B/8SzjO2
	 RPhHGo4rntq08QuY67qvqHnODFCBOvUS2vazky9CZEKVrLuqKhWecBKnFlJjkWBim5
	 /ek4M2ymARhw2+THJzp2vLxmEW8ru1DpgPqWx0iyF2WdGLESpjn6OB/At02rUfZxqK
	 unGDh+pDrSznROQ8tgkmSfoC6GKZp2ZlnSaTqzof0ZnkuYSRMaC/uBMtbg8OtkKsTJ
	 2QONK2MOUS6IDN5/0+qTP+Xz3Mg1cy3iMx+opdsMDsFwQ+GEZUtBL0tMAshFvM55TK
	 CUV1rjlk/10ow==
From: Thomas Gleixner <tglx@kernel.org>
To: Gregory Price <gourry@gourry.net>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, kernel-team@meta.com, corbet@lwn.net,
 skhan@linuxfoundation.org, peterz@infradead.org, luto@kernel.org,
 akpm@linux-foundation.org, feng.tang@linux.alibaba.com, pmladek@suse.com,
 mhiramat@kernel.org, marc.herbert@linux.intel.com,
 joel.granados@kernel.org, gourry@gourry.net, lirongqing@baidu.com,
 kees@kernel.org, nathan@kernel.org, linusw@kernel.org, arnd@arndb.de,
 deller@gmx.de, jpoimboe@kernel.org, ruanjinjie@huawei.com,
 lukas.bulwahn@redhat.com, ryan.roberts@arm.com, ojeda@kernel.org
Subject: Re: [PATCH 2/2] kernel/entry: add kernel.syscall_user_dispatch sysctl
In-Reply-To: <20260627205551.769684-2-gourry@gourry.net>
References: <20260627205551.769684-1-gourry@gourry.net>
 <20260627205551.769684-2-gourry@gourry.net>
Date: Fri, 03 Jul 2026 17:46:40 +0200
Message-ID: <877bncm5y7.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94861-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:gourry@gourry.net,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kernel-team@meta.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:peterz@infradead.org,m:luto@kernel.org,m:akpm@linux-foundation.org,m:feng.tang@linux.alibaba.com,m:pmladek@suse.com,m:mhiramat@kernel.org,m:marc.herbert@linux.intel.com,m:joel.granados@kernel.org,m:lirongqing@baidu.com,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:arnd@arndb.de,m:deller@gmx.de,m:jpoimboe@kernel.org,m:ruanjinjie@huawei.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:ojeda@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tglx@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,meta.com,lwn.net,linuxfoundation.org,infradead.org,kernel.org,linux-foundation.org,linux.alibaba.com,suse.com,linux.intel.com,gourry.net,baidu.com,arndb.de,gmx.de,huawei.com,redhat.com,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FCAE70401F

On Sat, Jun 27 2026 at 16:55, Gregory Price wrote:

Same comment vs. subject prefix.

> Add a matching sysctl to go with CONFIG_SYSCALL_USER_DISPATCH.
>
> kernel.syscall_user_dispatch (default 1) controls whether userspace
> may arm SUD (both via prctl and ptrace).

What's SUD again? This is a changelog and not twatter.

> +	/* Arming can be denied at runtime via sysctl, disarming is allowed */
> +	if (mode != PR_SYS_DISPATCH_OFF && !syscall_user_dispatch_allowed)
> +		return -EPERM;

That might be similar to other sysctls, but if an application had it
enabled prior to the sysctl=off toggle, then that application will
suddenly fail in operation if it requires to move the dispatch window.

Thanks,

        tglx

