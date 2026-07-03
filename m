Return-Path: <linux-doc+bounces-94866-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9CnmGEnnR2p0hQAAu9opvQ
	(envelope-from <linux-doc+bounces-94866-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 18:46:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A0F704637
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 18:46:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=E0GDICzy;
	dmarc=pass (policy=none) header.from=debian.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94866-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-94866-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2565E30321BF
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 16:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16BA433E99;
	Fri,  3 Jul 2026 16:45:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495FE27732;
	Fri,  3 Jul 2026 16:45:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783097138; cv=none; b=HE5IFekcL5P2V7VqGT9HfpwReDA0G0nNPbMR+xa41eKRiBfkNtwXDE4HhH0o5JKIe2MtQcAkaP+jvMBxwTc3R+0/ogQ5DBHp/sQo5Ta8U3AsTF3b3q1I8UvTSFnaimb+5omdU5bUYuu2896PenwTHXHhkbL8EaAa2ori44yB93s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783097138; c=relaxed/simple;
	bh=0DRZ2smuBcmNbxpX37Hz2EgOkA+rk2Dh8WvQYelSEMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InTGwnIjJkVo8wc9jN2EkEtXTFKPyJnTVRgfZO4Fuz6d7uqWZ5BlAuta5b6Om2OOSOt2vqfFCtLbHun0hBD7VcmtP3DczUpeiL6ghnsdp09aGXG8X12V9ytJ67u/76f/UWJTIsilzrMFXHwk3TsslfMDIsk5FGqHxo1+F2X7yH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=E0GDICzy; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oytYUjBSAM6Spo5uHh1E+ruoHlc7Qx0XVI6YVgYR4W0=; b=E0GDICzyxiEzkb1P1PTSVX/dVw
	VmKHeNXg+otnMSNWJGB/XkjhUL0j7yonSPmQAu+C/Udh7xPN+dZemORrAS3b+4D8Gj47HkVri42rx
	GKgldjgD4S4efDLbncRFppb/a/NNFhIhgNpatLLb+KaX2LRbr7BYEfaHnCVtHBuDhIVfXGcU+St7m
	Rrq6y2vJpYduX9hTKjA7Y63IZti8sk7pdikdtC7r0afBHaE72b880h+bJnPFTnGeP5jQVfzU1Nopj
	pbj66BcLAKn5MqITFO2pjdqBSOXxSCqhM3NZl4mZW5T5zFWKPfe8yN6RA6Y1I7GL43fweacMW2/H3
	CvYs1Cuw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wfh04-009XSc-13;
	Fri, 03 Jul 2026 16:44:24 +0000
Date: Fri, 3 Jul 2026 09:44:11 -0700
From: Breno Leitao <leitao@debian.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, maz@kernel.org, ardb@kernel.org, ilias.apalodimas@linaro.org, 
	oupton@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, oleg@redhat.com, mark.rutland@arm.com, lpieralisi@kernel.org, 
	tglx@kernel.org, ada.coupriediaz@arm.com, anshuman.khandual@arm.com, 
	ebiggers@kernel.org, broonie@kernel.org, mrigendra.chaubey@gmail.com, 
	baohua@kernel.org, lucaswei@google.com, james.morse@arm.com, zengheng4@huawei.com, 
	thuth@redhat.com, yang@os.amperecomputing.com, leo.bras@arm.com, 
	Sascha.Bischoff@arm.com, james.clark@linaro.org, peterz@infradead.org, ben.horgan@arm.com, 
	punit.agrawal@oss.qualcomm.com, gshan@redhat.com, osama.abdelkader@gmail.com, 
	fengchengwen@huawei.com, ryan.roberts@arm.com, yangyicong@hisilicon.com, 
	kevin.brodsky@arm.com, kees@kernel.org, jeson.gao@unisoc.com, zhaoyang.huang@unisoc.com, 
	ryotkkr98@gmail.com, wsw9603@163.com, pasha.tatashin@soleen.com, 
	jeremy.linton@arm.com, schuster.simon@siemens-energy.com, osandov@fb.com, arnd@arndb.de, 
	zhangpengjie2@huawei.com, smostafa@google.com, vladimir.murzin@arm.com, tabba@google.com, 
	vdonnefort@google.com, kaleshsingh@google.com, jic23@kernel.org, timothy.hayes@arm.com, 
	alexandru.elisei@arm.com, zenghui.yu@linux.dev, david@kernel.org, 
	akpm@linux-foundation.org, ljs@kernel.org, memxor@gmail.com, qperret@google.com, 
	chaitanyas.prakash@arm.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH 01/17] arm64: Move DAIF macros to ptrace.h and use them
 centrally
Message-ID: <akfl8VwB-RkHIFgm@gmail.com>
References: <20260703100135.2512312-1-ruanjinjie@huawei.com>
 <20260703100135.2512312-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703100135.2512312-2-ruanjinjie@huawei.com>
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-94866-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:maz@kernel.org,m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:oupton@kernel.org,m:joey.gouly@arm.com,m:seiden@linux.ibm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:oleg@redhat.com,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:ada.coupriediaz@arm.com,m:anshuman.khandual@arm.com,m:ebiggers@kernel.org,m:broonie@kernel.org,m:mrigendra.chaubey@gmail.com,m:baohua@kernel.org,m:lucaswei@google.com,m:james.morse@arm.com,m:zengheng4@huawei.com,m:thuth@redhat.com,m:yang@os.amperecomputing.com,m:leo.bras@arm.com,m:Sascha.Bischoff@arm.com,m:james.clark@linaro.org,m:peterz@infradead.org,m:ben.horgan@arm.com,m:punit.agrawal@oss.qualcomm.com,m:gshan@redhat.com,m:osama.abdelkader@gmail.com,m:fengchengwen@huawei.com,m:ryan.roberts@arm.com,m:yangyicong@hisilicon.com,m:kevin.brodsky@arm.com,m:kees@kernel.org,m:jeson.gao@unisoc.com,m
 :zhaoyang.huang@unisoc.com,m:ryotkkr98@gmail.com,m:wsw9603@163.com,m:pasha.tatashin@soleen.com,m:jeremy.linton@arm.com,m:schuster.simon@siemens-energy.com,m:osandov@fb.com,m:arnd@arndb.de,m:zhangpengjie2@huawei.com,m:smostafa@google.com,m:vladimir.murzin@arm.com,m:tabba@google.com,m:vdonnefort@google.com,m:kaleshsingh@google.com,m:jic23@kernel.org,m:timothy.hayes@arm.com,m:alexandru.elisei@arm.com,m:zenghui.yu@linux.dev,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:memxor@gmail.com,m:qperret@google.com,m:chaitanyas.prakash@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-efi@vger.kernel.org,m:kvmarm@lists.linux.dev,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,lwn.net,linuxfoundation.org,linaro.org,linux.ibm.com,huawei.com,redhat.com,gmail.com,google.com,os.amperecomputing.com,infradead.org,oss.qualcomm.com,hisilicon.com,unisoc.com,163.com,soleen.com,siemens-energy.com,fb.com,arndb.de,linux.dev,linux-foundation.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[71];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3A0F704637

On Fri, Jul 03, 2026 at 06:01:19PM +0800, Jinjie Ruan wrote:
> So move the definitions of DAIF_PROCCTX, DAIF_PROCCTX_NOIRQ, DAIF_ERRCTX,
> and DAIF_MASK from <asm/daifflags.h> to <asm/ptrace.h>. 

This seems a bit counter intuitive, to have DAIF definitions at
arm/ptrace.h instead of asm/daifflags.h, no?

> diff --git a/arch/arm64/kvm/hyp/nvhe/host.S b/arch/arm64/kvm/hyp/nvhe/host.S
> index 9393fe3ea6a1..cbe2a616c726 100644
> --- a/arch/arm64/kvm/hyp/nvhe/host.S
> +++ b/arch/arm64/kvm/hyp/nvhe/host.S
> @@ -11,6 +11,7 @@
>  #include <asm/kvm_asm.h>
>  #include <asm/kvm_mmu.h>
>  #include <asm/kvm_ptrauth.h>
> +#include <asm/ptrace.h>

..

> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> index 89cb553be1e5..26ea02e7f5fd 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> @@ -15,6 +15,7 @@
>  #include <asm/kvm_asm.h>
>  #include <asm/kvm_mmu.h>
>  #include <asm/pgtable-hwdef.h>
> +#include <asm/ptrace.h>

And then you need to do this in many low level files, which sounds less
intuitive to have to have ptrace.h include instead of asm/daifflags.h
(which is clear why we need it).

--breno

