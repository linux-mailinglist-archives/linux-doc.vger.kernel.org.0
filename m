Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D46F76503E
	for <lists+linux-doc@lfdr.de>; Thu, 27 Jul 2023 11:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbjG0Jsf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jul 2023 05:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232810AbjG0Jr2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 05:47:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA40BA
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 02:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690451200;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9/ZtPwamYEdAIqsg4Eha/G0ZWoXDeFDSv2EcRY5ZelM=;
        b=WBxm/GICrULU9Q4b5gRPGiWaJjiSO1esm0u94/+8NL7GaArA5pJSOWpL8V3521BemGZode
        liAjk7xCACW6h+HbwIIQcDRuR7LYXaaK5pow8N0tixopgJBJvyyJToUHeukCNT5x3LZBpc
        er8qwCcesThVPTzarY9yCwSUHEy3HVI=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-mK1iEhd2Ok6xR2R10At_iA-1; Thu, 27 Jul 2023 05:46:38 -0400
X-MC-Unique: mK1iEhd2Ok6xR2R10At_iA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4fb76659d54so677618e87.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 02:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690451197; x=1691055997;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/ZtPwamYEdAIqsg4Eha/G0ZWoXDeFDSv2EcRY5ZelM=;
        b=CJO/YknlWymSCfqGH1aW8X/E2JbXYegRlLkwqi7Alwln6UsXFQ2IHDX0k+lxnyCtOY
         T3pbIPGJYydODIpUiYbj8aCSg4Lb4uzkCwkKufLGbZwWM3MuTmbz+P1UVizD+pu6kjS9
         ton9F5WWo9lkYTSvOrwuaOwrLH5DFxrt1RPbeWFRiFa8bMoQCFZjjZCK2xWBzZRB4x1C
         3iWTKjiqrst0k/HZ7BX6h5PKRuyzO/KoxrH2p/SSNG2ALiuUS3jh1hbEtau7DeD39f5R
         QvMc2mTyZOdAhZkc19YF+OLWuriZcX61L3YvZcZ8MJmPDPtGnQgDUxASKg4kT+BjHh8f
         CZnQ==
X-Gm-Message-State: ABy/qLb4CyYe0qtEIZOAADRoxlG18EJXYXIGrIjdD80CCMLf3Xlv/AZg
        wMb60fICJcJKD1rxnpw2mF63o/sc3d/bSuN5M35ZRDO1LGIIaTbVDC/N0PXd4Iph+yhvJjRrN21
        wX1BkA9zF8KTD2jfqqYgp
X-Received: by 2002:a05:6512:3186:b0:4f8:7513:8cb0 with SMTP id i6-20020a056512318600b004f875138cb0mr1763658lfe.2.1690451196851;
        Thu, 27 Jul 2023 02:46:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHWfc8e6nRRU05KgrIaBfOnm87x2dNku7t4qZB3XfKVqk/Go7XcWjycqa01reYQ5M3BH+RFoA==
X-Received: by 2002:a05:6512:3186:b0:4f8:7513:8cb0 with SMTP id i6-20020a056512318600b004f875138cb0mr1763631lfe.2.1690451196504;
        Thu, 27 Jul 2023 02:46:36 -0700 (PDT)
Received: from vschneid.remote.csb ([149.12.7.81])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600c1d0a00b003fd2d3462fcsm6308442wms.1.2023.07.27.02.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 02:46:36 -0700 (PDT)
From:   Valentin Schneider <vschneid@redhat.com>
To:     Josh Poimboeuf <jpoimboe@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
        bpf@vger.kernel.org, x86@kernel.org, rcu@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
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
Subject: Re: [RFC PATCH v2 02/20] tracing/filters: Enable filtering a
 cpumask field by another cpumask
In-Reply-To: <20230726194148.4jhyqqbtn3qqqqsq@treble>
References: <20230720163056.2564824-1-vschneid@redhat.com>
 <20230720163056.2564824-3-vschneid@redhat.com>
 <20230726194148.4jhyqqbtn3qqqqsq@treble>
Date:   Thu, 27 Jul 2023 10:46:33 +0100
Message-ID: <xhsmho7jxsn46.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 26/07/23 12:41, Josh Poimboeuf wrote:
> On Thu, Jul 20, 2023 at 05:30:38PM +0100, Valentin Schneider wrote:
>>  int filter_assign_type(const char *type)
>>  {
>> -	if (strstr(type, "__data_loc") && strstr(type, "char"))
>> -		return FILTER_DYN_STRING;
>> +	if (strstr(type, "__data_loc")) {
>> +		if (strstr(type, "char"))
>> +			return FILTER_DYN_STRING;
>> +		if (strstr(type, "cpumask_t"))
>> +			return FILTER_CPUMASK;
>> +		}
>
> The closing bracket has the wrong indentation.
>
>> +		/* Copy the cpulist between { and } */
>> +		tmp = kmalloc((i - maskstart) + 1, GFP_KERNEL);
>> +		strscpy(tmp, str + maskstart, (i - maskstart) + 1);
>
> Need to check kmalloc() failure?  And also free tmp?
>

Heh, indeed, shoddy that :-)

Thanks!

>> +
>> +		pred->mask = kzalloc(cpumask_size(), GFP_KERNEL);
>> +		if (!pred->mask)
>> +			goto err_mem;
>> +
>> +		/* Now parse it */
>> +		if (cpulist_parse(tmp, pred->mask)) {
>> +			parse_error(pe, FILT_ERR_INVALID_CPULIST, pos + i);
>> +			goto err_free;
>> +		}
>> +
>> +		/* Move along */
>> +		i++;
>> +		if (field->filter_type == FILTER_CPUMASK)
>> +			pred->fn_num = FILTER_PRED_FN_CPUMASK;
>> +
>
> --
> Josh

