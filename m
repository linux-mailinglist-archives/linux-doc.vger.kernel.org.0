Return-Path: <linux-doc+bounces-32265-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C469E9342
	for <lists+linux-doc@lfdr.de>; Mon,  9 Dec 2024 13:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86878161F1F
	for <lists+linux-doc@lfdr.de>; Mon,  9 Dec 2024 12:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B37E221D90;
	Mon,  9 Dec 2024 12:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ev3wyfKc"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0182163B6
	for <linux-doc@vger.kernel.org>; Mon,  9 Dec 2024 12:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745893; cv=none; b=Nuy6crBE5Ri47OGV3EEEIilYowHZ66wduQnEBIlh402jfu9RcnO7KCKhzWYBa4mbh9OlSBWQRQplohsv1yXCiYnWTGtYuUvzuXV6hX8fkNIH7ySLUXbbV5XvdRojuJNdwt3xwec/Uj/OQK7t4xVCFaE6g9/D28R04vblj3v4SNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745893; c=relaxed/simple;
	bh=8ozULsLWQO+vzCljXTI+v97uJ+n9WOO7i0CyLv4/O+g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MdKf5kkndXujtte9TdKug4ZqjrWcx1oMaLgzxG/yEud8lVsVL8J7PAgg5S26wrnUQg5V+kft3TVa1cdj1Fish3g1Ck7/MlQlXy+AKSlc7tvadOucuvWb7rrSTkWNO2gzS8YrVWmrPEEHUBlzdy8xLhjAYOfCwmH5/RrFUIBCARw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ev3wyfKc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733745890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ozULsLWQO+vzCljXTI+v97uJ+n9WOO7i0CyLv4/O+g=;
	b=Ev3wyfKcZldxWELeAdDChfmG6a2mHotpEByJ5aQv4wo4FOF6CLFjVhxqfhBPeJ14WHUDRU
	mByafu9PStkNbNLznDVT+4DWyZ+3G3TkIJOO8fvLzFg2oD9nNW9DjBYQCg+Xc8vFjSdQId
	flI2bRb7MjiRrVDULRUzOznGwqtbGdY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-Zprn0pweNk6PaRFJ4otgIA-1; Mon, 09 Dec 2024 07:04:48 -0500
X-MC-Unique: Zprn0pweNk6PaRFJ4otgIA-1
X-Mimecast-MFC-AGG-ID: Zprn0pweNk6PaRFJ4otgIA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385e9c69929so758720f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Dec 2024 04:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733745887; x=1734350687;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ozULsLWQO+vzCljXTI+v97uJ+n9WOO7i0CyLv4/O+g=;
        b=RLUjQTLRmDTkKyRIkL7XpGJntid7NljSrg9NtKAqv70WXwCJ9GZV1EZzwmI0jZHnJW
         I42TfstYToeqratb7G7Msl0LWoYzU1RFvp1wEOqCDci+qbY4AWTubNULykUR/FisLEUu
         bxBeyHPofjaEDyz5rNAYodogqqP3CjDJHzc38SU+raq2ZVwhC7u26xpeKSRNtz7cu2iy
         B8rFXnon2d5Jvy6IY4LHpKUNTBPjeJet76bBzuDtnx2LzeMFMGdTktwNFxldG49clWoJ
         Royh2FaxfcjM8Bx/T0yg2pMEbT1Omj1pnFFyzONQfuMiWB9ZBxrOM8Q5NR9cxpOnNW1v
         5pTA==
X-Forwarded-Encrypted: i=1; AJvYcCXXbAczs/mYHk9fJ1AHLEuFWVWkCsInQ2TEOaJqock7QXn4lJUhI+/yPWA3yhS3ACf3K6ApubnpO44=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4tfle8JSFH4uBj4mHBwgqh3z06P76x3N0KvyuAn3hOWu9HGsb
	FLZulrfRdepa/9Nk4oSvkN+HyVjpL+aWHiCRV2QcUVj6pLVR+w90d7vi4Lg8IZTKPnLsIQ5IBKe
	7lB1GexI5m8+0DHHV/0AefjK8chlhF2MOCNCGQE46FpugSTgmhFcHR/M+XA==
X-Gm-Gg: ASbGncuoOkUPTFjK7qjk8zyVJMFFvvL2qhdM6uMv8CFkl28d7a+RBtQa47hHfa9m8qx
	UeTWrUIqJGSKp4CPnYLqSxlU2T5yBntKEQRcMxH385fCHAhBMMuGnxsqYcEylG7E9eRcCi5eJXM
	BTBUPz+uIkiL8rh2c0yXP+K4PNHFiLaVWNN9lvsVVcc5ocgSe04KchemZ6VOMwrTWyOshSrXMx5
	fy2kR2HeW6Fz1Yx+rl3qGkn4cUE2SeVlmBtM8rQuo9uHuH2mPXTLwu0+RRCN89mgrARIgfqZj+V
	bOLU2GSdV8QCVgvB6enmDYLt1pSWdC6wD9Y=
X-Received: by 2002:a05:6000:184b:b0:385:ed20:3be2 with SMTP id ffacd0b85a97d-38645401effmr26614f8f.48.1733745887074;
        Mon, 09 Dec 2024 04:04:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7+TwyI4hfJQ4uZRNXBuUPLYNSzp/LJUZ4222u4bGFUZ10ecblUvGELIouY8pa5AFUG5gJsQ==
X-Received: by 2002:a05:6000:184b:b0:385:ed20:3be2 with SMTP id ffacd0b85a97d-38645401effmr26553f8f.48.1733745886668;
        Mon, 09 Dec 2024 04:04:46 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386408549b9sm2359972f8f.89.2024.12.09.04.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:04:45 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Petr Tesarik <ptesarik@suse.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
 bpf@vger.kernel.org, x86@kernel.org, rcu@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Vitaly Kuznetsov
 <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>, Frederic
 Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Neeraj
 Upadhyay <quic_neeraju@quicinc.com>, Joel Fernandes
 <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, Boqun
 Feng <boqun.feng@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang1211@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Lorenzo Stoakes
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
 Dionna Glaze <dionnaglaze@google.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Juri Lelli <juri.lelli@redhat.com>, Marcelo
 Tosatti <mtosatti@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, Daniel
 Wagner <dwagner@suse.de>
Subject: Re: [RFC PATCH v3 13/15] context_tracking,x86: Add infrastructure
 to defer kernel TLBI
In-Reply-To: <20241205183111.12dc16b3@mordecai.tesarici.cz>
References: <20241119153502.41361-1-vschneid@redhat.com>
 <20241119153502.41361-14-vschneid@redhat.com>
 <20241120152216.GM19989@noisy.programming.kicks-ass.net>
 <20241120153221.GM38972@noisy.programming.kicks-ass.net>
 <xhsmhldxdhl7b.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <20241121111221.GE24774@noisy.programming.kicks-ass.net>
 <4b562cd0-7500-4b3a-8f5c-e6acfea2896e@intel.com>
 <20241121153016.GL39245@noisy.programming.kicks-ass.net>
 <20241205183111.12dc16b3@mordecai.tesarici.cz>
Date: Mon, 09 Dec 2024 13:04:43 +0100
Message-ID: <xhsmh1pyh6p0k.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 05/12/24 18:31, Petr Tesarik wrote:
> On Thu, 21 Nov 2024 16:30:16 +0100
> Peter Zijlstra <peterz@infradead.org> wrote:
>
>> On Thu, Nov 21, 2024 at 07:07:44AM -0800, Dave Hansen wrote:
>> > On 11/21/24 03:12, Peter Zijlstra wrote:
>> > >> I see e.g. ds_clear_cea() clears PTEs that can have the _PAGE_GLOBAL flag,
>> > >> and it correctly uses the non-deferrable flush_tlb_kernel_range().
>> > >
>> > > I always forget what we use global pages for, dhansen might know, but
>> > > let me try and have a look.
>> > >
>> > > I *think* we only have GLOBAL on kernel text, and that only sometimes.
>> >
>> > I think you're remembering how _PAGE_GLOBAL gets used when KPTI is in play.
>>
>> Yah, I suppose I am. That was the last time I had a good look at this
>> stuff :-)
>>
>> > Ignoring KPTI for a sec... We use _PAGE_GLOBAL for all kernel mappings.
>> > Before PCIDs, global mappings let the kernel TLB entries live across CR3
>> > writes. When PCIDs are in play, global mappings let two different ASIDs
>> > share TLB entries.
>>
>> Hurmph.. bah. That means we do need that horrible CR4 dance :/
>
> In general, yes.
>
> But I wonder what exactly was the original scenario encountered by
> Valentin. I mean, if TLB entry invalidations were necessary to sync
> changes to kernel text after flipping a static branch, then it might be
> less overhead to make a list of affected pages and call INVLPG on them.
>
> AFAIK there is currently no such IPI function for doing that, but if we
> could add one. If the list of invalidated global pages is reasonably
> short, of course.
>
> Valentin, do you happen to know?
>

So from my experimentation (hackbench + kernel compilation on housekeeping
CPUs, dummy while(1) userspace loop on isolated CPUs), the TLB flushes only
occurred from vunmap() - mainly from all the hackbench threads coming and
going.

Static branch updates only seem to trigger the sync_core() IPI, at least on
x86.

> Petr T


