Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F31CDF0051
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2019 15:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731026AbfKEOxC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 5 Nov 2019 09:53:02 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:34635 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731023AbfKEOxC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Nov 2019 09:53:02 -0500
Received: by mail-io1-f66.google.com with SMTP id q83so1693300iod.1
        for <linux-doc@vger.kernel.org>; Tue, 05 Nov 2019 06:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+KOXusQ0gMsjPIECI8aJtEVaJzR/S8atj/RIpKomKHE=;
        b=DBW1WPJxUMXrfv7VGwMYcFnk0qqQqtdg00M0Uec/ovJOKDOAhr0OFfig9xaYTtvdTA
         fao7BC6uzWRQfSL8Gp1wX/pGlJGTbcnPTT/fOK7bVzH1ZXkPBjkzULXtIn7Lzj8Rqh3o
         +Ve7M2LvNirX/loRVDz2W6eYTr2OGZBpm8NwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+KOXusQ0gMsjPIECI8aJtEVaJzR/S8atj/RIpKomKHE=;
        b=U8U29PBRBkiFMWxaFE7f1KJU+FE+ZeBGDA5gG5LEPbNt3uyeul+ZPbskbnKHe6EfL8
         J6LtP0otV3MLHjKN4v4te2JPLt/R8PAETDBCKqR5oC1CgqA90Am+iG+TVTt8/KNVdvYp
         drPQesvwzWqGvwqofa9Ft53kv8ZCHSnJWZQDGGCTn4Gbn7l04RbeKksGDFDB7CH6ClOz
         fCON8AE3BCBMFRzpkmUAfCaWkOPepjnNatUfO06atKAab/xp8GFVIa24mkUFHGipJOCy
         eKICuaYUNO94TS6aUf5XxOi1tfc3aO3a+jsmkmr+2HwY9035JFnAqGi+qjDDAexZMi0r
         /Aqg==
X-Gm-Message-State: APjAAAUth0qW7mqMoalF4Iv1PDeb0pjk7wQEGg+jEpu0b4apc/LrMvs1
        fYXeNR90lgN0Zb/2Zo8mBYe2Yg==
X-Google-Smtp-Source: APXvYqz5HA2yCc0jWmXskaxybqR69b3WXB8Liclq5ymEdXWCL+pK+LjplQc9EZ95TvV3xrmGZYm64A==
X-Received: by 2002:a5d:8987:: with SMTP id m7mr29268311iol.104.1572965581116;
        Tue, 05 Nov 2019 06:53:01 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id f8sm2796434ilg.58.2019.11.05.06.52.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 06:53:00 -0800 (PST)
Subject: Re: [PATCH] Documentation: RCU: whatisRCU: Fix formatting for section
 2
To:     paulmck@kernel.org, Amol Grover <frextrite@gmail.com>
Cc:     Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Jonathan Corbet <corbet@lwn.net>, rcu@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20191104133315.GA14499@workstation-kernel-dev>
 <20191104150328.GZ20975@paulmck-ThinkPad-P72>
 <20191104171641.GA15217@workstation-kernel-dev>
 <20191104194528.GJ20975@paulmck-ThinkPad-P72>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <dc5570d4-26bf-59ab-76bb-79490dde2369@linuxfoundation.org>
Date:   Tue, 5 Nov 2019 07:52:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104194528.GJ20975@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Amol,

On 11/4/19 12:45 PM, Paul E. McKenney wrote:
> On Mon, Nov 04, 2019 at 10:46:41PM +0530, Amol Grover wrote:
>> On Mon, Nov 04, 2019 at 07:03:28AM -0800, Paul E. McKenney wrote:
>>> On Mon, Nov 04, 2019 at 07:03:15PM +0530, Amol Grover wrote:
>>>> Convert RCU API method text to sub-headings and
>>>> add hyperlink and superscript to 2 literary notes
>>>> under rcu_dereference() section
>>>>
>>>> Signed-off-by: Amol Grover <frextrite@gmail.com>
>>>
>>> Good stuff, but Phong Tran beat you to it.  If you are suggesting
>>> changes to that patch, please send a reply to her email, which
>>> may be found here:
>>>

Please do a review and send comments and suggestions in an email
instead of a patch.

>>> https://lore.kernel.org/lkml/20191030233128.14997-1-tranmanphong@gmail.com/
>>>
>>> There are several options for replying to this email listed at the
>>> bottom of that web page.
>>
>> Thank you Paul! And that is correct, I was suggesting changes to
>> that patch. However, since that patch was already integrated into
>> the `dev` branch, I mistakenly believed this patch could be sent
>> independently. Sorry for the trouble, I'll re-send the patch the
>> correct way.
> 

Please drop your patch and do a review for the patch as suggested by
Paul. This should have been a review and not a patch on top.

thanks,
-- Shuah
