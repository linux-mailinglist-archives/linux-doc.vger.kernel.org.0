Return-Path: <linux-doc+bounces-18346-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCC2904C36
	for <lists+linux-doc@lfdr.de>; Wed, 12 Jun 2024 09:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18B73281496
	for <lists+linux-doc@lfdr.de>; Wed, 12 Jun 2024 07:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B5F79D8;
	Wed, 12 Jun 2024 07:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="MMNnY9J+"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE4E1369BF
	for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 07:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718175636; cv=none; b=lJ1Od+QIkth2hrHhuupdGHeKrfigbJVQI0bU7VRq7sH1CxogQ1FKgYvXjsbxw3f6tRULr7dyN2gvJMpV1+gnWcKMO2e9tb6DnHdLd/cCAYB3W8QYUjv2Z6FOsUSqS0om3EvyQtIE2V42/IRpRh/PJGNrfBJGut4CSvy3DzzXDAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718175636; c=relaxed/simple;
	bh=AtbcNm6/nYW0sSNz4mBUhJriOMUPEe+fzfqGK4dS9xI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rvFqzdEXxlY5+FzHEa0dvvPFIwxw5TQs80Qd+6YWspKfP8MZvc1Eye819vY7uX5Zt0L83m74T7L5Xr6azYtsMlAiqERapbJbZ/6rBsv6Pna+uZ2bVtvoNELnkcPJqx1lY2AzaeBvx2Y6//dZaVtQAppWjfnUUBjW/yd2RgnUC3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=MMNnY9J+; arc=none smtp.client-ip=62.149.156.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Received: from [192.168.1.56] ([79.0.204.227])
	by Aruba Outgoing Smtp  with ESMTPSA
	id HHv8saXtAqLIyHHv8sEPCA; Wed, 12 Jun 2024 08:57:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1718175443; bh=AtbcNm6/nYW0sSNz4mBUhJriOMUPEe+fzfqGK4dS9xI=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=MMNnY9J+FVmps1XHtQ19bcoAAOwcXBo8R3GJaexoXhr4qU1YlsD5HAlrZo12CLDBG
	 NQ1XMqizg/sWkHXblaXNq4RYNi5lU1+gA1Ri3KB8deJ0gcMtKAVgN1x2+eLeatU3Bl
	 1TU/qTwWWNJHuiBaor9tcfRqK48q8p1tGhyX5u1hKgO1HiOxakLJGQMnLTgmpvG7a9
	 XtggOByJnzMEIB3LehxId3kSkHzo4zX97Mlh3Mb2RBvWw07hsp5O/pDgFsPIQBvRzo
	 nroyD7AHrIhy7/1bcs1LHN2mbSjxxkNl4ecgLruc+jqwfLBNV+EMvGHDfdPGxmi1SU
	 vNgGllRxdkryQ==
Message-ID: <9cd3e304-48d7-4a69-a70c-8937dcb62a08@enneenne.com>
Date: Wed, 12 Jun 2024 08:57:21 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/3] ABI: pps: Add ABI documentation for Intel TIO
To: Randy Dunlap <rdunlap@infradead.org>, lakshmi.sowjanya.d@intel.com,
 tglx@linutronix.de, corbet@lwn.net, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
 eddie.dong@intel.com, christopher.s.hall@intel.com, pandith.n@intel.com,
 subramanian.mohan@intel.com, thejesh.reddy.t.r@intel.com
References: <20240612035359.7307-1-lakshmi.sowjanya.d@intel.com>
 <20240612035359.7307-4-lakshmi.sowjanya.d@intel.com>
 <8b66c491-ec6a-430f-8566-114372151c3a@infradead.org>
From: Rodolfo Giometti <giometti@enneenne.com>
Content-Language: en-US
In-Reply-To: <8b66c491-ec6a-430f-8566-114372151c3a@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFygZQhLsm+uwPE8FCAvvBLDz3F34gfCsP0Ff9On4pSYIEZPA+2S3YTw3CohXQmHvVAzZU/KHsY4MZoZCjd++YVqQGbrZo4irbSmOVgjOZkM0bsy5xNO
 1m/xKa3J92m1JeVQRBomLb+nVDSLwoEoNm0expMjf/HKDIBzqsvdFRYpprnzg+xpBb/kalnLSDsgCEZPN5ZWnL+xochVTS35jl1IwoaCRbaLCRRptNjnAYbs
 HyfC5CUqNt+/x/9PWdU+pKuKYQ7ZMPHx44cDrLN4Pecp9DU7sfnaelFt9Wziv/4jaywMLT9gj4gTd1kO6BxpN14oWAVmvu81Vr0jExDPjA8dibcILxE7Nwzh
 5QhirSiUgpDsZR7MCzca1ULYBOCBxcgC7QsJptbr6cVuw3cnkc9ayEqF3QWTNfytsQ76fYl6SPyzIX42SrcJTWuP/lUFvkEUU0CTVvlgD+iiuIwT3tg1xAH4
 +xIeiCA9o45ASvmMRrKTX53v+r08DJwKCnbFMTtWnu7Se33GtSzVVmH/3vrQsTCETdDP9z3DUCCcuQ5JcimuvDuc5TwuehZxBBaTKe8Rv3WZXOwedDMp4hr1
 dSdTFHDhRG05m96skxJbHyB9hXTlU+OxZmF6GmbrLiCRqV5tp+CxJVSdOTzynF+nCDw=

On 12/06/24 06:29, Randy Dunlap wrote:
> Hi--
> 
> On 6/11/24 8:53 PM, lakshmi.sowjanya.d@intel.com wrote:
>> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>>
>> Document sysfs interface for Intel Timed I/O PPS driver.
>>
>> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>> ---
>>   Documentation/ABI/testing/sysfs-platform-pps-tio | 7 +++++++
>>   MAINTAINERS                                      | 1 +
>>   2 files changed, 8 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-platform-pps-tio
>>
>> diff --git a/Documentation/ABI/testing/sysfs-platform-pps-tio b/Documentation/ABI/testing/sysfs-platform-pps-tio
>> new file mode 100644
>> index 000000000000..e461cea12d60
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-platform-pps-tio
>> @@ -0,0 +1,7 @@
>> +What:		/sys/devices/platform/INTCxxxx/enable
>> +Date:		September 2024
>> +KernelVersion:	6.11
>> +Contact:	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>> +Description:
>> +		(RW) Enable or disable PPS TIO generator output, read to
>> +		see the status of hardware (Enabled/Disabled).
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index aacccb376c28..9c623f167aa9 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -17946,6 +17946,7 @@ M:	Rodolfo Giometti <giometti@enneenne.com>
>>   L:	linuxpps@ml.enneenne.com (subscribers-only)
>>   S:	Maintained
>>   W:	http://wiki.enneenne.com/index.php/LinuxPPS_support
> 
> I can't connect to (load) that web page above (wiki...).
> Is it correct? Does it work for other people?

The LinuxPPS wiki is at http://linuxpps.org

>> +F:	Documentation/ABI/testing/sysfs-platform-pps-tio
>>   F:	Documentation/ABI/testing/sysfs-pps
>>   F:	Documentation/devicetree/bindings/pps/pps-gpio.yaml
>>   F:	Documentation/driver-api/pps.rst
> 

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming


