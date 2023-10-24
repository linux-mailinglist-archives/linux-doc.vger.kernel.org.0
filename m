Return-Path: <linux-doc+bounces-1053-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ADD7D5A76
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 20:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD103B21097
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 18:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F161CA9C;
	Tue, 24 Oct 2023 18:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="B8BTElvt"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F6D3C6BE
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 18:28:54 +0000 (UTC)
Received: from mail.zytor.com (unknown [IPv6:2607:7c80:54:3::138])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F39B9;
	Tue, 24 Oct 2023 11:28:53 -0700 (PDT)
Received: from [127.0.0.1] ([98.35.210.218])
	(authenticated bits=0)
	by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 39OIRcVA3383411
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 24 Oct 2023 11:27:38 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 39OIRcVA3383411
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023101201; t=1698172060;
	bh=oroAbK7jVyJ1hEsK6EWzfojE3csZE571ESfRCsIkU3g=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=B8BTElvtiP1+hIe3f629T3y7gl9CjCEdpQHCxMzh3kj7A+HWfpncPZeWtsJqUBTJJ
	 N0B6uD+17VWHv3W/v5pWNYmoJEgugY0P9vyf7Xr5nQ/sfFss9v96oQR1fjs4wfrznB
	 V9d3M5czrx2IRLCHZqBnO/GwsIaIlBZiaIz0qhpv1rXjQJYTONbBF+KLUt+yPYa+04
	 DZ+q2lVOiU2iNj1UBv2mQbNkrvjO0nOOxltztSuqUrwx7NaeMON5kSerM3pibiHVaS
	 jkZ+iqoguLfD/M3C14MUCHzGhenjuirZGyPRePTDrEmsT+wnhKiFTmLs7RDwRLGwGz
	 NzowXbqpBrXjQ==
Date: Tue, 24 Oct 2023 11:27:36 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Peter Zijlstra <peterz@infradead.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
        ak@linux.intel.com, tim.c.chen@linux.intel.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kvm@vger.kernel.org, Alyssa Milburn <alyssa.milburn@linux.intel.com>,
        Daniel Sneddon <daniel.sneddon@linux.intel.com>,
        antonio.gomez.iglesias@linux.intel.com,
        Alyssa Milburn <alyssa.milburn@intel.com>
Subject: Re: [PATCH  v2 1/6] x86/bugs: Add asm helpers for executing VERW
User-Agent: K-9 Mail for Android
In-Reply-To: <20231024170248.GE40044@noisy.programming.kicks-ass.net>
References: <20231024-delay-verw-v2-0-f1881340c807@linux.intel.com> <20231024-delay-verw-v2-1-f1881340c807@linux.intel.com> <20231024103601.GH31411@noisy.programming.kicks-ass.net> <20231024163515.aivo2xfmwmbmlm7z@desk> <20231024163621.GD40044@noisy.programming.kicks-ass.net> <20231024164520.osvqo2dja2xhb7kn@desk> <20231024170248.GE40044@noisy.programming.kicks-ass.net>
Message-ID: <DD2F34A0-4F2F-4C8C-A634-7DBEF31C40F0@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 24, 2023 10:02:48 AM PDT, Peter Zijlstra <peterz@infradead=2Eorg=
> wrote:
>On Tue, Oct 24, 2023 at 09:45:20AM -0700, Pawan Gupta wrote:
>
>> > > modules being within 4GB of kernel=2E
>
>FWIW, it's 2G, it's a s32 displacement, the highest most address can
>jump 2g down, while the lowest most address can jump 2g up=2E Leaving a 2=
G
>directly addressable range=2E
>
>And yeah, we ensure kernel text and modules are inside that 2G range=2E

To be specific, we don't require that it is located at any particular *phy=
sical* addresses, but all modules including the root module are remapped in=
to the [-2GiB,0) range=2E If we didn't do that, modules would have to be co=
mpiled with the pic memory model rather than the kernel memory model which =
is what they currently are=2E This would add substantial overhead due to th=
e need for a GOT (the PLT is optional if all symbols are resolved at load t=
ime=2E)

The kernel is different from user space objects since it is always fully l=
oaded into physical memory and is never paged or shared=2E Therefore, inlin=
e relocations, which break sharing and create dirty pages in user space, ha=
ve zero execution cost in the kernel; the only overhead to modules other th=
an load time (including the runtime linking) is that modules can't realisti=
cally be mapped using large page entries=2E

