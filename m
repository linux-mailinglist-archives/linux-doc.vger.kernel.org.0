Return-Path: <linux-doc+bounces-31428-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5569D5D1E
	for <lists+linux-doc@lfdr.de>; Fri, 22 Nov 2024 11:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2F2A2822A4
	for <lists+linux-doc@lfdr.de>; Fri, 22 Nov 2024 10:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604E11D5158;
	Fri, 22 Nov 2024 10:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RmdSJ0iF"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EAC13C3D6
	for <linux-doc@vger.kernel.org>; Fri, 22 Nov 2024 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270667; cv=none; b=HAzyRlixg/7kVfYVClNhtIa5ivFzaYBtuyanh1JONSOwZF196wrVj5tJb4qpDPFiGWAZyfd5IdjGTZdW0VxDdA4gFQOXgS+xsz8V51Xhm3gE2iuNS52ipvyqg9d9AX5o4gdOk6beQ/SfrWVkDbPpbFiqNzr0nDeJvjSoxo3y5u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270667; c=relaxed/simple;
	bh=XUuo/u7cK5K5gY/dFgAwCjVRAIBZqBeX+BIxJiAEQkY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uYJY/MMo8JqtFU2w1pdWoKlwuZcc3GxCvDJBGvqlRpw03DZX7j4r42EZBQs5ykw3nzvOgUX/IcZnR9PyNhTUl+vKlkRibaJ6JZLqlrvZoxzJ3S2VkwQ8bo2bwbuTk2hdjD3zFj44v29Qt1IoMUshub6hCCGkfLl8+WbMP/y/YLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RmdSJ0iF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732270664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=69DVKh9DUZx0Pn4NM7TlxBgCo8xRovdMM0JkhaNwI8A=;
	b=RmdSJ0iFkYWDqYT/nWQdylr5lxytCZyfYY0A9Tx855o06aD9rEBHQ0kRZUtw/GeNI47O6l
	3VBWDRHiZETHfnhI+0f58qJR3GdcsQjITevTw5StXkqkKVsaEXJZYHyS7RtYrBgjVNuxdp
	y76RiYTMHY+ocrxxdWfYT20yTh9XpZM=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-KCNHyuioP1yB5YxR80C8Yg-1; Fri, 22 Nov 2024 05:17:43 -0500
X-MC-Unique: KCNHyuioP1yB5YxR80C8Yg-1
X-Mimecast-MFC-AGG-ID: KCNHyuioP1yB5YxR80C8Yg
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-6ee57ae1133so26684327b3.0
        for <linux-doc@vger.kernel.org>; Fri, 22 Nov 2024 02:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270663; x=1732875463;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69DVKh9DUZx0Pn4NM7TlxBgCo8xRovdMM0JkhaNwI8A=;
        b=HuV8fYAZh+7OGL4IwtvDf6rgJF9HdgSWR8iqZR1pf5jy62Yn2jsd27auvmewo8uedH
         +UwPcg+Ek3cwg/zSr6pGhNBs5Yi02/dF34E4TQL2j4HNtqMXmNUavCWjxqMOvSyap132
         Rh730q2djm9nLA99tQGE5tHGtM1lB1fJjqcLs0h1rj1BFItBwRlQmQZMjBQD3Z9dg+da
         h8Q5ZVjrmvYi26soD0i0l292ES0gL2c9TMHK7V25A4l0MJbFNxqShDNLXphfXrgC4U9j
         P5E01EfjD8Y0g6LaYUBH9Tp0BrDTMQGedxBS0X0edduftcL3ibCSPTMiDzl6+LCpvqUj
         rqHg==
X-Forwarded-Encrypted: i=1; AJvYcCUWsNoAlQUWm2VrY976OYsXrXxuz6BQng7dNc7bXCDOCxtz7X332UCEyrB1LI1s/kK+Qp1DKazpCvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmrzIJc0S0814bnQdtKsCWyxV2TMdcZAebmxxauWeg8dZxuugu
	8k8ucOD5vFaF04pntHv+voNsMiROXVKT2fkxnRFiXA/wzceNGiW0KPAVMzeTOzyzYEf3wmtGnAw
	Z7Mx/wHuAFiIbvuT/zY/oB3A14k5jCvGDU9fniRTmiR1Qw8MIuTRMQj6q5A==
X-Gm-Gg: ASbGncu58IAPzyW1ruuXvjYylO5Glac4CdVPIuLVBPzVXr1w95sEVZIfOCugufWaYKO
	5ADVhnc7y3DW3wozrEWLKb0/2NEgglOpaHgjeyWBdqAxO6T+Hr6BfT2NC/1LIQ+fZutLKu54MtM
	ItssxP14FIZEa2VZw2bJBbCrGu8ZcV+WDxtm2Amfs15GdroZLyasWdTKP5cQ4FRUrkSYavBpFF/
	1uc0nJgaLt3UpX2BNufr0E24eAF+7eHcmzreZLTTSu1TVOYed6t+MgmpbW7oTd+4IeLJf+G5dAn
	8aF5wJ7FIr7mx8rr4WGpF5dnGtCRoXlK6E8=
X-Received: by 2002:a05:690c:4b8f:b0:6e2:a129:1623 with SMTP id 00721157ae682-6eee0a4e7cbmr23805687b3.38.1732270663049;
        Fri, 22 Nov 2024 02:17:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzjL7GOb26N8xVdZoDD0aeetdAAWaPf+1MRvyDFWpPzlOuVttoePPk8DAQ//wEdbZj+zzG2Q==
X-Received: by 2002:a05:690c:4b8f:b0:6e2:a129:1623 with SMTP id 00721157ae682-6eee0a4e7cbmr23805387b3.38.1732270662779;
        Fri, 22 Nov 2024 02:17:42 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b513f91e8esm72637485a.2.2024.11.22.02.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:17:41 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
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
 Neeraj Upadhyay <quic_neeraju@quicinc.com>, Joel Fernandes
 <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, Boqun
 Feng <boqun.feng@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang1211@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Lorenzo Stoakes
 <lstoakes@gmail.com>, Jason Baron <jbaron@akamai.com>, Kees Cook
 <keescook@chromium.org>, Sami Tolvanen <samitolvanen@google.com>, Ard
 Biesheuvel <ardb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Juerg
 Haefliger <juerg.haefliger@canonical.com>, Nicolas Saenz Julienne
 <nsaenz@kernel.org>, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>, Dan Carpenter <error27@gmail.com>,
 Chuang Wang <nashuiliang@gmail.com>, Yang Jihong <yangjihong1@huawei.com>,
 Petr Mladek <pmladek@suse.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Song Liu <song@kernel.org>, Julian Pidancet <julian.pidancet@oracle.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze
 <dionnaglaze@google.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Juri
 Lelli <juri.lelli@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Daniel Wagner <dwagner@suse.de>, Petr
 Tesarik <ptesarik@suse.com>
Subject: Re: [RFC PATCH v3 06/15] jump_label: Add forceful jump label type
In-Reply-To: <20241121202106.nqybif4yru57wgu3@jpoimboe>
References: <20241119153502.41361-1-vschneid@redhat.com>
 <20241119153502.41361-7-vschneid@redhat.com>
 <20241119233902.kierxzg2aywpevqx@jpoimboe>
 <20241120145649.GJ19989@noisy.programming.kicks-ass.net>
 <20241120145746.GL38972@noisy.programming.kicks-ass.net>
 <20241120165515.qx4qyenlb5guvmfe@jpoimboe>
 <20241121110020.GC24774@noisy.programming.kicks-ass.net>
 <xhsmhcyioa8lu.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <20241121202106.nqybif4yru57wgu3@jpoimboe>
Date: Fri, 22 Nov 2024 11:17:33 +0100
Message-ID: <xhsmha5dra7ya.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 21/11/24 12:21, Josh Poimboeuf wrote:
> On Thu, Nov 21, 2024 at 04:51:09PM +0100, Valentin Schneider wrote:
>> Okay so forcing the IPI for .noinstr patching lets us get rid of all the
>> force_ipi faff; however I would still want the special marking to tell
>> objtool "yep we're okay with this one", and still get warnings when a new
>> .noinstr key gets added so we double think about it.
>
> Yeah.  Though, instead of DECLARE_STATIC_KEY_FALSE_NOINSTR adding a new
> jump label type, it could just add an objtool annotation pointing to the
> key.  If that's the way we're going I could whip up a patch if that
> would help.
>

Well I'm down for the approach and I'd appreciate help for the objtool side
:-)

> --
> Josh


