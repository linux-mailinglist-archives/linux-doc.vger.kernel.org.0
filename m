Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFDAF20B8FE
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2020 21:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgFZTFT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Jun 2020 15:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgFZTFR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jun 2020 15:05:17 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474C5C03E979;
        Fri, 26 Jun 2020 12:05:17 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id h4so10932336ior.5;
        Fri, 26 Jun 2020 12:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=liMltOM0SM3D6vl3HMgptm6OHlaJ5OZbEc9z9zCU6s8=;
        b=afLbQh7mGvHfjLQ1zpg9eY/B+M/3Og37b/DXOBVRfhlL2i2IMZ/2OKknw6moyXQmue
         PYw+s5Utc/Uxz0ojI2WxBbMyNIMBwSMOOW0JiwlKAgBRW7eJORKDeA55ABzPDuhuwZkt
         mHHWTkegig7EO+y9yMcXDLc2eJWE8JDZYsEVWpc3Ln5tdQzN4ZbeouxFiLqEUU1vwZ8K
         zvVpHH+Q8RXwQXxs4hJiUuoIBBYx3tlo9DtFrwC76gMkwuwSokMrhIxwgNxpbHUHQ5h4
         kb1O/7EG/cha03X1dM+6IhBXI9brfX7xuchmJ5c56AVuSmmz1FPbHXRXwK5ylugUBuzP
         yO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=liMltOM0SM3D6vl3HMgptm6OHlaJ5OZbEc9z9zCU6s8=;
        b=tIMuMq1dzcRwOlXaSCMeAVGLluHsaIa/5EXjcud5eZAZTCRScfY/qlUH8nLSAunoyt
         OhL/cPNxWw0wpNE16LShe7MR+urkHtotAMo49m6qelfEM/Z60wPScAu9lM+gKitcdXIF
         Aa6bo+sbQgeTdyg3LhRgGEJzMuxFxduAKKljTjWAvR7zbOgYGRkeIPZJYOgX7v/p9cjj
         Rf35tOs+KT1lz5FvPppY5Gu6KMLIO5Tplx1crpUia3Fj5V5x6EIQ4y+07f8kMasp2OZe
         3/9wuya2w88PV5BhSYIR8GhdM+sd3u6kQ0T29exdZLKygoe4TwIu8WJtQzbK6O2rjI5V
         MnIQ==
X-Gm-Message-State: AOAM533Cxy3+9Lw3Qfi24ugVpgUxjLeqtCGkiR0n/AoHUgpDUnLwqp0n
        GOYi8fxdG2J/CQyaIx87LKBfWt3E
X-Google-Smtp-Source: ABdhPJyw1AUnf5mM3AmYeEE8DUABbkwxMno1ViJ5f4iHtxw5v/sPSYpz0yjx2iNQP22uFQlZRKe9Kw==
X-Received: by 2002:a5d:8f04:: with SMTP id f4mr4919337iof.33.1593198316353;
        Fri, 26 Jun 2020 12:05:16 -0700 (PDT)
Received: from [10.67.50.75] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id k3sm11502176iot.42.2020.06.26.12.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 12:05:15 -0700 (PDT)
Subject: Re: [EXT] Re: [PATCH net-next v3 4/7] net: phy: add backplane kr
 driver support
To:     Florinel Iordache <florinel.iordache@nxp.com>,
        Andrew Lunn <andrew@lunn.ch>
Cc:     "davem@davemloft.net" <davem@davemloft.net>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Leo Li <leoyang.li@nxp.com>,
        "Madalin Bucur (OSS)" <madalin.bucur@oss.nxp.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1592832924-31733-1-git-send-email-florinel.iordache@nxp.com>
 <1592832924-31733-5-git-send-email-florinel.iordache@nxp.com>
 <20200622142430.GP279339@lunn.ch>
 <AM0PR04MB5443DAF865284ADE78423C64FB970@AM0PR04MB5443.eurprd04.prod.outlook.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 G10n8gCguORqNGMsVRxrlLs7/himep7MrCc=
Message-ID: <83ff6b40-157e-3f1c-7370-29a0681dfad2@gmail.com>
Date:   Fri, 26 Jun 2020 12:05:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB5443DAF865284ADE78423C64FB970@AM0PR04MB5443.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/22/20 7:39 AM, Florinel Iordache wrote:
>> -----Original Message-----
>> From: Andrew Lunn <andrew@lunn.ch>
>> Sent: Monday, June 22, 2020 5:25 PM
>> To: Florinel Iordache <florinel.iordache@nxp.com>
>> Cc: davem@davemloft.net; netdev@vger.kernel.org; f.fainelli@gmail.com;
>> hkallweit1@gmail.com; linux@armlinux.org.uk; devicetree@vger.kernel.org;
>> linux-doc@vger.kernel.org; robh+dt@kernel.org; mark.rutland@arm.com;
>> kuba@kernel.org; corbet@lwn.net; shawnguo@kernel.org; Leo Li
>> <leoyang.li@nxp.com>; Madalin Bucur (OSS) <madalin.bucur@oss.nxp.com>;
>> Ioana Ciornei <ioana.ciornei@nxp.com>; linux-kernel@vger.kernel.org
>> Subject: [EXT] Re: [PATCH net-next v3 4/7] net: phy: add backplane kr driver
>> support
>>
>> Caution: EXT Email
>>
>> On Mon, Jun 22, 2020 at 04:35:21PM +0300, Florinel Iordache wrote:
>>> Add support for backplane kr generic driver including link training
>>> (ieee802.3ap/ba) and fixed equalization algorithm
>>
>> Hi Florinel
>>
>> This is still a PHY device. I don't remember any discussions which resolved the
>> issues of if at the end of the backplane there is another PHY.
>>
>> It makes little sense to repost this code until we have this problem discussed and
>> a way forward decided on. It fits into the discussion Russell and Ioana are having
>> about representing PCS drivers. Please contribute to that.
>>
>>         Andrew
> 
> Hi Andrew,
> 
> Yes, you are right: we decided to send only support for DPAA1 using current approach as a PHY device
> (as mentioned in cover-letter), until PCS representation will be fully clarified.
> The entire DPAA2 support was removed for now, together with phylink changes.
> DPAA1 maintainer (Madalin Bucur) agrees with current representation as a PHY device for DPAA1.
> So we would like to have some discussions around this approach for DPAA1 only, as it seems suitable for us.

The question is really whether it is suitable for others beyond NXP, the
drivers are certainly organized in such a way that there is little NXP
specifics in them so the intent is clearly there.

We will probably not know, either because vendors have decided to hide
all of this stuff under firmware, or they do not use Linux or they just
are not following what is going on upstream and have no desire to
participate.
-- 
Florian
