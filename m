Return-Path: <linux-doc+bounces-31437-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 320609D60EE
	for <lists+linux-doc@lfdr.de>; Fri, 22 Nov 2024 15:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9BC41F21BE9
	for <lists+linux-doc@lfdr.de>; Fri, 22 Nov 2024 14:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2901442F2;
	Fri, 22 Nov 2024 14:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UDAgDFlG"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329C12AF12
	for <linux-doc@vger.kernel.org>; Fri, 22 Nov 2024 14:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732287433; cv=none; b=BNyIvnn8GudH50D+cA+05bW78dGRB09msvixW8M1X4IYjvnkPqqRJa4JxnTJc5+OnKATf7iISn2QNn9SwwSvgHOWODbAkLHbh+i40p79ShsEbWSa9XCBYJQ5Uj96uXe/xVL21BMy8qljoHFw2c97H8ZmwNE4bPEhs7ZpPIAkw3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732287433; c=relaxed/simple;
	bh=tqqa48xgvR9pXkWvcyLzXe0k1qdpgquZatajbiXvd10=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O1x+88Q5qgt+ZvYANvmapiMrls9buVMTziCvLBcXBShJ2IF+STd6FXIgI8DrQEK1hQFGZMluPZbQPtUuq+SHFEJX2Up0vyojKBHETBw9Lq1Jcjav75+SwdpLYI6UU9ii8c2JS4Ue4uH1jm6nIHKsqaHM0mJWzVJd4iaVhuFjxPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UDAgDFlG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732287431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sptth2+J7xYYlvrpOuYTMVo9n+vm/HkHIiB9PfWHJ6k=;
	b=UDAgDFlG8XED7/CIpXsjVmEqeunIT4eXDsw31icDRspjRg3A11iQwsvIpuAOxtoL29DUwL
	eT/DwuAgXRLT+KTr0P+lwaE3cS7GnSAAZP3UwmtcpkN75aRXZD4Hmm5XiHAWoewCkFpq5R
	EUCb9iKMcoJFJ/01SZ1vSlSlNStYTe8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-Np4JsRqrPtiQqS8OSRanVg-1; Fri, 22 Nov 2024 09:57:10 -0500
X-MC-Unique: Np4JsRqrPtiQqS8OSRanVg-1
X-Mimecast-MFC-AGG-ID: Np4JsRqrPtiQqS8OSRanVg
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b31ccf23ebso253459685a.1
        for <linux-doc@vger.kernel.org>; Fri, 22 Nov 2024 06:57:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732287429; x=1732892229;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sptth2+J7xYYlvrpOuYTMVo9n+vm/HkHIiB9PfWHJ6k=;
        b=ZkN8b6OmygIEybQiFWpFF9BUWenRh2ztMM7BSw61oZbYmhetdcozfd3Ws7HUUBDLFb
         w5x5RrrRzPeT4CKm/QYU2hwtqvMMcgFEYrJmc2mPREfUyoEntQHX4g3wG488Go9Oy9lF
         hR9xZxb/7CZOF1R539JBvDFoAJs4/8tchnvvRjqBPi1yDYx0uaMZdCgcXv5EAOJtTjF7
         s5tu4u/jYe6iXOGMor1gq14o/jvYsmkLT5Y45k+2I51xghkQXxzs5A4hhM/jrp4yLuI0
         qsVoESnLwkIuuNzyhr0VsGUj502xOGMKbRYfsEq21gP91iWD1pKAfzWPaGTwFQng9UXL
         Q3/A==
X-Forwarded-Encrypted: i=1; AJvYcCX+4TPFAwRq/DLoKR/papgqSQFGq4PRYuv9KbIFxl6kkAWIzA7TMn6hJswZTRYr/alxG1k17abGLvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV+3Axt3ThNEfbnrubH47nYnV9NXq2HD+e8MThJTUvSayWd4PL
	WeH6Q94N8gKDyOPe26FQc47h+vnLja+9VaJm+kRw4aFKlJ+wf+m4vfJcPW6xYtxU/pLKzSSuSKG
	7HDsl5m7DUnSmc+dLndQiR+N8qKo1jyEnD0yviywXnssN/OjH5TYRdUPxqQ==
X-Gm-Gg: ASbGnctJNoeKOwcQH8UUREIYVW6cjmtdoipNgHGbiVf+KK921AYwH+ksB9GW6Ddo61W
	RLtuxXmPGzf2HiJrMRtpRAAX9Vgdc0s4OChR/mU7e03pgv/vcuKFXF6hOGjW15VpbOYaynnGvCq
	AMW3QXpJ588QYooLjJ0Pi+/q71hPtJ11PfFrs+QMb4EcfgKDA6NRcjV2t7NnqlMKRwlGl5KviDO
	W6jRF90xlXRHWM4KqsX/JZ9OeIpPxPSh3ZIWTvfbUMyUgJRowPNzenNC6cDBgVg8nOY7vgnTR2j
	x6Olr1YdPL1vF2KbXsb/c90Jd+FtAXMM+bQ=
X-Received: by 2002:a05:620a:4551:b0:7b1:522a:b05 with SMTP id af79cd13be357-7b514488166mr373605085a.7.1732287429602;
        Fri, 22 Nov 2024 06:57:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHo66xOB/q1z1C9fiLdA8QOFwiL4+kiR9reyJMdimFadi7v3LEk57578pB7zv1XQEy4GyU/yA==
X-Received: by 2002:a05:620a:4551:b0:7b1:522a:b05 with SMTP id af79cd13be357-7b514488166mr373597785a.7.1732287429065;
        Fri, 22 Nov 2024 06:57:09 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b513faf57dsm93769985a.48.2024.11.22.06.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 06:57:08 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org,
 x86@kernel.org, rcu@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Vitaly
 Kuznetsov <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>, Joel Fernandes
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
 Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [RFC PATCH v3 11/15] context-tracking: Introduce work deferral
 infrastructure
In-Reply-To: <Zz4cqfVfyb1enxql@localhost.localdomain>
References: <20241119153502.41361-1-vschneid@redhat.com>
 <20241119153502.41361-12-vschneid@redhat.com>
 <Zz2_7MbxvfjKsz08@pavilion.home> <Zz3w0o_3wZDgJn0K@localhost.localdomain>
 <xhsmho729hlv0.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <Zz4cqfVfyb1enxql@localhost.localdomain>
Date: Fri, 22 Nov 2024 15:56:59 +0100
Message-ID: <xhsmh1pz39v0k.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 20/11/24 18:30, Frederic Weisbecker wrote:
> Le Wed, Nov 20, 2024 at 06:10:43PM +0100, Valentin Schneider a =C3=A9crit=
 :
>> On 20/11/24 15:23, Frederic Weisbecker wrote:
>>
>> > Ah but there is CT_STATE_GUEST and I see the last patch also applies t=
hat to
>> > CT_STATE_IDLE.
>> >
>> > So that could be:
>> >
>> > bool ct_set_cpu_work(unsigned int cpu, unsigned int work)
>> > {
>> >    struct context_tracking *ct =3D per_cpu_ptr(&context_tracking, cpu);
>> >    unsigned int old;
>> >    bool ret =3D false;
>> >
>> >    preempt_disable();
>> >
>> >    old =3D atomic_read(&ct->state);
>> >
>> >    /* CT_STATE_IDLE can be added to last patch here */
>> >    if (!(old & (CT_STATE_USER | CT_STATE_GUEST))) {
>> >            old &=3D ~CT_STATE_MASK;
>> >            old |=3D CT_STATE_USER;
>> >    }
>>
>> Hmph, so that lets us leverage the cmpxchg for a !CT_STATE_KERNEL check,
>> but we get an extra loop if the target CPU exits kernelspace not to
>> userspace (e.g. vcpu or idle) in the meantime - not great, not terrible.
>
> The thing is, what you read with atomic_read() should be close to reality.
> If it already is !=3D CT_STATE_KERNEL then you're good (minus racy change=
s).
> If it is CT_STATE_KERNEL then you still must do a failing cmpxchg() in an=
y case,
> at least to make sure you didn't miss a context tracking change. So the b=
est
> you can do is a bet.
>
>>
>> At the cost of one extra bit for the CT_STATE area, with CT_STATE_KERNEL=
=3D1
>> we could do:
>>
>>   old =3D atomic_read(&ct->state);
>>   old &=3D ~CT_STATE_KERNEL;
>
> And perhaps also old |=3D CT_STATE_IDLE (I'm seeing the last patch now),
> so you at least get a chance of making it right (only ~CT_STATE_KERNEL
> will always fail) and CPUs usually spend most of their time idle.
>

I'm thinking with:

        CT_STATE_IDLE		=3D 0,
        CT_STATE_USER		=3D 1,
        CT_STATE_GUEST		=3D 2,
        CT_STATE_KERNEL		=3D 4, /* Keep that as a standalone bit */

we can stick with old &=3D ~CT_STATE_KERNEL; and that'll let the cmpxchg
succeed for any of IDLE/USER/GUEST.

> Thanks.


