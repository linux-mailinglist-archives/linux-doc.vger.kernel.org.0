Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 603056B202A
	for <lists+linux-doc@lfdr.de>; Thu,  9 Mar 2023 10:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbjCIJdk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 9 Mar 2023 04:33:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbjCIJd2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Mar 2023 04:33:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBE4E9832
        for <linux-doc@vger.kernel.org>; Thu,  9 Mar 2023 01:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678354336;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sQ+J/SIf2Lwzsd+AvJuj8Brejkg7/l6hsC8VV8+8W1M=;
        b=Lgc+Uyry8nh+xzHEt4bEc75oJxL0B9rJSx+Nv29OEEngdWlObB8yg9R/nqSM6ZFqiiISpp
        nLNBqAL5fEL8ONmbqWDTmoITkrBDPc+IM9g5WEjCDD34Wt0V3iWk510hhqEDvKa/3IKg9t
        g3yxXa+ZPj2ZPhv8WScudUiO6WKwoSU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-ILJADl86OVuHkH7Gl2ojNA-1; Thu, 09 Mar 2023 04:32:14 -0500
X-MC-Unique: ILJADl86OVuHkH7Gl2ojNA-1
Received: by mail-ed1-f69.google.com with SMTP id ev6-20020a056402540600b004bc2358ac04so2068334edb.21
        for <linux-doc@vger.kernel.org>; Thu, 09 Mar 2023 01:32:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678354334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQ+J/SIf2Lwzsd+AvJuj8Brejkg7/l6hsC8VV8+8W1M=;
        b=Uib7OS11bcIAbWLxy7SWWQqXNS4Sp0+r8NNy3rSiX11wDTDxotwpOrYCZJZFHuPJmc
         xdShe4hCLuvr7bjfPwewqBAJ1kS4hnMHmFVtedwce98iElNaZHPTPmyb97A5dxanoG2X
         KQJqqZvnwWqbACj+teJbHhYMKjmnZbSO8QTlpVK2h+Gnlbo6XGwJTSkepNswvodxTMFb
         A76m+ehe/imqywaj3Wat3pSDbirbptOM/KS0B/lBjyCvbbLNJpwygmCXJV7xC9Mf0UNi
         USwsgQmxFYtaPPeS1CMBDfv9+enguWOIDVrdZvd8uJcWec+62m+Uya4jkm3DZ+WdEJDn
         Wn1Q==
X-Gm-Message-State: AO0yUKXqv5p8WRd80lz2ddk489DOpZOOBENHK/5jfJVBd5mYIVJzJBQk
        IO8elU+VzQtsP1RrKJY8bqKD0sUQZXTfoxXhR/x7HYfjHyMDxVeAxzZHYyEoBGE6loyCibgOaXa
        npe0WefNAyZJgsD5vzzjx
X-Received: by 2002:aa7:da0a:0:b0:4af:7bdc:188e with SMTP id r10-20020aa7da0a000000b004af7bdc188emr25673792eds.16.1678354333824;
        Thu, 09 Mar 2023 01:32:13 -0800 (PST)
X-Google-Smtp-Source: AK7set9Zcc4VfH+adkU4CX8s8G2r+r/hbCkiRw8tT7qROHeFsFcauVxjL7MeoaeJyJi8J5zGFtIfvg==
X-Received: by 2002:aa7:da0a:0:b0:4af:7bdc:188e with SMTP id r10-20020aa7da0a000000b004af7bdc188emr25673759eds.16.1678354333521;
        Thu, 09 Mar 2023 01:32:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t26-20020a1709060c5a00b008ec793ac3f4sm8527194ejf.192.2023.03.09.01.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 01:32:13 -0800 (PST)
Message-ID: <9398f15b-6c50-b7ef-1886-c3c78f075e72@redhat.com>
Date:   Thu, 9 Mar 2023 10:32:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 00/13] Adds support for PHY LEDs with offload triggers
Content-Language: en-US, nl
To:     Linus Walleij <linus.walleij@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        John Crispin <john@phrozen.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        Tim Harvey <tharvey@gateworks.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Arun.Ramadoss@microchip.com
References: <20230216013230.22978-1-ansuelsmth@gmail.com>
 <CACRpkda30Ky5oYPn_nGWGOzT5ntZYdE3gafrs7D27ZHxgGuO8A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CACRpkda30Ky5oYPn_nGWGOzT5ntZYdE3gafrs7D27ZHxgGuO8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 3/9/23 10:09, Linus Walleij wrote:
> Hi Christian,
> 
> thanks for your patch!
> 
> On Thu, Feb 16, 2023 at 2:36 AM Christian Marangi <ansuelsmth@gmail.com> wrote:
> 
>> The current idea is:
>> - LED driver implement 3 API (hw_control_status/start/stop).
>>   They are used to put the LED in hardware mode and to configure the
>>   various trigger.
>> - We have hardware triggers that are used to expose to userspace the
>>   supported hardware mode and set the hardware mode on trigger
>>   activation.
>> - We can also have triggers that both support hardware and software mode.
>> - The LED driver will declare each supported hardware blink mode and
>>   communicate with the trigger all the supported blink modes that will
>>   be available by sysfs.
>> - A trigger will use blink_set to configure the blink mode to active
>>   in hardware mode.
>> - On hardware trigger activation, only the hardware mode is enabled but
>>   the blink modes are not configured. The LED driver should reset any
>>   link mode active by default.
> 
> The series looks good as a start.
> There are some drivers and HW definitions etc for switch-controlled
> LEDs, which is great.
> 
> I am a bit reluctant on the ambition to rely on configuration from sysfs
> for the triggers, and I am also puzzled to how a certain trigger on a
> certain LED is going to associate itself with, say, a certain port.
> 
> I want to draw your attention to this recently merged patch series
> from Hans de Goede:
> https://lore.kernel.org/linux-leds/20230120114524.408368-1-hdegoede@redhat.com/
> 
> This adds the devm_led_get() API which works similar to getting
> regulators, clocks, GPIOs or any other resources.
> 
> It is not yet (I think) hooked into the device tree framework, but it
> supports software nodes so adding DT handling should be sort of
> trivial.

That series contains this (unmerged) patch to hookup DT handling:

https://lore.kernel.org/linux-leds/20230120114524.408368-6-hdegoede@redhat.com/

this was not merged because there are no current users, but adding
support is as easy as picking up that patch :)

Note there also already is a devicetree *only*:

struct led_classdev *of_led_get(struct device_node *np, int index);

Since I was working on a x86/ACPI platform I needed something more
generic though and ideally new code would use the generic approach.

Regards,

Hans





> 
> I think the ambition should be something like this (conjured example)
> for a DSA switch:
> 
>     platform {
>             switch {
>                     compatible = "foo";
> 
>                     leds {
>                             #address-cells = <1>;
>                             #size-cells = <0>;
>                             led0: led@0 {
>                                     reg = <0>;
>                                     color =...
>                                     function = ...
>                                     function-enumerator = ...
>                                     default-state = ...
>                             };
>                             led1: led@1 {
>                                     reg = <1>;
>                                     color =...
>                                     function = ...
>                                     function-enumerator = ...
>                                     default-state = ...
>                             };
>                     };
> 
>                     ports {
>                             #address-cells = <1>;
>                             #size-cells = <0>;
>                             port@0 {
>                                     reg = <0>;
>                                     label = "lan0";
>                                     phy-handle = <&phy0>;
>                                     leds = <&led0>;
>                             };
>                             port@1 {
>                                     reg = <1>;
>                                     label = "lan1";
>                                     phy-handle = <&phy1>;
>                                     leds = <&led0>;
>                             };
>                     };
> 
>                     mdio {
>                             compatible = "foo-mdio";
>                             #address-cells = <1>;
>                             #size-cells = <0>;
> 
>                             phy0: ethernet-phy@0 {
>                                     reg = <0>;
>                             };
>                             phy1: ethernet-phy@1 {
>                                     reg = <1>;
>                             };
>                     };
>             };
>     };
> 
> I am not the man to tell whether the leds = <&led0>; phandle should be on
> the port or actually on the phy, it may even vary. You guys know the answer
> to this.
> 
> But certainly something like this resource phandle will be necessary to
> assign the right LED to the right port or phy, I hope you were not going
> to rely on strings and naming conventions?
> 
> Yours,
> Linus Walleij
> 

