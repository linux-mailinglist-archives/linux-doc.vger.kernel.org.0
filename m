Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA6B532CE19
	for <lists+linux-doc@lfdr.de>; Thu,  4 Mar 2021 09:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232459AbhCDIGV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 4 Mar 2021 03:06:21 -0500
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:50141 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232303AbhCDIFw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Mar 2021 03:05:52 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=alimailimapcm10staff010182156082;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UQMKfJf_1614845109;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UQMKfJf_1614845109)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 04 Mar 2021 16:05:10 +0800
Subject: Re: [PATCH v2 7/9] docs/zh_CN: Improve zh_CN/process/6.Followthrough
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
References: <cover.1614488009.git.bobwxc@email.cn>
 <e841b93b26de20861dd4b224fd6815555429de83.1614488009.git.bobwxc@email.cn>
 <f71b3159-7ea4-c482-8383-7d113ef68511@linux.alibaba.com>
 <20210304074012.GA14632@mipc>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <7d27acd9-5817-1642-5234-42bad9fce97f@linux.alibaba.com>
Date:   Thu, 4 Mar 2021 16:05:09 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210304074012.GA14632@mipc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/3/4 下午3:40, Wu X.C. 写道:
> On Thu, Mar 04, 2021 at 03:23:43PM +0800, Alex Shi wrote:
>>
>>
>> 在 2021/2/28 下午1:40, Wu XiangCheng 写道:
>>> Improve language and grammar of zh_CN/process/6.Followthrough.rst
>>>
>>> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
>>> ---
>>>  .../zh_CN/process/6.Followthrough.rst         | 141 +++++++++---------
>>>  1 file changed, 74 insertions(+), 67 deletions(-)
>>>
>>> diff --git a/Documentation/translations/zh_CN/process/6.Followthrough.rst b/Documentation/translations/zh_CN/process/6.Followthrough.rst
>>> index f509e077e1cb..c5442c356dad 100644
>>> --- a/Documentation/translations/zh_CN/process/6.Followthrough.rst
>>> +++ b/Documentation/translations/zh_CN/process/6.Followthrough.rst
>>> @@ -1,145 +1,152 @@
>>>  .. include:: ../disclaimer-zh_CN.rst
>>>  
>>>  :Original: :ref:`Documentation/process/6.Followthrough.rst <development_followthrough>`
>>> -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
>>> +
>>> +:Translator:
>>> +
>>> + 时奎亮 Alex Shi <alex.shi@linux.alibaba.com>
>>> +
>>> +:校译:
>>> +
>>> + 吴想成 Wu XiangCheng <bobwxc@email.cn>
>>>  
>>>  .. _cn_development_followthrough:
>>>  
>>>  跟进
>>>  ====
>>>  
>>> -在这一点上，您已经遵循了到目前为止给出的指导方针，并且，随着您自己的工程技能
>>> +此时，您已经遵循了到目前为止给出的指导方针，并且，随着您自己的工程技能
>>
>> Seems there are many lines shorter than before, this may make new
>> doc are bit more ugly and cause reader uncomfort, consider your change
>> may widerly used or reference for long time. Line width control is
>> very meanignful and valuable things.
>>
>> Would you like try to refill all shorter lines, make context more
>> pretty?
>>
> OK, good suggestion.
> I'll try to fill the shorter lines or return at a word or punctuation.
> But I won't fill a modified single line in a large paragraph, that may
> cause many unnecessary line changes.

Uh, it still worth to do ...

> 
> Thanks
> Wu X.C.
> 
