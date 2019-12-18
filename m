Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F68F1257AC
	for <lists+linux-doc@lfdr.de>; Thu, 19 Dec 2019 00:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbfLRXWD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Dec 2019 18:22:03 -0500
Received: from mga12.intel.com ([192.55.52.136]:51739 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726569AbfLRXWD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Dec 2019 18:22:03 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Dec 2019 15:22:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; 
   d="scan'208";a="365889145"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143]) ([10.7.153.143])
  by orsmga004.jf.intel.com with ESMTP; 18 Dec 2019 15:21:56 -0800
Subject: Re: [PATCH v11 04/14] dt-bindings: Add bindings document of Aspeed
 PECI adapter
To:     Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        Eric Sandeen <sandeen@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>,
        Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
        "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
        Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        David Kershner <david.kershner@unisys.com>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Johan Hovold <johan@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Juergen Gross <jgross@suse.com>,
        Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
        Tomer Maimon <tmaimon77@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        openbmc@lists.ozlabs.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Milton Miller II <miltonm@us.ibm.com>,
        Pavel Machek <pavel@ucw.cz>,
        Robin Murphy <robin.murphy@arm.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-5-jae.hyun.yoo@linux.intel.com>
 <20191218025702.GA18998@bogus>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <c203251d-125a-0d41-927d-0ce237622f71@linux.intel.com>
Date:   Wed, 18 Dec 2019 15:21:56 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191218025702.GA18998@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Rob,

On 12/17/2019 6:57 PM, Rob Herring wrote:
> On Wed, Dec 11, 2019 at 11:46:14AM -0800, Jae Hyun Yoo wrote:
>> This commit adds bindings document of Aspeed PECI adapter for ASPEED
>> AST24xx/25xx/26xx SoCs.
>>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Joel Stanley <joel@jms.id.au>
>> Cc: Andrew Jeffery <andrew@aj.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
>> Cc: Milton Miller II <miltonm@us.ibm.com>
>> Cc: Pavel Machek <pavel@ucw.cz>
>> Cc: Robin Murphy <robin.murphy@arm.com>
>> Cc: Ryan Chen <ryan_chen@aspeedtech.com>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>> Changes since v10:
>> - Changed documents format to DT schema format so I dropped all review tags.
>>    Please review it again.
>>
>>   .../devicetree/bindings/peci/peci-aspeed.yaml | 124 ++++++++++++++++++
>>   1 file changed, 124 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.yaml b/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
>> new file mode 100644
>> index 000000000000..0f5c2993fe9b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/peci/peci-aspeed.yaml
>> @@ -0,0 +1,124 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/peci/peci-aspeed.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Aspeed PECI Bus Device Tree Bindings
>> +
>> +maintainers:
>> +  - Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - aspeed,ast2400-peci
>> +      - aspeed,ast2500-peci
>> +      - aspeed,ast2600-peci
>> +
>> +  reg:
>> +    maxItems: 1
>> +
> 
>> +  "#address-cells":
>> +    # Required to define a client address.
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    # Required to define a client address.
>> +    const: 0
> 
> These 2 can be defined by the bus schema.

I see. I'll add these to peci-bus schema.

>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    description: |
> 
> You can drop the '|' if there's no formatting to preserve.

Will check this for all bindings in this patch set.

>> +      Clock source for PECI controller. Should reference the external
>> +      oscillator clock.
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  clock-frequency:
>> +    # Operation frequency of PECI controller in units of Hz.
>> +    minimum: 187500
>> +    maximum: 24000000
>> +
>> +  msg-timing:
>> +    description: |
>> +      Message timing negotiation period. This value will determine the period
>> +      of message timing negotiation to be issued by PECI controller. The unit
>> +      of the programmed value is four times of PECI clock period.
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +      - minimum: 0
>> +        maximum: 255
>> +        default: 1
>> +
>> +  addr-timing:
>> +    description: |
>> +      Address timing negotiation period. This value will determine the period
>> +      of address timing negotiation to be issued by PECI controller. The unit
>> +      of the programmed value is four times of PECI clock period.
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +      - minimum: 0
>> +        maximum: 255
>> +        default: 1
>> +
>> +  rd-sampling-point:
>> +    description: |
>> +      Read sampling point selection. The whole period of a bit time will be
>> +      divided into 16 time frames. This value will determine the time frame
>> +      in which the controller will sample PECI signal for data read back.
>> +      Usually in the middle of a bit time is the best.
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +      - minimum: 0
>> +        maximum: 15
>> +        default: 8
>> +
>> +  cmd-timeout-ms:
>> +    # Command timeout in units of ms.
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +      - minimum: 1
>> +        maximum: 60000
>> +        default: 1000
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - interrupts
>> +  - clocks
>> +  - resets
>> +  - clock-frequency
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/ast2600-clock.h>
>> +    peci: bus@1e78b000 {
>> +        compatible = "simple-bus";
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges = <0x0 0x1e78b000 0x60>;
> 
> You can drop this node in the examples.

I see. Will drop the parent node in this example.

Thanks a lot for your review!

-Jae

>> +
>> +        peci0: peci-bus@0 {
>> +            compatible = "aspeed,ast2600-peci";
>> +            reg = <0x0 0x100>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
>> +            resets = <&syscon ASPEED_RESET_PECI>;
>> +            clock-frequency = <24000000>;
>> +            msg-timing = <1>;
>> +            addr-timing = <1>;
>> +            rd-sampling-point = <8>;
>> +            cmd-timeout-ms = <1000>;
>> +        };
>> +    };
>> +...
>> -- 
>> 2.17.1
>>
> 
