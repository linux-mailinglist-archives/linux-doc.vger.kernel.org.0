Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D869550D936
	for <lists+linux-doc@lfdr.de>; Mon, 25 Apr 2022 08:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbiDYGLq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 25 Apr 2022 02:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbiDYGLj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Apr 2022 02:11:39 -0400
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADE0644C
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 23:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650866916; x=1682402916;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fCEB7jGr7Dsj/ic6FS9clDRWopNqXzv9JjhfwKvrrYw=;
  b=Hxbpx+We0MJoaLrztOZDQI7tvLFWhezstT+V++bAW4ov0OizlSFhtADJ
   d4+AYwIN6WEdndqJ3v3ey1deqLHOgV2ISfMxJk/ewzukAsMYSCEuA+t29
   r8PLYMo1dT5aBK1beb1xMWN8RZxpIiaX79X2q39kYrLC2AnvddqlGaNs4
   O3fdrgB+TTwrvdcAm4HXd+7o8B4PbH72SeNJHAhdYl64VGWZccFhmiMTQ
   UEDeB2k/0P7VO1hP0oGGUsw0fGOS09hBF3P6xIqrz+7trrxdQpVbKtLcQ
   M6tQLjuCPBYx5PJkaW5/W4bDoWWK2Quhsjql2+stpGffgWfLPu6HNqgS8
   w==;
X-IronPort-AV: E=Sophos;i="5.90,287,1643644800"; 
   d="scan'208";a="203595247"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2022 14:08:34 +0800
IronPort-SDR: wuKqRSuJKzMO62AxTfboX8Qi0JlKwSlBLDxAuCdX2gigg5AGzq3w6mtN1akBF2NojqHWYmIeRc
 NLZ8+2hr9ckWk/VYgXIkg7ulEtdFW7Za2Ak4uttCmrxtmFpkVnQKq6uoS+u84aG2furUV082ZN
 xaBy42cX4kUkSJal6o4yozNpmvT8goM5lGkaj0bdR7x2dMvFzurzs6Vn/jCJZrMj1ZccKQLEFq
 t4dMhmFZhonKwsG1H7o6966BjFmQcqepwfr3dCjtHRzJfDqwivCwerEIBOPgkbgL8lJgxc0Pf/
 xe4WFlmhA6PRqH4AvQOlzm+0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 22:39:30 -0700
IronPort-SDR: T+vPYqi6x6MB00TGiR5veDUCEhahsIBh3vGR01Q3kYk9yjK4p7LrJYMyME2rrm4Y7IxWQVADDX
 YlyRqnEoY7qOtWDYwXPvdUYCWRrvLm8ZSvLueGjAJCvRK1KsYliKqf5DvQbHugjx0iKkRRwWiP
 A+dtvO6AiAPqswuRzii7Mt4VaSQgAr4T6CmAP0soveEpM4fVynEn1Zy7vtLdo/+GS0AtFbhbSi
 /oz6Yb+dmKuo4x3fi66vmpLIu0TjZpEANSJ0Ea7wzFgo0CzbOqMsCB0pVKsLjisepv4S+t5dFK
 65M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 23:08:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kmvhd74g0z1SVnx
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 23:08:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1650866913; x=1653458914; bh=fCEB7jGr7Dsj/ic6FS9clDRWopNqXzv9Jjh
        fwKvrrYw=; b=a0qweF/NBW2fnaJFnDSNWeNuU/6LFYUIPJXfJyzMvzbZKJticwf
        HaLwhbtPQbLh5S+7GS1Y1Rab3hRt9aFdDnNJZ/1C9KI5g9U/JMQ2387VKUoUB0WF
        rwGr9Dynm6+mmN95OmjdHo2rIeqxlycQAyXqH7z3EgzXyCiP8gL1ZlccQP2oeIVW
        6kjn9OK/UBf/GmPQm6pXwS/qw+F76EoKbJjCP363JnTdearbdolgNMboGB76vkKB
        VMnxZfhgfWYM9RpbYRhoy/vT82acsSHpEB3/MVeqrAz+mbjI9gFAk3Pj4V7G/Xaa
        LNhrEAK/XbeM/pDENps4cWrXf5FSiXZ3T5g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id G69ClnGY59zu for <linux-doc@vger.kernel.org>;
        Sun, 24 Apr 2022 23:08:33 -0700 (PDT)
Received: from [10.225.163.24] (unknown [10.225.163.24])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kmvhc3x07z1Rvlx;
        Sun, 24 Apr 2022 23:08:32 -0700 (PDT)
Message-ID: <f1185514-a4de-5430-b4a0-b172e22009e8@opensource.wdc.com>
Date:   Mon, 25 Apr 2022 15:08:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 3/5] ata: libata-core: Improve link flags forced
 settings
Content-Language: en-US
To:     Hannes Reinecke <hare@suse.de>, linux-ide@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>
References: <20220425013417.3947791-1-damien.lemoal@opensource.wdc.com>
 <20220425013417.3947791-4-damien.lemoal@opensource.wdc.com>
 <21b1ef5b-aaf6-6baa-6580-52f3c35d2d67@suse.de>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <21b1ef5b-aaf6-6baa-6580-52f3c35d2d67@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/25/22 14:56, Hannes Reinecke wrote:
> On 4/25/22 03:34, Damien Le Moal wrote:
>> Similarly to the horkage flags, introduce the force_lflag_onoff() macro
>> to define struct ata_force_param entries of the force_tbl array that
>> allow turning on or off a link flag using the libata.force boot
>> parameter. To be consistent with naming, the macro force_lflag() is
>> renamed to force_lflag_on().
>>
>> Using force_lflag_onoff(), define a new force_tbl entry for the
>> ATA_LFLAG_NO_DEBOUNCE_DELAY link flag, thus allowing testing if an
>> adapter requires a link debounce delay or not.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> ---
>>   drivers/ata/libata-core.c | 32 ++++++++++++++++++++++----------
>>   1 file changed, 22 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
>> index dfdb23c2bbd6..e5a0e73b39d3 100644
>> --- a/drivers/ata/libata-core.c
>> +++ b/drivers/ata/libata-core.c
>> @@ -96,7 +96,8 @@ struct ata_force_param {
>>   	unsigned long	xfer_mask;
>>   	unsigned int	horkage_on;
>>   	unsigned int	horkage_off;
>> -	u16		lflags;
>> +	u16		lflags_on;
>> +	u16		lflags_off;
>>   };
>>   
>>   struct ata_force_ent {
>> @@ -386,11 +387,17 @@ static void ata_force_link_limits(struct ata_link *link)
>>   		}
>>   
>>   		/* let lflags stack */
>> -		if (fe->param.lflags) {
>> -			link->flags |= fe->param.lflags;
>> +		if (fe->param.lflags_on) {
>> +			link->flags |= fe->param.lflags_on;
>>   			ata_link_notice(link,
>>   					"FORCE: link flag 0x%x forced -> 0x%x\n",
>> -					fe->param.lflags, link->flags);
>> +					fe->param.lflags_on, link->flags);
>> +		}
>> +		if (fe->param.lflags_off) {
>> +			link->flags &= ~fe->param.lflags_off;
>> +			ata_link_notice(link,
>> +				"FORCE: link flag 0x%x cleared -> 0x%x\n",
>> +				fe->param.lflags_off, link->flags);
>>   		}
>>   	}
>>   }
>> @@ -6153,8 +6160,12 @@ EXPORT_SYMBOL_GPL(ata_platform_remove_one);
>>   #define force_xfer(mode, shift)				\
>>   	{ #mode,	.xfer_mask	= (1UL << (shift)) }
>>   
>> -#define force_lflag(name, flags)			\
>> -	{ #name,	.lflags		= (flags) }
>> +#define force_lflag_on(name, flags)			\
>> +	{ #name,	.lflags_on	= (flags) }
>> +
>> +#define force_lflag_onoff(name, flags)			\
>> +	{ "no" #name,	.lflags_on	= (flags) },	\
>> +	{ #name,	.lflags_off	= (flags) }
>>   
>>   #define force_horkage_on(name, flag)			\
>>   	{ #name,	.horkage_on	= (flag) }
>> @@ -6209,10 +6220,11 @@ static const struct ata_force_param force_tbl[] __initconst = {
>>   	force_xfer(udma/133,		ATA_SHIFT_UDMA + 6),
>>   	force_xfer(udma7,		ATA_SHIFT_UDMA + 7),
>>   
>> -	force_lflag(nohrst,		ATA_LFLAG_NO_HRST),
>> -	force_lflag(nosrst,		ATA_LFLAG_NO_SRST),
>> -	force_lflag(norst,		ATA_LFLAG_NO_HRST | ATA_LFLAG_NO_SRST),
>> -	force_lflag(rstonce,		ATA_LFLAG_RST_ONCE),
>> +	force_lflag_on(nohrst,		ATA_LFLAG_NO_HRST),
>> +	force_lflag_on(nosrst,		ATA_LFLAG_NO_SRST),
>> +	force_lflag_on(norst,		ATA_LFLAG_NO_HRST | ATA_LFLAG_NO_SRST),
>> +	force_lflag_on(rstonce,		ATA_LFLAG_RST_ONCE),
>> +	force_lflag_onoff(dbdelay,	ATA_LFLAG_NO_DEBOUNCE_DELAY),
>>   
>>   	force_horkage_onoff(ncq,	ATA_HORKAGE_NONCQ),
>>   	force_horkage_onoff(ncqtrim,	ATA_HORKAGE_NO_NCQ_TRIM),
> 
> Hmm.
> 
> Personally, I'm not a fan of distinct 'flags_on' and 'flags_off'; I 
> always wonder what does happen if one sets the same value for both ...

Problem is that when parsing the options and gathering the horkages/flags
about the drive, nothing is known about it yet, so we do not have the link
flags to directly modify based on the option name. So we have to keep the
information about which flag to set and which to reset. Generating a
"flags_mask" variable with all the correct flags set based on the option
is easy, but we still need to know the operation to do with that mask on
the device/link flags.

> 
> And do we really need this? All settings above are just simple flags 
> which can be set or unset.
> Sure, some flags are inverted, but still they are flags.
> So why do we need the separation here?
> Isn't it rather cosmetical?

For the existing libata.force option, yes, all this is cosmetic.
For the new flags, we still have to deal with the reversed flags (the
ATA_XXX_NO_...). And for these, the onoff is definitely reversed from the
non reversed flags. And given that some of the reversed flags can already
be set with libata.force, I find this way the cleanest to add new flags
without breaking the manipulation of existing ones.

> 
> Cheers,
> 
> Hannes


-- 
Damien Le Moal
Western Digital Research
