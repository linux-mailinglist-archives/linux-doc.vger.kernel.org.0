Return-Path: <linux-doc+bounces-17158-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF438D30D7
	for <lists+linux-doc@lfdr.de>; Wed, 29 May 2024 10:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AE961F2787B
	for <lists+linux-doc@lfdr.de>; Wed, 29 May 2024 08:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525211836CA;
	Wed, 29 May 2024 08:10:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F140169AC6
	for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716970226; cv=none; b=ckcs52luZRoWEVRhTwZI1POdd0DiWTwSpVxT3XbPhVFI/wPmqIKFQ9EZIaOSFSL5iqyBnTXzS1GmJQ/kvUNBBfuHdjFvq3ZSniM9oJWSuLghY2fDOz7bI+vMEid+9OqPylIZqY/GKlDuDwatn9m2XilOI0qECyThOHdfrj0qCcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716970226; c=relaxed/simple;
	bh=6w01DwTDwkZFJqJPu1bFkv4UoLONV6Hg/yhfFRYmO/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rhD9AVnG2jwV0q0VIKvH9j/rM8HgIKacmYCd3W6dD4cVDERzJBtJfMIxHcCZHiCFOZi3MhhteVThpD630/J4llsPkKjGLEfSVdfZg4owhxRXQ2CZuIksG7WjR/UDNE/iGvVxeUse+wR/x1nvzfvJIR5TX7Qsf+1cHNfPZFBeHos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1sCENs-0002yS-5j; Wed, 29 May 2024 10:10:08 +0200
Message-ID: <ba112552-deaa-456d-95b4-af213db37dbc@pengutronix.de>
Date: Wed, 29 May 2024 10:10:06 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: crypto: async-tx-api: fix broken code example
To: Andre Noll <maan@tuebingen.mpg.de>
Cc: Dan Williams <dan.j.williams@intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>,
 Maciej Sosnowski <maciej.sosnowski@intel.com>,
 Andre Noll <maan@systemlinux.org>, linux-crypto@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
References: <20240523-async-dma-docs-v1-1-b900e0804e11@pengutronix.de>
 <Zk9P3ITcqc-9EhZp@tuebingen.mpg.de>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Zk9P3ITcqc-9EhZp@tuebingen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

Hello Andre,

On 23.05.24 16:17, Andre Noll wrote:
> On Thu, May 23, 15:18, Ahmad Fatoum wrote
>> The code example fails to compile:
>>
>>   1) ddr_conv is defined twice, once as a VLA, which have been phased out
> 
>        addr_conv
>>
>>   2) submit is not a pointer, but is still dereferenced with ->
> 
> 3) The first call to async_xor() lacked the trailing semicolon.
> 
>> Fix these issues and while at it, make the functions static as users
>> are unlikely to export them.
> 
> No objections, but please don't consider me authoritative. Two nits
> below, FWIW.

Oh, thanks for catching these. I just sent a v2 with your feedback
incorporated including the nitpicks.

Cheers,
Ahmad

> 
>> --- a/Documentation/crypto/async-tx-api.rst
>> +++ b/Documentation/crypto/async-tx-api.rst
>> @@ -150,38 +150,38 @@ of an operation.
>>  Perform a xor->copy->xor operation where each operation depends on the
>>  result from the previous operation::
> 
> Maybe add
> 
> #include <linux/async_tx.h>
> 
>>  
>> -    void callback(void *param)
>> +    static void callback(void *param)
>>      {
>>  	    struct completion *cmp = param;
>>  
>>  	    complete(cmp);
>>      }
> 
> This could be simplified to
> 
> static void callback(void *param)
> {
> 	complete(param);
> }
> 
> Best
> Andre

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


