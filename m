Return-Path: <linux-doc+bounces-77037-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEb+MsAfn2l3ZAQAu9opvQ
	(envelope-from <linux-doc+bounces-77037-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 17:13:52 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4F519A56E
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 17:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 604D330EBB10
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 15:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FD63DA7FF;
	Wed, 25 Feb 2026 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8o8c6fx"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548043DA7F5;
	Wed, 25 Feb 2026 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772034663; cv=none; b=T7Zx7ErIAwzoXvdawWpje6LSH9V66yMWVr0QGuIHgucgkGTEOO8t33HqBBKpIqErk8ShRyzW3tGnKrVwSfQxxH3i/hwzp/w+R3p65Gmm7tA3iqY06H+Ip3cz8O1SN3iSuLcI0H8MJ3XObwHDACeebXUBiJXVE2the0lzBwxja6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772034663; c=relaxed/simple;
	bh=X8g+EKJL0vZnYgJbnZJBCkMj0KCIXHLnrvIicphTvcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MR4skSslCM8NWDMgKjskkSzEpSF/4wIrcNjSarYWhbr7bMg/FealIu4DfqczkolK+LaBQ355vQMf8Qh065ltt7A6JQN0GU0YjkFVdMsZGfMbk1pkUerxL3kzgr/rfDg23PiVh8eEFT6vZjlLY8LCUPyMFCT8zMljRy83bnaRoVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8o8c6fx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187F0C116D0;
	Wed, 25 Feb 2026 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772034663;
	bh=X8g+EKJL0vZnYgJbnZJBCkMj0KCIXHLnrvIicphTvcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8o8c6fx7S2iXqLGrOBHQYvcEjWQG5022FEv9UcaDkP34xHM0E5ber/YhVZZJ7TDJ
	 CmonH3kI+u7XPVDT6HakxUNk6XaTfLiUErrtz15xA+amKw+aR7DLJxX5crqo3Vj23y
	 ha8ymHj5xiUMc7OdnyEepYVJrN8Xo9CXha27eWqxeexBZWgLI8h5Se7XX6MsM3qOYC
	 PueqjmhMJa59WDVNHonUx88k63SjrdKBN71BGuIPR/BImGSF37PiacUkuArAzcg6zs
	 7txFnlhhrz7LlIGf8EGIHyQZ/UYqfI6d9lioag4Y/n6KbkRjxo5SIKImiSdoeutd6u
	 yWRrawVpZN9Sw==
Date: Wed, 25 Feb 2026 17:50:45 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, akpm@linux-foundation.org, bhe@redhat.com,
	vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org,
	pmladek@suse.com, dapeng1.mi@linux.intel.com, kees@kernel.org,
	paulmck@kernel.org, lirongqing@baidu.com, arnd@arndb.de,
	ardb@kernel.org, leitao@debian.org, cfsworks@gmail.com,
	ryan.roberts@arm.com, sourabhjain@linux.ibm.com,
	tangyouling@kylinos.cn, eajames@linux.ibm.com,
	hbathini@linux.ibm.com, ritesh.list@gmail.com,
	songshuaishuai@tinylab.org, samuel.holland@sifive.com,
	kevin.brodsky@arm.com, vishal.moola@gmail.com,
	junhui.liu@pigmoral.tech, coxu@redhat.com, liaoyuanhong@vivo.com,
	fuqiang.wang@easystack.cn, jbohac@suse.cz, brgerst@gmail.com,
	x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Subject: Re: [PATCH v6 0/5] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-ID: <aZ8aVU8qIHue-khK@kernel.org>
References: <20260224085342.387996-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224085342.387996-1-ruanjinjie@huawei.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,suse.com,baidu.com,arndb.de,debian.org,kylinos.cn,tinylab.org,sifive.com,pigmoral.tech,vivo.com,easystack.cn,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-77037-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[58];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4F4F519A56E
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 04:53:37PM +0800, Jinjie Ruan wrote:
> The crash memory allocation, and the exclude of crashk_res, crashk_low_res
> and crashk_cma memory are almost identical across different architectures,
> This patch set handle them in crash core in a general way, which eliminate
> a lot of duplication code.
> 
> And add support for crashkernel CMA reservation for arm64 and riscv.
> 
> Rebased on v7.0-rc1.
> 
> Basic test were performed on QEMU platforms for x86, ARM64, and RISC-V
> architectures with the following parameters:
> 
> 	"cma=256M crashkernel=256M crashkernel=64M,cma"
> 
> Changes in v6:
> - Update the crash core exclude code as Mike suggested.
> - Rebased on v7.0-rc1.
> - Add acked-by.
> - Link to v5: https://lore.kernel.org/all/20260212101001.343158-1-ruanjinjie@huawei.com/
> 
> Changes in v5:
> - Fix the kernel test robot build warnings.
> - Sort crash memory ranges before preparing elfcorehdr for powerpc
> - Link to v4: https://lore.kernel.org/all/20260209095931.2813152-1-ruanjinjie@huawei.com/
> 
> Changes in v4:
> - Move the size calculation (and the realloc if needed) into the
>   generic crash.
> - Link to v3: https://lore.kernel.org/all/20260204093728.1447527-1-ruanjinjie@huawei.com/
> 
> Changs in v3:
> - Exclude crash kernel memory in crash core as Mike suggested.
> - Add acked-by.
> 
> Jinjie Ruan (4):
>   crash: Exclude crash kernel memory in crash core
>   crash: Use crash_exclude_core_ranges() on powerpc
>   arm64: kexec: Add support for crashkernel CMA reservation
>   riscv: kexec: Add support for crashkernel CMA reservation
> 
> Sourabh Jain (1):
>   powerpc/crash: sort crash memory ranges before preparing elfcorehdr

Overall LGTM, I had a comment about arm64 and riscv patches, but other than
that

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

