Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44FC42D6B0B
	for <lists+linux-doc@lfdr.de>; Fri, 11 Dec 2020 00:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394155AbgLJWbV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Dec 2020 17:31:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:60080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405115AbgLJWY2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 Dec 2020 17:24:28 -0500
X-Gm-Message-State: AOAM532o1DgyNBuNjxw6NMqEX9/l2ClYivot7BWKX0HFVtXAqRcxESgI
        jl6BM5WFWaV/LK3FAdgvb5z4rUJeTuWSGyF1tv4ljA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607637686;
        bh=4yt8h1Q+CPGGcT2IO75cM/fN5M+tD+08bKTLE18FGBc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TxPIBpbH8QXy+otm71zMxmjrY7REouAV6AjwLUenqLtoG6TWyGNwC/h2Zh0lBJLVh
         kd5DS/hMH+LEwZug8sGnNXD5kLJCuEBjJu0Yhhaxy3ZJxwPnn2ShjYTBcsKB1FT1Ns
         xaBYNh9i3xBnGXpOvVc/8JvDGcoRNamLFi3OYwJBCawIcaZFSd8fQT+sHme7yGyNST
         S6dGNCGSgfdLszOzEAJVt2UxR3DIRlxYlkf/QjSJ/bYAAsuqa3XiJOQeKVW3tcoC5/
         Z3Ohqt36y+knqp7ygVjCM5ceqSYaZz7LLH9U5uvfbHVSN4s0lS9z4up2jHBY5khZiD
         Mh0AgAuUE4bJQ==
X-Google-Smtp-Source: ABdhPJzF2a9E+mCWo9M4tLmMpSz+6JMPjrTXsFPQMg/z71zkpXbGLbBH1iCVRxG8tDVwZozqBfsoJUXetLw8AUPWzi8=
X-Received: by 2002:adf:e98c:: with SMTP id h12mr10402629wrm.75.1607637683968;
 Thu, 10 Dec 2020 14:01:23 -0800 (PST)
MIME-Version: 1.0
References: <9389c1198da174bcc9483d6ebf535405aa8bdb45.camel@redhat.com>
 <E4F263BE-6CAA-4152-8818-187D34D8D0FD@amacapital.net> <87360djqve.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87360djqve.fsf@nanos.tec.linutronix.de>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 10 Dec 2020 14:01:12 -0800
X-Gmail-Original-Message-ID: <CALCETrXXH5GoaSZwSPy-JFxJ6iMMCj0A=yFFPuyutBh+1imCsQ@mail.gmail.com>
Message-ID: <CALCETrXXH5GoaSZwSPy-JFxJ6iMMCj0A=yFFPuyutBh+1imCsQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] KVM: x86: implement KVM_{GET|SET}_TSC_STATE
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Maxim Levitsky <mlevitsk@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        kvm list <kvm@vger.kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
        Jim Mattson <jmattson@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Borislav Petkov <bp@alien8.de>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Jones <drjones@redhat.com>,
        Oliver Upton <oupton@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 10, 2020 at 1:25 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Andy,
>

>
> I'm still convinced that a notification about 'we take a nap' will be
> more robust, less complex and more trivial to backport.

What do you have in mind?  Suppose the host kernel sends the guest an
interrupt on all vCPUs saying "I'm about to take a nap".  What happens
if the guest is busy with IRQs off for a little bit?  Does the host
guarantee the guest a certain about of time to try to get the
interrupt delivered before allowing the host to enter S3?  How about
if the host wants to reboot for a security fix -- how long is a guest
allowed to delay the process?

I'm sure this can all be made to work 99% of time, but I'm a bit
concerned about that last 1%.

--Andy
