Return-Path: <linux-doc+bounces-84944-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAhqF6WZ8GmGVwEAu9opvQ
	(envelope-from <linux-doc+bounces-84944-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 13:27:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CDD483B45
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 13:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A35530C5098
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 10:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10CD3F789A;
	Tue, 28 Apr 2026 10:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Qsqv6r1l"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED7F3F7894;
	Tue, 28 Apr 2026 10:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777373579; cv=none; b=mZVmfltO+PXBcJwyP2QJi/c3zbcBitb7PSGA9dMbvwrdAnXInWjTYzLAcsWG6x253qC6Cit9zfUArTf3/q9uDNV92aTTxPJFaTIN1ym1XhX4je5TY2ElA2eMfHvaMcnK/kYpBSFj5urbvEdPIoaxaRG7NtSy5DoSl1u9jPB0Cu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777373579; c=relaxed/simple;
	bh=FAkK0ftN7gWUbuk+HZ/TnP99n+RR4S9QM3ioJ/hUWvI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lhhNaJWyHyRdAMzHDoJkcW2uHwsAFkSDyDUHaFmxWgtZLIkwUjgKJOCuGtO8Qw+EdWggAuDbhw8PxyOkx5ZXvLIScP971AIrbGy9dR+VhA5d6SsBCDr2yiSQumlZBT3KpibsVexQzWYYauESZicFJ0l4GOTh9/JYB2O8AvPNmlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Qsqv6r1l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEE5C2BCAF;
	Tue, 28 Apr 2026 10:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1777373579;
	bh=FAkK0ftN7gWUbuk+HZ/TnP99n+RR4S9QM3ioJ/hUWvI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Qsqv6r1lJZq/c7ZPtIt0sZl/DuaHenFFdJWV+kUZfKy9lze4sbNHOT4ldBEvZsMcI
	 IzA4ewciHKUUGkWs11knSBEVXzjvVrxdGd/P9JBd6VWThd9m0HhwDsNHUrAT8OtKfZ
	 vkIpz9kt+ca77YyWoiGiskB7TOq8ICE0RWcWLVHM=
Date: Tue, 28 Apr 2026 03:52:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <chenhuacai@kernel.org>,
 <kernel@xen0n.name>, <maddy@linux.ibm.com>, <mpe@ellerman.id.au>,
 <npiggin@gmail.com>, <chleroy@kernel.org>, <pjw@kernel.org>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <hpa@zytor.com>, <robh@kernel.org>,
 <saravanak@kernel.org>, <bhe@redhat.com>, <vgoyal@redhat.com>,
 <dyoung@redhat.com>, <rdunlap@infradead.org>, <peterz@infradead.org>,
 <pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
 <dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
 <paulmck@kernel.org>, <lirongqing@baidu.com>, <rppt@kernel.org>,
 <leitao@debian.org>, <ardb@kernel.org>, <jbohac@suse.cz>,
 <cfsworks@gmail.com>, <tangyouling@kylinos.cn>,
 <sourabhjain@linux.ibm.com>, <ritesh.list@gmail.com>,
 <hbathini@linux.ibm.com>, <eajames@linux.ibm.com>, <guoren@kernel.org>,
 <songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
 <vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <coxu@redhat.com>,
 <fuqiang.wang@easystack.cn>, <liaoyuanhong@vivo.com>,
 <takahiro.akashi@linaro.org>, <james.morse@arm.com>,
 <lizhengyu3@huawei.com>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <kexec@lists.infradead.org>
Subject: Re: [PATCH v12 00/15] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-Id: <20260428035256.cbb3ac77c4bbb89bb7efcc19@linux-foundation.org>
In-Reply-To: <dfa24c4b-a423-4c80-9a8f-28c577c9ec11@huawei.com>
References: <20260402072701.628293-1-ruanjinjie@huawei.com>
	<dfa24c4b-a423-4c80-9a8f-28c577c9ec11@huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 50CDD483B45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-84944-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,linux.alibaba.com,google.com,baidu.com,debian.org,suse.cz,kylinos.cn,tinylab.org,pigmoral.tech,easystack.cn,vivo.com,linaro.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[64];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.dev:email,linux-foundation.org:email,linux-foundation.org:dkim,linux-foundation.org:mid,soleen.com:email,infradead.org:email]

On Tue, 28 Apr 2026 11:30:13 +0800 Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> It seems the patches for crash core rework, powerpc, riscv, and arm64
> are mostly ready to be merged. Could any maintainer help pick these up,
> or should I rebase the entire series against v7.1-rc1?

April 2 is prehistoric ;)

Yes, refresh, retest, resend.  Note that there have been maintainership
shuffles in this area.  

KDUMP
M:	Andrew Morton <akpm@linux-foundation.org>
M:	Baoquan He <bhe@redhat.com>
M:	Mike Rapoport <rppt@kernel.org>
M:	Pasha Tatashin <pasha.tatashin@soleen.com>
M:	Pratyush Yadav <pratyush@kernel.org>
R:	Dave Young <ruirui.yang@linux.dev>
L:	kexec@lists.infradead.org
S:	Maintained
F:	Documentation/admin-guide/kdump/
F:	fs/proc/vmcore.c
F:	include/linux/crash_core.h
F:	include/linux/crash_dump.h
F:	include/uapi/linux/vmcore.h
F:	kernel/crash_*.c

I believe that Pasha/Mike/Pratyush are setting up a git tree, but there
isn't one listed here?


