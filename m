Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB13A6AE18D
	for <lists+linux-doc@lfdr.de>; Tue,  7 Mar 2023 15:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjCGOBs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 7 Mar 2023 09:01:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjCGOBo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Mar 2023 09:01:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9822554CAD
        for <linux-doc@vger.kernel.org>; Tue,  7 Mar 2023 06:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678197658;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5ju9gg/y4szyt14f2LWbHQQkg2yj4KFsHllcMP2Gs2E=;
        b=YBUdVKYMLGyrfAKFj7CB4n4Rq98n1GNpaeYA7JveFPLaiNp4BUioTvQpdGi1Y9qv4CSofW
        EswgNAe8m9apbAXVsisXdcEH4isDSlUhdamxRH0lA+zrjxyqgisFhlojJd+CO9vyJ6s4L6
        r56d1GFODRvJfLDLn3k/kzZuXs6hU7I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-IhkD_1szN0qSCW-h4ox-0w-1; Tue, 07 Mar 2023 09:00:52 -0500
X-MC-Unique: IhkD_1szN0qSCW-h4ox-0w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88A7929DD9A8;
        Tue,  7 Mar 2023 14:00:12 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.80])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5562D492C18;
        Tue,  7 Mar 2023 14:00:04 +0000 (UTC)
From:   Florian Weimer <fweimer@redhat.com>
To:     szabolcs.nagy@arm.com
Cc:     "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
        "david@redhat.com" <david@redhat.com>,
        "bsingharora@gmail.com" <bsingharora@gmail.com>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "Syromiatnikov, Eugene" <esyr@redhat.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "Yu, Yu-cheng" <yu-cheng.yu@intel.com>,
        "Eranian, Stephane" <eranian@google.com>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "nadav.amit@gmail.com" <nadav.amit@gmail.com>,
        "jannh@google.com" <jannh@google.com>,
        "dethoma@microsoft.com" <dethoma@microsoft.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "kcc@google.com" <kcc@google.com>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "bp@alien8.de" <bp@alien8.de>, "oleg@redhat.com" <oleg@redhat.com>,
        "hjl.tools@gmail.com" <hjl.tools@gmail.com>,
        "Yang, Weijiang" <weijiang.yang@intel.com>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "Schimpe, Christina" <christina.schimpe@intel.com>,
        "debug@rivosinc.com" <debug@rivosinc.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "john.allen@amd.com" <john.allen@amd.com>,
        "rppt@kernel.org" <rppt@kernel.org>, "nd@arm.com" <nd@arm.com>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
        "gorcunov@gmail.com" <gorcunov@gmail.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH v7 01/41] Documentation/x86: Add CET shadow stack
 description
References: <Y/9fdYQ8Cd0GI+8C@arm.com>
        <636de4a28a42a082f182e940fbd8e63ea23895cc.camel@intel.com>
        <df8ef3a9e5139655a223589c16a68393ab3f6d1d.camel@intel.com>
        <ZADQISkczejfgdoS@arm.com>
        <9714f724b53b04fdf69302c6850885f5dfbf3af5.camel@intel.com>
        <ZAYS6CHuZ0MiFvmE@arm.com> <87wn3tsuxf.fsf@oldenburg.str.redhat.com>
        <a205aed2171a0a463e3bb7179e8dd63bd4012e7e.camel@intel.com>
        <ZAc2LQEfvRLCknQQ@arm.com>
Date:   Tue, 07 Mar 2023 15:00:02 +0100
In-Reply-To: <ZAc2LQEfvRLCknQQ@arm.com> (szabolcs's message of "Tue, 7 Mar
        2023 13:03:41 +0000")
Message-ID: <87ilfcoe59.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

* szabolcs:

> changing/disabling the alt stack is not valid while a handler is
> executing on it. if we don't allow jumping out and back to an
> alt stack (swapcontext) then there can be only one alt stack
> live per thread and change/disable can do the shadow stack free.
>
> if jump back is allowed (linux even makes it race-free with
> SS_AUTODISARM) then the life-time of alt stack is extended
> beyond change/disable (jump back to an unregistered alt stack).
>
> to support jump back to an alt stack the requirements are
>
> 1) user has to manage an alt shadow stack together with the alt
>    stack (requies user code change, not just libc).
>
> 2) kernel has to push a restore token on the thread shadow stack
>    on signal entry (at least in case of alt shadow stack, and
>    deal with corner cases around shadow stack overflow).

We need to have a story for stackful coroutine switching as well, not
just for sigaltstack.  I hope that we can use OpenJDK (Project Loom) and
QEMU as guinea pigs.  If we have something that works for both,
hopefully that covers a broad range of scenarios.  Userspace
coordination can eventually be handled by glibc; we can deallocate
alternate stacks on thread exit fairly easily (at least compared to the
current stack 8-).

Thanks,
Florian

