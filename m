Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFBF7BE6B4
	for <lists+linux-doc@lfdr.de>; Mon,  9 Oct 2023 18:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377229AbjJIQlW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 Oct 2023 12:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376275AbjJIQlV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Oct 2023 12:41:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA02B0
        for <linux-doc@vger.kernel.org>; Mon,  9 Oct 2023 09:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696869641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+YpXHXo6RBy8CnTiTObZdU28mMjUq9Z4XmoNn8CdwOg=;
        b=LLo4D7hwm/+U6MJgO7V9MHv388IkIHapHhOi3kWgTpDxX3a+VvtQIBiBH0epTTP9lEjPCr
        wypmBcuNErTokw7IuAe8O0VRHVrqUUO55mhrAWZ32LoUxtLCquOu+RMAODIi6Xyd49TTBz
        vkQaoVay1N/4O3ZICu93/9jz2MiRSqs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-TL37Mn3kP9qtJIg0N-ihuw-1; Mon, 09 Oct 2023 12:40:39 -0400
X-MC-Unique: TL37Mn3kP9qtJIg0N-ihuw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-406de77fb85so26602125e9.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Oct 2023 09:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696869638; x=1697474438;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+YpXHXo6RBy8CnTiTObZdU28mMjUq9Z4XmoNn8CdwOg=;
        b=QQ8SrCglJ1RvVm814MTIeeE3H3tsCTBgv4fDefreDFBV/8snntwYYSDAciou2ZibuE
         I/2rfZfq/Yy6D9VTE068cH3TD+vjxwdEzjx+Iqu3s99qbwlCG+RQZSKnoX17L9YEhHTA
         BSb45kUrhirFwkEW3WSBaFRSdY1GBc/OUVMp1YslOwH1n42u4xZ+FDGOlX7CvrCxvMXJ
         DSBW9QCV6PA8vfcM28n8mML2Q6Gu7V6drLnwoRjH3l+C4Y7BNN5sq7VWZTF4809AiJc7
         dVfc/ku/R1a+xKVqFqBTK1PjwUKEmWLNvPDLAO9N9YNUj0yB0Kl/g31srmGeHSxzq8//
         HI7g==
X-Gm-Message-State: AOJu0Yxcvh3nq/jpaWC2WLK5f8vrn6Z3eqMgLujAkIIOTdqTwVlowfpd
        JmvCpKvtghRDpm3GR5GJ0imaqST6mdrGUGhhWTZEXPiBKvqOUNyMORRXDPbHGSFLIDAmxtNG9GH
        4qWyEM1evtcjqFKWb5RXM
X-Received: by 2002:a05:600c:2949:b0:405:82c0:d9d9 with SMTP id n9-20020a05600c294900b0040582c0d9d9mr14896187wmd.41.1696869638573;
        Mon, 09 Oct 2023 09:40:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMgAs2OFs3TPKIXUcqwEYEgUj8NhgbOlPIyIMA79idAa9Hjf42+dP6kuPpgcF+X3v1F7p9tg==
X-Received: by 2002:a05:600c:2949:b0:405:82c0:d9d9 with SMTP id n9-20020a05600c294900b0040582c0d9d9mr14896162wmd.41.1696869638060;
        Mon, 09 Oct 2023 09:40:38 -0700 (PDT)
Received: from starship ([89.237.100.246])
        by smtp.gmail.com with ESMTPSA id bd5-20020a05600c1f0500b004030e8ff964sm14033430wmb.34.2023.10.09.09.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:40:37 -0700 (PDT)
Message-ID: <907b351fee183609891a4d0cfb0a79bad85577a0.camel@redhat.com>
Subject: Re: [RFC PATCH v2 14/20] x86/kvm: Make kvm_async_pf_enabled
 __ro_after_init
From:   Maxim Levitsky <mlevitsk@redhat.com>
To:     Valentin Schneider <vschneid@redhat.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
        bpf@vger.kernel.org, x86@kernel.org, rcu@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Neeraj Upadhyay <quic_neeraju@quicinc.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Zqiang <qiang.zhang1211@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Uladzislau Rezki <urezki@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        Lorenzo Stoakes <lstoakes@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Jason Baron <jbaron@akamai.com>,
        Kees Cook <keescook@chromium.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Juerg Haefliger <juerg.haefliger@canonical.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Nadav Amit <namit@vmware.com>,
        Dan Carpenter <error27@gmail.com>,
        Chuang Wang <nashuiliang@gmail.com>,
        Yang Jihong <yangjihong1@huawei.com>,
        Petr Mladek <pmladek@suse.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>, Song Liu <song@kernel.org>,
        Julian Pidancet <julian.pidancet@oracle.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Dionna Glaze <dionnaglaze@google.com>,
        Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Yair Podemsky <ypodemsk@redhat.com>
Date:   Mon, 09 Oct 2023 19:40:31 +0300
In-Reply-To: <20230720163056.2564824-15-vschneid@redhat.com>
References: <20230720163056.2564824-1-vschneid@redhat.com>
         <20230720163056.2564824-15-vschneid@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

У чт, 2023-07-20 у 17:30 +0100, Valentin Schneider пише:
> objtool now warns about it:
> 
>   vmlinux.o: warning: objtool: exc_page_fault+0x2a: Non __ro_after_init static key "kvm_async_pf_enabled" in .noinstr section
> 
> The key can only be enabled (and not disabled) in the __init function
> kvm_guest_init(), so mark it as __ro_after_init.
> 
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> ---
>  arch/x86/kernel/kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
> index 1cceac5984daa..319460090a836 100644
> --- a/arch/x86/kernel/kvm.c
> +++ b/arch/x86/kernel/kvm.c
> @@ -44,7 +44,7 @@
>  #include <asm/svm.h>
>  #include <asm/e820/api.h>
>  
> -DEFINE_STATIC_KEY_FALSE(kvm_async_pf_enabled);
> +DEFINE_STATIC_KEY_FALSE_RO(kvm_async_pf_enabled);
>  
>  static int kvmapf = 1;
>  
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky

