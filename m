Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4C144B89AE
	for <lists+linux-doc@lfdr.de>; Wed, 16 Feb 2022 14:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234262AbiBPNV3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Feb 2022 08:21:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234633AbiBPNVN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Feb 2022 08:21:13 -0500
Received: from gateway33.websitewelcome.com (gateway33.websitewelcome.com [192.185.145.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC592AE287
        for <linux-doc@vger.kernel.org>; Wed, 16 Feb 2022 05:20:01 -0800 (PST)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway33.websitewelcome.com (Postfix) with ESMTP id A6FD937A1D
        for <linux-doc@vger.kernel.org>; Wed, 16 Feb 2022 07:20:00 -0600 (CST)
Received: from gator4132.hostgator.com ([192.185.4.144])
        by cmsmtp with SMTP
        id KKDwnlOVbdx86KKDwnPE4B; Wed, 16 Feb 2022 07:20:00 -0600
X-Authority-Reason: nr=8
Received: from host-95-232-30-176.retail.telecomitalia.it ([95.232.30.176]:46602 helo=[10.0.1.2])
        by gator4132.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <bristot@kernel.org>)
        id 1nKKDv-0030ep-2d; Wed, 16 Feb 2022 07:19:59 -0600
Message-ID: <a7589253-d73a-942d-692f-27d80ee855c5@kernel.org>
Date:   Wed, 16 Feb 2022 14:19:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC V2 12/21] rv/reactor: Add the printk reactor
Content-Language: en-US
To:     John Ogness <john.ogness@linutronix.de>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Gabriele Paoloni <gpaoloni@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-trace-devel@vger.kernel.org
References: <cover.1644830251.git.bristot@kernel.org>
 <fad2d358d57dfffc084d482684ecc1d13b62b262.1644830251.git.bristot@kernel.org>
 <10cf6003-6d2b-056b-11bb-3ae9c342a369@linuxfoundation.org>
 <c1657d1c-0d2b-4aa3-c1ed-2ae6fdfcda86@kernel.org>
 <87v8xg30qc.fsf@jogness.linutronix.de>
 <45179cdb-2391-207a-2f7b-2dea828d1606@kernel.org>
 <87r1842r1m.fsf@jogness.linutronix.de>
 <65172f14-bad6-37b1-d243-e91ca472d22e@kernel.org>
 <874k50hqmj.fsf@jogness.linutronix.de>
 <05a593c4-0134-1449-7f30-305a0ffe1b49@kernel.org>
 <87fsojrsnh.fsf@jogness.linutronix.de>
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
In-Reply-To: <87fsojrsnh.fsf@jogness.linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4132.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - kernel.org
X-BWhitelist: no
X-Source-IP: 95.232.30.176
X-Source-L: No
X-Exim-ID: 1nKKDv-0030ep-2d
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: host-95-232-30-176.retail.telecomitalia.it ([10.0.1.2]) [95.232.30.176]:46602
X-Source-Auth: kernel@bristot.me
X-Email-Count: 3
X-Source-Cap: YnJpc3RvdG1lO2JyaXN0b3RtZTtnYXRvcjQxMzIuaG9zdGdhdG9yLmNvbQ==
X-Local-Domain: no
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/16/22 11:51, John Ogness wrote:
> On 2022-02-16, Daniel Bristot de Oliveira <bristot@kernel.org> wrote:
>> So, I will keep printk(), add a depends on *!* fbcon, and remove the
>> comment.  What do you think?
> printk() and depends on !VT_CONSOLE. OK for me. Hopefully soon this
> restriction can be removed.

ack.

Thanks, John!
-- Daniel

> John

