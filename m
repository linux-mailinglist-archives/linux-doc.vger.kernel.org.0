Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97EC423E540
	for <lists+linux-doc@lfdr.de>; Fri,  7 Aug 2020 02:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbgHGAmB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 6 Aug 2020 20:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgHGAmB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Aug 2020 20:42:01 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D659C061574
        for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2020 17:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=MnKeRL9nzN5EAU5eJZq9osJJLG6+homCJiPYeEL9vNg=; b=dpGMGFAnb00dbMl9LiSz4EJh0/
        XOaOYhbM7TDESC//eMzlWGZBsneEpuigV5xIj85TKtLR/FJYcDut3fybKw6x6ecf84AY7w6MY3FP0
        8TsFK8JoBKTYNvPT2XgCxvFvZgdS7QjIpCAnG2IjD1CN90uMDiuhoICTvcyZw6lmK/e7cAwJwR2jA
        KLpzCuVlm0x5piLJYPg+CzZePq3nSf14IkEQ+QHN3hi9VQo0qKxsLcQbsCrqJb49oK36Zazs+8vjO
        OLn198dYXWJVtowN0gJ5Zlp2eJc8oP8d8FNqE1dJlWv5m4cZDqqF6AQD1sRrQbTUMfgqlo4hcrR2e
        TdNbBh/Q==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k3qSM-00026X-5X; Fri, 07 Aug 2020 00:41:58 +0000
Subject: Re: [PATCH] docs: Correct the release date of 5.2 stable
To:     Billy Wilson <billy_wilson@byu.edu>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <20200806231754.7735-1-billy_wilson@byu.edu>
 <84f3c886-7ade-5870-22a0-6cef2735c19b@infradead.org>
 <20200807000823.GA7953@imjin>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d67c4c89-72c9-43d8-9e86-c5ad48df132b@infradead.org>
Date:   Thu, 6 Aug 2020 17:41:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807000823.GA7953@imjin>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 8/6/20 5:08 PM, Billy Wilson wrote:
> On Thu, Aug 06, 2020 at 04:46:13PM -0700, Randy Dunlap wrote:
>> On 8/6/20 4:17 PM, Billy Wilson wrote:
>>> A table lists the 5.2 stable release date as September 15, but it was
>>> released on July 7. This may confuse a reader who is trying to
>>> understand the stable update release cycle.
>>>
>>> Signed-off-by: Billy Wilson <billy_wilson@byu.edu>
>>> ---
>>>  Documentation/process/2.Process.rst | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
>>> index 3588f48841eb..4ae1e0f600c1 100644
>>> --- a/Documentation/process/2.Process.rst
>>> +++ b/Documentation/process/2.Process.rst
>>> @@ -113,7 +113,7 @@ than one development cycle past their initial release. So, for example, the
>>>  5.2 kernel's history looked like this (all dates in 2019):
>>>  
>>>  	==============  ===============================
>>> -	September 15 	5.2 stable release
>>> +	July 7		5.2 stable release
>>>  	July 14		5.2.1
>>>  	July 21		5.2.2
>>>  	July 26		5.2.3
>>
>> Hi,
>> For clarification, what 5.2 kernel do you find that was released on
>> July 7, 2019?  IOW, what you consider the 5.2 stable release of that date?
>> or where did you get that date?
>>
>> thanks.
>>
>> -- 
>> ~Randy
>>
> 
> I found the date of July 7 at https://kernelnewbies.org/Linux_5.2 . I
> just double checked that date against the git tag for v5.2 (commit
> 0ecfebd2b524) and it looks like it matches.

OK, that part makes sense (to me).

> September 15, meanwhile, is the 5.3 stable release date. I mainly
> noticed this because the table uses the 5.2 release dates to illustrate
> the stable update release cycle. I was scratching my head for a few
> minutes trying to figure out why 5.2 had a date of September 15 and
> 5.2.1 had a date of July 14, until I realized it was a mistake.

I had 2 questions. One was why not July 8 instead of July 7,
but you answered that part satisfactorily (above).  (July 8 is when
the tarball and .sign files are dated.)

The other question is do we call v5.2 stable?  Or should we begin
stable at v5.2.1?


thanks.
-- 
~Randy

