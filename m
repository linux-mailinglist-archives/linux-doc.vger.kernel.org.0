Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D845157CA44
	for <lists+linux-doc@lfdr.de>; Thu, 21 Jul 2022 14:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233326AbiGUMIx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 21 Jul 2022 08:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbiGUMIw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jul 2022 08:08:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDC6B85F95;
        Thu, 21 Jul 2022 05:08:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 76A0A61CFF;
        Thu, 21 Jul 2022 12:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D1FC3411E;
        Thu, 21 Jul 2022 12:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658405330;
        bh=LXie3sbnk8wgU9gzwq8ntIR3HYeqzQkMMgEXBK+44jE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=fipYXFe5tkugtJrcKyXxa51hr12B18OxkCCuzLPicXgcFU20MBvpER5VMZsrll6nS
         bE8UKSXOLSkCbjARk7NzKSVcLyWkyrSseoI3t3bkI7JqVziq+qyjIP/juaJRuub3Tf
         VMhNkMUHeBXvBNGGC/rJuA6xQak+5eHNrJD1qP9++LypHnACsuCIefculn2UafC/KO
         l1RJjkiz/gBrNBlZgiDcHnVTuEMiXElL4mZ/G3kDz93QU66JsHxnnRm3+SiKyn8nhQ
         5RdyVlwiIpJgzpsuEMRKuQSyfQ9UfunsyPlob3N8oDajqgSMPV/oqtNrMsEb+PaKHJ
         PkFglKMtlfOUg==
Message-ID: <3c0a4cb5-f88f-ec5f-e614-d1e8ceb036c2@kernel.org>
Date:   Thu, 21 Jul 2022 14:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V6 04/16] rv/include: Add deterministic automata monitor
 definition via C macros
Content-Language: en-US
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Gabriele Paoloni <gpaoloni@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>,
        Tao Zhou <tao.zhou@linux.dev>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-trace-devel@vger.kernel.org
References: <cover.1658244826.git.bristot@kernel.org>
 <9ffc05b67fff087413143a420373731e0e34eef4.1658244826.git.bristot@kernel.org>
 <20220720160606.3e672b55@gandalf.local.home>
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
In-Reply-To: <20220720160606.3e672b55@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/20/22 22:06, Steven Rostedt wrote:
>> +/*												\
>> + * da_monitor_enabled_##name - checks if the monitor is enabled					\
>> + */												\
>> +static inline bool da_monitor_enabled_##name(void)						\
>> +{												\
> Should we add a:
> 
> 	smp_rmb();
> 
> here? And then a smp_wmb() where these switches get updated?
>

Makes sense.

Should I also add the READ_ONCE/WRITE_ONCE? like

smp_rmb()
READ_ONCE(var)

WRITE_ONCE(var, value)
smp_wmb()

for all these on/off knobs, or just the barriers?

> I guess how critical is it that these turn off immediately after the switch
> is flipped?

It is not critical to continue the execution of those that have already crossed by
the variable. Still, waiting for the tracepoints to finish their execution before
returning to the user-space task that disabled the variable might be a good thing.

IIRC, we can do that via RCU... like, synchronize_rcu()?

>> +	/* global switch */									\
>> +	if (unlikely(!rv_monitoring_on()))							\
>> +		return 0;									\
>> +												\
>> +	/* monitor enabled */									\
>> +	if (unlikely(!rv_##name.enabled))							\
>> +		return 0;									\
>> +												\
>> +	return 1;										\
>> +}												\
>> +												\

