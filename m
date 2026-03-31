Return-Path: <linux-doc+bounces-81803-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKe0A/AOy2msDQYAu9opvQ
	(envelope-from <linux-doc+bounces-81803-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 02:01:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 774A436283C
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 02:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB2FD303E3B7
	for <lists+linux-doc@lfdr.de>; Tue, 31 Mar 2026 00:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C963BED6F;
	Tue, 31 Mar 2026 00:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gdh4IsN4"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D33A3B774B;
	Tue, 31 Mar 2026 00:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774915203; cv=none; b=rkG3Ik/dDeOppOQ/zDebhC3rTMudiuCDkdqe96m4fn2OCQ6lzi/MO0NmYdXu7SZQYIgc31itV58zOei4m2sWg6T3uHfm9orSWmcyet48ix6uMVi82gXA4EP0d2vIGGu6gjnhNkohnzzDIfYFkggWeWGBO1C/8JeUZ16byaGYjDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774915203; c=relaxed/simple;
	bh=nflDkOq0Zqwb58YzrdiSqpPIhkpTAzBKnu8Q3SFxf+0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=g5809decs2VR/ZFq4ZrQS0fUWYyyEa7Lj9Uhi0Rxc8rFOEGTFk//YWKz7dRPeV0hDyv0vFxN2Xdwzwp8BG18L+bWESdZN6QfjCreIocN6DrpsOkqlCdcl/A5IBl9iRr5QGVT5FJqXIs388kGtbfo1onexqumfM2lQxKAxq24J2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gdh4IsN4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48C1C4CEF7;
	Tue, 31 Mar 2026 00:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774915203;
	bh=nflDkOq0Zqwb58YzrdiSqpPIhkpTAzBKnu8Q3SFxf+0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Gdh4IsN45OLC64JvdICWSUZT4Z14Unu57CJZxKMY+CdC4C9BmJdY/OsHZ5zxYSmIp
	 /3PWmy6D+VyDBIZMSv0RJGR5UCtQjAw8ZtsBUHFGYZZLi5q5hf+oeWWQR/ReMgEpbf
	 DwLxfkFDh2nntt76+0f9BmjWYeLDoscGpmVCVXXiJMjJsVYSrAnKTXXgJk+kSjFG/p
	 fjrwknbCsLDbeRDlELhsyK114qmvlAaMTUi+bM4MaoNk+D8T724fRWXcw/GG5NMboK
	 Z5z7TkuUYMPpuUwAMUSBjTQ7+UGxRpmAxt0vZ/3+OGt4mhWlwSHNHkXRcLHGUOi47u
	 a27FDQBgzQX+A==
Date: Tue, 31 Mar 2026 09:00:00 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 oss@malat.biz, paulmck@kernel.org, rostedt@goodmis.org,
 kernel-team@meta.com
Subject: Re: [PATCH v2] bootconfig: Apply early options from embedded config
Message-Id: <20260331090000.b3be159bb7655449e6c4d230@kernel.org>
In-Reply-To: <acpzhCBEPh-tKVqg@gmail.com>
References: <20260325-early_bootconfig-v2-1-6b05a36fbfb5@debian.org>
	<20260325232204.05edbb21c7602b6408ca007b@kernel.org>
	<acZPZ4XKy4QynznK@gmail.com>
	<20260327223744.f246150adc1671f7605a4f0a@kernel.org>
	<acpzhCBEPh-tKVqg@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-81803-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 774A436283C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 06:15:17 -0700
Breno Leitao <leitao@debian.org> wrote:

> On Fri, Mar 27, 2026 at 10:37:44PM +0900, Masami Hiramatsu wrote:
> > On Fri, 27 Mar 2026 03:06:41 -0700
> > Breno Leitao <leitao@debian.org> wrote:
> 
> > > > To fix this, we need to change setup_arch() for each architecture so
> > > > that it calls this bootconfig_apply_early_params().
> > > 
> > > Could we instead integrate this into parse_early_param() itself? That
> > > approach would avoid the need to modify each architecture individually.
> > 
> > Ah, indeed. 
> 
> I investigated integrating bootconfig into parse_early_param() and hit a
> blocker: xbc_init() and xbc_make_cmdline() depend on memblock_alloc(), but on
> most architectures (x86, arm64, arm, s390, riscv) parse_early_param() is called
> from setup_arch() _before_ memblock is initialized.

Yeah, that's right.

> 
> So, bootconfig will not be available as early as parse_early_param(). 
> 
> An alternative is replace memblock allocations in lib/bootconfig.c with static
> __initdata buffers, similar to Petr's approach in 2023:
> 
> 	https://lore.kernel.org/all/20231121231342.193646-3-oss@malat.biz/
> 
> But, there was concerns about the allocation size:
> 
> 	Petr Malat <oss@malat.biz> wrote: 
> 	> To allow handling of early options, it's necessary to eliminate allocations
> 	> from embedded bootconfig handling
> 
> 	"Hm, my concern is that this can introduce some sort of overhead to parse the bootconfig."
> 

As far as we can correctly handle the early params and it is limited only
with the embedded bootconfig, I think it is OK to allocate it statically.

Thank you,


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

