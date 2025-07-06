Return-Path: <linux-doc+bounces-51845-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BB7AF6FA3
	for <lists+linux-doc@lfdr.de>; Thu,  3 Jul 2025 12:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6E284A69F8
	for <lists+linux-doc@lfdr.de>; Thu,  3 Jul 2025 10:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898372E03F6;
	Thu,  3 Jul 2025 10:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NIPn3QJC"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74B8233712
	for <linux-doc@vger.kernel.org>; Thu,  3 Jul 2025 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537029; cv=none; b=gvrHq/RVQexYjPvHd4nreAXcATqRhPF/TAEBvuAsONKxcdoSUTdZeyGiXyGWMLbVKXmIQ4Tz+NbLYJtJ20CM/NYaFjZ+P06mw63ONdnZvYlRaJ8ZeeJ0F49sy31Ogxrl9tfs+0zSrRHZg1sVevtYSU/vxdUua9p5SDNaefHZE24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537029; c=relaxed/simple;
	bh=t2jpb7/Z5KgiLlt/9TEa+jgLsbUjBOFYGE/Oo12VC6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iWzFeTj03mgb2XPjybQGc31fO2RTQU7sIzUJUCRR4gLFdlbX4O11oT0dzKdqbV/iyZG5gIFHgp9eW6QAsa5Jk9+iJCGSZKksiAl6zPjSPx7ncnL7tWNst+Jxsn0XSFnMl/7Seul8ivtTa085FjGlqkeLc0hxkKpBcX1Ja7X19G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NIPn3QJC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751537026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9B3ihYuWOeAFzcnls83zQtIbBYRAt2J+SrasgFV6Zjc=;
	b=NIPn3QJCLxwNLEFzKYPs8L1zpAMa4pPW9H6qaAXU78QP8kzBwm/iUpXMM3mbJE1bgmyUWg
	LyFy27BKHHEV7B0jQJ4S49snBalZW+CYMyNK7JsloWiBZCyhhbpJ308qBeAtVzFfZNXKV3
	R9MY1pTFGOlVAxaVsM61tDdhvO0gCtA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-qgZLjwNIPiWT7qXUoCFtWg-1; Thu, 03 Jul 2025 06:03:45 -0400
X-MC-Unique: qgZLjwNIPiWT7qXUoCFtWg-1
X-Mimecast-MFC-AGG-ID: qgZLjwNIPiWT7qXUoCFtWg_1751537024
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3b20f50da27so412714f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 03 Jul 2025 03:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751537024; x=1752141824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9B3ihYuWOeAFzcnls83zQtIbBYRAt2J+SrasgFV6Zjc=;
        b=d3ucpcicObf8z+rcD+egC4pbO5Bz0ZBB2kVT7xvUXxzLMLBuSZYUP9CmIye3fKit+E
         55G0cIfR6RTj2SKHu9rZfAgv/1LY12qMS6Ff0qPAKiC3FEjz8H73jK2a0UHLWQkZXeLN
         2iYmk8flUZg/O2hDRDaiPQeq2wdBAt5mgiS19BQGOqSlJmKoEcMaRgkGSfkFYZotZgC5
         v+kSXNXwAcZCn4gkiZdX0iAe0MIvXDygShI4B+Ag1E5TpJp9DmLZ2lx1c4FQ37HWucdZ
         Vvl/ksKhWWye/iruf9x2yLEBhB1DbakJ0hIFK58kfyzfwXGVhKz5bbBBKCBuZ74NH5u3
         Mvng==
X-Forwarded-Encrypted: i=1; AJvYcCX6DuOmZS2jgC36C3tfLLY/N3U2DtStlis+pKXIZL8wE/z9CK62xhRcpGLleV69JxZUvsGk5bP6M4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDEaOtYrOwtQNq3NssI2GubY3cOR0azmH6L22pdPv4fNEszQ9U
	eYraxWrvWoUbarJYSHwpAwurb6pTBF1iCmojAZ+kV0A3dKA7zVbjDmcUnS8AgseVP0yP/vLsWo5
	JlfZkO0jx3VRXFOOi/O6jgNCtfOQbHbUvr6w7j8Zf5AbwJYWtNV9f4H7jdbGGGA==
X-Gm-Gg: ASbGncuut9vwlWKc1vgY0eqBxOrPLmXT8RvBCWjJeMmOSTlN0jgTggtfOWfl+WMsgjB
	B/agWtIlynhVtG2E2qQaZGpFB2VkgN2bkfZ/ZYYQs0aMGtRrfRpil1wS6D+BJNuM/W4FwK0dexl
	IPvVNEXe6kwuipsTyi1ugWqatmRat8vGcvfPWdMCmfT9lCevhTASBALp+O6u2ShTUrqebVUVsk/
	Dr5WqxxX2gvL730a3yugJ/iGFxHPoya3KVzKn4UBi4gPaqvGn9q/E5ERTxR0OzbzYTzdAGsOOmL
	9AmzgqDIoFl2d8tXHW9CKeFjFZlo2nFQ5tyUYhKjaiqZgTlQ+AK8dP5kBFrW7/wHXlI=
X-Received: by 2002:a05:6000:2207:b0:3a5:8934:4959 with SMTP id ffacd0b85a97d-3b3450a2240mr1717361f8f.27.1751537024204;
        Thu, 03 Jul 2025 03:03:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk+YmnervE/9rlaKNpBDo2E1RoLkBUfVqR7jtbbm8XVo68a+HMCOaP16O0KFNsHAN0CxbnUw==
X-Received: by 2002:a05:6000:2207:b0:3a5:8934:4959 with SMTP id ffacd0b85a97d-3b3450a2240mr1717328f8f.27.1751537023692;
        Thu, 03 Jul 2025 03:03:43 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314? ([2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3aba76e40c0sm14156922f8f.59.2025.07.03.03.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 03:03:43 -0700 (PDT)
Message-ID: <56cb86e1-db38-43c9-857b-f14bb4a5ecd8@redhat.com>
Date: Thu, 3 Jul 2025 12:03:41 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5 0/4] net: phy: bcm54811: Fix the PHY initialization
To: =?UTF-8?B?S2FtaWwgSG9yw6FrICgyTik=?= <kamilh@axis.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, andrew+netdev@lunn.ch,
 horms@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20250701075015.2601518-1-kamilh@axis.com>
 <20250702150216.2a5410b3@kernel.org>
 <da323894-7256-493d-a601-fe0b0e623b00@broadcom.com>
 <b89e3a66-3c98-45b3-9f16-8247ac1dc1f4@axis.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <b89e3a66-3c98-45b3-9f16-8247ac1dc1f4@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/3/25 11:03 AM, Kamil Horák (2N) wrote:
> On 7/3/25 01:46, Florian Fainelli wrote:
>> On 7/2/25 15:02, Jakub Kicinski wrote:
>>> On Tue, 1 Jul 2025 09:50:11 +0200 Kamil Horák - 2N wrote:
>>>> PATCH 1 - Add MII-Lite PHY interface mode as defined by Broadcom for
>>>>     their two-wire PHYs. It can be used with most Ethernet controllers
>>>>     under certain limitations (no half-duplex link modes etc.).
>>>>
>>>> PATCH 2 - Add MII-Lite PHY interface type
>>>>
>>>> PATCH 3 - Activation of MII-Lite interface mode on Broadcom bcm5481x
>>>>     PHYs
>>>>
>>>> PATCH 4 - Fix the BCM54811 PHY initialization so that it conforms
>>>>     to the datasheet regarding a reserved bit in the LRE Control
>>>>     register, which must be written to zero after every device reset.
>>>>     Also fix the LRE Status register reading, there is another bit to
>>>>     be ignored on bcm54811.
>>>
>>> I'm a bit lost why the first 3 patches are included in a series for net.
>>> My naive reading is we didn't support this extra mode, now we do,
>>> which sounds like a new feature.. Patch 4, sure, but the dependency
>>> is not obvious.
>>
>> I don't see the dependency either, at least not in an explicit way. 
>> Kamil, could patch #4 stand on its own and routed through "net" while 
>> patches 1-3 are routed through "net-next"?
> It can be done this way, however, even the patch #3 is effectively a 
> fix, not new feature, because the bcm54811 PHY in MLP package only has 
> MII-Lite interface available externally. As far I know, there is no BGA 
> casing available for bcm54811 (unlike bcm54810, that one having both MLP 
> and BGA). Thus, it cannot function without being switched to MII-Lite 
> mode. The introduction of MII-Lite itself is clearly a new feature and 
> it is even (theoretically) available for any MII-capable PHY. So if 
> putting it all to net it is really impossible or contrary to the 
> net-next vs. net selection rules, let's divide it....
> To get fully functional, bcm54811-based networking, all patches are 
> necessary so any other user out there must wait for both branches to join.

The above makes sense to me, but I think it would be nice to capture
some of this info in the cover letter - the fact that many people were
confused by the series is an hint the info was indeed missing and required.

Please resubmit with an extended cover letter, thanks!
(unless Florian jumps in and explicitly asks for something different :-P)

Paolo


