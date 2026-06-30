Return-Path: <linux-doc+bounces-94192-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wi+ZLCXmQ2oDlQoAu9opvQ
	(envelope-from <linux-doc+bounces-94192-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 17:52:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7BD6E61FE
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 17:52:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hYaFsO0F;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94192-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94192-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 98FA6306419F
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 15:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0924746AF32;
	Tue, 30 Jun 2026 15:50:24 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC6546AF12;
	Tue, 30 Jun 2026 15:50:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834623; cv=none; b=tt43vawGwdxekQMmbDhVgpljv7rFND0WbEv9T2gR0AqYu6+cWlr34a+J2Hsth3mJjXy3f3UkPjiS4Sp7Djb/76Ph2OC1Ue7YOeSJCK1LHZMcdWz9pQZYmTMlSQC/pwcgTJwusMo+Aj9xAjYxAmJxiiil6VvFcfaVipburUn9utY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834623; c=relaxed/simple;
	bh=wJVOvcEEpbA1CW16gcTsNnjYtnN5mAQFWxq+X6OZbkg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BEm8+WtTBi+2+DDzz4P6JnpUppnDXg/VZbTwe3r1IN5paHrhf9eYjHO7lwI832Cs17lDcGC6kYhlEs3LYlFC+4WJ9ivV73rveBcRcwY50TArUmtffNyMi31GGS48lN8Fj+nVS+O2/G9Zdxt/iyRet1bdMJU+tsViap2U8Hxl8QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYaFsO0F; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272C01F00A3A;
	Tue, 30 Jun 2026 15:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782834617;
	bh=orBYolOiVh8P+Gs6dp8/inZibU5jKERhYsBdgyU7ewg=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=hYaFsO0FH9QTvOvjL+VAVldlJ2YPFGk7Uv9Z6QoYCVHtTYFvz5GLpT1JPoGmvuzja
	 MTy6IgtdK2zMOgBks1ci94yQnYzuxOJiLmpU/slEb508GaEKc1CAdIz3+/Zq6Bt0w9
	 2FVSSC8lyJ1ZeKB8y1XDpUIRQvZEcPOZths6ZliY3SggfKoZOFKnqpC88EFu33XLTW
	 sn6AnFxz4EW0LATrsCAmY8ssBo7Q13rik2AkR7zp8ALgguCfUFUhwRyu2d3NhQu+/K
	 Y2AM6LawUcaWvPp3WCkTdmmqcN+TndJjAv7WwB1TzTqCVHBCGCID2JuhETb5Xb/WQQ
	 rTUnWQuYsWNdQ==
From: Mike Rapoport <rppt@kernel.org>
To: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
 will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
 chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
 aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, 
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org, 
 saravanak@kernel.org, akpm@linux-foundation.org, baoquan.he@linux.dev, 
 pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev, 
 rdunlap@infradead.org, peterz@infradead.org, feng.tang@linux.alibaba.com, 
 dapeng1.mi@linux.intel.com, elver@google.com, enelsonmoore@gmail.com, 
 kuba@kernel.org, ebiggers@kernel.org, lirongqing@baidu.com, 
 leitao@debian.org, kees@kernel.org, coxu@redhat.com, cfsworks@gmail.com, 
 jbohac@suse.cz, osandov@fb.com, ryan.roberts@arm.com, 
 tangyouling@kylinos.cn, sourabhjain@linux.ibm.com, ritesh.list@gmail.com, 
 gaohan@iscas.ac.cn, david@kernel.org, wangruikang@iscas.ac.cn, 
 muchun.song@linux.dev, vishal.moola@gmail.com, junhui.liu@pigmoral.tech, 
 guoren@kernel.org, namcao@linutronix.de, rick.p.edgecombe@intel.com, 
 djbw@kernel.org, liaoyuanhong@vivo.com, fuqiang.wang@easystack.cn, 
 vishal.l.verma@intel.com, chenjiahao16@huawei.com, x86@kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, kexec@lists.infradead.org, 
 Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260629094746.191843-1-ruanjinjie@huawei.com>
References: <20260629094746.191843-1-ruanjinjie@huawei.com>
Subject: Re: [PATCH v17 00/10] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-Id: <178283459765.548295.14688999641870037803.b4-ty@b4>
Date: Tue, 30 Jun 2026 18:49:57 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:robh@kernel.org,m:saravanak@kernel.org,m:akpm@linux-foundation.org,m:baoquan.he@linux.dev,m:pasha.tatashin@soleen.com,m:pratyush@kernel.org,m:ruirui.yang@linux.dev,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:leitao@debian.org,m:kees@kernel.org,m:coxu@redhat.com,m:cfsworks@gmail.com,m:jbohac@suse.cz,m:osandov@fb.com,m:ryan.roberts@arm.com,m:tangyouling@kylinos.cn,m:sourabhjain@linux.ibm.com,m:ritesh.list@
 gmail.com,m:gaohan@iscas.ac.cn,m:david@kernel.org,m:wangruikang@iscas.ac.cn,m:muchun.song@linux.dev,m:vishal.moola@gmail.com,m:junhui.liu@pigmoral.tech,m:guoren@kernel.org,m:namcao@linutronix.de,m:rick.p.edgecombe@intel.com,m:djbw@kernel.org,m:liaoyuanhong@vivo.com,m:fuqiang.wang@easystack.cn,m:vishal.l.verma@intel.com,m:chenjiahao16@huawei.com,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:devicetree@vger.kernel.org,m:kexec@lists.infradead.org,m:ruanjinjie@huawei.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,linux.dev,soleen.com,infradead.org,linux.alibaba.com,google.com,baidu.com,debian.org,suse.cz,fb.com,kylinos.cn,iscas.ac.cn,pigmoral.tech,linutronix.de,intel.com,vivo.com,easystack.cn,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_SENDER(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94192-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[69];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A7BD6E61FE

On Mon, 29 Jun 2026 17:47:36 +0800, Jinjie Ruan wrote:
> arm64/riscv: Add support for crashkernel CMA reservation
> 
> The crash memory allocation, and the exclude of crashk_res, crashk_low_res
> and crashk_cma memory are almost identical across different architectures,
> This patch set handle them in crash core in a general way, which eliminate
> a lot of duplication code.
> 
> [...]

Applied to crashkernel-cma branch of liveupdate/linux.git tree, thanks!

[01/10] riscv: kexec_file: Fix crashk_low_res not exclude bug
        commit: 5fc6e7d45373571d03cd04fd4c6069c0a97fa75a
[02/10] powerpc/crash: sort crash memory ranges before preparing elfcorehdr
        commit: 202b5de3ec34317d6a8944239fe227ef8f6853ec
[03/10] crash: Add crash_prepare_headers() to exclude crash kernel memory
        commit: 5beabef0cffaa1ea6e27e85dbd526b7a28e0e7c7
[04/10] arm64: kexec_file: Use crash_prepare_headers() helper to simplify code
        commit: 201b561cbc6c594aa1ef718a1204dd45720d96dd
[05/10] x86/crash: Use crash_prepare_headers() helper to simplify code
        commit: a8f09f2a7485956c3653696f6cb94faadd243645
[06/10] riscv: kexec_file: Use crash_prepare_headers() helper to simplify code
        commit: 7b078a0aa2753dcf5cae88e5349a25ac39998a9b
[07/10] LoongArch: kexec_file: Use crash_prepare_headers() helper to simplify code
        commit: 51ed0950adf05c99e393818887a2616dd4ab3e34
[08/10] powerpc/kexec_file: Use crash_exclude_core_ranges() helper
        commit: b0e06c5a30742bc6bc8523fe9c71c1a043a7661d
[09/10] arm64: kexec_file: Add support for crashkernel CMA reservation
        commit: c12c63d05dfe7088aa8b1b872fe261e25537c823
[10/10] riscv: kexec_file: Add support for crashkernel CMA reservation
        commit: a037fe3c58ed489ca8ad8531bd7e16b90a84badc

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: crashkernel-cma

--
Sincerely yours,
Mike.



