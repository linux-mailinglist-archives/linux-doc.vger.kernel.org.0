Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52F234A9354
	for <lists+linux-doc@lfdr.de>; Fri,  4 Feb 2022 06:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236392AbiBDFUc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 4 Feb 2022 00:20:32 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:50712 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235223AbiBDFUb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Feb 2022 00:20:31 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B6FB3B83683
        for <linux-doc@vger.kernel.org>; Fri,  4 Feb 2022 05:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3B2C340E9;
        Fri,  4 Feb 2022 05:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643952029;
        bh=YyMGbf0ZqsvTYLYfTUApEeUhPl/FcV973WctliE1Z1o=;
        h=In-Reply-To:References:Date:From:To:Subject:From;
        b=AUdDQBlIaAZzSdVDqz1s6pagZyke5HnBWzZnTgTJslocW5z6IbO2wuvitbd+5PCZ7
         aG40ENbM2yopbXxuo92gcPgrmF6VryGx7eigJtLDcfzGab/CyQEATHgDmBv2SejZw7
         etnMc2iKINVGrMO1npU0s21JjhqVlx95Gs/hV/EtmnFR2djfgW7oZF26m2ERtjZnKk
         GKG9TscZ/QcSFXtdRpprz7sONHdWF/xlQlqGpBimiEVzlRg8yBK7hxBy7eQ+Onocqo
         1HDNni1+qyJ9jAb6mPgS6kk6c6ZYKD2W/0dX+s6jWTwUkftJ/uSGeTtjBp1VKObQ3n
         9XyKyMfrPOYKA==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailauth.nyi.internal (Postfix) with ESMTP id 2CDBC27C0054;
        Fri,  4 Feb 2022 00:20:27 -0500 (EST)
Received: from imap48 ([10.202.2.98])
  by compute5.internal (MEProxy); Fri, 04 Feb 2022 00:20:27 -0500
X-ME-Sender: <xms:mrf8YVbTm8_pmK_MvOR8hk6Aju6RFy_Zj2fpvrrrGl4r1R_8RiQFEg>
    <xme:mrf8YcZbdhS0VJHuEqEWUHviIs4UmPJUOJQRbiqSyuzrGO_ewyz1EN-GvBW0g0qen
    e7OFM3xJLVYuv-4f0U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeekgdekvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnugih
    ucfnuhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnheptdfhheettddvtedvtedugfeuuefhtddugedvleevleefvdetleffgfef
    vdekgeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnugihodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduudeiudekheei
    fedvqddvieefudeiiedtkedqlhhuthhopeepkhgvrhhnvghlrdhorhhgsehlihhnuhigrd
    hluhhtohdruhhs
X-ME-Proxy: <xmx:mrf8YX9PwVICYj5qH6i_Q6FA_NJFrHD25Sm76qBdsm30PwiVUV2N0A>
    <xmx:mrf8YTpfspnCSqmjVQRKLp3C1gc9XD4BK3b06eKjb7IB1T8hpAGkiw>
    <xmx:mrf8YQpsPATUCd9qUrXZL34GvGc5O0GY9VC-OihFIJCdFDlVUEVn4A>
    <xmx:m7f8YUDtAIoRWtGvTdv_-mow5CBI5EaFKojcYhLnXiq5zCDqiR8h_R2RVx4>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id EDE8721E006E; Fri,  4 Feb 2022 00:20:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4586-g104bd556f9-fm-20220203.002-g104bd556
Mime-Version: 1.0
Message-Id: <6b04d8cb-844e-42a5-9ea2-db0e8eafaa19@www.fastmail.com>
In-Reply-To: <a7e59ae16e0e05579b087caf4045e42b174e2167.camel@intel.com>
References: <87fsozek0j.ffs@tglx>
 <a7e59ae16e0e05579b087caf4045e42b174e2167.camel@intel.com>
Date:   Thu, 03 Feb 2022 21:20:05 -0800
From:   "Andy Lutomirski" <luto@kernel.org>
To:     "Rick P Edgecombe" <rick.p.edgecombe@intel.com>,
        "Balbir Singh" <bsingharora@gmail.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Eugene Syromiatnikov" <esyr@redhat.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        "Randy Dunlap" <rdunlap@infradead.org>,
        "Kees Cook" <keescook@chromium.org>,
        "Dave Hansen" <dave.hansen@linux.intel.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        "Eranian, Stephane" <eranian@google.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "Florian Weimer" <fweimer@redhat.com>,
        "Nadav Amit" <nadav.amit@gmail.com>,
        "Jann Horn" <jannh@google.com>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "kcc@google.com" <kcc@google.com>,
        "Borislav Petkov" <bp@alien8.de>,
        "Oleg Nesterov" <oleg@redhat.com>, "H.J. Lu" <hjl.tools@gmail.com>,
        "Weijiang Yang" <weijiang.yang@intel.com>,
        "Pavel Machek" <pavel@ucw.cz>, "Arnd Bergmann" <arnd@arndb.de>,
        "Moreira, Joao" <joao.moreira@intel.com>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Mike Kravetz" <mike.kravetz@oracle.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "Dave Martin" <Dave.Martin@arm.com>,
        "john.allen@amd.com" <john.allen@amd.com>,
        "Ingo Molnar" <mingo@redhat.com>,
        "Shankar, Ravi V" <ravi.v.shankar@intel.com>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Linux API" <linux-api@vger.kernel.org>,
        "Cyrill Gorcunov" <gorcunov@gmail.com>
Subject: Re: [PATCH 00/35] Shadow stacks for userspace
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Thu, Feb 3, 2022, at 5:08 PM, Edgecombe, Rick P wrote:
> Hi Thomas,

>> >        Signals
>> >        -------
>> >        Originally signals placed the location of the shadow stack
>> > restore 
>> >        token inside the saved state on the stack. This was
>> > problematic from a 
>> >        past ABI promises perspective.

What was the actual problem?

>> > So the restore location was
>> > instead just 
>> >        assumed from the shadow stack pointer. This works because in
>> > normal 
>> >        allowed cases of calling sigreturn, the shadow stack pointer
>> > should be 
>> >        right at the restore token at that time. There is no
>> > alternate shadow 
>> >        stack support. If an alt shadow stack is added later we
>> > would
>> >        need to
>> 
>> So how is that going to work? altstack is not an esoteric corner
>> case.
>
> My understanding is that the main usages for the signal stack were
> handling stack overflows and corruption. Since the shadow stack only
> contains return addresses rather than large stack allocations, and is
> not generally writable or pivotable, I thought there was a good
> possibility an alt shadow stack would not end up being especially
> useful. Does it seem like reasonable guesswork?

It's also used for things like DOSEMU that execute in a weird context and then trap back out to the outer program using a signal handler and an altstack.  Also, imagine someone writing a SIGSEGV handler specifically intended to handle shadow stack overflow.

The shadow stack can be pivoted using RSTORSSP.
