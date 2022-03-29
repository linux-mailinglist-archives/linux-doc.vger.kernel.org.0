Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D38F4EB0C2
	for <lists+linux-doc@lfdr.de>; Tue, 29 Mar 2022 17:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233740AbiC2Pi4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 29 Mar 2022 11:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239134AbiC2PiY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 11:38:24 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2ED1BD83B
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 08:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=/sYa/wjFbH9UOVAzJ1A/HyPpDpIUp+pYrzFG+QKERao=; b=UGyLHAxgmGoSwU6HZXv7QWODY3
        AjzuZWFmKm5oNhIsIlxzlhxcbbKl9hakQgbTAJrjLiszS3PuuDYilCljaF7JnNORPFgUCT3oXL0zc
        X0h65e0fQ++vyz+m2Q8fcJJjUxRMdhBiQfFBiLXkX6N/eO2H30xluKbwTfVoV70k5mJODbkD/gN23
        k3G4kSqji8Iz5zY4RKFOLDi2u1dD7tzqOnL0JpUuFAL4Vi70F//y/q9v0NagZCTngHwsAjMjg2eem
        JsABmKLvYbUGEISbr60p1H0+U8+m/wG8HNgTD/826XTviq+YeekFVG06yShrspkwQvMx/2rlEyzI0
        730yw4RQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nZDtV-005wfE-Il; Tue, 29 Mar 2022 15:36:29 +0000
Message-ID: <42ae72ad-70db-719b-ed0b-8afedf50121d@infradead.org>
Date:   Tue, 29 Mar 2022 08:36:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] docs: sphinx/requirements: Limit jinja2<3.1
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
 <871qyk7p28.fsf@meer.lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <871qyk7p28.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 3/29/22 08:31, Jonathan Corbet wrote:
> Akira Yokosawa <akiyks@gmail.com> writes:
> 
>> jinja2 release 3.1.0 (March 24, 2022) broke Sphinx<4.0.
>> This looks like the result of deprecating Python 3.6.
>> It has been tested against Sphinx 4.3.0 and later later.
> 
> *Sigh*.  I wish this stuff didn't feel like such a house of cards
> sometimes... 

ack.

>> Setting an upper limit of <3.1 to junja2 can unbreak Sphinx<4.0
>> including Sphinx 2.4.4.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: linux-doc@vger.kernel.org
>> ---
>> Or we can bump the requirement to Sphinx>=4.0.
>> Thoughts?
> 
> It's probably time to consider a bump there, but that is a bigger one
> than I would want to do at this point.  So I'll just fast-track this
> patch in; dropping it into the stable updates probably makes sense too.

Yeah, some of us don't have Python4 installed...

-- 
~Randy
