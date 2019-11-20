Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D53B1046AB
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2019 23:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfKTWje (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Nov 2019 17:39:34 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:33061 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbfKTWje (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Nov 2019 17:39:34 -0500
Received: by mail-qt1-f195.google.com with SMTP id y39so1442697qty.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2019 14:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NFgSbCPrFi8T1e2VirUq06TjZPpBWKiWuXdt2lSVc4U=;
        b=jRM6QcxrOfaUipntiznUGAD/wRVd3zwNIfxLENQpJHTQEaDCnKp3GOchwa8ciZvzIi
         TAq7z5QVmMjyA9avtmWNqGw99xpMxe5ydLYEM3MWv3MVBX+oA3JcDw7//dCf8z0vl3wo
         fqlUzZrswm700YSN9vke015iBv8VbtO0qpE+Pu6Z6KRPWEzFDnPSkk0bOcPLPvtgXnSa
         t7u7i/+kazk8OLOM863r2vvb0e1FoNF9+uh3S5hAA9j8mwCROmbimxiEnmnRQESF00JM
         N9V8dcvmqOIgfvrNzdPhrMuqpKH19z/SBA1tine59HfQs/iGZRjf77MRZcII/5/LJBPF
         RgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NFgSbCPrFi8T1e2VirUq06TjZPpBWKiWuXdt2lSVc4U=;
        b=OtJaTFLCbG6dDQfODPnc+wus64TSX8s/wxFNR9nkWz1hWECZcbeRbIURowR/TJoAtO
         dDX0if0inIizsHR/RKFksLmMf2GPervFqE9hm9M8hxV0pyHW7H5D2u+cf59y3YjOim9E
         b/aZNiL8HGNrb8VFOg/XxqWZ1AqjOfttcqGGywDjEmAz/Ov0kujIiUybH2XNTNSeRHnU
         HwXy8ufOg2scN8+8KscQ/xdCPD5ZLhnuGFCnFgBVjT5kCzjPgcNj/LZWMGlp51bJvGFx
         J5+4wR9YRbFlhsDSlS6iP4q+VE3FuPYnjpQpqduQBMZQdd9Da9plOOPqJnTdoMSwaF7o
         rm1A==
X-Gm-Message-State: APjAAAUFToVStpltQ5klfDucZrx+xS3eEe2VXpziPorGFrVHdHTkCCtP
        g70mAjeA0mN0UOwYnaRYXsidIdiJDZQ1b521lR7Y5Q==
X-Google-Smtp-Source: APXvYqz5KAZ+lKj1P+x2VcEtxHmr75Pstcw9CBJGyhaFjeUWmJkqNyrSLxRyu0Qir86wAERBFeyJR1tTSGmuedvnyss=
X-Received: by 2002:ac8:458d:: with SMTP id l13mr5317290qtn.266.1574289571278;
 Wed, 20 Nov 2019 14:39:31 -0800 (PST)
MIME-Version: 1.0
References: <20191119231912.12768-1-mike.leach@linaro.org> <20191119231912.12768-6-mike.leach@linaro.org>
 <20191120190604.GA5641@xps15>
In-Reply-To: <20191120190604.GA5641@xps15>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Wed, 20 Nov 2019 22:39:21 +0000
Message-ID: <CAJ9a7Vi=TyMf3FjU8u=ui0_wV5TQC+CMmUXH4C22KkKKo=wPRg@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] dt-bindings: arm: Adds CoreSight CTI hardware definitions.
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mathieu,

... is an optional end of document marker in YAML. Seemed to appear in
most of the files I looked at in the devicetree.org  dt-schema project
I looked at so I took it as customary for DT YAML docs.
But as you say - it's up to Rob etc. to approve or otherwise.

Regards

Mike

On Wed, 20 Nov 2019 at 19:06, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, Nov 19, 2019 at 11:19:03PM +0000, Mike Leach wrote:
> > Adds new coresight-cti.yaml file describing the bindings required to define
> > CTI in the device trees.
> >
> > Adds an include file to dt-bindings/arm to define constants describing
> > common signal functionality used in CoreSight and generic usage.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >  .../bindings/arm/coresight-cti.yaml           | 303 ++++++++++++++++++
> >  .../devicetree/bindings/arm/coresight.txt     |   7 +
> >  MAINTAINERS                                   |   2 +
> >  include/dt-bindings/arm/coresight-cti-dt.h    |  37 +++
> >  4 files changed, 349 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/coresight-cti.yaml
> >  create mode 100644 include/dt-bindings/arm/coresight-cti-dt.h
> >
> > diff --git a/Documentation/devicetree/bindings/arm/coresight-cti.yaml b/Documentation/devicetree/bindings/arm/coresight-cti.yaml
> > new file mode 100644
> > index 000000000000..882c72f1c798
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/coresight-cti.yaml
> > @@ -0,0 +1,303 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +# Copyright 2019 Linaro Ltd.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/coresight-cti.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ARM Coresight Cross Trigger Interface (CTI) device.
> > +
> > +description: |
> > +  The CoreSight Embedded Cross Trigger (ECT) consists of CTI devices connected
> > +  to one or more CoreSight components and/or a CPU, with CTIs interconnected in
> > +  a star topology via the CTM (which is not programmable). The ECT components
> > +  are not part of the trace generation data path and are thus not part of the
> > +  CoreSight graph described in the general CoreSight bindings file
> > +  coresight.txt.
> > +
> > +  The CTI component properties define the connections between the individual
> > +  CTI and the components it is directly connected to, consisting of input and
> > +  output hardware trigger signals. CTIs can have a maximum number of input and
> > +  output hardware trigger signals (8 each for v1 CTI, 32 each for v2 CTI). The
> > +  number is defined at design time, the maximum of each defined in the DEVID
> > +  register.
> > +
> > +  CTIs are interconnected in a star topology via the CTM, using a number of
> > +  programmable channels usually 4, but again implementation defined and
> > +  described in the DEVID register. The star topology is not required to be
> > +  described in the bindings as the actual connections are software
> > +  programmable.
> > +
> > +  In general the connections between CTI and components via the trigger signals
> > +  are implementation defined, other than when v8 core and ETM is present.
> > +  The v8 architecture defines the required signal connections between CPU core
> > +  and CTI, and ETM and CTI, if the ETM if present.
> > +
> > +  When only minimal information is available for the CTI trigger connections,
> > +  then a minimal driver binding can be declare with no explicit trigger
> > +  signals. This will result in the using the DEVID register to set the
> > +  input and output triggers and channels in use. Any user / client
> > +  application will require additional information on the connections
> > +  between the CTI and other components for correct operation. This minimal
> > +  binding may be used when using the Integration Control registers to
> > +  discover connections between CTI and other CoreSight components,
> > +
> > +  Certain triggers between CoreSight devices and the CTI have specific types
> > +  and usages. These can be defined along with the signal indexes with the
> > +  constants defined in <dt-bindings/arm/coresight-cti-dt.h>
> > +
> > +  For example a CTI connected to a core will usually have a DBGREQ signal. This
> > +  is defined in the binding as type PE_EDBGREQ. These types will appear in an
> > +  optional array alongside the signal indexes. Omitting types will default all
> > +  signals to GEN_IO.
> > +
> > +  Note that some hardware trigger signals can be connected to non-CoreSight
> > +  components (e.g. UART etc) depending on hardware implementation.
> > +
> > +maintainers:
> > +  - Mike Leach <mike.leach@linaro.org>
> > +
> > +allOf:
> > +  - $ref: /schemas/arm/primecell.yaml#
> > +
> > +# Need a custom select here or 'arm,primecell' will match on lots of nodes
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - arm,coresight-cti
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^cti(@[0-9a-f,]+)*$"
> > +  compatible:
> > +    items:
> > +      - const: arm,coresight-cti
> > +      - const: arm,primecell
> > +
> > +  reg:
> > +    items:
> > +      - description: device programming registers
> > +
> > +  arm,cti-v8-arch:
> > +    type: boolean
> > +    description:
> > +      This CTI follows the v8 architecturally mandated layout for a CTI.
> > +      Bindings declaring this must declare a cpu, and optionally a single
> > +      arm,cs-dev-assoc may be present to define an attached ETM. No additional
> > +      trig-conns nodes are permitted. The driver will build a connection model
> > +      according to architectural requirements. This will include a filter on
> > +      the CPU dbgreq signal as described above.
> > +
> > +  cpu:
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: Handle to cpu this device is associated with.
> > +
> > +  arm,cti-ctm-id:
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Defines the CTM this CTI is connected to, in large systems with multiple
> > +      separate CTI/CTM nets. Typically multi-socket systems where the CTM is
> > +      propagated between sockets.
> > +
> > +  arm,cs-dev-assoc:
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      defines a phandle reference to an associated CoreSight trace device.
> > +      When the associated trace device is enabled, then the respective CTI
> > +      will be enabled. Use in a trig-conns node, or in CTI base node when
> > +      arm,cti-v8-arch present. If the associated device has not been registered
> > +      then the node name will be stored as the connection name for later
> > +      resolution. If the associated device is not a CoreSight device or not
> > +      registered then the node name will remain the connection name and
> > +      automatic enabling will not occur.
> > +
> > +patternProperties:
> > +  '^trig_conns@[0-9]+$':
> > +    type: object
> > +    description:
> > +      A trigger connections child node which describes the trigger signals
> > +      between this CTI and another hardware device. This device may be a CPU,
> > +      CoreSight device, any other hardware device or simple external IO lines.
> > +      The connection may have both input and output triggers, or only one or the
> > +      other.
> > +
> > +    properties:
> > +
> > +      arm,trig-in-sigs:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
> > +          List of CTI trigger in signal numbers in use by a trig-conns node.
> > +
> > +      arm,trig-in-types:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
> > +          List of constants representing the types for the CTI trigger in
> > +          signals. Types in this array match to the corresponding signal in the
> > +          arm,trig-in-sigs array. If the -types array is smaller, or omitted
> > +          completely, then the types will default to GEN_IO.
> > +
> > +      arm,trig-out-sigs:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
> > +          List of CTI trigger out signal numbers in use by a trig-conns node.
> > +
> > +      arm,trig-out-types:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
> > +          List of constants representing the types for the CTI trigger out
> > +          signals. Types in this array match to the corresponding signal
> > +          in the arm,trig-out-sigs array. If the "-types" array is smaller,
> > +          or omitted completely, then the types will default to GEN_IO.
> > +
> > +      arm,trig-filters:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
> > +          List of CTI trigger out signals that will be blocked from becoming
> > +          active, unless filtering is disabled on the driver.
> > +
> > +      arm,trig-conn-name:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/string
> > +        description:
> > +          Defines a connection name that will be displayed, if the cpu or
> > +          arm,cs-dev-assoc properties are not being used in this connection.
> > +          Principle use for CTI that are connected to non-CoreSight devices, or
> > +          external IO.
> > +
> > +    anyOf:
> > +      - required:
> > +        - arm,trig-in-sigs
> > +      - required:
> > +        - arm,trig-out-sigs
> > +    oneOf:
> > +      - required:
> > +        - arm,trig-conn-name
> > +      - required:
> > +        - cpu
> > +      - required:
> > +        - arm,cs-dev-assoc
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +
> > +examples:
> > +  # minimum CTI definition. DEVID register used to set number of triggers.
> > +  - |
> > +    cti@20020000 {
> > +      compatible = "arm,coresight-cti", "arm,primecell";
> > +      reg = <0x20020000 0x1000>;
> > +
> > +      clocks = <&soc_smc50mhz>;
> > +      clock-names = "apb_pclk";
> > +    };
> > +  #  v8 architecturally defined CTI - CPU + ETM connections generated by the
> > +  #  driver according to the v8 architecture specification.
> > +  - |
> > +    cti@859000 {
> > +      compatible = "arm,coresight-cti", "arm,primecell";
> > +      reg = <0x859000 0x1000>;
> > +
> > +      clocks = <&soc_smc50mhz>;
> > +      clock-names = "apb_pclk";
> > +
> > +      arm,cti-v8-arch;
> > +      cpu = <&CPU1>;
> > +      arm,cs-dev-assoc = <&etm1>;
> > +    };
> > +  # Implementation defined CTI - CPU + ETM connections explicitly defined..
> > +  # Shows use of type constants from dt-bindings/arm/coresight-cti-dt.h
> > +  - |
> > +    #include <dt-bindings/arm/coresight-cti-dt.h>
> > +
> > +    cti@858000 {
> > +      compatible = "arm,coresight-cti", "arm,primecell";
> > +      reg = <0x858000 0x1000>;
> > +
> > +      clocks = <&soc_smc50mhz>;
> > +      clock-names = "apb_pclk";
> > +
> > +      arm,cti-ctm-id = <1>;
> > +
> > +      trig-conns@0 {
> > +            arm,trig-in-sigs = <4 5 6 7>;
> > +            arm,trig-in-types = <ETM_EXTOUT
> > +                                 ETM_EXTOUT
> > +                                 ETM_EXTOUT
> > +                                 ETM_EXTOUT>;
> > +            arm,trig-out-sigs = <4 5 6 7>;
> > +            arm,trig-out-types = <ETM_EXTIN
> > +                                  ETM_EXTIN
> > +                                  ETM_EXTIN
> > +                                  ETM_EXTIN>;
> > +            arm,cs-dev-assoc = <&etm0>;
> > +      };
> > +
> > +      trig-conns@1 {
> > +            cpu = <&CPU0>;
> > +            arm,trig-in-sigs = <0 1>;
> > +            arm,trig-in-types = <PE_DBGTRIGGER
> > +                                 PE_PMUIRQ>;
> > +            arm,trig-out-sigs=<0 1 2 >;
> > +            arm,trig-out-types = <PE_EDBGREQ
> > +                                  PE_DBGRESTART
> > +                                  PE_CTIIRQ>;
> > +
> > +            arm,trig-filters = <0>;
> > +      };
> > +    };
> > +  # Implementation defined CTI - none CoreSight component connections.
> > +  - |
> > +    cti@20110000 {
> > +      compatible = "arm,coresight-cti", "arm,primecell";
> > +      reg = <0 0x20110000 0 0x1000>;
> > +
> > +      clocks = <&soc_smc50mhz>;
> > +      clock-names = "apb_pclk";
> > +
> > +      trig-conns@0 {
> > +        arm,trig-in-sigs=<0>;
> > +        arm,trig-in-types=<GEN_INTREQ>;
> > +        arm,trig-out-sigs=<0>;
> > +        arm,trig-out-types=<GEN_HALTREQ>;
> > +        arm,trig-conn-name = "sys_profiler";
> > +      };
> > +
> > +      trig-conns@1 {
> > +        arm,trig-out-sigs=<2 3>;
> > +        arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> > +        arm,trig-conn-name = "watchdog";
> > +      };
> > +
> > +      trig-conns@2 {
> > +        arm,trig-in-sigs=<1 6>;
> > +        arm,trig-in-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> > +        arm,trig-conn-name = "g_counter";
> > +      };
> > +    };
> > +
> > +...
>
> I'm not sure what the "..." is there for.  It is not present in the example
> schema[1] but I can find the patter in other .yaml files.  As such I will let
> Rob decide on that part.
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> [1]. Documentation/devicetree/bindings/example-schema.yaml
>
> > \ No newline at end of file
> > diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> > index d02c42d21f2f..846f6daae71b 100644
> > --- a/Documentation/devicetree/bindings/arm/coresight.txt
> > +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> > @@ -45,6 +45,10 @@ its hardware characteristcs.
> >               - Coresight Address Translation Unit (CATU)
> >                       "arm,coresight-catu", "arm,primecell";
> >
> > +             - Coresight Cross Trigger Interface (CTI):
> > +                     "arm,coresight-cti", "arm,primecell";
> > +                     See coresight-cti.yaml for full CTI definitions.
> > +
> >       * reg: physical base address and length of the register
> >         set(s) of the component.
> >
> > @@ -72,6 +76,9 @@ its hardware characteristcs.
> >       * reg-names: the only acceptable values are "stm-base" and
> >         "stm-stimulus-base", each corresponding to the areas defined in "reg".
> >
> > +* Required properties for Coresight Cross Trigger Interface (CTI)
> > +     See coresight-cti.yaml for full CTI definitions.
> > +
> >  * Required properties for devices that don't show up on the AMBA bus, such as
> >    non-configurable replicators and non-configurable funnels:
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 9de89d75dbcc..8d01a74068f7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1608,9 +1608,11 @@ R:     Suzuki K Poulose <suzuki.poulose@arm.com>
> >  L:   linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:   Maintained
> >  F:   drivers/hwtracing/coresight/*
> > +F:   include/dt-bindings/arm/coresight-cti-dt.h
> >  F:   Documentation/trace/coresight/*
> >  F:   Documentation/devicetree/bindings/arm/coresight.txt
> >  F:   Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
> > +F:   Documentation/devicetree/bindings/arm/coresight-cti.yaml
> >  F:   Documentation/ABI/testing/sysfs-bus-coresight-devices-*
> >  F:   tools/perf/arch/arm/util/pmu.c
> >  F:   tools/perf/arch/arm/util/auxtrace.c
> > diff --git a/include/dt-bindings/arm/coresight-cti-dt.h b/include/dt-bindings/arm/coresight-cti-dt.h
> > new file mode 100644
> > index 000000000000..61e7bdf8ea6e
> > --- /dev/null
> > +++ b/include/dt-bindings/arm/coresight-cti-dt.h
> > @@ -0,0 +1,37 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * This header provides constants for the defined trigger signal
> > + * types on CoreSight CTI.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_ARM_CORESIGHT_CTI_DT_H
> > +#define _DT_BINDINGS_ARM_CORESIGHT_CTI_DT_H
> > +
> > +#define GEN_IO               0
> > +#define GEN_INTREQ   1
> > +#define GEN_INTACK   2
> > +#define GEN_HALTREQ  3
> > +#define GEN_RESTARTREQ       4
> > +#define PE_EDBGREQ   5
> > +#define PE_DBGRESTART        6
> > +#define PE_CTIIRQ    7
> > +#define PE_PMUIRQ    8
> > +#define PE_DBGTRIGGER        9
> > +#define ETM_EXTOUT   10
> > +#define ETM_EXTIN    11
> > +#define SNK_FULL     12
> > +#define SNK_ACQCOMP  13
> > +#define SNK_FLUSHCOMP        14
> > +#define SNK_FLUSHIN  15
> > +#define SNK_TRIGIN   16
> > +#define STM_ASYNCOUT 17
> > +#define STM_TOUT_SPTE        18
> > +#define STM_TOUT_SW  19
> > +#define STM_TOUT_HETE        20
> > +#define STM_HWEVENT  21
> > +#define ELA_TSTART   22
> > +#define ELA_TSTOP    23
> > +#define ELA_DBGREQ   24
> > +#define CTI_TRIG_MAX 25
> > +
> > +#endif /*_DT_BINDINGS_ARM_CORESIGHT_CTI_DT_H */
> > --
> > 2.17.1
> >



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
