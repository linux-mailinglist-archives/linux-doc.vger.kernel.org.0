Return-Path: <linux-doc+bounces-32392-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF349EB247
	for <lists+linux-doc@lfdr.de>; Tue, 10 Dec 2024 14:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 402C6281B2B
	for <lists+linux-doc@lfdr.de>; Tue, 10 Dec 2024 13:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7871AA1FB;
	Tue, 10 Dec 2024 13:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ORkHHKE4"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1744822087
	for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 13:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733838824; cv=none; b=F76Rr7PrbISoS7bcG/ZOLcoN1/T9fIhigaDjod3nZiQembgiabVybyQ8sVxtiTSf+tSNG4S3/R+kGj998keSNraRY3u/yYFPlTXULAF6X3jdBhEpBZm3WKXkRwTaPc7wUSgnKH4ucmaIVXk1lhzx2RZDHqH02E4ZfdK2/XKNuwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733838824; c=relaxed/simple;
	bh=XRwYnChJePzqn20wldDIV3wuVph1Ee0m/c4Ln+xEExI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KXwkLgfGAHkIjXZQOvc0b0MWLtfT4SaEajtf+dYRDAPKRroeCirzGI5dkXc9wT84a+fHBImJoruGAQ2j3FLJg3a8v5ZfXCYS3oLTbuJQBdTFHQhizjWMp+59Eb2v4QEt7xar/qN54xxVo0Z2W5DTcOuVuzeFYAKPQF315yRyzFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ORkHHKE4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733838821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/HoNuqIEOrVRmdvjmLSRb9lrwGMQMrAipZHJQOxiwTc=;
	b=ORkHHKE4vXzgm/RkA7zxY2xMNYxMDY8LI47vyzcAoTkbr5XHWfkBAPBDibYJtoKM1cle7q
	Seskh7pRDv+SMhalRb4czuX9NyUQWQXHewumaKwGxlIndXFgY1YLH9Zp3won1QETMf1O5d
	9dL3dlmNdL9e2fhE6ut8TgtJY3f7ZGg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-6QuUDNzeNE6sen5cW_MPsg-1; Tue, 10 Dec 2024 08:53:40 -0500
X-MC-Unique: 6QuUDNzeNE6sen5cW_MPsg-1
X-Mimecast-MFC-AGG-ID: 6QuUDNzeNE6sen5cW_MPsg
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-434f1af9d31so16320715e9.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 05:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733838819; x=1734443619;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/HoNuqIEOrVRmdvjmLSRb9lrwGMQMrAipZHJQOxiwTc=;
        b=LVhaH9ZPB9s7pH6lBkuMvOitkr7c4cbzoQbEjSfnujoanwX6olg1EZMy/Fd1QnaX55
         utkmacngSwY1byRhPh36GbllAcZMTR07ast2JeN1ePeTVsnN435XJ2j49qCj4zqWIDEe
         flvUw88AcUeppu1obj1gcnG7sw76XnUo1lBvEtosSjRWIprH2nfLyztPHQQQvMc9icRd
         izl35YPPxFW7TkJqMTexBoXwPTP3FDvCpAuDmygRGz5MYyjRHNZhXHTbxJgghUN5bcVS
         jsA7m6nsPC3KMBJTxI1qyFuojlUh3dRwnaiSJcIfOwGyO8uyokL8Y5u9UnEYlvtYgLb3
         Wa0g==
X-Forwarded-Encrypted: i=1; AJvYcCVeCRkvYeu0w6J/mXYkMzIIquaZ9J7Aul2ZBQKVPWP1jn3Aa8upANsnN1CUKW8npghUMUOrjOm6rk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YweuT9P2TatRW8tdz0ihSFvS/o6wxMuiEKq9McrVPthPq+A23pM
	dkrGcdlbzJ6ecD5lQ3yGXXJpYU+CUieM9ewMG7jjdp8GtLHPNHCrhKFtI1Z3ImZLGkkyNlIpScb
	vPebby06SByfxaEkBQ6BzMtw9NzG0/gYfLZRW5y8Id/HwiUQLWdcCvCT5TA==
X-Gm-Gg: ASbGncud+HdyCSE6iPq2fTIoJjTMbM1RQYDwwzockKoVPJ3fYYchR3Nscbwdg7C2rIC
	hrkMGjSm2YWFLB764ikZ4GDbZZIK3xthPb2yUb53ywbVgH4M7bHYx8XK25m5l4fAfmSvfeYssCx
	VGYuWSwYUnjCTtjD/A6fO6/9+1pjcX0nOuScj+OMT+rKwWp61m6kO0KwXzXCmguc09lYRNq2Ws6
	8Yqk31dK7vd3pppsA+EuE6NKfl484h10vm8kORn/QQ98rmX9d1TgDGpEG1uvJTK4bV6ThjT0LWc
	zRTTZK7hsHFj9E6PDE17AjsXAYHObwPOtViaOqg=
X-Received: by 2002:a05:600c:4447:b0:434:a7e3:db66 with SMTP id 5b1f17b1804b1-434fffd0718mr34707265e9.26.1733838819494;
        Tue, 10 Dec 2024 05:53:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGX1Bnu64mtb/xieDzhp74HQNT4+QKiGnwf7K+hTkAcz8zIBE2KO+I2nCgWMN/+kxkXTwBWJw==
X-Received: by 2002:a05:600c:4447:b0:434:a7e3:db66 with SMTP id 5b1f17b1804b1-434fffd0718mr34706985e9.26.1733838819087;
        Tue, 10 Dec 2024 05:53:39 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c0dd4sm227972305e9.34.2024.12.10.05.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 05:53:38 -0800 (PST)
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
In-Reply-To: <20241209154252.4f8fa5a8@mordecai.tesarici.cz>
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
Date: Tue, 10 Dec 2024 14:53:36 +0100
Message-ID: <xhsmhv7vr63vj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 09/12/24 15:42, Petr Tesarik wrote:
> On Mon, 9 Dec 2024 13:12:49 +0100
> Peter Zijlstra <peterz@infradead.org> wrote:
>
>> On Mon, Dec 09, 2024 at 01:04:43PM +0100, Valentin Schneider wrote:
>>
>> > > But I wonder what exactly was the original scenario encountered by
>> > > Valentin. I mean, if TLB entry invalidations were necessary to sync
>> > > changes to kernel text after flipping a static branch, then it might be
>> > > less overhead to make a list of affected pages and call INVLPG on them.
>>
>> No; TLB is not involved with text patching (on x86).
>>
>> > > Valentin, do you happen to know?
>> >
>> > So from my experimentation (hackbench + kernel compilation on housekeeping
>> > CPUs, dummy while(1) userspace loop on isolated CPUs), the TLB flushes only
>> > occurred from vunmap() - mainly from all the hackbench threads coming and
>> > going.
>>
>> Right, we have virtually mapped stacks.
>
> Wait... Are you talking about the kernel stac? But that's only 4 pages
> (or 8 pages with KASAN), so that should be easily handled with INVLPG.
> No CR4 dances are needed for that.
>
> What am I missing?
>

So the gist of the IPI deferral thing is to coalesce IPI callbacks into a
single flag value that is read & acted on upon kernel entry. Freeing a
task's kernel stack is not the only thing that can issue a vunmap(), so
instead of tracking all the pages affected by the unmap (which is
potentially an ever-growing memory leak as long as no kernel entry happens
on the isolated CPUs), we just flush everything.

Quick tracing with my dummy benchmark mostly shows

  vfree_atomic() -> drain_vmap_work()

but pretty much any vfree() / kvfree_rcu() from the housekeeping CPUs can
get us that IPI.


