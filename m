Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9AB710CE2E
	for <lists+linux-doc@lfdr.de>; Thu, 28 Nov 2019 19:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbfK1SAn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 28 Nov 2019 13:00:43 -0500
Received: from foss.arm.com ([217.140.110.172]:39250 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726569AbfK1SAm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 28 Nov 2019 13:00:42 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18CC71FB;
        Thu, 28 Nov 2019 10:00:42 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40B553F6C4;
        Thu, 28 Nov 2019 10:00:41 -0800 (PST)
Subject: Re: [PATCH v5 03/14] coresight: cti: Add sysfs access to program
 function regs
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Mike Leach <mike.leach@linaro.org>,
        Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <20191119231912.12768-1-mike.leach@linaro.org>
 <20191119231912.12768-4-mike.leach@linaro.org>
 <cc0eb144-48a2-bde5-4790-2fd5e1168360@arm.com>
 <CANLsYkzsn6UWjjXLDSx+2hbXV26Qf-6FMqE7xURPgPzxOYpVbw@mail.gmail.com>
From:   Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Message-ID: <f2ccaef9-2bd4-77a6-750b-e4eca4158ab1@arm.com>
Date:   Thu, 28 Nov 2019 18:00:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CANLsYkzsn6UWjjXLDSx+2hbXV26Qf-6FMqE7xURPgPzxOYpVbw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mathieu,

On 28/11/2019 17:20, Mathieu Poirier wrote:
> On Thu, 28 Nov 2019 at 03:54, Suzuki Kuruppassery Poulose
> <suzuki.poulose@arm.com> wrote:
>>
>> On 19/11/2019 23:19, Mike Leach wrote:
>>> Adds in sysfs programming support for the CTI function register sets.
>>> Allows direct manipulation of channel / trigger association registers.
>>>
>>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> Signed-off-by: Mike Leach <mike.leach@linaro.org>
>>
>>
>>> +/*
>>> + * #define CTI_DEBUG_INTEGRATION_CTRL to enable the access to the integration
>>> + * control registers. Normally only used to investigate connection data.
>>> + */
>>
>> On a second thought, I have some comments on this symbol.
>>
>> Given that the integration control registers may be useful for people to
>> find the device connections, I strongly feel that this is provided
>> via a CONFIG symbol rather than a  debug symbol within the code.
> 
> Device connections can be discovered with the dynamic sysfs connection
> entries added as part of patch 09.  In cases where that is not

Yes, that correct. That happens only if the DT/ACPI describes the
connections.

> sufficient and people really need to use the integration control
> registers they are probably instrumenting the code anyway.

In this case given the CTI number of triggers and connections, this
step is to identify the connections in the first place, so that they
can be described in the DT/ACPI. Of course this is not a common
activity, but more of a board bring up activity. Thus, we can't expect
the board bringup engineer to necessarily know how to modify
the driver to get this exposed. Having a Kconfig entry, with
a help text makes this easier for them to avoid fiddling with
the code. Hope this is clearer now.

Cheers
Suzuki


> 
>>
>> i.e, CONFIG_CTI_DEBUG_INTEGRATION_CTRL, to help the people better.
>> Codewise this doesn't make much difference, but it certainly makes
>> it more easier for people to use it.
> 
> I agree that code-wise it doesn't make much difference but I'm really
> not convinced it makes the driver easier to use, and one needs to
> recompile their kernel for production systems anyway.
> 
> Thanks,
> Mathieu
> 
>>
>> We have used debug symbols elsewhere in the drivers for pure functional
>> debugging purposes. However I feel this is case is superior.
>>
>>
>> Cheers
>> Suzuki

