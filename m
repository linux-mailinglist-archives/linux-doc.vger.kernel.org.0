Return-Path: <linux-doc+bounces-79341-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CF45C0eItGmBpQAAu9opvQ
	(envelope-from <linux-doc+bounces-79341-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 22:57:27 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C8428A37C
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 22:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 522D5312BDEC
	for <lists+linux-doc@lfdr.de>; Fri, 13 Mar 2026 21:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5BA36C0D6;
	Fri, 13 Mar 2026 21:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8LFC/Y2"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B39B1EC01B;
	Fri, 13 Mar 2026 21:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773439021; cv=none; b=CQTacgWhlNAb+HWfcRvqMcIFkUgpiV6IFVa5r9NVTzovTLSedaio3oXDkhUBryKDbwVnNHLTaDW3Jovd5CXrL1fiw1HyX5wLAFWJ+qQg+3Rxpcu5gCW56ZbGR5H0a/oq7WfuUEyC7CLo9hrZBrPYGyhAcIvBnTtlXKqBI4hi2S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773439021; c=relaxed/simple;
	bh=BwGIzF3Y1kGJ7LSzEz+7QIlkvRAEX1ybLPLbwYlypHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPPspZzz0A1gAYAAOkBUsLl08QYTqL20QNWlev5DSuj1x2mz8TXS9cCvisIKTvjJU2uO5dJlV22RAlHKJxW+TXj7qzaj4c4xDGeysAqrGbaOs6NWMPhWNbON57hVbL56yZSPbambEXv14OvXPcvsB8nGTKDuiYKEpjFk2g92dFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8LFC/Y2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE5AC19421;
	Fri, 13 Mar 2026 21:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773439021;
	bh=BwGIzF3Y1kGJ7LSzEz+7QIlkvRAEX1ybLPLbwYlypHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8LFC/Y2BvExaUUaQwCZ1enN784C4eGC3QLIYlLXoQRLLoZbcIPAW+9UHxunos89u
	 W2FcjOgbPlul4rkrHWNMnWcebVKNCNJBcZAC9W9bHqSllID/Yx8/g7Pg0waFNdbV1F
	 PZkKpvhQhygkjCvndRt4AGAp3O3ce5dB8Hf9tYRkl1Yd2G1/EC1V7ihRTEFOlFWtJD
	 TVRWH74L5h1udZNpGw4w/HeSz46hbFXg77yqFlXWTNDJcGX7icfPbrJEmetdc7x+30
	 MorgajnbJ3XPvDp3w4FMrauooCX4QG0hYbWRVYVLx7aMFlZXvlf6/A/GVpusGs1ME1
	 T/VOcVRh6Fn9Q==
Date: Fri, 13 Mar 2026 16:56:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: loongarch@lists.linux.dev, cfsworks@gmail.com, alex@ghiti.fr,
	skhan@linuxfoundation.org, liaoyuanhong@vivo.com,
	ritesh.list@gmail.com, linux-arm-kernel@lists.infradead.org,
	kees@kernel.org, leitao@debian.org, lirongqing@baidu.com,
	corbet@lwn.net, pmladek@suse.com, jbohac@suse.cz,
	eajames@linux.ibm.com, sourabhjain@linux.ibm.com,
	palmer@dabbelt.com, vishal.moola@gmail.com, npiggin@gmail.com,
	dapeng1.mi@linux.intel.com, brgerst@gmail.com, will@kernel.org,
	paulmck@kernel.org, tglx@kernel.org, rdunlap@infradead.org,
	hbathini@linux.ibm.com, kexec@lists.infradead.org, bhe@redhat.com,
	dyoung@redhat.com, x86@kernel.org, pjw@kernel.org, rppt@kernel.org,
	linux-doc@vger.kernel.org, kernel@xen0n.name,
	dave.hansen@linux.intel.com, catalin.marinas@arm.com,
	saravanak@kernel.org, samuel.holland@sifive.com,
	songshuaishuai@tinylab.org, coxu@redhat.com,
	fuqiang.wang@easystack.cn, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, osandov@fb.com, chenhuacai@kernel.org,
	aou@eecs.berkeley.edu, tangyouling@kylinos.cn, hpa@zytor.com,
	chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org, bp@alien8.de,
	vgoyal@redhat.com, fvdl@google.com, kevin.brodsky@arm.com,
	mingo@redhat.com, maddy@linux.ibm.com, akpm@linux-foundation.org,
	junhui.liu@pigmoral.tech, ardb@kernel.org, mpe@ellerman.id.au,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 4/5] arm64: kexec: Add support for crashkernel CMA
 reservation
Message-ID: <177343901948.3415566.6726187926870600451.robh@kernel.org>
References: <20260302035315.3892241-1-ruanjinjie@huawei.com>
 <20260302035315.3892241-5-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302035315.3892241-5-ruanjinjie@huawei.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,ghiti.fr,linuxfoundation.org,vivo.com,lists.infradead.org,kernel.org,debian.org,baidu.com,lwn.net,suse.com,suse.cz,linux.ibm.com,dabbelt.com,linux.intel.com,infradead.org,redhat.com,vger.kernel.org,xen0n.name,arm.com,sifive.com,tinylab.org,easystack.cn,fb.com,eecs.berkeley.edu,kylinos.cn,zytor.com,lists.ozlabs.org,alien8.de,google.com,linux-foundation.org,pigmoral.tech,ellerman.id.au];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79341-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[61];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A5C8428A37C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 02 Mar 2026 11:53:14 +0800, Jinjie Ruan wrote:
> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
> crashkernel= command line option") and commit ab475510e042 ("kdump:
> implement reserve_crashkernel_cma") added CMA support for kdump
> crashkernel reservation.
> 
> Crash kernel memory reservation wastes production resources if too
> large, risks kdump failure if too small, and faces allocation difficulties
> on fragmented systems due to contiguous block constraints. The new
> CMA-based crashkernel reservation scheme splits the "large fixed
> reservation" into a "small fixed region + large CMA dynamic region": the
> CMA memory is available to userspace during normal operation to avoid
> waste, and is reclaimed for kdump upon crash—saving memory while
> improving reliability.
> 
> So extend crashkernel CMA reservation support to arm64. The following
> changes are made to enable CMA reservation:
> 
> - Parse and obtain the CMA reservation size along with other crashkernel
>   parameters.
> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump.
> - Include the CMA-reserved ranges for kdump kernel to use.
> - Exclude the CMA-reserved ranges from the crash kernel memory to
>   prevent them from being exported through /proc/vmcore, which is already
>   done in the crash core.
> 
> Update kernel-parameters.txt to document CMA support for crashkernel on
> arm64 architecture.
> 
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v7:
> - Correct the inclusion of CMA-reserved ranges for kdump
>   kernel in of/kexec.
> v3:
> - Add Acked-by.
> v2:
> - Free cmem in prepare_elf_headers()
> - Add the mtivation.
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  arch/arm64/kernel/machine_kexec_file.c          | 2 +-
>  arch/arm64/mm/init.c                            | 5 +++--
>  drivers/of/fdt.c                                | 9 +++++----
>  drivers/of/kexec.c                              | 9 +++++++++
>  5 files changed, 19 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


