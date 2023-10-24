Return-Path: <linux-doc+bounces-1062-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 778807D5C66
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 22:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFAC0B20F99
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 20:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4303F4B6;
	Tue, 24 Oct 2023 20:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=zytor.com header.i=@zytor.com header.b="ngQUl/HX"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640873F4AC
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 20:30:50 +0000 (UTC)
Received: from mail.zytor.com (unknown [IPv6:2607:7c80:54:3::138])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03AFEA;
	Tue, 24 Oct 2023 13:30:48 -0700 (PDT)
Received: from [127.0.0.1] ([98.35.210.218])
	(authenticated bits=0)
	by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 39OKU61w3426385
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 24 Oct 2023 13:30:07 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 39OKU61w3426385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023101201; t=1698179409;
	bh=i9nl6v0XQTPlxSQ2dRSWnBYQvkoXzwqM1OBHxFm02uo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ngQUl/HXIc/IvUvksoAeojl9Bb4I82VGTs7uPEKlYj4COIE/kqJkOlYt29/vJkQG4
	 jFHVMeHrCIWVBJYzmmwB5oZ2PNkxFcdUBP77cCX0C6+TsIoBgsmQCwz9eThPJmVqf/
	 gxl4UHhBM9S58HgkQ22YbMOaUiyL7JwRkVKSPyKgMWrZLqL56+FpiBmV9YZef4Rhic
	 WBeX4WrB8juvYcbZgx9wzx9j3bQFCPt6RHmdJyg2pwlZ6O9oaSfFywOmwKGGLifRkT
	 8vNyIgQQuhx+YLt/M1nGycwC/OeDq5anb8KvUsHZez5Kgtr62jU0WcIZtyUK/G60zu
	 GoMxkx7t703kw==
Date: Tue, 24 Oct 2023 13:30:04 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Luck, Tony" <tony.luck@intel.com>, Peter Zijlstra <peterz@infradead.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        "Lutomirski, Andy" <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        "Christopherson,, Sean" <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "ak@linux.intel.com" <ak@linux.intel.com>,
        "tim.c.chen@linux.intel.com" <tim.c.chen@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        Alyssa Milburn <alyssa.milburn@linux.intel.com>,
        Daniel Sneddon <daniel.sneddon@linux.intel.com>,
        "antonio.gomez.iglesias@linux.intel.com" <antonio.gomez.iglesias@linux.intel.com>,
        "Milburn, Alyssa" <alyssa.milburn@intel.com>
Subject: RE: [PATCH  v2 1/6] x86/bugs: Add asm helpers for executing VERW
User-Agent: K-9 Mail for Android
In-Reply-To: <SJ1PR11MB6083FE98A35C6BCF027B568CFCDFA@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20231024-delay-verw-v2-0-f1881340c807@linux.intel.com> <20231024-delay-verw-v2-1-f1881340c807@linux.intel.com> <20231024103601.GH31411@noisy.programming.kicks-ass.net> <20231024163515.aivo2xfmwmbmlm7z@desk> <20231024163621.GD40044@noisy.programming.kicks-ass.net> <20231024164520.osvqo2dja2xhb7kn@desk> <20231024170248.GE40044@noisy.programming.kicks-ass.net> <DD2F34A0-4F2F-4C8C-A634-7DBEF31C40F0@zytor.com> <SJ1PR11MB6083E3E2D35B30F4E40E8FE7FCDFA@SJ1PR11MB6083.namprd11.prod.outlook.com> <5B8EB5F2-16A7-47BC-97FE-262ED0169DE3@zytor.com> <SJ1PR11MB6083FE98A35C6BCF027B568CFCDFA@SJ1PR11MB6083.namprd11.prod.outlook.com>
Message-ID: <49A97ACF-24A3-452C-88A5-0D55F77B7780@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 24, 2023 12:40:02 PM PDT, "Luck, Tony" <tony=2Eluck@intel=2Ecom>=
 wrote:
>> Sure it could, but it would mean the kernel is sitting on an average of=
 6 MB of unusable memory=2E It would also mean that unloaded modules would =
create holes in that memory which would have to be managed=2E
>
>On my Fedora38 desktop:
>
>$ lsmod | awk '{ bytes +=3D $2 } END {print bytes/(1024*1024)}'
>21=2E0859
>
>Lots more than 6MB memory already essentially pinned by loaded modules=2E
>
>$ head -3 /proc/meminfo
>MemTotal:       65507344 kB
>MemFree:        56762336 kB
>MemAvailable:   63358552 kB
>
>Pinning 20 or so Mbytes isn't going to make a dent in that free memory=2E
>
>Managing the holes for unloading/reloading modules adds some complexity =
=2E=2E=2E but shouldn't be awful=2E
>
>If this code managed at finer granularity than "page", it would save some=
 memory=2E
>
>$ lsmod | wc -l
>123
>
>All those modules rounding text/data up to 4K boundaries is wasting a bun=
ch of it=2E
>
>-Tony
>
>
>

Sure, but is it worth the effort?

