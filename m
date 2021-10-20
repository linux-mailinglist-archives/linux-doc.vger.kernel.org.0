Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07523434CBA
	for <lists+linux-doc@lfdr.de>; Wed, 20 Oct 2021 15:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhJTNys (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Oct 2021 09:54:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:50128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230190AbhJTNys (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 20 Oct 2021 09:54:48 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 097B161052;
        Wed, 20 Oct 2021 13:52:34 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mdC19-000RjV-SP; Wed, 20 Oct 2021 14:52:31 +0100
Date:   Wed, 20 Oct 2021 14:52:31 +0100
Message-ID: <874k9bdcrk.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Hikaru Nishida <hikalium@chromium.org>
Cc:     linux-kernel@vger.kernel.org, dme@dme.org, tglx@linutronix.de,
        mlevitsk@redhat.com, linux@roeck-us.net, pbonzini@redhat.com,
        vkuznets@redhat.com, will@kernel.org, suleiman@google.com,
        senozhatsky@google.com, kvmarm@lists.cs.columbia.edu,
        linux-arm-kernel@lists.infradead.org,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        John Stultz <john.stultz@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Juergen Gross <jgross@suse.com>,
        Kees Cook <keescook@chromium.org>,
        Lai Jiangshan <laijs@linux.alibaba.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sean Christopherson <seanjc@google.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, x86@kernel.org
Subject: Re: [RFC PATCH v3 0/5] x86/kvm: Virtual suspend time injection support
In-Reply-To: <20211020120431.776494-1-hikalium@chromium.org>
References: <20211020120431.776494-1-hikalium@chromium.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: hikalium@chromium.org, linux-kernel@vger.kernel.org, dme@dme.org, tglx@linutronix.de, mlevitsk@redhat.com, linux@roeck-us.net, pbonzini@redhat.com, vkuznets@redhat.com, will@kernel.org, suleiman@google.com, senozhatsky@google.com, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org, luto@kernel.org, arnd@arndb.de, bp@alien8.de, dave.hansen@linux.intel.com, geert@linux-m68k.org, hpa@zytor.com, mingo@kernel.org, mingo@redhat.com, jmattson@google.com, joro@8bytes.org, john.stultz@linaro.org, corbet@lwn.net, jgross@suse.com, keescook@chromium.org, laijs@linux.alibaba.com, linus.walleij@linaro.org, peterz@infradead.org, seanjc@google.com, sboyd@kernel.org, wanpengli@tencent.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, x86@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Hikaru,

On Wed, 20 Oct 2021 13:04:25 +0100,
Hikaru Nishida <hikalium@chromium.org> wrote:
> 
> 
> Hi,
> 
> This patch series adds virtual suspend time injection support to KVM.
> It is an updated version of the following series:
> v2:
> https://lore.kernel.org/kvm/20210806100710.2425336-1-hikalium@chromium.org/
> v1:
> https://lore.kernel.org/kvm/20210426090644.2218834-1-hikalium@chromium.org/
> 
> Please take a look again.
> 
> To kvm/arm64 folks:
> I'm going to implement this mechanism to ARM64 as well but not
> sure which function should be used to make an IRQ (like kvm_apic_set_irq
> in x86) and if it is okay to use kvm_gfn_to_hva_cache /
> kvm_write_guest_cached for sharing the suspend duration.

Before we discuss interrupt injection, I want to understand what this
is doing, and how this is doing it. And more precisely, I want to find
out how you solve the various problems described by Thomas here [1].

Assuming you solve these, you should model the guest memory access
similarly to what we do for stolen time. As for injecting an
interrupt, why can't this be a userspace thing?

Thanks,

	M.

[1] https://lore.kernel.org/all/871r557jls.ffs@tglx


-- 
Without deviation from the norm, progress is not possible.
