Return-Path: <linux-doc+bounces-96057-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pOGhAUXtT2q0qQIAu9opvQ
	(envelope-from <linux-doc+bounces-96057-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 20:49:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 658EA7347D4
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 20:49:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AVAXJFFm;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96057-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-96057-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D91BA30648F9
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 18:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1291445AC0;
	Thu,  9 Jul 2026 18:41:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA8243B493
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 18:41:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622488; cv=none; b=HPeMHludoWQ1sq1ZqUK8i8Ha2Nd6synf9PEBOOFfIlih5o9e3d92XMjLRMjfw8IZZUWIRJSbR1GRumeHl+d0JM3NkClgcVTdglxbfCumnO3hTfDLZz1FM64i60AUVz4kX0s5JI07f9JICkmQ0wIp6QWdZRPF3DkqeT9UkNjIaeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622488; c=relaxed/simple;
	bh=x/B73ZAx/OZvPWDOjgMBsyCuVlSuIzuC3lusVvx1Is4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvBkjkzABbeB5bxtduQgr9mAk6xEJ8MQTJKnhNZe6DcASubo2wIlmyAVe6OC+TH9zWUBKA+/f9oDklOOnky9DBlYXH4VfQ22rw8BF2REQRE1uMz4ygKq98c4ALmNjJbP72c/d3zgNh0PgW8j7REh3buL2DTzVtFpTajFFZz2+Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVAXJFFm; arc=none smtp.client-ip=209.85.210.181
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-848479c9bd5so60256b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 11:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622485; x=1784227285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aq4oHRjffhbqNLpraCJHXQbfXmiONMD/vVc6qcgWJtk=;
        b=AVAXJFFmK0nNQhIep2Zx7bQdFMVddMSEs+L4Gx9GRroa0HtOoGG79MHkpkbb+yGdq9
         mMa24LFtE6V2hXx+q5AovfFeAZSs/VC6/AeG9dU48X7N3xSCHS4uqGNtj17QWFTJdJSe
         JB1/zywZB5SQMADKuoiUUPLFcYWeOOFBCpUjBEr3aGMRxM3D4MNpkS+ANOiGWTtXyZkC
         if6xGjcnc8pBFlVWHJb9XXQOdHLeb2JwsQH4YA+0ivE+gjgRfvDY2hsDr0jpUu6miCVx
         yVF1GgWIDOlyJipWCi8tIkQKFScHFAiDOIXyB8qnWiDKSR3Uw3k6deV1NZVpP7BL0p10
         mCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622485; x=1784227285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aq4oHRjffhbqNLpraCJHXQbfXmiONMD/vVc6qcgWJtk=;
        b=XFPMz1qBU428jiuoPhEaxe67S0FSgRsuRfn0AiEs3dNGnzLLS06qB3lTSFkCL9epJk
         +/PFj+Q/RjVvzCO8Ayj/ziCMDeb7xzQf6ZbZnkUGFzEeB7e7Kv2XfIH72JsEaAgF7Rw8
         sb+F423wVoO5bzkAJOpaVVrUpLmzDp3tvI5jy0M81WZhVe539lNKlcymiFgf0nm9HCXa
         YHP/y8fVJGZPDFpxW/eAv1xNnJw64SS3tUdNfu1oQgGmTAMJtXS4lP2om1o7U1YckDL1
         m/Pur45g3x1Y8SwuGGVN9oojSXGnlddWPff3/GuAgkzWTLZsEB4f8kfUpVU5flew2pzd
         3fMQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYbqVJ7QE2LRe/nzfKtkGvTi+++zuRfH5tNxfiqtqdGibN3bvTvT6Lg/RG10zpH7TXHMiSAqm1v90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1+UnCvLAVXkqtT7qV/jnR/Aql4tWnC1IoEHv+VeKbZEnRCVoH
	QI88T3rTm0dqAPYi5pxd/8s/a/Ren90UYzDgM9fvzOZ7r2lzAUFvW6+3
X-Gm-Gg: AfdE7cnCNbRpckIL6/v22U36cPlpVZWXHt80+bwOAjBMW96HC2Sz8VYXbgy+OwpU+Rj
	ZXzcXiZ7kcZSbQQc+TrwFAUv0awKzTQLP76mxm4V1GQX9D/s9MawzNRV6+Ar8GdhJ9fRMihb3x4
	jjp5vjXCVEFqezXrigH4qcGrvWfRK3+kvj1Xgx9UyTouHpVN5oSfFq9b2NwoGfpRigGFE+TG16c
	DVIU1rcgZAOeGoAPtKDIXvPH6IEeECPU8GGdaOPOMXJ5N613jVxV/aHvDIAzOqPClYnVObTFBPE
	tDPW3UlsXycfnM1YcH6K9ykRBbkDt4aseLlXqhuxEQksXPTbFpz+J8qnyprPR3EV7OOU3efG6wA
	L3I3SOkW5LYCE7jLxzbVkXuH2CEHbjtbO7ptztSruJ2wc8pZmopbzs56U9IEmEPZ/LoLLJWEeYZ
	igYZF6lSdnN9rZ422BtDXDOIb7Kzkw9tcemk54uUN6SrOYe65VAWjWZDtnKqXz
X-Received: by 2002:a05:6a20:3d0c:b0:3bf:80b8:9c8a with SMTP id adf61e73a8af0-3c0bcead1e2mr9967332637.6.1783622485265;
        Thu, 09 Jul 2026 11:41:25 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d7c8bsm35321002c88.12.2026.07.09.11.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:41:24 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:11:04 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
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
Subject: Re: [patch 05/18] powerpc/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Message-ID: <ak_rL1RfdQVJ6zeq@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.918861529@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707190253.918861529@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96057-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,kernel.org,lists.linux.dev,dabbelt.com,lists.infradead.org,arm.com,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,suse.de,lwn.net];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@kerne
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ellerman.id.au:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 658EA7347D4

On Tue, Jul 07, 2026 at 09:06:15PM +0200, Thomas Gleixner wrote:
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
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/kernel/syscall.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -2,7 +2,6 @@
>  
>  #include <linux/compat.h>
>  #include <linux/context_tracking.h>
> -#include <linux/randomize_kstack.h>
>  #include <linux/entry-common.h>
>  
>  #include <asm/interrupt.h>
> @@ -19,8 +18,7 @@ notrace long system_call_exception(struc
>  	long ret;
>  	syscall_fn f;
>  
> -	r0 = syscall_enter_from_user_mode(regs, r0);
> -	add_random_kstack_offset();
> +	r0 = syscall_enter_from_user_mode_randomize_stack(regs, r0);
>  
>  	if (unlikely(r0 >= NR_syscalls)) {
>  		if (unlikely(trap_is_unsupported_scv(regs))) {
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

