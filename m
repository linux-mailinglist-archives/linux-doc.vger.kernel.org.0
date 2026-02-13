Return-Path: <linux-doc+bounces-75961-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGqtBTCWjmm8DAEAu9opvQ
	(envelope-from <linux-doc+bounces-75961-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 13 Feb 2026 04:10:40 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4A0132922
	for <lists+linux-doc@lfdr.de>; Fri, 13 Feb 2026 04:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47F5C303819E
	for <lists+linux-doc@lfdr.de>; Fri, 13 Feb 2026 03:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D124123815D;
	Fri, 13 Feb 2026 03:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqncZvbj"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD54822FF22;
	Fri, 13 Feb 2026 03:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770952221; cv=none; b=rKmR7Jp47UQBt17aPIyyrQ1qyGSIqvq+0I+80bS6ignBvGO4m0nvqgRkIl8GhnPxwdCXAulE0eil8XKpMrokQRaHs6k3mAETiyDquUI5TGTKIhuxmTdJKRXuHEi7D+z8uqt56ThaVH2FeapIJtft6n8DpxTUPCBRBJ069QKdcHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770952221; c=relaxed/simple;
	bh=DlVfwlabE/UrECF6UV6WXsGt9/oBuJ/GsD7QC77Cks8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ywl2ALH3UboyB0eUnoLlj2u2HJuvn7uEisH708hqNbP+02T86VovgHe3FCDm353GBmnOueoEddeTYssOutl1oQf+H4PbstyEVjZUJC7YiHuQk59JWiixYIxY20/q2VaKWJjPkykYle2zyDqeMJjB3FYNtWZr6LHzQ3uMDPMi3y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqncZvbj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C7CC2BC87;
	Fri, 13 Feb 2026 03:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770952221;
	bh=DlVfwlabE/UrECF6UV6WXsGt9/oBuJ/GsD7QC77Cks8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UqncZvbj0SmNgh6HQ/8D5uoY1GFs2E42UQc+n7sxEIeVzpQSz2IMx9zVWyz7j4P7+
	 tfOiJuyBxCrBsc2bAheTKpm+HdgmlfqnLuZA8ABBgI8BB4Lb7+u/ibAQCcDmZLMtyq
	 Dq96qaThsOFsKMLtIO2NcWVBj+w9FzkKz/VUtZt1faNqiV0NkWWQW2B8WwY9y04Gcd
	 aYQgjkp6ysc/U+JYrKXXYSXRfOItiv0ulvtW6qVQy79wnnzFOinDd0RjM46o52YLFs
	 e8YKvqJaZE43RDWwzJya1N+H3cjiEt8a6WCf6LJlnzNFusrJSTRdUBupc/JwHn7iy/
	 2DRGVckeUTNTA==
Date: Thu, 12 Feb 2026 20:10:16 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
    will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
    maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
    chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, 
    bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
    akpm@linux-foundation.org, bhe@redhat.com, vgoyal@redhat.com, 
    dyoung@redhat.com, rdunlap@infradead.org, kees@kernel.org, 
    elver@google.com, paulmck@kernel.org, arnd@arndb.de, fvdl@google.com, 
    thuth@redhat.com, ardb@kernel.org, leitao@debian.org, rppt@kernel.org, 
    osandov@fb.com, cfsworks@gmail.com, sourabhjain@linux.ibm.com, 
    ryan.roberts@arm.com, tangyouling@kylinos.cn, eajames@linux.ibm.com, 
    hbathini@linux.ibm.com, ritesh.list@gmail.com, songshuaishuai@tinylab.org, 
    bjorn@rivosinc.com, samuel.holland@sifive.com, kevin.brodsky@arm.com, 
    junhui.liu@pigmoral.tech, vishal.moola@gmail.com, dwmw@amazon.co.uk, 
    pbonzini@redhat.com, kai.huang@intel.com, ubizjak@gmail.com, 
    coxu@redhat.com, fuqiang.wang@easystack.cn, liaoyuanhong@vivo.com, 
    brgerst@gmail.com, jbohac@suse.cz, x86@kernel.org, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
    linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
    kexec@lists.infradead.org
Subject: Re: [PATCH v5 4/4] riscv: kexec: Add support for crashkernel CMA
 reservation
In-Reply-To: <20260212101001.343158-5-ruanjinjie@huawei.com>
Message-ID: <97c57b38-2970-bdd7-2303-6de9a5c14d14@kernel.org>
References: <20260212101001.343158-1-ruanjinjie@huawei.com> <20260212101001.343158-5-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,google.com,arndb.de,debian.org,fb.com,kylinos.cn,tinylab.org,rivosinc.com,sifive.com,pigmoral.tech,amazon.co.uk,intel.com,easystack.cn,vivo.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-75961-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[65];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pjw@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9D4A0132922
X-Rspamd-Action: no action

On Thu, 12 Feb 2026, Jinjie Ruan wrote:

> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
> crashkernel= command line option") and commit ab475510e042 ("kdump:
> implement reserve_crashkernel_cma") added CMA support for kdump
> crashkernel reservation. This allows the kernel to dynamically allocate
> contiguous memory for crash dumping when needed, rather than permanently
> reserving a fixed region at boot time.
> 
> So extend crashkernel CMA reservation support to riscv. The following
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
> riscv architecture.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Looks reasonable.  If the plan is to have the kdump maintainers merge 
this, then:

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv


- Paul

