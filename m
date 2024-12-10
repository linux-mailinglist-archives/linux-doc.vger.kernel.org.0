Return-Path: <linux-doc+bounces-32397-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DECFA9EB3AC
	for <lists+linux-doc@lfdr.de>; Tue, 10 Dec 2024 15:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD695163D99
	for <lists+linux-doc@lfdr.de>; Tue, 10 Dec 2024 14:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6E61B394E;
	Tue, 10 Dec 2024 14:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bFueAjGe"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEA41B0F12
	for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 14:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841782; cv=none; b=NVjJpZNPZ5Y++CX7wtNsdzIdbtdF/xKOCiLFUEivM65Sstdt5d6k6vKWNWv2Np3oJWt/VsWdnDHGZ/eZGNd5KtR+VaLffbvNfRm89HVODTDLwTkT0dI080Ec8uALzyggWMoIGNccKF/a+Z3MgT4ujoJx0nwBB5IE5upyG4FLPy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841782; c=relaxed/simple;
	bh=EqQrouXcz1X/4/zm7JkycQVkH+G/URDYjt1sE40V2dg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uPD7WDNqPSfuYH+fKL2PqjBdi8OT8Sty7O4h3bIPxBOvbQgLABR9E27OsFYJnUEfg+URqGKLoTiqyONiHDCmi0Ft1FAjTsw8z2ep6AEbMULUlrqFhc4zAl0khu1xAk0+lRb6JktUVN+1StQA7XnT4W+Lfc4WPPv3zNNjYuwGiVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bFueAjGe; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa659775dd5so41138466b.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 06:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733841779; x=1734446579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDMYkDLMWfYBtP7XGNsvPP0tBQfKbCsqwMG2oWCcg18=;
        b=bFueAjGeLwYVi2pkcEcb2T10U1NZQX/1GPWbmA6opZNnxof/M9WXS7MYFHbnRJSYEY
         mnoPX6Yq1AIkcH7ynzF2sQHCkNZHg5QMHwnupXW27OwghPdVdLsBdCYpktq1quTFi1Kz
         gzO2+pT+VdgfaG1rznmhZI1xn4++SD8jCHEDGmZ/7VUv5PtEoXEG88vDDO4JHa670nDC
         +bThP1bXw4+cy4qjsvRwVJ01HP/6S2QKabbJ/T9u17uOn2147VJKweQHPVgADFF37eKc
         LFyfWFAvEeCLmIJfOROhgWrWpU0sHArNPUCXjie9Z+36Bdqc5Ke+jk3aGKtWcl16+2xf
         8Jbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841779; x=1734446579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDMYkDLMWfYBtP7XGNsvPP0tBQfKbCsqwMG2oWCcg18=;
        b=GO8JJQmIEhv6q5HPuLznqmABaDbPrWRH1BoNIrzeV1WKoD9tgtPlOD5pUAk+IDz/Ad
         uIuR5kSNOetbbL4EC2ivo9izjTDmVpQ6+vrAC2uciIaBPusBzT3TY51IMwwkAPKI4QZT
         SuZkQFWVMhWxLUQT2CqYnKp8aRToDYeOFdxt4xbDw2n9NwpPBK8rykxHUl6kkrgWUrjp
         uhifNm7YwypJWzWGzC4WhtYZ7USK71ErNHfawaxqJtisY4ejYWiXkMtBxNHFpcRjo/yB
         mhQe2wKvZ1OT5+oPi29WYxyuCoLZhf+tQ0fv25f1zHrcxWQ4pH0qovvsLgIrUHQHC906
         CYSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUafAguXYoRdbLtGDfgPUZCv7sMCSrVoAVqUu3g2468Zl8c6c/PWKVLRZzgvsqoRcfWkdHg7w3iiuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxokANYZDzORKUlq64NVewAOwaYFjEbKLP1a/j8rhWp9+esN/mM
	jXi2n1mAdYbd/7dsH1v0SbCOsRzxF9p1xbJ3kfl9ScP1jnnA8CW9OjsQW3Blg0M=
X-Gm-Gg: ASbGncvARi0D5IcWsM/OJY3Mmg3zWRfBihbfc8U3y00O3ESUafdqRQMxKJkqZQkQyMm
	pY13ZvZFfvs27l1tYVh2hvTBKfML25HhuMfjAyH7wftJxEqp53bTU+2ijZ6PoIFcx+zllaFiHRd
	CBYgwc+b9CX5/YcQAZAdg+CSXefpyI4RXpoBG/9SQqdx0kc+y+1PP7mHRA5E0pHlUFOSdflPcrv
	/i3xQ6RW0G6sqFS2qcAZdZ/FYniWH1q4+6pg4zsSgN4tpc6LTLWONOSR38HnnOwMuiM+ahkH1s6
	90rhaOr3C+qadj+EfFAZoHtjAnyY1BLSLos3nQjyK6/MEN1MpAmeqjfQPAU=
X-Google-Smtp-Source: AGHT+IF+BVSl+ovmy5z/z2cOrnSCU4r6DIF0pijy9YMcMwFTwuXECASsWN0wVhsf39b1va2dJNeN6Q==
X-Received: by 2002:a17:907:d24:b0:a99:a6e0:fa0b with SMTP id a640c23a62f3a-aa69f176cf2mr159635866b.5.1733841779120;
        Tue, 10 Dec 2024 06:42:59 -0800 (PST)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6749d08efsm443993566b.29.2024.12.10.06.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 06:42:58 -0800 (PST)
Date: Tue, 10 Dec 2024 15:42:49 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen
 <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
 bpf@vger.kernel.org, x86@kernel.org, rcu@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Andy Lutomirski <luto@kernel.org>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Neeraj
 Upadhyay <quic_neeraju@quicinc.com>, Joel Fernandes
 <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, Boqun Feng
 <boqun.feng@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki
 <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>, Lorenzo Stoakes
 <lstoakes@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron
 <jbaron@akamai.com>, Kees Cook <keescook@chromium.org>, Sami Tolvanen
 <samitolvanen@google.com>, Ard Biesheuvel <ardb@kernel.org>, Nicholas
 Piggin <npiggin@gmail.com>, Juerg Haefliger
 <juerg.haefliger@canonical.com>, Nicolas Saenz Julienne
 <nsaenz@kernel.org>, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>, Nadav Amit <namit@vmware.com>, Dan
 Carpenter <error27@gmail.com>, Chuang Wang <nashuiliang@gmail.com>, Yang
 Jihong <yangjihong1@huawei.com>, Petr Mladek <pmladek@suse.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Song Liu <song@kernel.org>, Julian Pidancet
 <julian.pidancet@oracle.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dionna Glaze <dionnaglaze@google.com>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>, Juri Lelli <juri.lelli@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, Daniel Wagner
 <dwagner@suse.de>
Subject: Re: [RFC PATCH v3 13/15] context_tracking,x86: Add infrastructure
 to defer kernel TLBI
Message-ID: <20241210154249.1260046a@mordecai.tesarici.cz>
In-Reply-To: <xhsmhv7vr63vj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
References: <20241119153502.41361-1-vschneid@redhat.com>
	<20241119153502.41361-14-vschneid@redhat.com>
	<20241120152216.GM19989@noisy.programming.kicks-ass.net>
	<20241120153221.GM38972@noisy.programming.kicks-ass.net>
	<xhsmhldxdhl7b.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
	<20241121111221.GE24774@noisy.programming.kicks-ass.net>
	<4b562cd0-7500-4b3a-8f5c-e6acfea2896e@intel.com>
	<20241121153016.GL39245@noisy.programming.kicks-ass.net>
	<20241205183111.12dc16b3@mordecai.tesarici.cz>
	<xhsmh1pyh6p0k.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
	<20241209121249.GN35539@noisy.programming.kicks-ass.net>
	<20241209154252.4f8fa5a8@mordecai.tesarici.cz>
	<xhsmhv7vr63vj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Dec 2024 14:53:36 +0100
Valentin Schneider <vschneid@redhat.com> wrote:

> On 09/12/24 15:42, Petr Tesarik wrote:
> > On Mon, 9 Dec 2024 13:12:49 +0100
> > Peter Zijlstra <peterz@infradead.org> wrote:
> >  
> >> On Mon, Dec 09, 2024 at 01:04:43PM +0100, Valentin Schneider wrote:
> >>  
> >> > > But I wonder what exactly was the original scenario encountered by
> >> > > Valentin. I mean, if TLB entry invalidations were necessary to sync
> >> > > changes to kernel text after flipping a static branch, then it might be
> >> > > less overhead to make a list of affected pages and call INVLPG on them.  
> >>
> >> No; TLB is not involved with text patching (on x86).
> >>  
> >> > > Valentin, do you happen to know?  
> >> >
> >> > So from my experimentation (hackbench + kernel compilation on housekeeping
> >> > CPUs, dummy while(1) userspace loop on isolated CPUs), the TLB flushes only
> >> > occurred from vunmap() - mainly from all the hackbench threads coming and
> >> > going.  
> >>
> >> Right, we have virtually mapped stacks.  
> >
> > Wait... Are you talking about the kernel stac? But that's only 4 pages
> > (or 8 pages with KASAN), so that should be easily handled with INVLPG.
> > No CR4 dances are needed for that.
> >
> > What am I missing?
> >  
> 
> So the gist of the IPI deferral thing is to coalesce IPI callbacks into a
> single flag value that is read & acted on upon kernel entry. Freeing a
> task's kernel stack is not the only thing that can issue a vunmap(), so

Thank you for confirming it's not the kernel stack. Peter's remark left
me a little confused.

> instead of tracking all the pages affected by the unmap (which is
> potentially an ever-growing memory leak as long as no kernel entry happens
> on the isolated CPUs), we just flush everything.

Yes, this makes some sense. Of course, there is no way to avoid the
cost; we can only defer it to a "more suitable" point in time, and
current low-latency requirements make kernel entry better than IPI. It
is at least more predictable (as long as device interrupts are routed
to other CPUs).

I have looked into ways to reduce the number of page faults _after_
flushing the TLB. FWIW if we decide to track to-be-flushed pages, we
only need an array of tlb_single_page_flush_ceiling pages. If there are
more, flushing the entire TLB is believed to be cheaper. That is, I
merely suggest to use the same logic which is already implemented by
flush_tlb_kernel_range().

Anyway, since there is no easy trick, let's leave the discussion for a
later optimization. I definitely do not want to block progress on this
patch series.

Thanks for all your input!

Petr T

