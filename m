Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB78768132
	for <lists+linux-doc@lfdr.de>; Sat, 29 Jul 2023 21:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjG2TJK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 29 Jul 2023 15:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjG2TJJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 29 Jul 2023 15:09:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80C2210C0;
        Sat, 29 Jul 2023 12:09:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 05B8A60288;
        Sat, 29 Jul 2023 19:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1ADC433C7;
        Sat, 29 Jul 2023 19:09:03 +0000 (UTC)
Date:   Sat, 29 Jul 2023 15:09:01 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Josh Poimboeuf <jpoimboe@kernel.org>
Cc:     Valentin Schneider <vschneid@redhat.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
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
        Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>,
        Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Yair Podemsky <ypodemsk@redhat.com>
Subject: Re: [RFC PATCH v2 02/20] tracing/filters: Enable filtering a
 cpumask field by another cpumask
Message-ID: <20230729150901.25b9ae0c@rorschach.local.home>
In-Reply-To: <20230726194148.4jhyqqbtn3qqqqsq@treble>
References: <20230720163056.2564824-1-vschneid@redhat.com>
        <20230720163056.2564824-3-vschneid@redhat.com>
        <20230726194148.4jhyqqbtn3qqqqsq@treble>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 26 Jul 2023 12:41:48 -0700
Josh Poimboeuf <jpoimboe@kernel.org> wrote:

> On Thu, Jul 20, 2023 at 05:30:38PM +0100, Valentin Schneider wrote:
> >  int filter_assign_type(const char *type)
> >  {
> > -	if (strstr(type, "__data_loc") && strstr(type, "char"))
> > -		return FILTER_DYN_STRING;
> > +	if (strstr(type, "__data_loc")) {
> > +		if (strstr(type, "char"))
> > +			return FILTER_DYN_STRING;
> > +		if (strstr(type, "cpumask_t"))
> > +			return FILTER_CPUMASK;
> > +		}  
> 
> The closing bracket has the wrong indentation.
> 
> > +		/* Copy the cpulist between { and } */
> > +		tmp = kmalloc((i - maskstart) + 1, GFP_KERNEL);
> > +		strscpy(tmp, str + maskstart, (i - maskstart) + 1);  
> 
> Need to check kmalloc() failure?  And also free tmp?

I came to state the same thing.

Also, when you do an empty for loop:

	for (; str[i] && str[i] != '}'; i++);

Always put the semicolon on the next line, otherwise it is really easy
to think that the next line is part of the for loop. That is, instead
of the above, do:

	for (; str[i] && str[i] != '}'; i++)
		;


-- Steve


> 
> > +
> > +		pred->mask = kzalloc(cpumask_size(), GFP_KERNEL);
> > +		if (!pred->mask)
> > +			goto err_mem;
> > +
> > +		/* Now parse it */
> > +		if (cpulist_parse(tmp, pred->mask)) {
> > +			parse_error(pe, FILT_ERR_INVALID_CPULIST, pos + i);
> > +			goto err_free;
> > +		}
> > +
> > +		/* Move along */
> > +		i++;
> > +		if (field->filter_type == FILTER_CPUMASK)
> > +			pred->fn_num = FILTER_PRED_FN_CPUMASK;
> > +  
> 

