Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B97774B7609
	for <lists+linux-doc@lfdr.de>; Tue, 15 Feb 2022 21:48:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbiBOStf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 15 Feb 2022 13:49:35 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbiBOSte (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Feb 2022 13:49:34 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D21673E5
        for <linux-doc@vger.kernel.org>; Tue, 15 Feb 2022 10:49:23 -0800 (PST)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1nK2t7-0002Bq-IW; Tue, 15 Feb 2022 19:49:21 +0100
Message-ID: <e399b17e-5fb6-a0c4-f247-1762031fe54c@leemhuis.info>
Date:   Tue, 15 Feb 2022 19:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-BS
From:   Thorsten Leemhuis <linux@leemhuis.info>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <cover.1643710947.git.linux@leemhuis.info>
 <b32d06dca7d228d61692acaff386928bd673754f.1643710947.git.linux@leemhuis.info>
 <87k0ee5gf2.fsf@meer.lwn.net>
 <35bf934c-d8ed-7988-69f3-e0cb53e0adf4@leemhuis.info>
Subject: Re: [PATCH v4 1/3] docs: add two documents about regression handling
In-Reply-To: <35bf934c-d8ed-7988-69f3-e0cb53e0adf4@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1644950963;75307e56;
X-HE-SMSGID: 1nK2t7-0002Bq-IW
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02.02.22 11:05, Thorsten Leemhuis wrote:
> On 02.02.22 00:13, Jonathan Corbet wrote:
>> OK, I'll try not to take so long to have a look at it this time.
>>
>> Thorsten Leemhuis <linux@leemhuis.info> writes:
>>
>>> Create two documents explaining various aspects around regression
>>> handling and tracking; one is aimed at users, the other targets
>>> developers.
>>>
>>> The texts among others describe the first rule of Linux kernel
>>> development and what it means in practice. They also explain what a
>>> regression actually is and how to report one properly.
>>>
>>> Both texts additionally provide a brief introduction to the bot the
>>> kernel's regression tracker uses to facilitate the work, but mention the
>>> use is optional.
>>>
>>> To sum things up, provide a few quotes from Linus in the document for
>>> developers to show how serious he takes regressions.
>>>
>>> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
>>> ---
>>>  Documentation/admin-guide/index.rst           |   1 +
>>>  .../admin-guide/regressions-users.rst         | 436 ++++++++++++
>>>  Documentation/process/index.rst               |   1 +
>>>  Documentation/process/regressions-devs.rst    | 672 ++++++++++++++++++
>>
>> I'll start with some *serious* bikesheddery...it's best if the names of
>> the files tell readers what's inside.  This isn't something I feel
>> really strongly about, but we could consider
> 
> I wasn't totally happy with the file names myself, so it's good that you
> bring it up.
> 
>> 	admin-guide/reporting-regressions.txt (or just regressions.txt)
>>         process/regression-policy.txt
> 
> I like "reporting-regressions.txt", but I wonder if using the word
> "policy" is a good idea. I tried to avoid it (and similar words, like
> guidelines), as they might do more harm then good. So how about:
> 
>  	admin-guide/reporting-regressions.rst
>         process/regressions.rst

BTW, I settled on these:

 admin-guide/reporting-regressions.rst
 process/handling-regressions.rst

>> [...] 
>>> +Send a mail to the regressions mailing list (regressions@lists.linux.dev) while
>>> +CCing the Linux kernel's regression tracker (regressions@leemhuis.info); if the
>>> +issue might better be dealt with in private, feel free to omit the list.
>>
>> Perhaps a separate concern, but might you want to set up an @kernel.org
>> alias for the regression tracker?  Trust me, you're not gonna want to
>> run it forever, and the ability to quickly redirect the mail may prove
>> to be a nice thing to have.  An email address with your domain sitting
>> in the docs will circulate for years after it gets changed.
> 
> Yeah, it's on my mental to do list for a few weeks already, but never
> set down to actually get this rolling. You are right, I'll ask for an alias.

I liked the idea and requested this, but Konstantin raised a good point:
"we don't have generic aliases for all other subsystems, but the
situation where someone may want to discuss something off-list arises
for all of them". I have to agree with him. I first wanted to change the
text to something like "look up the address in MAINTAINERS", but that
just shifts the problem. Additionally: We have lot's of other private
addresses from maintainers in the docs as well and don't consider that
to be a problem. And if somebody else takes over I can also redirect
that email or create a autoreply on my local server. So I'd say we just
leave things as they are, it's not perfect, but good enough I'd say.

Ciao, Thorsten
