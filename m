Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E036957BC32
	for <lists+linux-doc@lfdr.de>; Wed, 20 Jul 2022 19:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbiGTRCS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Jul 2022 13:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbiGTRCR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jul 2022 13:02:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 560C96A9D6;
        Wed, 20 Jul 2022 10:02:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E5815B81FBC;
        Wed, 20 Jul 2022 17:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F86CC3411E;
        Wed, 20 Jul 2022 17:02:11 +0000 (UTC)
Date:   Wed, 20 Jul 2022 13:02:09 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Daniel Bristot de Oliveira <bristot@kernel.org>
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
Subject: Re: [PATCH V6 02/16] rv: Add runtime reactors interface
Message-ID: <20220720130209.65f501b1@gandalf.local.home>
In-Reply-To: <ba11409a-df46-8fad-61a9-256277c588c0@kernel.org>
References: <cover.1658244826.git.bristot@kernel.org>
        <4b5f93e3186b067073c1692d4c2b50d0b42101d5.1658244826.git.bristot@kernel.org>
        <20220720124133.3cdd2c44@gandalf.local.home>
        <ba11409a-df46-8fad-61a9-256277c588c0@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 20 Jul 2022 18:50:39 +0200
Daniel Bristot de Oliveira <bristot@kernel.org> wrote:

> On 7/20/22 18:41, Steven Rostedt wrote:
> > On Tue, 19 Jul 2022 19:27:07 +0200
> > Daniel Bristot de Oliveira <bristot@kernel.org> wrote:
> >   
> >> +/*
> >> + * reacting_on interface.
> >> + */
> >> +static ssize_t reacting_on_read_data(struct file *filp,
> >> +				     char __user *user_buf,
> >> +				     size_t count, loff_t *ppos)
> >> +{
> >> +	char *buff;
> >> +
> >> +	mutex_lock(&rv_interface_lock);
> >> +	buff = reacting_on ? "1\n" : "0\n";
> >> +	mutex_unlock(&rv_interface_lock);  
> > Again, no need for the locks, but perhaps just to keep things sane:
> > 
> > 	buf = READ_ONCE(reacting_on) ? "1\n" : "0\n";  
> 
> So, for all files that only read/write a single variable, use READ_ONCE/WRITE_ONCE without
> locks? (and in all usage of that variable too).

Only if there's no races.

That is, taking the locks here provide no benefit over a READ_ONCE().

If there was some logic that checks if the value is still valid or not,
then that would be a different story.

For example:

static int enable_monitor(struct rv_monitor_def *mdef)
{
        int retval;

        if (!mdef->monitor->enabled) {
                retval = mdef->monitor->enable();
                if (retval)
                        return retval;
        }

        mdef->monitor->enabled = 1;

        return 0;
}

That has logic that looks to require a lock to protect things from changing
from underneath.

-- Steve
