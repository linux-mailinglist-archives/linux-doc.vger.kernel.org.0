Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59A3B769496
	for <lists+linux-doc@lfdr.de>; Mon, 31 Jul 2023 13:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjGaLUP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 31 Jul 2023 07:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbjGaLUO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Jul 2023 07:20:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8CBBF
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 04:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690802367;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=liRJKw+opNrXfUwr+Bq4QbRM7UJXeuw3tZj+4BJUEBU=;
        b=efIRPk6zGHsgO2Of6QmTZ+GzCCix/6mBmYiS6VlYpLUXKH3RqZNb+d48UaPz6lTWGDTKVz
        86K6BRkX3+2nC+GQ6nbV839mjkHWbh43t18kF8FsKdYhriVHTD0gUF2kMOoQdsnSIofjIq
        fkIH+o6nhvDB1E5jxoe6N0xO+7KUM9Y=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-i8x4BguMOECgsrThBAjSqw-1; Mon, 31 Jul 2023 07:19:26 -0400
X-MC-Unique: i8x4BguMOECgsrThBAjSqw-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-76c7e6b9e16so205629585a.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Jul 2023 04:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690802346; x=1691407146;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=liRJKw+opNrXfUwr+Bq4QbRM7UJXeuw3tZj+4BJUEBU=;
        b=LCpQXECvAy/exTV6VlckPqdaONuWv5odeg7gm/XAeXXswwWxq6/WXgMGNI7Ad9vkn/
         2qwCDxjyLpxjbBMjqmfgxR1zzifrpqEAO2zrsTytr1UERjgKgpUjUWBTm0irwc7GJRs4
         Glh/DhoOgSGLmG4UNAIbN1jrprA+K37j32UMQpnBDtVzu23nJf6ZU6+HA6GmiUOWvr1Y
         t9nVwLielaWlTdfk9+rNeC5+Td5vaok+mgZUNldF6g9u8fIs2jAM/TeVgrgmoUoVRG1m
         pp3JQzVxoaHwtEc/HZ/a7pEzpZkL30vkqPnQcQvtjZBm+XzPG8IW8lVFblzlwr1mtMk4
         Dqww==
X-Gm-Message-State: ABy/qLbm4SOh71O8PP93oiGNRGo9Gto5xpgxtvLgBUv4B8bPJ4fMNMYm
        x5YGEckgtqUSrfudEeIYHPYjSMSJ6VjNk17jK6oYXTRteHkkLLqNPL8cxzD+Bj+LqQWmtaRvAi3
        83yXk2vZ4DaWbbb7mPf2T
X-Received: by 2002:a05:620a:4083:b0:766:68cd:d9dc with SMTP id f3-20020a05620a408300b0076668cdd9dcmr8634431qko.19.1690802346551;
        Mon, 31 Jul 2023 04:19:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHxRoj22fts1ZRiVdo7BaEAZi0l1tMUruIOv4Nb34gy9lu7KljXIlDPd8x8zhbGrKa5lC+fNA==
X-Received: by 2002:a05:620a:4083:b0:766:68cd:d9dc with SMTP id f3-20020a05620a408300b0076668cdd9dcmr8634382qko.19.1690802346102;
        Mon, 31 Jul 2023 04:19:06 -0700 (PDT)
Received: from vschneid.remote.csb ([149.12.7.81])
        by smtp.gmail.com with ESMTPSA id f7-20020a05620a15a700b007682634ac20sm3177128qkk.115.2023.07.31.04.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 04:19:05 -0700 (PDT)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Josh Poimboeuf <jpoimboe@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
        bpf@vger.kernel.org, x86@kernel.org, rcu@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
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
Subject: Re: [RFC PATCH v2 12/20] objtool: Warn about non __ro_after_init
 static key usage in .noinstr
In-Reply-To: <20230728153557.frzmaayyy3auibx3@treble>
References: <20230720163056.2564824-1-vschneid@redhat.com>
 <20230720163056.2564824-13-vschneid@redhat.com>
 <20230728153557.frzmaayyy3auibx3@treble>
Date:   Mon, 31 Jul 2023 12:18:40 +0100
Message-ID: <xhsmh5y60s50v.mognet@vschneid.remote.csb>
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

On 28/07/23 10:35, Josh Poimboeuf wrote:
> On Thu, Jul 20, 2023 at 05:30:48PM +0100, Valentin Schneider wrote:
>> +static int validate_static_key(struct instruction *insn, struct insn_state *state)
>> +{
>> +	if (state->noinstr && state->instr <= 0) {
>> +		if ((strcmp(insn->key_sym->sec->name, ".data..ro_after_init"))) {
>> +			WARN_INSN(insn,
>> +				  "Non __ro_after_init static key \"%s\" in .noinstr section",
>
> For consistency with other warnings, this should start with a lowercase
> "n" and the string literal should be on the same line as the WARN_INSN,
> like
>
>                       WARN_INSN(insn, "non __ro_after_init static key \"%s\" in .noinstr section",
>                                 ...
>
>> diff --git a/tools/objtool/special.c b/tools/objtool/special.c
>> index 91b1950f5bd8a..1f76cfd815bf3 100644
>> --- a/tools/objtool/special.c
>> +++ b/tools/objtool/special.c
>> @@ -127,6 +127,9 @@ static int get_alt_entry(struct elf *elf, const struct special_entry *entry,
>>                      return -1;
>>              }
>>              alt->key_addend = reloc_addend(key_reloc);
>> +
>> +		reloc_to_sec_off(key_reloc, &sec, &offset);
>> +		alt->key_sym = find_symbol_by_offset(sec, offset & ~2);
>
> Bits 0 and 1 can both store data, should be ~3?
>

Quite so, that needs to be the same as jump_entry_key().

> --
> Josh

