Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE1767D435
	for <lists+linux-doc@lfdr.de>; Thu, 26 Jan 2023 19:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbjAZSbS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 26 Jan 2023 13:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbjAZSbQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Jan 2023 13:31:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFBD72B6
        for <linux-doc@vger.kernel.org>; Thu, 26 Jan 2023 10:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674757829;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tZQdAeWhpsHHDlnk0ZLGhZkWwYVHE6PEpnsUOblp67M=;
        b=Oy2Ooh6/0KkSegme7i8E+CkQLVMRrOR/eIzFMsZxCSGzRV4dATnOY5ZbrzHUJ0LetV/yL7
        0c/p26ANdDh7Ky1WIJ+ddmpPTwjrIjKtT9W9qY9piD9YGrHKlidt/gwx42NPIGYCMdHXFY
        J0rklMNYBgNMlBqR7zaxlMcZIWKlSPQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-chZp4DlCM_q_QexTTWLAfw-1; Thu, 26 Jan 2023 13:30:26 -0500
X-MC-Unique: chZp4DlCM_q_QexTTWLAfw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7632310115E0;
        Thu, 26 Jan 2023 18:30:25 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (ovpn-194-60.brq.redhat.com [10.40.194.60])
        by smtp.corp.redhat.com (Postfix) with SMTP id C4E722026D76;
        Thu, 26 Jan 2023 18:30:22 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Thu, 26 Jan 2023 19:30:22 +0100 (CET)
Date:   Thu, 26 Jan 2023 19:30:19 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Andrei Vagin <avagin@gmail.com>
Cc:     Gregory Price <gourry.memverge@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>,
        Gregory Price <gregory.price@memverge.com>,
        Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v6 1/2] ptrace,syscall_user_dispatch: Implement Syscall
 User Dispatch Suspension
Message-ID: <20230126183019.GD4069@redhat.com>
References: <20230125025126.787431-1-gregory.price@memverge.com>
 <20230125025126.787431-2-gregory.price@memverge.com>
 <20230126003008.GA31684@redhat.com>
 <CANaxB-xn0wW5xA_CT7bA5=jig+td__EDKPBWSpZdfgMgVOezCg@mail.gmail.com>
 <20230126150725.GB4069@redhat.com>
 <CANaxB-woave9F479O75P9PC+nFO3DVmbeFA1rXf2c=bhRmWoiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANaxB-woave9F479O75P9PC+nFO3DVmbeFA1rXf2c=bhRmWoiQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01/26, Andrei Vagin wrote:
>
> On Thu, Jan 26, 2023 at 7:07 AM Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > IIUC, PTRACE_O_SUSPEND_SYSCALL_USER_DISPATCH is needed to run the injected
> > code, and this also needs to change the state of the traced process. If
> > the tracer (CRIU) dies while the tracee runs this code, I guess the tracee
> > will have other problems?
>
> Our injected code can reheal itself if something goes wrong. The hack
> here is that we inject
> the code with a signal frame and it calls rt_segreturn to resume the process.

What will happen if CRIU dies and clears ->ptrace right before
syscall_user_dispatch() checks PT_SUSPEND_SYSCALL_USER_DISPATCH ?

How the tracee will react to SIGSYS with unexpected .si_syscall ?

> I don't expect that
> the syscall user dispatch
> is used by many applications,

Agreed, so the case when CRIU will need to do the additional
PTRACE_SET_SYSCALL_USER_DISPATCH_CONFIG twice to disable and then re-enable
syscall_user_dispatch is unlikely.

> so I don't strongly insist on
> PTRACE_O_SUSPEND_SYSCALL_USER_DISPATCH.

I too won't argue too much. but so far I do not feel there is enough
justification for this feature ...

Oleg.

