Return-Path: <linux-doc+bounces-94884-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3oihGO7vR2pZhwAAu9opvQ
	(envelope-from <linux-doc+bounces-94884-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 19:22:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFF27049C6
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 19:22:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gourry.net header.s=google header.b=nXqp1SsZ;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94884-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-94884-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7612030060AC
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 17:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6A32BDC05;
	Fri,  3 Jul 2026 17:22:47 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5471029D267
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 17:22:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783099367; cv=none; b=Gwp52vjmaJawBQOZqmROxO/iBbjk1uAteA1xEf7MT7zo2qnrGTmFnVFvoPfavg2iZnbqXb+rZsKEe6c0R5LW/xeFhmsQC00cFYPnhPAc3A78yslvBceXHIKL18SAEYhII8eUmN6rXTZOpW2KqNa2WR1HvA3fr3IEUs1ObtlNvQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783099367; c=relaxed/simple;
	bh=8Q6S8eSRiXqqbVyN+JydEj02y/pvsZwRU7MyCqulak0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uABdXLcszmqyLke4II8713HiSwKMxYRvOZLVRYVwnCVr4u/DVwyrr3W29ElUeNfBYGDkfGhuSK7OdjhDiJeBpGdGkhfoziR36i4Byzbn+Wzf9lxDhLcGWrC/MesMlIzu3d/qj/Q+v5/O0UAROm8G0DxlgOqJCcWBFBS8N0Hb8MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=nXqp1SsZ; arc=none smtp.client-ip=209.85.222.178
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e7632b193so51868585a.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2026 10:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783099365; x=1783704165; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wNR9K06lLbEYvnJ4+KHd4VFdF558bi2QMUxDhjH/sTw=;
        b=nXqp1SsZy+If0hVpw9SrUK9ykGlgrBTwX5oroIWhjM+mherTMdUO4tIrVS4Fnl1lbE
         0VRXmb9Ktn6tcPi/6wmVnMWpOkWkyi4ZEe7P4YbIQK1hpbbCzTFoHGxElDy0LtGCIRFN
         9y89GpHqmg0bBY5hCvdNJmKeZR4yo9yVdkXvZkDyu34r/g3anUfKE7Ahm7kv2iFK7eyZ
         1p5e6RMQoVhzYNSgw5CQMeCi80LGUf8hoEs2Hhm850Q7PF4Owe9Gns+9eoYpIA7bBEWE
         Ct/NkuQUMSjhc0fiBGL188Y5zyJW6Wf1T2avqONYDHud9M58PRs5TOWq+qR6zCA7qRTf
         bjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783099365; x=1783704165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wNR9K06lLbEYvnJ4+KHd4VFdF558bi2QMUxDhjH/sTw=;
        b=iWwZJ0BLIcMn90NRbl5CCfHpp0fvZsbkO1FRXlNs7D7SjosLDcqsxmRM4b3Bka9PYN
         fboiTbNZveEGat6SLb/iIMUzEWs7+w1SqwYRMKpMbC5ILytVCf5AhR0LZHYa4qsNfQ9S
         dN/wrpL0JKa/ZqM/UrLsdETn7WkBBiGktdIHB5pQ0IjW3NNEYzdzGV3sItYKWK7LkQ55
         H61OK6CZ1lfljkYSsPq2DUJnEyRsjWPN7KIK+PXHemGLelN6Y4l0f1eymQgFpDCx2NtG
         dFe9GK8fiOTzrtKDqVWYOjodtYAhokdxorW4Cgi/cM/YAQ+HSDX1cHwGZ0t02hIlNLft
         7h7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Vb9IK/7CaOQRKTEeEBJPI89z8Rc3Nz6zJ0ertK9CklMUkwtmhmmRHy2/BAtnAASCYn3WC83YnMII=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzTYKIOlhU6Gf1yxxz3vKpUtcfwU9nGzFBqwoTE5IsIjBnC9yI
	Y8MjMuvCY6IMo/20mGQgZImR5sdG/E2uzfJeG6EZDfXXCq6h2Sw8RWmlDSZUevuDOmsK8wwtQOu
	eZm7c2H8=
X-Gm-Gg: AfdE7cnptfXncdfcRuBGgSRGgTmFuUwNw6CSKYgz3JV0ZHtUikRTwzKPLhuxUfqRm5T
	pRpNXSbsVAaMFmJ9ng8VcVlrVVAWDl0chrchl4vfcl8fKFEYVZIhUNWcnaSTi8uYfcoqdSRmDEi
	PcBED8wwkA28ag0Rd3npPtMKfrEdl1xQXUmYJCFY0aFo2eQdJDOsYbixod6ZveM8IXzKh4Im1vk
	q5ytiaKhiD8D+Ah/FbfJu3RoOseId20ReMb54QyyMP/a1vgN6FeOtySDeuTAq64Pq07HlQIv+nG
	SPhdRZ/A5C6+gmucYOuibNF5TJvpX0e7G+vkyjJsqyQ+ivYJXH4oG7IpOQcWeiw3ls1AH5uRazL
	Bbr6+AeA64WzloL5pBgUjvh678deaX1VCesJMF+E/hZr2L4upYRq8D9887FkQhZF40c+UfiDgdd
	X15sh50w==
X-Received: by 2002:a05:620a:19a1:b0:92e:8fa2:be6c with SMTP id af79cd13be357-92e9a49f558mr44070485a.39.1783099365081;
        Fri, 03 Jul 2026 10:22:45 -0700 (PDT)
Received: from fedora ([2607:fb91:1408:4b9b:69b2:bc92:5299:1677])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b800efsm198609785a.4.2026.07.03.10.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 10:22:44 -0700 (PDT)
Date: Fri, 3 Jul 2026 13:22:41 -0400
From: Gregory Price <gourry@gourry.net>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kernel-team@meta.com, corbet@lwn.net, skhan@linuxfoundation.org,
	peterz@infradead.org, luto@kernel.org, akpm@linux-foundation.org,
	feng.tang@linux.alibaba.com, pmladek@suse.com, mhiramat@kernel.org,
	marc.herbert@linux.intel.com, joel.granados@kernel.org,
	lirongqing@baidu.com, kees@kernel.org, nathan@kernel.org,
	linusw@kernel.org, arnd@arndb.de, deller@gmx.de,
	jpoimboe@kernel.org, ruanjinjie@huawei.com,
	lukas.bulwahn@redhat.com, ryan.roberts@arm.com, ojeda@kernel.org
Subject: Re: [PATCH 1/2] kernel/entry: add CONFIG_SYSCALL_USER_DISPATCH to
 compile SUD out
Message-ID: <akfv4ecFcHMqx5Xp@fedora>
References: <20260627205551.769684-1-gourry@gourry.net>
 <87a4s8m69c.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4s8m69c.ffs@fw13>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gourry.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kernel-team@meta.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:peterz@infradead.org,m:luto@kernel.org,m:akpm@linux-foundation.org,m:feng.tang@linux.alibaba.com,m:pmladek@suse.com,m:mhiramat@kernel.org,m:marc.herbert@linux.intel.com,m:joel.granados@kernel.org,m:lirongqing@baidu.com,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:arnd@arndb.de,m:deller@gmx.de,m:jpoimboe@kernel.org,m:ruanjinjie@huawei.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:ojeda@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[gourry.net];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gourry@gourry.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-94884-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,meta.com,lwn.net,linuxfoundation.org,infradead.org,kernel.org,linux-foundation.org,linux.alibaba.com,suse.com,linux.intel.com,baidu.com,arndb.de,gmx.de,huawei.com,redhat.com,arm.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gourry@gourry.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gourry.net:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,gourry.net:from_mime,gourry.net:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EFF27049C6

On Fri, Jul 03, 2026 at 05:39:59PM +0200, Thomas Gleixner wrote:
> 
> I buy the miminal system aspect, but high security is just a voodoo
> argument. Why?
> 
>   1) The functionality needs to be enabled with a PRCTL, which can be
>      filtered.
> 
>   2) It requires LD_PRELOAD to be effective
> 
> If your high security system allows #2 then it's not a high security
> system to begin with. If you fail to add the proper filters then it does
> not pass the test either.
> 

sure, it can be filtered, but not all software runs in a sandbox and not
all attack vectors need end in priv-esc or launching new tasks.  It
does not require LD_PRELOAD to be useful to an attacker.

just as an example, if i land remote execution in a task, i can enable
syscall user dispatch and just steal cpu time from that task whenever it
makes a syscall without having to do any of the traditional tricks of
overwriting GDT entries to get hooks.  No need for ld preloading or even
leaving the active task's context.

syscall user dispatch is just a really clean, powerful tool for writing
implants.  I've been playing with it for the better part of 2 years and
just realized I don't want it enabled (or even present at all) on some
of my machines / machines I manage and there's no way to do that.

> I agree that disabling it alltogether reduces the effort, but it's not a
> prerequisite.
> 
> > +config SYSCALL_USER_DISPATCH
> > +	bool "Syscall User Dispatch (SUD)"
> > +	depends on GENERIC_ENTRY
> > +	default y
> > +	help
> > +	  Syscall User Dispatch (SUD) lets a thread have its own system calls
> > +	  redirected to a userspace handler.  It is used by emulators that run
> > +	  foreign binaries which issue system calls directly.
> 
> Huch?
> 
> What is foreign? Different country, different universe or different
> mindset?
> 
> It's also not restricted to emulators. It allows to intercept and abort
> system calls which are issued within a certain IP address range and
> redirect them to a emulator or debugger. 
> 

foreign meaning non-linux, but sure i'll change it to be more general.

> 
> >--- a/include/linux/syscall_user_dispatch.h
> >+++ b/include/linux/syscall_user_dispatch.h
> >@@ -7,8 +7,22 @@
> >
> > #include <linux/thread_info.h>
> > #include <linux/syscall_user_dispatch_types.h>
> > +#include <linux/sched.h>
> 
> Why does this require to pull in the heaviest header?
> 

we dereference current (struct task_struct)

> > +bool syscall_user_dispatch(struct pt_regs *regs);
> > +
> > +static inline bool syscall_user_dispatch_clear_on_dispatch(void)
> 
> Wants to be __always_inline as otherwise agressive compilers like CLANG
> happily put it out of line.
>

ack.

