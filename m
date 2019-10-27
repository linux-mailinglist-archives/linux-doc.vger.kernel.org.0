Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC1DE64E2
	for <lists+linux-doc@lfdr.de>; Sun, 27 Oct 2019 19:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfJ0SaZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 27 Oct 2019 14:30:25 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42626 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbfJ0SaZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 27 Oct 2019 14:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=/GyiX/sfBVlwfmQZXB6ZIev2q642ZHQbnhMv6jDyAMQ=; b=Thj52uzbZX+73n2/xfksU9ZT7
        u8O/lE+dOnXqDdr5tB5+2mplmuD6NqN8Rxgp/F8PC1d1Y7sIJI4SNMQVxo4GibhpNkjTb7FMh3SYN
        993PalCrexxh+Xb0djqbVmqbEHBKD13Kn7U/9geAeETCI+5KONf8LO7z3CPEKmIoVYreGR+nzoy7B
        kKOolDBTP7F7kInnhHF9K+wKREZMOW5++uUYuIsTsSNS6/9nzp/eZ9GUBoE3uS8O4cZuOaTtVBHXx
        tRKbDKjkZ4YhXMeZJozPJE5bskT+w5MTLnwd2FgGH28zWhFL+q7Y8lehx1C550C7irTHWSp4O/YNg
        MH5aJA0pg==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iOnJ2-0004xe-7N; Sun, 27 Oct 2019 18:30:24 +0000
Subject: Re: Sphinx parallel build errors
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
 <201910091929.0C058BB@keescook> <20191010124832.23bc4362@lwn.net>
 <c6263597-e9d0-5a1f-effd-d1706c24e666@infradead.org>
 <8305ffe2-51ba-eb4b-4d44-2defe45aa68f@infradead.org>
 <20191027121729.59c1d539@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c0be66ed-eb97-bc19-5bdb-0ef8903c3709@infradead.org>
Date:   Sun, 27 Oct 2019 11:30:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191027121729.59c1d539@lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/27/19 11:17 AM, Jonathan Corbet wrote:
> On Sun, 27 Oct 2019 11:11:57 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>>> Yes, I see oom-kills when building docs for 5.4-rc2.
>>> But only after I ran 'gimp *.jpg' for 22 photos.
>>>
>>> I can see anywhere from 1 to 4 sphinx-build processes running.  
>>
>> I continue to have oom-kills when building docs.
>> At least 2 times I also had system freezes where I had to power
>> cycle to reboot.
>>
>> I suppose I can only hope that other people start running into this
>> issue.  :(
> 
> Are you still running gimp at the same time?

no.

> Also, are you doing a straight "make htmldocs" or something else?

straight "make htmldocs".

-- 
~Randy

