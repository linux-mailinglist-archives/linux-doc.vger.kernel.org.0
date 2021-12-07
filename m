Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A06846C28E
	for <lists+linux-doc@lfdr.de>; Tue,  7 Dec 2021 19:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236040AbhLGSWm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 7 Dec 2021 13:22:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbhLGSWm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Dec 2021 13:22:42 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E97BC061574
        for <linux-doc@vger.kernel.org>; Tue,  7 Dec 2021 10:19:11 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id i5so31336327wrb.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Dec 2021 10:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ryBB1dJoJAjwQetkQUG1CkdXjTwGO2uIq3Be4erfjLI=;
        b=GkieuRCAxWKFS03VV9C6Bquc4bDeerCOXSoIFakdnaM7ADQo9mPtOFZAaiYO5pe1zJ
         N9Vrb1Pe+MdDqFqIE9ivzVkr98Y7WZRvw/f2e8+tobjY82al+y5Y8O6uMahnUXVGikU8
         D3/G5zcSlX2AKONlLp775RfJ9rbYEAGp7rdOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ryBB1dJoJAjwQetkQUG1CkdXjTwGO2uIq3Be4erfjLI=;
        b=5TXLxKBYG0tR2QLadRay3cMtqmbUck60PQBfrZU1RKpPgJgHDebY752UJ8JMmhTTTR
         1r6mtAElI5GuzXPgXUnRy1YBjChUWqCbvixC2qVdR/7umNt6VN3rBYoo48EGA1jJb4G5
         3yQJpnV73iI3/x6AKbqoYBmr5arE5xWQvnNjozbrA2QTivKLgu8caTHounJIU3Tx79uu
         b9wEVp47s3Dfafw5wSGg7QuA8X+PMxp/gtv/q1nu3uQhA+Sny0wH0Oah5kOB1bMX48O6
         YADVTqir56PB2Ez7UJJDgSJLAcd1cV6xyTE+flGQNMScrBdgBIlJIwwd/Up0YnF9BjOX
         514w==
X-Gm-Message-State: AOAM530f+qnPfRcMmhtSqanoJkqzm5zH2plAuMZWDHJJpdaBSk19+kuE
        Ri/Qgnf7UeVHgaQZhRjul6DyWA==
X-Google-Smtp-Source: ABdhPJys+7fkflB/7uVRaDXSUkVakrY1E7ZzZ4ixrqIvd1ejF0OBx2V85+mJtPAb8y/5g4keFYmJng==
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr53846531wrw.21.1638901150128;
        Tue, 07 Dec 2021 10:19:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y6sm3346625wma.37.2021.12.07.10.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 10:19:09 -0800 (PST)
Date:   Tue, 7 Dec 2021 19:19:07 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc:     Simon Ser <contact@emersion.fr>,
        Michel Daenzer <michel@daenzer.net>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Marek Olsak <marek.olsak@amd.com>,
        Roman Gilg <subdiff@gmail.com>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Harry Wentland <Harry.Wentland@amd.com>,
        Mark Yacoub <markyacoub@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Yann Dirson <ydirson@free.fr>, Daniel Vetter <daniel@ffwll.ch>,
        linux-doc@vger.kernel.org, qingqing.zhuo@amd.com, roman.li@amd.com,
        amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com,
        nicholas.choi@amd.com, dri-devel@lists.freedesktop.org,
        Alex Deucher <alexander.deucher@amd.com>,
        bhawanpreet.lakha@amd.com,
        Christian Koenig <christian.koenig@amd.com>
Subject: Re: [PATCH v2 6/6] Documentation/gpu: Add amdgpu and dc glossary
Message-ID: <Ya+lm9B8opSSkHsu@phenom.ffwll.local>
References: <20211202160132.2263330-1-Rodrigo.Siqueira@amd.com>
 <20211202160132.2263330-7-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202160132.2263330-7-Rodrigo.Siqueira@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 02, 2021 at 11:01:32AM -0500, Rodrigo Siqueira wrote:
> In the DC driver, we have multiple acronyms that are not obvious most of
> the time; the same idea is valid for amdgpu. This commit introduces a DC
> and amdgpu glossary in order to make it easier to navigate through our
> driver.
> 
> Changes since V1:
>  - Yann: Divide glossary based on driver context.
>  - Alex: Make terms more consistent and update CPLIB
>  - Add new acronyms to the glossary
> 
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>  Documentation/gpu/amdgpu/amdgpu-glossary.rst  |  47 ++++
>  .../gpu/amdgpu/display/dc-glossary.rst        | 243 ++++++++++++++++++
>  Documentation/gpu/amdgpu/display/index.rst    |   1 +
>  Documentation/gpu/amdgpu/index.rst            |   7 +
>  4 files changed, 298 insertions(+)
>  create mode 100644 Documentation/gpu/amdgpu/amdgpu-glossary.rst
>  create mode 100644 Documentation/gpu/amdgpu/display/dc-glossary.rst
> 
> diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> new file mode 100644
> index 000000000000..e635851025e7
> --- /dev/null
> +++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
> @@ -0,0 +1,47 @@
> +===============
> +AMDGPU Glossary
> +===============
> +
> +Here you can find some generic acronyms used in the amdgpu driver. Notice that
> +we have a dedicated glossary for Display Core.

Maybe add a link to that here so it's easier to find? sphinx autogenerates
header targets so pretty easy (if the heading is unique at least).
-Daniel

> +
> +.. glossary::
> +
> +    CPLIB
> +      Content Protection Library
> +
> +    DFS
> +      Digital Frequency Synthesizer
> +
> +    ECP
> +      Enhanced Content Protection
> +
> +    EOP
> +      End Of Pipe/Pipeline
> +
> +    HQD
> +      Hardware Queue Descriptor
> +
> +    KCQ
> +      Kernel Compute Queue
> +
> +    KGQ
> +      Kernel Graphics Queue
> +
> +    KIQ
> +      Kernel Interface Queue
> +
> +    MQD
> +      Memory Queue Descriptor
> +
> +    PPLib
> +      PowerPlay Library - PowerPlay is the power management component.
> +
> +    SMU
> +      System Management Unit
> +
> +    VCE
> +      Video Compression Engine
> +
> +    VCN
> +      Video Codec Next
> diff --git a/Documentation/gpu/amdgpu/display/dc-glossary.rst b/Documentation/gpu/amdgpu/display/dc-glossary.rst
> new file mode 100644
> index 000000000000..547c0bfbb3e2
> --- /dev/null
> +++ b/Documentation/gpu/amdgpu/display/dc-glossary.rst
> @@ -0,0 +1,243 @@
> +===========
> +DC Glossary
> +===========
> +
> +On this page, we try to keep track of acronyms related to the display
> +component. If you do not find what you are looking for, look at the amdgpu
> +glossary; if you cannot find it anywhere, consider asking in the amdgfx and
> +update this page.
> +
> +.. glossary::
> +
> +    ABM
> +      Adaptive Backlight Modulation
> +
> +    APU
> +      Accelerated Processing Unit
> +
> +    ASIC
> +      Application-Specific Integrated Circuit
> +
> +    ASSR
> +      Alternate Scrambler Seed Reset
> +
> +    AZ
> +      Azalia (HD audio DMA engine)
> +
> +    BPC
> +      Bits Per Colour/Component
> +
> +    BPP
> +      Bits Per Pixel
> +
> +    Clocks
> +      * PCLK: Pixel Clock
> +      * SYMCLK: Symbol Clock
> +      * SOCCLK: GPU Engine Clock
> +      * DISPCLK: Display Clock
> +      * DPPCLK: DPP Clock
> +      * DCFCLK: Display Controller Fabric Clock
> +      * REFCLK: Real Time Reference Clock
> +      * PPLL: Pixel PLL
> +      * FCLK: Fabric Clock
> +      * MCLK: Memory Clock
> +
> +    CRC
> +      Cyclic Redundancy Check
> +
> +    CRTC
> +      Cathode Ray Tube Controller - commonly called "Controller" - Generates
> +      raw stream of pixels, clocked at pixel clock
> +
> +    CVT
> +      Coordinated Video Timings
> +
> +    DAL
> +      Display Abstraction layer
> +
> +    DC (Software)
> +      Display Core
> +
> +    DC (Hardware)
> +      Display Controller
> +
> +    DCC
> +      Delta Colour Compression
> +
> +    DCE
> +      Display Controller Engine
> +
> +    DCHUB
> +      Display Controller HUB
> +
> +    ARB
> +      Arbiter
> +
> +    VTG
> +      Vertical Timing Generator
> +
> +    DCN
> +      Display Core Next
> +
> +    DCCG
> +      Display Clock Generator block
> +
> +    DDC
> +      Display Data Channel
> +
> +    DIO
> +      Display IO
> +
> +    DPP
> +      Display Pipes and Planes
> +
> +    DSC
> +      Display Stream Compression (Reduce the amount of bits to represent pixel
> +      count while at the same pixel clock)
> +
> +    dGPU
> +      discrete GPU
> +
> +    DMIF
> +      Display Memory Interface
> +
> +    DML
> +      Display Mode Library
> +
> +    DMCU
> +      Display Micro-Controller Unit
> +
> +    DMCUB
> +      Display Micro-Controller Unit, version B
> +
> +    DPCD
> +      DisplayPort Configuration Data
> +
> +    DPM(S)
> +      Display Power Management (Signaling)
> +
> +    DRR
> +      Dynamic Refresh Rate
> +
> +    DWB
> +      Display Writeback
> +
> +    FB
> +      Frame Buffer
> +
> +    FBC
> +      Frame Buffer Compression
> +
> +    FEC
> +      Forward Error Correction
> +
> +    FRL
> +      Fixed Rate Link
> +
> +    GCO
> +      Graphical Controller Object
> +
> +    GMC
> +      Graphic Memory Controller
> +
> +    GSL
> +      Global Swap Lock
> +
> +    iGPU
> +      integrated GPU
> +
> +    IH
> +      Interrupt Handler
> +
> +    ISR
> +      Interrupt Service Request
> +
> +    ISV
> +      Independent Software Vendor
> +
> +    KMD
> +      Kernel Mode Driver
> +
> +    LB
> +      Line Buffer
> +
> +    LFC
> +      Low Framerate Compensation
> +
> +    LTTPR
> +      Link Training Tunable Phy Repeater
> +
> +    LUT
> +      Lookup Table
> +
> +    MALL
> +      Memory Access at Last Level
> +
> +    MC
> +      Memory Controller
> +
> +    MPC
> +      Multiple pipes and plane combine
> +
> +    MPO
> +      Multi Plane Overlay
> +
> +    MST
> +      Multi Stream Transport
> +
> +    NBP State
> +      Northbridge Power State
> +
> +    NBIO
> +      North Bridge Input/Output
> +
> +    ODM
> +      Output Data Mapping
> +
> +    OPM
> +      Output Protection Manager
> +
> +    OPP
> +      Output Plane Processor
> +
> +    OPTC
> +      Output Pipe Timing Combiner
> +
> +    OTG
> +      Output Timing Generator
> +
> +    PCON
> +      Power Controller
> +
> +    PGFSM
> +      Power Gate Finite State Machine
> +
> +    PSR
> +      Panel Self Refresh
> +
> +    SCL
> +      Scaler
> +
> +    SDP
> +      Scalable Data Port
> +
> +    SLS
> +      Single Large Surface
> +
> +    SST
> +      Single Stream Transport
> +
> +    TMDS
> +      Transition-Minimized Differential Signaling
> +
> +    TMZ
> +      Trusted Memory Zone
> +
> +    TTU
> +      Time to Underflow
> +
> +    VRR
> +      Variable Refresh Rate
> +
> +    UVD
> +      Unified Video Decoder
> diff --git a/Documentation/gpu/amdgpu/display/index.rst b/Documentation/gpu/amdgpu/display/index.rst
> index fe2ecad8df81..e23c752ee5f5 100644
> --- a/Documentation/gpu/amdgpu/display/index.rst
> +++ b/Documentation/gpu/amdgpu/display/index.rst
> @@ -26,3 +26,4 @@ table of content:
>     display-manager.rst
>     dc-debug.rst
>     dcn-overview.rst
> +   dc-glossary.rst
> diff --git a/Documentation/gpu/amdgpu/index.rst b/Documentation/gpu/amdgpu/index.rst
> index 5c8cbf514097..ff38c360b04e 100644
> --- a/Documentation/gpu/amdgpu/index.rst
> +++ b/Documentation/gpu/amdgpu/index.rst
> @@ -334,3 +334,10 @@ smartshift_bias
>  
>  .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: smartshift_bias
> +
> +AMDGPU Glossary
> +===============
> +
> +.. toctree::
> +
> +   amdgpu-glossary.rst
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
