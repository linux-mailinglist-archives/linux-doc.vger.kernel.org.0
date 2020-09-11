Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 737212656B4
	for <lists+linux-doc@lfdr.de>; Fri, 11 Sep 2020 03:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725280AbgIKBe2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Sep 2020 21:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgIKBeP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Sep 2020 21:34:15 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C68C061757
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 18:34:15 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id i17so7893630oig.10
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 18:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7vaJi8kgW5W7GuAXioXeaqqVAFP6TvfOLHR8jdJNfGI=;
        b=UOXfO5+x3QkkTe7v71QHlKaT4HecVi4d69p2MacHc+AZ7+9f095/my4bRjsD248HuF
         z7yI73v+W5SQzcuFd9ukjJsGi19jMAO6obblnwR6lzhvBnXL+Yd7tIPZUZewyLXBd+5y
         wQYyKOMclt6T3CdHqAlP+9eKg8ekpV8PaArzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7vaJi8kgW5W7GuAXioXeaqqVAFP6TvfOLHR8jdJNfGI=;
        b=BBNxHEYtYgKsJDZ8iVMw2yiYPFtKrBbRF8qGDTKtOJ42lbietnqnGNTIDw+9uUBXMt
         dhM0x27DcIAHXRERH+rL0J1bA/SztUW2CC3+QDh3PIAmZSd+2LlvpjzeN3XECYd3PJR8
         R7Jg9wL0anVduaY4/TZTFvp+pDDaBPrq8ZUUPsfTD69nJ+QHB1rQqvfRq8OgDi1NTqaz
         GBPT1S8BWRkbqtimyr/RJk4ZG/RNvKrIotgtnPh6We6DZ1EjI1Wyajrxwz5xR80hwHsQ
         Gv9Bh3LUzO/1bkqd6VKsHtfKD/yoc6IKgypuW2f9mXFhyFXvtJj/CHF9TPnAhtHSMobT
         FL6g==
X-Gm-Message-State: AOAM532sy/4gULEmMBIaIJcpIoq5CDkjOPcRQ7uzz/WT7Ol3lV2fE6ZW
        n26RILd7w2FwwJ7xTtH/LhYoDXTZYsugMg==
X-Google-Smtp-Source: ABdhPJzhxoPLlARsfWWzICedHKinD4e+Wl5kxwU9KCyJ7cF4pceSjcf5McnrNvjDJe6hjaLxHsQfzA==
X-Received: by 2002:aca:5605:: with SMTP id k5mr1864936oib.21.1599788052935;
        Thu, 10 Sep 2020 18:34:12 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id 111sm131877otc.15.2020.09.10.18.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 18:34:12 -0700 (PDT)
Subject: Re: [PATCH v3 0/8] tracing/boot: Add new options for tracing specific
 period
To:     Masami Hiramatsu <mhiramat@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        linux-kselftest@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <159972809455.428528.4737752126800169128.stgit@devnote2>
 <20200910193433.236cf081@oasis.local.home>
 <20200911102743.de29a1f09bcb361f8d6556f6@kernel.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f386dbb5-eca7-fba4-b36f-d71bbdf64591@linuxfoundation.org>
Date:   Thu, 10 Sep 2020 19:34:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911102743.de29a1f09bcb361f8d6556f6@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/10/20 7:27 PM, Masami Hiramatsu wrote:
> On Thu, 10 Sep 2020 19:34:33 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
>> On Thu, 10 Sep 2020 17:54:54 +0900
>> Masami Hiramatsu <mhiramat@kernel.org> wrote:
>>
>>> Hi,
>>>
>>> Here is the 3rd version of the series to improve the boot-time tracing to
>>> support kretprobe and tracing_on option. Previous version is here:
>>>
>>>   https://lkml.kernel.org/r/159894698993.1478826.2813843560314595660.stgit@devnote2
>>>
>>> This version adds uprobe %return suffix support ([5/8]) and the testcases
>>> ([8/8]), and update kprobe %suffix support([4/8]) and the uprobe event
>>> document([6/8]).
>>>
>>>
>>> The combination of tracing_on and kretprobe allows us to trace events
>>> while a specific function call period. For example, the below bootconfig
>>> will make a function callgraph in the pci_proc_init() function at boot
>>> time.
>>>
>>> ftrace {
>>> 	tracing_on = 0  # off at start
>>> 	tracer = function_graph
>>> 	event.kprobes {
>>> 		start_event {
>>> 			probes = "pci_proc_init"
>>> 			actions = "traceon"
>>> 		}
>>> 		end_event {
>>> 			probes = "pci_proc_init%return"
>>> 			actions = "traceoff"
>>> 		}
>>> 	}
>>> }
>>>
>>> Here is the example output;
>>>
>>
>> [..]
>>
>> Hi Masami,
>>
>> This looks really great! I just got back from a 10 day holiday, and I'm
>> drowning in "catch-up".  I plan on looking at all this relatively soon
>> (in a week or two?). I just don't want you to think I'm ignoring this.
> 
> Hi Steve,
> 
> Thanks, I hope you enjoyed the holiday!
> BTW, this series includes some document update and testcases.
> Since we can not decouple these updates, I think it is better you to
> pull the series.
> 

Hi Steve and Masami,

selftests patch 8/8 in this series looks good to me. My ack for
it to go through Steve's ftrace tree

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
