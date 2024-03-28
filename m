Return-Path: <linux-doc+bounces-12529-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E620C88673D
	for <lists+linux-doc@lfdr.de>; Fri, 22 Mar 2024 08:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 166F71C23917
	for <lists+linux-doc@lfdr.de>; Fri, 22 Mar 2024 07:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE80134DE;
	Fri, 22 Mar 2024 07:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EJUGrPDC"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CAE12E7D
	for <linux-doc@vger.kernel.org>; Fri, 22 Mar 2024 07:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711091019; cv=none; b=mmTbbkyNGhh6GXywPuNCn7jW1YXu1mR+TEnW825E4PNX1AHNHItXR8YvXU1/uN7J6IfZwtx2SPx6uxCn6ETypgzLSAXGt7DdfO41k3FwlinCqyat2e0yJk9aOUKRS+aNfvyrmGr1C+rKCQW8R+5pulEKb2aqxeAMMCvXQEcEN30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711091019; c=relaxed/simple;
	bh=Gm4HQ16RBPvPfatmp7c0shn/vD8w4u3ZtkmuXFHGIn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D3KPZfULZAZHbGaq1X++hIO5m7Cj/Z/lW8LnvsN6jJmsLXwyKBYkarIFoR1GXMN8wtkfxXGUs2Ef2OxIBIw5anMtgLi4lBLCyiYW2VDjPhojBdpcyFQCX58X81cXW2T2+1LrF9BOZWEdbOIpj1eIxX6ZittM36A/sU+gCNOrGP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EJUGrPDC; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a44665605f3so207419666b.2
        for <linux-doc@vger.kernel.org>; Fri, 22 Mar 2024 00:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711091016; x=1711695816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LXNLeKIT8taWhEs33wdn5uePjNzLjGrZtZNh/bncN3g=;
        b=EJUGrPDCX0vZPmHcoWIEuw2hLzf+Rucs5SkF23lnzSIMAiiA/hEwk6wR6vAhlHg4zC
         lZoJ1R66y7Qh93cx7zTPvDxdew7jPH2zzOm/KNpljyE/5ir+8TqfaotM+svoSTt0QzbD
         gMavDI0e/CBqC0mtu2/i5DFJZLcblKQwR47YO/LkGz666XBgCAtSMrLJK0cl22OiZOm0
         I/gC6GCZGdWHZw4YdYS3KcIre1qVctGKzLPuhqL6lkwCW/9zyNvDsG7qy/jhVHcDZCsR
         nuQvyrwzSC6GYytop8e5y8DHsOvQ5nxemCyANyCzj43WP+/Xc6z2mD6a4d8PwaYVhexf
         fSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711091016; x=1711695816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXNLeKIT8taWhEs33wdn5uePjNzLjGrZtZNh/bncN3g=;
        b=k8tvH7iSGNtAmg1ZZhS8LhhpRlXE8IXsgfOJJbm+TssbzChZy5A+1Jd6Cml7nIZCci
         YsAWYEP7vvfpNKo11+vMG9UKhvluMZthPWCPbC9JKOba6o2LTBBzjrdZqNX8MC4R6NBW
         hOtcUmDbVL9f79ze+gYbu9taF3C/uaoIS47mQeWuhZs80pIGQsxWJ8b4MeARSm7pLFmL
         wqCq52Njpl4Zo7Iw+yPUkBl3dZSLUHpzsx4GVsotFKcOmS9edVpVfatqC0Ad/eUCytEl
         /x3Y/9sGI38PjpVJYGmcy7qoqk/JO+14l/fjAcE9NsHMWIATjg9ShKZOGbNXtktbXj52
         CdxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYRc60jLZ1v+oopAKgWlhjf4FCvGsJcrNMIZFrkngMEJiPCJ3nDg30+a+mzhrspf0FH4nVykOl9MdKuV8qo/vc23zSZPcnVCnW
X-Gm-Message-State: AOJu0YzjkNwE+GNE6mZHyGWEA1RcLmOPZ/OimWZsyLukiwSGQgw3Hxq0
	/vzgdS+4mDJDa77xOwbIAKLD0AXrKctwsUJKUbs5E2BGFcqfjrJpS/JegmTnUO8=
X-Google-Smtp-Source: AGHT+IG1FC4sG/jg28gpKIR2D7mEB8yvJgs4MCcgPYON1VZYX4TY5uTV0YSg8hzeAsBv/RB5nvTmLw==
X-Received: by 2002:a17:906:b2c7:b0:a46:faa7:d014 with SMTP id cf7-20020a170906b2c700b00a46faa7d014mr979992ejb.9.1711091016580;
        Fri, 22 Mar 2024 00:03:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id a22-20020a170906245600b00a46ee3c31afsm696562ejb.154.2024.03.22.00.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 00:03:35 -0700 (PDT)
Message-ID: <d41a53bd-ea1e-476a-a18c-ed51dbac0a98@linaro.org>
Date: Fri, 22 Mar 2024 08:03:33 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 12/12] dt-bindings: net: add Microchip's
 LAN865X 10BASE-T1S MACPHY
To: Parthiban.Veerasooran@microchip.com, conor@kernel.org
Cc: andrew@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, saeedm@nvidia.com,
 anthony.l.nguyen@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, Horatiu.Vultur@microchip.com,
 ruanjinjie@huawei.com, Steen.Hegelund@microchip.com,
 vladimir.oltean@nxp.com, UNGLinuxDriver@microchip.com,
 Thorsten.Kummermehr@microchip.com, Pier.Beruto@onsemi.com,
 Selvamani.Rajagopal@onsemi.com, Nicolas.Ferre@microchip.com,
 benjamin.bigler@bernformulastudent.ch
References: <20240306085017.21731-1-Parthiban.Veerasooran@microchip.com>
 <20240306085017.21731-13-Parthiban.Veerasooran@microchip.com>
 <20240306-spree-islamist-957acf0ee368@spud>
 <4c5968a3-c043-45fc-8fff-2a9eaa6de341@lunn.ch>
 <20240306-ripeness-dimple-e360a031ccde@spud>
 <05a9a7ee-e4f0-443e-9c8a-8ee649a11448@microchip.com>
 <2f384a54-74a0-4a75-a325-8985257b5d66@linaro.org>
 <ba37c212-fb98-407d-9bee-6d14801754d9@microchip.com>
 <96493beb-afbf-42f2-88f0-ad645422ecdb@linaro.org>
 <1735add6-4a6a-452b-bf26-1cf19c95493e@microchip.com>
 <20240321-upcountry-finless-b0e9b1ab4deb@spud>
 <13a28ba3-2da4-428c-8091-25e75c6c11e8@microchip.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <13a28ba3-2da4-428c-8091-25e75c6c11e8@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/03/2024 07:25, Parthiban.Veerasooran@microchip.com wrote:
>>> properties:
>>>     compatible:
>>>       oneOf:
>>>         - items:
>>>             - const: microchip,lan8651
>>>             - const: microchip,lan8650
>> No, this is not right either. You need to also allow the lan8650 on its
>> own. All you had to do with the original items list was flip the order
>> of the lan8650 and lan8651.
> Ah ok, now I understand this. Then it is supposed to be like below,
> 
> properties: 
> 
>    compatible: 
> 
>      oneOf: 
> 
>        - const: microchip,lan8650 
> 
>        - items: 
> 
>            - const: microchip,lan8651 
> 
>            - const: microchip,lan8650
> 
> Executed dt_binding_check with the above update and it was successful. 
> Hope this is OK?

This is the third time you ask us. None of the previous cases were
actually tested. Maybe this one was, maybe not. I assume the latter.

First, test your code.

Best regards,
Krzysztof


