Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B4F462507
	for <lists+linux-doc@lfdr.de>; Mon, 29 Nov 2021 23:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbhK2Wen (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Nov 2021 17:34:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbhK2WeI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Nov 2021 17:34:08 -0500
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8EC9C21A26E
        for <linux-doc@vger.kernel.org>; Mon, 29 Nov 2021 12:48:43 -0800 (PST)
Received: from zimbra39-e7.priv.proxad.net (unknown [172.20.243.189])
        by smtp2-g21.free.fr (Postfix) with ESMTP id E969F20039C;
        Mon, 29 Nov 2021 21:48:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
        s=smtp-20201208; t=1638218920;
        bh=Tb69XT4xufw0xlyq9ZOTCfYh/fb8Zm8VtIecKAGOiCc=;
        h=Date:From:To:Cc:In-Reply-To:Subject:From;
        b=oylv/lmdZ2nZGRl8k4nmq3VKiHjhuXXtz8ZFcoaXNdvB5IqRxtAXAPAvXNrp2dEUE
         haUe0LA8UwGf8if2Uz0LX6dSrWl1/EdLmO7uPDokDM0/9uB7M8MlPEI/E9LzNG2QU8
         wN9zcp+Qz6eYZnJr9yV7qb3Rt8qIUfGRv0A1sJhjgj7aOtVwaUqLGra2wzD7uuOI6Z
         gz27Qh6pperg6PikCP7/fPxWfwiKBtrgAaA+HjA4OqCs5qx2fsGAlIrLoSUV86g+JM
         ISi5D93R4ww5Q+ZQM8wzCMExN5/6PDUfLYBdHvABCOx8LDvUffgJm/ALPCXw5xkOWQ
         vGVV+RZb+SCEg==
Date:   Mon, 29 Nov 2021 21:48:38 +0100 (CET)
From:   ydirson@free.fr
To:     Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc:     Mark Yacoub <markyacoub@chromium.org>,
        Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
        nicholas choi <nicholas.choi@amd.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Alex Deucher <alexdeucher@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
        Roman Li <roman.li@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Aurabindo Pillai <aurabindo.pillai@amd.com>,
        Sean Paul <seanpaul@chromium.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Alex Deucher <alexander.deucher@amd.com>,
        Qingqing Zhuo <qingqing.zhuo@amd.com>,
        Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
        Harry Wentland <Harry.Wentland@amd.com>,
        Roman Gilg <subdiff@gmail.com>
Message-ID: <1254252919.1503545635.1638218918877.JavaMail.root@zimbra39-e7>
In-Reply-To: <CADnq5_NVcHizoY_xRM4d09B2s9DzWwDhn=YrgJ-3COXNANzE3A@mail.gmail.com>
Subject: Re: [PATCH 6/6] Documentation/gpu: Add DC glossary
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [88.120.44.86]
X-Mailer: Zimbra 7.2.0-GA2598 (ZimbraWebClient - FF3.0 (Linux)/7.2.0-GA2598)
X-Authenticated-User: ydirson@free.fr
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Rodrigo,

That will really be helpful!

I know drawing the line is a difficult problem (and can even make things
harder when searching), but maybe it would make sense to keep generic
acronyms not specific to amdgpu in a separate list.  I bet a number of
them would be useful in the scope of other drm drivers (e.g. CRTC, DCC,
MST), and some are not restricted to the drm subsystem at all (e.g. FEC,
LUT), but still have value as not necessarily easy to look up.

Maybe "DC glossary" should just be "Glossary", since quite some entries
help to read adm/amdgpu/ too.  Which brings me to the result of my recent
searches as suggested entries:

 KIQ (Kernel Interface Queue), MQD (memory queue descriptor), HQD (hardware
 queue descriptor), EOP (still no clue :)

Maybe some more specific ones just to be spelled out in clear where they
are used ?  KCQ (compute queue?), KGQ (gfx queue?)

More suggestions inlined.

Best regards,
-- 
Yann

> On Thu, Nov 25, 2021 at 10:40 AM Rodrigo Siqueira
> <Rodrigo.Siqueira@amd.com> wrote:
> >
> > In the DC driver, we have multiple acronyms that are not obvious
> > most of
> > the time. This commit introduces a DC glossary in order to make it
> > easier to navigate through our driver.
> >
> > Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > ---
> >  Documentation/gpu/amdgpu-dc/amdgpu-dc.rst   |   2 +-
> >  Documentation/gpu/amdgpu-dc/dc-glossary.rst | 257
> >  ++++++++++++++++++++
> >  2 files changed, 258 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/gpu/amdgpu-dc/dc-glossary.rst
> >
> > diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> > b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> > index 2e45e83d9a2a..15405c43786a 100644
> > --- a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> > +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> > @@ -26,4 +26,4 @@ table of content:
> >     amdgpu-dcn-overview.rst
> >     amdgpu-dm.rst
> >     amdgpu-dc-debug.rst
> > -
> > +   dc-glossary.rst
> > diff --git a/Documentation/gpu/amdgpu-dc/dc-glossary.rst
> > b/Documentation/gpu/amdgpu-dc/dc-glossary.rst
> > new file mode 100644
> > index 000000000000..48698fc1799f
> > --- /dev/null
> > +++ b/Documentation/gpu/amdgpu-dc/dc-glossary.rst
> > @@ -0,0 +1,257 @@
> > +===========
> > +DC Glossary
> > +===========
> > +
> > +.. glossary::
> > +
> > +    ABM
> > +      Adaptive Backlight Modulation
> > +
> > +    APU
> > +      Accelerated Processing Unit
> > +
> > +    ASIC
> > +      Application-Specific Integrated Circuit
> > +
> > +    ASSR
> > +      Alternate Scrambler Seed Reset
> > +
> > +    AZ
> > +      Azalia (HD audio DMA engine)
> > +
> > +    BPC
> > +      Bits Per Colour/Component
> > +
> > +    BPP
> > +      Bits Per Pixel
> > +
> > +    Clocks
> > +      * PCLK: Pixel Clock
> > +      * SYMCLK: Symbol Clock
> > +      * SOCCLK: GPU Engine Clock
> > +      * DISPCLK: Display Clock
> > +      * DPPCLK: DPP Clock
> > +      * DCFCLK: Display Controller Fabric Clock
> > +      * REFCLK: Real Time Reference Clock
> > +      * PPLL: Pixel PLL
> > +      * FCLK: Fabric Clock
> > +      * MCLK: Memory Clock
> > +      * CPLIB: Content Protection Library
> 
> CPLIB is not a clock.  It should be split out as its own item.
> 
> > +
> > +    CRC
> > +      Cyclic Redundancy Check
> > +
> > +    CRTC
> > +      Cathode Ray Tube Controller - commonly called "Controller" -
> > Generates
> > +      raw stream of pixels, clocked at pixel clock
> > +
> > +    CVT
> > +      Coordinated Video Timings
> > +
> > +    DAL
> > +      Display Abstraction layer

I recall this as the old name for DC, maybe this should be mentioned ?

> > +
> > +    DC (Software)
> > +      Display Core
> > +
> > +    DC (Hardware)
> > +      Display Controller
> > +
> > +    DCC
> > +      Delta Colour Compression
> > +
> > +    DCE
> > +      Display Controller Engine
> > +
> > +    DCHUB
> > +      Display Controller Hub
> > +
> > +    ARB
> > +      Arbiter
> > +
> > +    VTG
> > +      Vertical Timing Generator
> > +
> > +    DCN
> > +      Display Core Next
> > +
> > +    DCCG
> > +      Display Clock Generator block
> > +
> > +    DDC
> > +      Display Data Channel
> > +
> > +    DFS
> > +      Digital Frequency Synthesizer
> > +
> > +    DIO
> > +      Display IO
> > +
> > +    DPP
> > +      Display Pipes and Planes
> > +
> > +    DSC
> > +      Display Stream Compression (Reduce the amount of bits to
> > represent pixel
> > +      count while at the same pixel clock)
> > +
> > +    dGPU
> > +      discrete GPU
> > +
> > +    DMIF
> > +      Display Memory Interface
> > +
> > +    DML
> > +      Display Mode Library
> > +
> > +    DMCU
> > +      Display Micro Controller Unit
> > +
> > +    DMCUB
> > +      Display Micro-Controller Unit, version B
> 
> Make Micro Controller vs. Micro-Controller consistent for these.
> 
> > +
> > +    DPCD
> > +      DisplayPort Configuration Data
> > +
> > +    DPM(S)
> > +      Display Power Management (Signaling)
> > +
> > +    DRR
> > +      Dynamic Refresh Rate
> > +
> > +    DWB
> > +      Display writeback
> > +
> > +    ECP
> > +      Enhanced Content Protection
> > +
> > +    FB
> > +      Frame Buffer
> > +
> > +    FBC
> > +      Frame Buffer Compression
> > +
> > +    FEC
> > +      Forward Error Correction
> > +
> > +    FRL
> > +      Fixed Rate Link
> > +
> > +    GCO
> > +      Graphical Controller Object
> > +
> > +    GMC
> > +      Graphic Memory Controller
> > +
> > +    GSL
> > +      Global Swap Lock
> > +
> > +    iGPU
> > +      integrated GPU
> > +
> > +    IH
> > +      Interrupt Handler
> > +
> > +    ISR
> > +      Interrupt Service Request
> > +
> > +    ISV
> > +      Independent Software Vendor
> > +
> > +    KMD
> > +      Kernel Mode Driver
> > +
> > +    LB
> > +      Line Buffer
> > +
> > +    LFC
> > +      Low Framerate Compensation
> > +
> > +    LTTPR
> > +      Link Training Tunable Phy Repeater
> > +
> > +    LUT
> > +      Lookup Table
> > +
> > +    MALL
> > +      Memory Access at Last Level
> > +
> > +    MC
> > +      Memory Controller
> > +
> > +    MPC
> > +      Multiple pipes and plane combine
> > +
> > +    MPO
> > +      Multi Plane Overlay
> > +
> > +    MST
> > +      Multi Stream Transport
> > +
> > +    NBP State
> > +      Northbridge Power State
> > +
> > +    NBIO
> > +      North Bridge Input/Output
> > +
> > +    ODM
> > +      Output Data Mapping
> > +
> > +    OPM
> > +      Output Protection Manager
> > +
> > +    OPP
> > +      Output Plane Processor
> > +
> > +    OPTC
> > +      Output Pipe Timing Combiner
> > +
> > +    OTG
> > +      Output Timing Generator
> > +
> > +    PCON
> > +      Power Controller
> > +
> > +    PGFSM
> > +      Power Gate Finite State Machine
> > +
> > +    PPLib
> > +      PowerPlay Library
> 
> Maybe say that powerplay is the power management component.
> 
> > +
> > +    PSR
> > +      Panel Self Refresh
> > +
> > +    SCL
> > +      Scaler
> > +
> > +    SDP
> > +      Scalable Data Port
> > +
> > +    SMU
> > +      System Management Unit
> > +
> > +    SLS
> > +      Single Large Surface
> > +
> > +    SST
> > +      Single Stream Transport
> > +
> > +    TMDS
> > +      Transition-Minimized Differential Signaling
> > +
> > +    TMZ
> > +      Trusted Memory Zone
> > +
> > +    TTU
> > +      Time to Underflow
> > +
> > +    VRR
> > +      Variable Refresh Rate
> > +
> > +    UVD
> > +      Unified Video Decoder
> > +
> > +    VCE
> > +      Video Compression Engine
> > +
> > +    VCN
> > +      Video Codec Next
> > --
> > 2.25.1
> >
> 
