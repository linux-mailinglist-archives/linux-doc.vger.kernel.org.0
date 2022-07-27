Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0B65827E1
	for <lists+linux-doc@lfdr.de>; Wed, 27 Jul 2022 15:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbiG0NmY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 27 Jul 2022 09:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbiG0NmX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Jul 2022 09:42:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68642CE27;
        Wed, 27 Jul 2022 06:42:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6526E6176A;
        Wed, 27 Jul 2022 13:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D8CC433D6;
        Wed, 27 Jul 2022 13:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658929341;
        bh=BR6lIHvQshH5awQxKKtysghwmE9IJ6ziXFKne10F1nc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=cVRK/DFsk6dcXr5N/ybmT3hdsYYM4ETKpBjLl1B/sAYwhIUEGRKuY4CRC3floG565
         nyQA05qKYk2N7wRuAl+2zyqepUQCmU7lWvDLNYhZ0lOoh2xuqkvlezLvF9KssEe2M0
         n4ypLKGSJ7cyUOOq6c6QsVNYclwVoHiQx+oLQFNNh+KPzuM+n9PNT1l3YPYXEcl3jP
         3SIPm5oJwEx2juJthSbwDWQZMSifprUduxcdmPC1kbYNYVfmlFcMVdLVXtk+OT0X0p
         vr6M2UTgWqivwfd4nB3oTw3mK28aPND2qSx/E8YATZEDz2O1CZR2yemMnB1LJ6rgRy
         Y6z79XUyhng5A==
Message-ID: <1dad74ee-2d82-c8b1-7367-cbc6ea124785@kernel.org>
Date:   Wed, 27 Jul 2022 15:42:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 01/16] rv: Add Runtime Verification (RV) interface
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
References: <cover.1658778484.git.bristot@kernel.org>
 <2aa3b18239f170ba23263f18d166d08634ed65dd.1658778484.git.bristot@kernel.org>
 <20220726122237.44386359@gandalf.local.home>
 <1e03adf9-2aea-63ab-93ae-a73836a7081a@kernel.org>
 <20220726165903.262a0a65@gandalf.local.home>
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
In-Reply-To: <20220726165903.262a0a65@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/26/22 22:59, Steven Rostedt wrote:
>>>> +static void turn_monitoring_on(void)
>>>> +{
>>>> +	reset_all_monitors();  
>>> Why does this reset all monitors but turn_monitoring_off() does not?  
>> When we turn monitoring off, the monitors will stop monitoring while yet
>> in sync with the events generated by the system, i.e., all the events after
>> the start were processed.
>>
>> But if we disabled the monitor, and some events get ignored, the monitors
>> will be out of sync with the system. Thus, resetting the monitor to
>> for a synchronization between the monitors and the system is needed, before
>> enabling monitoring back.
>>
>>> You should keep that out.  
>> did not get :-(
> I don't like the way the _on() and _off() are different.
> 
> Have the _on() just turn in on *without* the reset.
> 
> If you need the reset, then make a separate function called:
> 
> static void turn_monitoring_on_with_reset(void)
> {
> 	reset_all_monitors();
> 	turn_monitoring_on();
> }
> 

as usual... https://www.youtube.com/watch?v=qYo0lVVH2wU

Fixed in v8, along with all other changes.

Thanks
-- Daniel
