Return-Path: <linux-doc+bounces-84965-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OdcIlu38GlwXgEAu9opvQ
	(envelope-from <linux-doc+bounces-84965-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 15:34:19 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7FB485EC6
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 15:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BDE19319F858
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 12:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118A743CEF2;
	Tue, 28 Apr 2026 12:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2H9r0W1"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C41B238D27;
	Tue, 28 Apr 2026 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380807; cv=none; b=Ph6pweTpy1uBoqS8xWFjABzUFMrW5AZyK0qJnMhsuvGYvbbJKRLShmocpdRkRhi01G9InhqxrYBhk8JiqSqcbHMjiMcJIQy7S8oXP6ePohEOaTWZvbOqREfkhj2zPmKiGKwwMRlJl7R98oLLaHgyoZ11HglNgDF6E8AdWAovWt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380807; c=relaxed/simple;
	bh=MFTHBWIVPPds/6umCo+/GsrLJiT9dmnX5t+TJKOu5mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDYGS8RbJPrlRDAhl9FPqv0jQtkj1Fx4tsWu0ZCvlkjyfGDl9sthea/EMaoEMYRy1YY4ejmdI7KhLYJ563nD8Fv46cxW+Iw6DmQAiCak0hsdzsRJcwNj/HtMC7r7JnMJn7Gq921udEcXkjalJDGqVNZqdgO9qShVtBdxAfS9moI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2H9r0W1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3A7C2BCB7;
	Tue, 28 Apr 2026 12:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777380805;
	bh=MFTHBWIVPPds/6umCo+/GsrLJiT9dmnX5t+TJKOu5mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q2H9r0W1pFFOcIVTMHsruFr/GMxPujb4LuXdLrJe3uKYcZNxQlHL325YdzeYIaqGb
	 YgUJCml9iD59Ml9MwxFlDl8g45HE5SHDfQGNKeas7kf1pYmKZ8jVqRDzf6HHicsR74
	 sZhFSzs8Ra8AOxlyR0j8SYeZmmbjYyl+cqItSnBMh0HfeU971hN2OffDpUKu+aAFBj
	 GLEtiSpFA8P4RWzmvn81yKRR+hygNgh10efvXltfAPPC4wXMVhE51Jp4/oUrhxxohi
	 717FMNQI5CLuRE78CHCswC/iUhsYlDYFPjyu26ZyBg3OTRsdTyrq/yecTvXuGJxsmB
	 j+0ksBK4wyZcg==
Date: Tue, 28 Apr 2026 14:53:01 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
	skhan@linuxfoundation.org, catalin.marinas@arm.com, will@kernel.org,
	chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org,
	saravanak@kernel.org, bhe@redhat.com, vgoyal@redhat.com,
	dyoung@redhat.com, rdunlap@infradead.org, peterz@infradead.org,
	pawan.kumar.gupta@linux.intel.com, feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com,
	paulmck@kernel.org, lirongqing@baidu.com, leitao@debian.org,
	ardb@kernel.org, jbohac@suse.cz, cfsworks@gmail.com,
	tangyouling@kylinos.cn, sourabhjain@linux.ibm.com,
	ritesh.list@gmail.com, hbathini@linux.ibm.com,
	eajames@linux.ibm.com, guoren@kernel.org,
	songshuaishuai@tinylab.org, kevin.brodsky@arm.com,
	vishal.moola@gmail.com, junhui.liu@pigmoral.tech, coxu@redhat.com,
	fuqiang.wang@easystack.cn, liaoyuanhong@vivo.com,
	takahiro.akashi@linaro.org, james.morse@arm.com,
	lizhengyu3@huawei.com, x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	kexec@lists.infradead.org, Baoquan He <baoquan.he@linux.dev>
Subject: Re: [PATCH v12 00/15] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-ID: <afCtrXaUAGDcseq3@kernel.org>
References: <20260402072701.628293-1-ruanjinjie@huawei.com>
 <dfa24c4b-a423-4c80-9a8f-28c577c9ec11@huawei.com>
 <20260428035256.cbb3ac77c4bbb89bb7efcc19@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428035256.cbb3ac77c4bbb89bb7efcc19@linux-foundation.org>
X-Rspamd-Queue-Id: 7D7FB485EC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[huawei.com,lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,linux.alibaba.com,google.com,baidu.com,debian.org,suse.cz,kylinos.cn,tinylab.org,pigmoral.tech,easystack.cn,vivo.com,linaro.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,linux.dev];
	TAGGED_FROM(0.00)[bounces-84965-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[65];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,infradead.org:email,huawei.com:email,soleen.com:email,linux-foundation.org:email]

(added new Baoquan's email)

On Tue, Apr 28, 2026 at 03:52:56AM -0700, Andrew Morton wrote:
> On Tue, 28 Apr 2026 11:30:13 +0800 Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
> > It seems the patches for crash core rework, powerpc, riscv, and arm64
> > are mostly ready to be merged. Could any maintainer help pick these up,
> > or should I rebase the entire series against v7.1-rc1?
> 
> April 2 is prehistoric ;)
> 
> Yes, refresh, retest, resend.  Note that there have been maintainership
> shuffles in this area.  
> 
> KDUMP
> M:	Andrew Morton <akpm@linux-foundation.org>
> M:	Baoquan He <bhe@redhat.com>
> M:	Mike Rapoport <rppt@kernel.org>
> M:	Pasha Tatashin <pasha.tatashin@soleen.com>
> M:	Pratyush Yadav <pratyush@kernel.org>
> R:	Dave Young <ruirui.yang@linux.dev>
> L:	kexec@lists.infradead.org
> S:	Maintained
> F:	Documentation/admin-guide/kdump/
> F:	fs/proc/vmcore.c
> F:	include/linux/crash_core.h
> F:	include/linux/crash_dump.h
> F:	include/uapi/linux/vmcore.h
> F:	kernel/crash_*.c
> 
> I believe that Pasha/Mike/Pratyush are setting up a git tree, but there
> isn't one listed here?

On it:
https://lore.kernel.org/all/20260428124833.1903302-1-rppt@kernel.org/
https://lore.kernel.org/all/20260428124325.4189486-1-pratyush@kernel.org/

-- 
Sincerely yours,
Mike.

