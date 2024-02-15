Return-Path: <linux-doc+bounces-9643-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6118856F02
	for <lists+linux-doc@lfdr.de>; Thu, 15 Feb 2024 21:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA95A1C224A9
	for <lists+linux-doc@lfdr.de>; Thu, 15 Feb 2024 20:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A748D2595;
	Thu, 15 Feb 2024 20:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=okanakyuz.com header.i=@okanakyuz.com header.b="MHqYS84h"
X-Original-To: linux-doc@vger.kernel.org
Received: from olivedrab.birch.relay.mailchannels.net (olivedrab.birch.relay.mailchannels.net [23.83.209.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B735713B2BC
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 20:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708030786; cv=pass; b=R25EbJvOHr+4GZax/5QJrO6ldxw9oUIIdnCP6DsNNRqoKZl/0siaW7pET6dmxBvhlrkmp8MK/15E6w3BVK/MwHNlAO7VAHP1zBTfoZ4x5zHbr+64/Jmzwbi+z0s5Mg6Npk6RE36EZi/S9TkrOkZiJOpUW6mivu6MyLaYisqXIII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708030786; c=relaxed/simple;
	bh=/mSUBbaJgobG9E0uIKTDJyTpld50sZunPGvI+/SX598=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aEz9IU9pxguGlF52vAORlgJuV3WeCsItiXrXzmXCV/Sa6gJ9WLc9yJ/PwKTdZnCc9+DqXw+RlwyMSqVjpC5xInGvlVMeFU0pzb/KYqYNHCGosBnpHiEXun6ZiPzVSPmvdSiQZJhqNw2u59F2zJ7ohOepeSIMuzL3ZLAtqTcGGHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=okanakyuz.com; spf=none smtp.mailfrom=okanakyuz.com; dkim=pass (2048-bit key) header.d=okanakyuz.com header.i=@okanakyuz.com header.b=MHqYS84h; arc=pass smtp.client-ip=23.83.209.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=okanakyuz.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=okanakyuz.com
X-Sender-Id: hostingeremail|x-authuser|okanakyuz@okanakyuz.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 81DDB941275
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 20:42:35 +0000 (UTC)
Received: from fr-int-smtpout5.hostinger.io (unknown [127.0.0.6])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 0EB83940A27
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 20:42:33 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1708029754; a=rsa-sha256;
	cv=none;
	b=rlL8oGiAUIPl4OO8l5fDEvmNxJfAml4ZUCWIa5hicUrt9CgwvJDdAfW/0/7Ca1k24tx/xA
	T48crWsZ6F17GM3HwZIfEDe6+pmkFZxQbwAAQB4JaAvB0rTal8QWDyORepQYULcgeq66by
	Jt6/cEp6gjSEB6r2D3W0wUyn/IEC6MzUKQUS6tfGq+bGBjgvVR/xW8M/UMnRObp3+2HPFt
	XVtklL6/q8ZoWroKAWz3qQtL7i4gdEtevu82WEZ5gGhiuEfOKP3+rCHzaLgJon2N05htEg
	594L6bNIRGClVHFfKcdad/eOC7mnUE1WR/G7cJExyC7cStKU5uBqrjapywbYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1708029754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=6ot6RPa4XOaODJrhv54Aj+MPR5wL0ugjba+aQ/EkZnA=;
	b=15BQVhtgmFzpdDq+yFiUuvopysIAkFRjn01OL3hvb6m5W3YBc6l9BtpCX92CCfsQN1cpmW
	BjdQBiUGBP/gYzO6Ygjpq54INJdb5BmwfswsIlwNuk9hx13fAI+cyyQwq2WawWW+eDnjzf
	XsW82ZaqRAXsKKTZrFGarEwdaSYLD63JHi5lDOibNExLX5an1oF1/E5JIdu0KfwbW3k1j+
	OdNuoE99umGAofgLEZOt51UVsdWu+Hy1kta5PzgSQ1FkdYQla+H/NyTP/g0xx6zfYNwrxK
	adO/o6dODYUjQxCzLS0jCgCZwjqZsOlcICbl5NAGFk1noIA3+nfwfKkB/y1sDg==
ARC-Authentication-Results: i=1;
	rspamd-6bdc45795d-4sp4r;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=okanakyuz@okanakyuz.com
X-Sender-Id: hostingeremail|x-authuser|okanakyuz@okanakyuz.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|okanakyuz@okanakyuz.com
X-MailChannels-Auth-Id: hostingeremail
X-Reign-Occur: 5a1539fe73aa7fac_1708029755094_1991775511
X-MC-Loop-Signature: 1708029755094:2875241703
X-MC-Ingress-Time: 1708029755094
Received: from fr-int-smtpout5.hostinger.io ([UNAVAILABLE]. [89.116.146.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.120.66.9 (trex/6.9.2);
	Thu, 15 Feb 2024 20:42:35 +0000
Message-ID: <d1cf9665-df49-4ab8-a80e-e02530d9aa42@okanakyuz.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=okanakyuz.com;
	s=hostingermail-a; t=1708029752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ot6RPa4XOaODJrhv54Aj+MPR5wL0ugjba+aQ/EkZnA=;
	b=MHqYS84hpe4sBxl/2GDg2810B7/EUA/5uFDOsFebY7m3GmJ+dL5plBba8ogLdhTJLSpmLj
	ZV3he29WK47+oizN5tUgBo67FGpmRecHHWMdODsxaDuBveky0yeHPtcw2KE9kP2qJKzd6v
	FnGyWAvFgxmR4+U0vVmR2TN01V3o9eOUCyjysAFotwY+UCfCRMvFe+IEfgb5U7jwBv3RYv
	TaznqSyIu8zDJXzDmN1ORL2g2AIBbWvSbGgaPlkBLSeODiF/iEbsOXLGN4fG2IQxLpctxk
	j/65SUfCjXtZXJP3m/L9zyXI3g2rdEzKi3fVFjKIICeahgxZI69+s++iyL2o/A==
Date: Thu, 15 Feb 2024 23:42:30 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] The datasheet URL has been changed.
To: Guenter Roeck <linux@roeck-us.net>, jdelvare@suse.com, corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
References: <20240215151957.20855-1-okanakyuz@okanakyuz.com>
 <da10b4b9-b950-4021-8737-d12cbccef8c9@roeck-us.net>
Content-Language: en-GB
From: =?UTF-8?Q?Okan_Aky=C3=BCz?= <okanakyuz@okanakyuz.com>
In-Reply-To: <da10b4b9-b950-4021-8737-d12cbccef8c9@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-Envelope: MS4xfMnkNkm6M0NIYgJlzn3EgqxwLUMeDhzKqAxUhXvzaNxgC4g0AeuSas1qWHR3A2qUruZv/9miDSTnWGfpv/ZS4KfbPL9mMkybtEVHXjGB3Gy2QjL0EnGr evp7c/11htgTvDiDU/Ovozgt1gNZi/o5Md1NkdOBzra2+cqqA4P2O+Mjw4bcYifP+9iZIjtf6vx0fSiUzfKgCJTYQsCMRJgCobPd1yHLU67BT59rDHl/epMP rUrI+TLAIMAdabU8QgUVYNZKCxMULzw3aDl7NgIR5Ax6IkW3LseeLYx9A9bC9qgA9diniOJv1bMogxTot4HOzC2fqyqP5qI9HcQ2WbQS+4/zNH2na49D8cqD 5Q8SnJnxo9FNLJKjg5Bn4vNgcx2KKG0+ZXHML6+xMnspNi+MAu8=
X-CM-Analysis: v=2.4 cv=apu0CzZV c=1 sm=1 tr=0 ts=65ce7738 a=geHYaF3j5ifCImHjKwHHfg==:117 a=geHYaF3j5ifCImHjKwHHfg==:17 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=a4NEJbfMAAAA:8 a=-tA9vPf7AAAA:8 a=UXzzSC1OAAAA:8 a=gAnH3GRIAAAA:8 a=vKjkYViWplyUrToOSwAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vtdtr2SZiqPAgdHKmkdM:22 a=NXyddzfXndtU_1loVILY:22 a=oVHKYsEdi7-vN-J5QA_j:22
X-AuthUser: okanakyuz@okanakyuz.com

Analog Devices (ADI) acquired Maxim Integrated on September 8, 2021. I 
compared the revision numbers of the pdf files on archive.org. The 
addresses of the files changed somewhere between January 2022 and 
December 4, 2023. There is no version change on the pdf, just the url.

I will read the documentation again and prepare a more suitable patch. 
Since it was my first attempt.

Thank you for your help and understending.
Okan

On 15/02/2024 20:00, Guenter Roeck wrote:
> On 2/15/24 07:19, Okan Akyuz wrote:
>> The URL for the datasheet was not functional. It has been replaced
>> with the active one from the manufacturer's website.
>>
>> Signed-off-by: Okan Akyuz <okanakyuz@okanakyuz.com>
>> ---
>>   Documentation/hwmon/max6620.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/hwmon/max6620.rst 
>> b/Documentation/hwmon/max6620.rst
>> index 84c1c44d3de4..d70173bf0242 100644
>> --- a/Documentation/hwmon/max6620.rst
>> +++ b/Documentation/hwmon/max6620.rst
>> @@ -11,7 +11,7 @@ Supported chips:
>>         Addresses scanned: none
>>   -    Datasheet: http://pdfserv.maxim-ic.com/en/ds/MAX6620.pdf
>> +    Datasheet: 
>> https://www.analog.com/media/en/technical-documentation/data-sheets/max6620.pdf
>>     Authors:
>>       - L\. Grunenberg <contact@lgrunenberg.de>
>
> Is this supposed to be v2 ? If so, please provide change logs.
>
> Neither "The datasheet URL has been changed" now the original
> "The URL of the datasheet seems to have changed" describes
> the patch.
>
> Please read and follow Documentation/process/submitting-patches.rst.
>
> Thanks,
> Guenter
>

