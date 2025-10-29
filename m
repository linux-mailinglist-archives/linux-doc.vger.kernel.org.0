Return-Path: <linux-doc+bounces-64963-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 31403C1BC21
	for <lists+linux-doc@lfdr.de>; Wed, 29 Oct 2025 16:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7E4AA5A5F1B
	for <lists+linux-doc@lfdr.de>; Wed, 29 Oct 2025 15:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EE82F1FEF;
	Wed, 29 Oct 2025 15:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mm1AyMC4"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162982EBB86
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 15:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761750045; cv=none; b=ODSpRtPo2AhRsFKheO7l22NVSBaRSm95VKp2Gtbc8PGhz3ds1tK9LrdShFtr8E5IjHhSMVs68Kdz0xY6GTiyYJLI4v0nriJMMYeUY/iLyyebslqDAqkhRg+so0c0Yke9zZVUrmn8umPF0SLBCFdCelWU4twlN+tAoVifsn3RqVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761750045; c=relaxed/simple;
	bh=+tlRYDhwKjnWGU2DM6wmocuZ6nd/UXarWG9O3eba0S4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBin95JjnGvrNISWyykbVF1bCiUzR9OFC1N7xOfiIiN5fSAahZkpucQgcLYszhTaLEmUURyYmWig7N5sb/cGDM6upXP1GtuqBqQtae8E6RwnhACsJP/l5fj/G01bBCqwng8lAQlhiG42zHvoCe6cIpH8szy//IUj7szUCotQ9QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mm1AyMC4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761750043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/lje2qSf9aCISv8IiiVymSF9NXLzc82e4gvzdRzncDM=;
	b=Mm1AyMC4qlZXB6QbPaN+711xgFR1lJURUcrv89hR6WR0VJ1/yLExdht4SQV9f24a+pNkpq
	EVNBRTMLsAallpoQA0a5l7TM69JyO1UuQzfexu0KRS7Iw07mSmOJyNNM+yo0d4OGnETdzD
	hTcvbqT610Tl9btem5dIivNF2UiK/dA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-629-ADxkmCSCO4ar-tY2CUo5Jg-1; Wed,
 29 Oct 2025 11:00:37 -0400
X-MC-Unique: ADxkmCSCO4ar-tY2CUo5Jg-1
X-Mimecast-MFC-AGG-ID: ADxkmCSCO4ar-tY2CUo5Jg_1761750034
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 084EA180A22A;
	Wed, 29 Oct 2025 15:00:33 +0000 (UTC)
Received: from [10.44.34.31] (unknown [10.44.34.31])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3217F19560AD;
	Wed, 29 Oct 2025 15:00:27 +0000 (UTC)
Message-ID: <10e525df-cd38-464a-8df5-ec59100ba40e@redhat.com>
Date: Wed, 29 Oct 2025 16:00:26 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] dpll: add phase-adjust-gran pin attribute
To: Jiri Pirko <jiri@resnulli.us>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 Michal Schmidt <mschmidt@redhat.com>, Petr Oros <poros@redhat.com>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251024144927.587097-1-ivecera@redhat.com>
 <20251024144927.587097-2-ivecera@redhat.com>
 <20251028183919.785258a9@kernel.org>
 <b3f45ab3-348b-4e3e-95af-5dc16bb1be96@redhat.com>
 <jgebk37r4xs6w4526hjc5u6r7oudanb5ce7v4xlaw2tcswtycx@cvmxkwxvkpek>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <jgebk37r4xs6w4526hjc5u6r7oudanb5ce7v4xlaw2tcswtycx@cvmxkwxvkpek>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12



On 10/29/25 3:20 PM, Jiri Pirko wrote:
> Wed, Oct 29, 2025 at 08:44:52AM +0100, ivecera@redhat.com wrote:
>> Hi Kuba,
>>
>> On 10/29/25 2:39 AM, Jakub Kicinski wrote:
>>> On Fri, 24 Oct 2025 16:49:26 +0200 Ivan Vecera wrote:
>>>> +      -
>>>> +        name: phase-adjust-gran
>>>> +        type: s32
>>>> +        doc: |
>>>> +          Granularity of phase adjustment, in picoseconds. The value of
>>>> +          phase adjustment must be a multiple of this granularity.
>>>
>>> Do we need this to be signed?
>>>
>> To have it unsigned brings a need to use explicit type casting in the core
>> and driver's code. The phase adjustment can be both positive and
>> negative it has to be signed. The granularity specifies that adjustment
>> has to be multiple of granularity value so the core checks for zero
>> remainder (this patch) and the driver converts the given adjustment
>> value using division by the granularity.
>>
>> If we would have phase-adjust-gran and corresponding structure fields
>> defined as u32 then we have to explicitly cast the granularity to s32
>> because for:
> 
> I prefer cast. The uapi should be clear. There is not point of having
> negative granularity.
> 
> 
I will use u32 for phase-adjust-gran and dpll_pin_properties.phase_gran.

OK?
>> <snip>
>> s32 phase_adjust, remainder;
>> u32 phase_gran = 1000;
>>
>> phase_adjust = 5000;
>> remainder = phase_adjust % phase_gran;
>> /* remainder = 0 -> OK for positive adjust */
>>
>> phase_adjust = -5000;
>> remainder = phase_adjust % phase_gran;
>> /* remainder = 296
>> * Wrong for negative adjustment because phase_adjust is casted to u32
>> * prior division -> 2^32 - 5000 = 4294962296.
>> * 4294962296 % 1000 = 296
>> */
>>
>> remainder = phase_adjust % (s32)phase_gran;
>> /* remainder = 0
>>   * Now OK because phase_adjust remains to be s32
>>   */
>> </snip>
>>
>> Similarly for division in the driver code if the granularity would be
>> u32.
>>
>> So I have proposed phase adjustment granularity to be s32 to avoid these
>> explicit type castings and potential bugs in drivers.
> 
> Cast in dpll core, no?
Depends... if the driver will use s32 (sse patch 2) then no castings are 
necessary.

Thanks,
Ivan


