Return-Path: <linux-doc+bounces-94859-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UChKB9fXR2q/gAAAu9opvQ
	(envelope-from <linux-doc+bounces-94859-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 17:40:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9B7703F29
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 17:40:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="KkzC/u0k";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94859-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94859-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C13D4300BD9F
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 15:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2CF24886A;
	Fri,  3 Jul 2026 15:40:03 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5161D9A5F;
	Fri,  3 Jul 2026 15:40:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093203; cv=none; b=dBA7Oe0QumRi+98TPA6qucybU0gHNlz9OUvWYsyKjqpGu4MrSSbOI66mWp5YhO1+3LSyFS/A4LYpNHbMe8wuonsncRrxGxnAv4TO1KggPAci0WdO9yqlprbam9q1NhRMicCj5iwHM/4tQYrtuMcHOnwD1yxKau1yDPBVBLcOcYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093203; c=relaxed/simple;
	bh=0jkdT9QD8oaV+xvNpcFFoheEl+J6LiXgKlRXZ08jTWU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O8ikd0ZASeAgvRpqdZfL9ofFbeXSFc+Hsn1OFlcVh4eolKNSgBpu2wkzoSuw5DVykQylHvkDMVkTOxCHr3qAYQG4xqa/FOuYbf9K72s1jcmtE7rFOeZTaes+nkX5v6TKTp1jMTuOo9q870iFFWOelCbxCuyQfh2BnY8jIYkL8aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkzC/u0k; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D7B1F000E9;
	Fri,  3 Jul 2026 15:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783093202;
	bh=y2NL+dknYLH6y2zoSaP+qVBqL0DlM0+ewISJwJqvqIw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=KkzC/u0kw4EYtmlvW9Q4djBW2uN7f8kaCOPeC9Eb79FtAOn09KmkgViPwAs0KhOgY
	 Vz2+OquYHTkMPP9MzJwk5vicZpMKoizBLJnHGR3jgeaKirQlnLFxfamzUdroHOFeA5
	 U6YJWpdy5Y721B7XyS/rguWZPgCa3Fo3AbwtyzJMVgodQoccVAjFjNvs0CoBCd64nH
	 KSrDDOjS3T8Y4aGjTCznk3D6K47oGYfKvCCRiAUhLVFeOKdjF1pO3r6u8ZzvEaVHRf
	 sRYLANiPvU7SyuRCtLXtKEuVu0RWhA/WwDOu+19EtS0jewnrUCowLsgVhtz1RtFg/L
	 faseWNGZMLYdA==
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
Subject: Re: [PATCH 1/2] kernel/entry: add CONFIG_SYSCALL_USER_DISPATCH to
 compile SUD out
In-Reply-To: <20260627205551.769684-1-gourry@gourry.net>
References: <20260627205551.769684-1-gourry@gourry.net>
Date: Fri, 03 Jul 2026 17:39:59 +0200
Message-ID: <87a4s8m69c.ffs@fw13>
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
	TAGGED_FROM(0.00)[bounces-94859-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[fw13:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E9B7703F29

Gregory!

On Sat, Jun 27 2026 at 16:55, Gregory Price wrote:

First a few formal notes.

    - Multi patch series require a cover letter

    - The subject prefix is not a matter of personal preference

See https://docs.kernel.org/process/maintainer-tip.html and the related
generic process documentation.

Please also refrain from made up acronyms in the subject line. What the
heck is SUD and why needs this to spell out the CONFIG option name
prominently.

    syscall_user_dispatch: Make it configurable in Kconfig

or something like that is concise and clear, no?

> Syscall User Dispatch is built under CONFIG_GENERIC_SYSCALL and cannot
> be disabled independent of the core syscall-entry machinery.
>
> Native foreign-binary emulators (Wine/Proton) need it, but it should
> be an optional for minimal/high security systems.

I buy the miminal system aspect, but high security is just a voodoo
argument. Why?

  1) The functionality needs to be enabled with a PRCTL, which can be
     filtered.

  2) It requires LD_PRELOAD to be effective

If your high security system allows #2 then it's not a high security
system to begin with. If you fail to add the proper filters then it does
not pass the test either.

I agree that disabling it alltogether reduces the effort, but it's not a
prerequisite.

> +config SYSCALL_USER_DISPATCH
> +	bool "Syscall User Dispatch (SUD)"
> +	depends on GENERIC_ENTRY
> +	default y
> +	help
> +	  Syscall User Dispatch (SUD) lets a thread have its own system calls
> +	  redirected to a userspace handler.  It is used by emulators that run
> +	  foreign binaries which issue system calls directly.

Huch?

What is foreign? Different country, different universe or different
mindset?

It's also not restricted to emulators. It allows to intercept and abort
system calls which are issued within a certain IP address range and
redirect them to a emulator or debugger. 


>--- a/include/linux/syscall_user_dispatch.h
>+++ b/include/linux/syscall_user_dispatch.h
>@@ -7,8 +7,22 @@
>
> #include <linux/thread_info.h>
> #include <linux/syscall_user_dispatch_types.h>
> +#include <linux/sched.h>

Why does this require to pull in the heaviest header?

> +bool syscall_user_dispatch(struct pt_regs *regs);
> +
> +static inline bool syscall_user_dispatch_clear_on_dispatch(void)

Wants to be __always_inline as otherwise agressive compilers like CLANG
happily put it out of line.

Thanks,

        tglx

