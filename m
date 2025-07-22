Return-Path: <linux-doc+bounces-53784-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41394B0D72F
	for <lists+linux-doc@lfdr.de>; Tue, 22 Jul 2025 12:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2748B188DCA0
	for <lists+linux-doc@lfdr.de>; Tue, 22 Jul 2025 10:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E607819DF62;
	Tue, 22 Jul 2025 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iQ3EoUxg"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25C115748F
	for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753179440; cv=none; b=Y+e2H18bIk4TtMStxpTlAolf61G8RsEamc6hTYy2lTx831u4cSjSlpQeCRkBdSxm6qtgou2KSeb406qHr5/LH8/Z3ghINgDUNuI9rDm3cBkFRl9noEoV4UOnhvY3mz+EnMHHSOzb6gy0HP9+8C8aoWtwRK3kKYWmIl85RlpZR1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753179440; c=relaxed/simple;
	bh=8zuS2Vzm+tEOQV4oYYQFSbyQSMoniG/oIs0YaI2b90M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSEFoIREO9YT6OUMxCGNdsJMFVHDscBBRyjhEk+mgL/+lH/Q7tmpHGOClxJJ2/WMvWaNgCwdDybu8Cxee7RzkROgIY9FCYqpSfbKjcj8Iup1u+jA+NOREmQqrT9MTphp0M0rQYEuc5TRPzVJvwy7SzG6ciR3788slKLxuiKRfL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iQ3EoUxg; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <60ac707f-b57b-4f31-8c54-b59e75200181@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753179426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tAK/szCwAUl9Nc/zNWVtzXtl2k6tosWPZ26fi0u2HZA=;
	b=iQ3EoUxg3VOUDHLv+lwTX/EjNWg7DAPbM3lfuvAwsE/IqEDS1E4TCxigwbP26N9AOtdrkn
	GHjtikCGMqUbCVjzpGOBqJnwk+o8t17ua6t0c+95gqEqNFPbBEpgDKI+JuOD8jQ1GalGQF
	HGOcwfbKtZS6NS0Gvl2njHNRJ6CYPhQ=
Date: Tue, 22 Jul 2025 11:17:03 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 01/15] net: rnpgbe: Add build support for rnpgbe
To: Yibo Dong <dong100@mucse.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 gur.stavi@huawei.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 danishanwar@ti.com, lee@trager.us, gongfan1@huawei.com, lorenzo@kernel.org,
 geert+renesas@glider.be, Parthiban.Veerasooran@microchip.com,
 lukas.bulwahn@redhat.com, alexanderduyck@fb.com, richardcochran@gmail.com,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250721113238.18615-1-dong100@mucse.com>
 <20250721113238.18615-2-dong100@mucse.com>
 <32fc367c-46a4-4c76-b8a8-494bf79a6409@linux.dev>
 <D6DDF24A13236761+20250722030245.GA96891@nic-Precision-5820-Tower>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <D6DDF24A13236761+20250722030245.GA96891@nic-Precision-5820-Tower>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 22/07/2025 04:02, Yibo Dong wrote:
> On Mon, Jul 21, 2025 at 02:30:40PM +0100, Vadim Fedorenko wrote:
>> On 21/07/2025 12:32, Dong Yibo wrote:
>>> Add build options and doc for mucse.
>>> Initialize pci device access for MUCSE devices.
>>>
>>> Signed-off-by: Dong Yibo <dong100@mucse.com>
>>> ---

[...]

>>> +
>>> +struct mucse {
>>> +	struct net_device *netdev;
>>> +	struct pci_dev *pdev;
>>> +	/* board number */
>>> +	u16 bd_number;
>>> +
>>> +	char name[60];
>>> +};
>>> +
>>> +/* Device IDs */
>>> +#ifndef PCI_VENDOR_ID_MUCSE
>>> +#define PCI_VENDOR_ID_MUCSE 0x8848
>>> +#endif /* PCI_VENDOR_ID_MUCSE */
>>
>> this should go to include/linux/pci_ids.h without any ifdefs
>>
> 
> Got it, I will update this.

As Andrew said, my suggestion is not fully correct, if you are not going
to implement more drivers, keep PCI_VENDOR_ID_MUCSE in rnpgbe.h but
without #ifdef


>>> +
>>> +#define PCI_DEVICE_ID_N500_QUAD_PORT 0x8308
>>> +#define PCI_DEVICE_ID_N500_DUAL_PORT 0x8318
>>> +#define PCI_DEVICE_ID_N500_VF 0x8309
>>> +#define PCI_DEVICE_ID_N210 0x8208
>>> +#define PCI_DEVICE_ID_N210L 0x820a
>>> +
>>> +#endif /* _RNPGBE_H */
>>
>> [...]
>>


