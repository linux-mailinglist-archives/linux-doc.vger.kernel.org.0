Return-Path: <linux-doc+bounces-96041-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WQ09JYTrT2obqQIAu9opvQ
	(envelope-from <linux-doc+bounces-96041-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 20:42:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F292A734607
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 20:42:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hSxrzxxE;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96041-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-96041-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7407E308FD81
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 18:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0200943747C;
	Thu,  9 Jul 2026 18:40:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89490437466
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 18:40:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622421; cv=none; b=hjYvjrpuw2F9omQqMq9Qsy0LgbOrBank6LzWvn4jtj0DC0vX6zo7wehcLtX3zGjj+2yOWw3LUofmxiKBf+exywPouq38uWdYT84HOj/4nXNDindYFb+4vrs4EEF2EOeMDrZlnrYYnuTZcX+zcQ42BGPzXUevO92P7B2kD2Fyif8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622421; c=relaxed/simple;
	bh=rnI8Mtk7zFh67ToOxrITQJjhD2smVc7SMC3A0Srfn7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kr6kkOlcKuRdp8bGaZR8Rbae8QyQUErQGTf+8waUqhqXLn0OSdMmBR1cLlv7SuzPsR8PEV0OyuvxQHPMl0+FyB0a+faHBbw7XyIkLPElcbHuApbj7vxyeoJ2o61cwZeQODkJah3ORQDWZ6me/qIK3sLTVnJOC5jFqpg8PLNSDW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSxrzxxE; arc=none smtp.client-ip=209.85.215.182
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so87830a12.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 11:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622419; x=1784227219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v3NWG3nzWzn0lD5brSEphHHDIxNRitNNFv0e1po41sA=;
        b=hSxrzxxEgcIPpX4HGktg5ZBZPXnANJ73MP3lQU8dB8IP7Qadq7oJ8G+4+MWybMR345
         8CD1MkedcDdfN9mmArcgE/028EQezgTd0kAfl421CaxIudItiKKE10qi8Hx/9r62yEyx
         L94i9XpzAPgVLVw5oRo/Cu4zV80C73sGdWFgFhGCzziH+NX//k6+57HkXCDPFDDUBWZc
         ASWX5fCCg0oURezyLULnlaLxVPoPewDbOh1Y8+e6IUs/KO6/S3FQwLZwN/3FF0sAVTqs
         pcWyaUPVyMBfu+h0C/SdPiDsIEvJVLAXiECIbVjHMA/BigcVj3icz30PkDlWEhhKpoRQ
         lmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622419; x=1784227219;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v3NWG3nzWzn0lD5brSEphHHDIxNRitNNFv0e1po41sA=;
        b=q1PzPHfwi6bpXCuLi31znxk0w27BhdTnLtFZsTcw8oWjtZtUKZUmT5XhTd5rJ3gM6Y
         5lwD00Grbeub6SU/fFwLKwtHSb9hs94PqPfPaIhGvC87vi8bwFoyPMTcd29p05qKzZHw
         D9sx/xW4aDGhDyJj/6KYYO7Ay+UK+v85uNrt/uUajQkRlhqfPCvqqRbqsHGiCoaGe65s
         gO0iaAC4PmM5FJnhEWSB/Dulw3LYQmUmTo/B/00pRHYU864bUrXdvBst0sYgsy2g1iQC
         Cikv1Y2HOi25g6qrKL7/+/o3Ng4yjqXgWU6qByA+iBB6sx+nLToCglXB5JcZ355Y7ohe
         w5rQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8mAIYkoRaZSRpo8/0KzYYQuPNksyb84DAnyOBF+wgzaCzb54w4gp07XFJiqluoQijeZ17YUz7Lfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvRdZbeMFUFNH1XceobOrTiekSfc/Gg5e8EDgbM7eIso6BBO6g
	A4g+SP3Y54+rpKnlcL2al3yk27h8WD1KNnSvYyNs1hW/3uckoMECDV2t
X-Gm-Gg: AfdE7ckjU6j71hdxCXwNn470g3EKj6gjEuDxVPt1QJ29UHMw+A2QCyvGjiT8S5DDf1b
	N7v+tF7g9WjIh5TJxow73NQ6tNAcXQSN1BJOqRhDZ142SWf8G/vxLiyS25lGo0+jYYou7LY6b28
	hiPe5nilaq4AYijOmW7Sd+ZwusYGkMBd+VSYhw12qDCUXF3UEINHs2bfDwqBQuaT/5LUtgnu2kr
	YeJVvLzbdkKkM2NVLHb/rF8/EGxHqbh6wWWpIu2zpZzT406CZVG8ZCa0KaNWnNY3UF7eLpmLWVk
	3dhCU5W22FFl2p+Cbjxwop8R7bXKRMhhFoIa2O5rHOEaZ5OvhGQXxjpG+6NPjdE3Zx0AcZF2n7v
	EXJc2ZoFRJstPhvEY7uxpUu6CYocXjV8Bb9fGql+vjYpggdsZ+fRTiIOo93TUia/h3begP3GIDP
	ItEKsD+YeNlBkFkVYiAQuPpF1JPM19tSpJJbcnS4uYQTpVRwKXZGrX/3IJL9gW
X-Received: by 2002:a05:6a21:4902:b0:3b4:8300:7019 with SMTP id adf61e73a8af0-3c0bcf656a1mr10343651637.18.1783622418932;
        Thu, 09 Jul 2026 11:40:18 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6091dsm28653518eec.14.2026.07.09.11.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:40:18 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:10:01 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 04/18] loongarch/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Message-ID: <ak_q9qWuifFdo_9S@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.865955911@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190253.865955911@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96041-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,kernel.org,lists.linux.dev,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,dabbelt.com,lists.infradead.org,arm.com,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,suse.de,lwn.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@kerne
 l.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:url,infradead.org:email,linux.dev:email,vger.kernel.org:from_smtp,li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F292A734607

On Tue, Jul 07, 2026 at 09:06:11PM +0200, Thomas Gleixner wrote:
> syscall_enter_from_user_mode_randomize_stack() replaces
> syscall_enter_from_user_mode() and the subsequent invocation of
> add_random_kstack_offset().
> 
> The advantage is that it applies the stack randomization right after
> enter_from_user_mode() and thereby avoids the overhead of get/put_cpu_var()
> as that code is invoked with interrupts disabled.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: loongarch@lists.linux.dev
> ---
>  arch/loongarch/kernel/syscall.c |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> --- a/arch/loongarch/kernel/syscall.c
> +++ b/arch/loongarch/kernel/syscall.c
> @@ -11,7 +11,6 @@
>  #include <linux/linkage.h>
>  #include <linux/nospec.h>
>  #include <linux/objtool.h>
> -#include <linux/randomize_kstack.h>
>  #include <linux/syscalls.h>
>  #include <linux/unistd.h>
>  
> @@ -70,9 +69,7 @@ void noinstr __no_stack_protector do_sys
>  	regs->orig_a0 = regs->regs[4];
>  	regs->regs[4] = -ENOSYS;
>  
> -	nr = syscall_enter_from_user_mode(regs, nr);
> -
> -	add_random_kstack_offset();
> +	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
>  
>  	if (nr < NR_syscalls) {
>  		syscall_fn = sys_call_table[array_index_nospec(nr, NR_syscalls)];
> 
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-snps-arc

