Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 305B17694AB
	for <lists+linux-doc@lfdr.de>; Mon, 31 Jul 2023 13:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbjGaLVp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 31 Jul 2023 07:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232387AbjGaLVZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Jul 2023 07:21:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AAC51733
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 04:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690802426;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5vaUW0ZFNoavCkOsFWH4xJQw7j0BCOKV0sVk8cbQiFE=;
        b=Aix8KJ0XtXMNDGC7Px72w3at5hNZMKZsnaOI9NfnhJLKeZWnLtlbXclePR//6n8r++9lqs
        6LvtOxJ/DpR5UXckAxkKcX9shXm9e5kZa1J1nNKwfLM4FPuHbAY94I0RIbgnarJ0D65cCM
        Y/dI7anFnbPbFfktk1oWVptNJ5cYlX0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-uarrI7yaOP29wJf0HhjgHQ-1; Mon, 31 Jul 2023 07:20:24 -0400
X-MC-Unique: uarrI7yaOP29wJf0HhjgHQ-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-76aec4bfac3so619335885a.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 04:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690802424; x=1691407224;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vaUW0ZFNoavCkOsFWH4xJQw7j0BCOKV0sVk8cbQiFE=;
        b=VPWKo7VOPWVp7szDmCBJLEcu4JE6astyInRfkxnQFBgP3MQF6LzjfNl74ZJgVkO9xN
         6KoSnz5I+RtVtwDifdgsfr66vORWVqTIbPJ3UqWT0tdVTUU23C6aApqwLO7h1eqnrVLW
         zm17CguZgDMOPMxyDlfg+f1d1kCmgdUQ6hohbP6hd29PVbmMUlmpbUppHmknolqTumDF
         4mP9MYSN43bwI3ok1NZfh/hDEz8JrXGKgcjl6rEO23+1hwBfRDIN+tmLktLQMH+5x+5M
         qoen+6c5ICrKvPHMomZDBDgo5S+8PcXD4rjkfIpzAOOdKAnwmwN+NnolNkAQsOK2JN9m
         prJQ==
X-Gm-Message-State: ABy/qLajad1pR9DH+A8SdSWCFfuFIO8QiHqvOin1ZyNGt1Wm3evaphLG
        3vM+XE59GBLEgXdJqHA4LCtNHjIhsfZ2IEmzHS66NwSPW9Vtz3XRBjaoAWJX7OOGZIqYB5jH/xM
        jb4VuQ8Nj7BtxkKsyae9t
X-Received: by 2002:a05:620a:3199:b0:765:a678:977c with SMTP id bi25-20020a05620a319900b00765a678977cmr11440922qkb.67.1690802424242;
        Mon, 31 Jul 2023 04:20:24 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF4PsqV0GfIB6WcE+e1KZA+Ob00KHOmMkV0SPV2mk8Z9iXGAjuozcLuEeBrBpyr3ypNADcfxg==
X-Received: by 2002:a05:620a:3199:b0:765:a678:977c with SMTP id bi25-20020a05620a319900b00765a678977cmr11440851qkb.67.1690802423943;
        Mon, 31 Jul 2023 04:20:23 -0700 (PDT)
Received: from vschneid.remote.csb ([149.12.7.81])
        by smtp.gmail.com with ESMTPSA id c23-20020a05620a11b700b00767303dc070sm3206663qkk.8.2023.07.31.04.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 04:20:23 -0700 (PDT)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
        bpf@vger.kernel.org, x86@kernel.org, rcu@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
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
        Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Yair Podemsky <ypodemsk@redhat.com>
Subject: Re: [RFC PATCH v2 05/20] tracing/filters: Optimise cpumask vs
 cpumask filtering when user mask is a single CPU
In-Reply-To: <20230729153436.1e07bfa6@rorschach.local.home>
References: <20230720163056.2564824-1-vschneid@redhat.com>
 <20230720163056.2564824-6-vschneid@redhat.com>
 <20230729153436.1e07bfa6@rorschach.local.home>
Date:   Mon, 31 Jul 2023 12:20:13 +0100
Message-ID: <xhsmh3514s4ya.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/07/23 15:34, Steven Rostedt wrote:
> On Thu, 20 Jul 2023 17:30:41 +0100
> Valentin Schneider <vschneid@redhat.com> wrote:
>
>>              /* Move along */
>>              i++;
>> +
>> +		/*
>> +		 * Optimisation: if the user-provided mask has a weight of one
>> +		 * then we can treat it as a scalar input.
>> +		 */
>> +		single = cpumask_weight(pred->mask) == 1;
>> +		if (single && field->filter_type == FILTER_CPUMASK) {
>> +			pred->val = cpumask_first(pred->mask);
>> +			kfree(pred->mask);
>
> Don't we need:
>                       pred->mask = NULL;
>
> here, or the free_predicate() will cause a double free?
>

We do, thanks for spotting this.

> -- Steve
>
>> +		}
>> +

