Return-Path: <linux-doc+bounces-46121-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA84AB7152
	for <lists+linux-doc@lfdr.de>; Wed, 14 May 2025 18:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DA781887EA2
	for <lists+linux-doc@lfdr.de>; Wed, 14 May 2025 16:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5764E270EC5;
	Wed, 14 May 2025 16:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="tW6KXxWl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B73C2741B7
	for <linux-doc@vger.kernel.org>; Wed, 14 May 2025 16:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240014; cv=none; b=pZA2sHBKVVmEFdj1oZafxdGdpAxwyKR7KlpkuRyoh09S+lXsAFvVq/KaeNiImqNo+V7/ZjJTmIZ8V887jeJ9bK4/8DhS7U8lW+L8meb2/5Ei0U1M9IhVw4VFyCzvWMB2PsP46FghqMUEx+z6zo/qvnC48AeZG3C9EqrSdKZHrzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240014; c=relaxed/simple;
	bh=9QOQNm1DtryVnoeSN7DGC61nsEhaIMM2YYX27XDU2u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vE/JNosT4Et3RaYGH+uC6SZj6+GvHxdgJVeiscFemOvVKcXrIIHSrvqRLr900zmHfM3RFg76oYUONQs1cP16kXhkT6JI6shfDreFtDhMjsdHaes+WLH8T7jXf8zu7GKk+l1mm+libVhnHGj+LK4a43rTGe90x3oOQTFSJRHI3XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=tW6KXxWl; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7082e46880eso64014237b3.1
        for <linux-doc@vger.kernel.org>; Wed, 14 May 2025 09:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747240010; x=1747844810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJ0AzCyNbBw7LmTlYnlYRUZRvc6BiWujoVO60kyzOiU=;
        b=tW6KXxWljaiMmR2np+P1joBCEqM4CtD+NZd0mrqRmHRWzXS828ZOSDtNmgq4vBxlMh
         +yJfIY98WIpc7m8RNjqvDRv3fAJunQRYFGUL2QEdxfliDqkG+t8q6eKdeJ5iotFAbfOB
         g6dKFfqVbNLxXZlpPifyHJPGWhg122FRdGhA2D6Iadw1fY85506ZM0tnTGsvTUgaDBaY
         zuP5k1vmEkGdzyX9WerwK4ePCv2i+Ff5juHT0AYHiRHoUbz6Bd5kghDTl6/obqQcRfVy
         ZOStTNr6eW/y01sdLU9P4zFgHolRPuO52CPlgSP0hll7RaRAujd4WzU6gGrNFoMowqoD
         MtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240010; x=1747844810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJ0AzCyNbBw7LmTlYnlYRUZRvc6BiWujoVO60kyzOiU=;
        b=hCiZFo28AHfv8lpemSATP413eMSMWBIrNhi0E0x8XMuITGlIwpTYz8N50xwnMDKvjN
         6PBUC2TdJ2mjsTpDc9AUnnpLGVqLRPhV5BWeJG7kIjY9QPEcCl8Q+NgoSCqpvx0Aijij
         eUExCYn89C/Ty+RamS1HTDIUrw7xM/qGK8J2V36gqw6c5UMdZsBrbTI2phEyay2jp1yD
         uaNEt4LxVRq8S2NPKysOwg3iwmsMjyFZtd8yiPCgXWdEipiGB4e3c/jl5NJ0zqREZAQE
         IkzsLS2bpavb7jFcLKYaFEKxLN/jh8UDKs9pRkWaifR4hFas7fLEiaHY6GekUxQVWg4j
         D8XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWriREdyxlv/COHTb+iH8fvv2GBzEmgr2rBvM3uOcSRrORvn0dR0bmL+IUpTRmfBdDwMfTz1MIcR68=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXFejsA3aKSGpU6MHikG9HVUmxKOQPlCACTMgV7UYiJQbt+z7g
	lbNQ00zb6/4NCs07DXgm9Zb2rZv1tSUWzLZR1au4QMIDaeIMg3qijHm0nKTfgSk=
X-Gm-Gg: ASbGncsimGOADtzwn8m9Afsl2B/hKid0uwhIIUPyGKu9NOljLpTmpMau3EatVeKwu7i
	38AFFB5Akl2S8gZj7rfXqv8E+RPK1yd61GVkhtuUcdrYLoGisdPLB+St2h6zsYZEr7THBTMU4T8
	gwtqz9paKc4F5vj5GUGm2pHxtkJHVeT9iIAOTxcGmxThzIPRHr+GEyhv3obMjFu9bRGCxIH+bml
	P1+PsO26ZWjrxYYm0NwS9Okcv0tLKPlJC9Mr0NW8P/fi/0XbqXQho+xyi56sgqmXcXmwOl6k6MA
	ovnLSwckom9aF0XTxrol5jNzBnLM+IHwERIGFWfdeWAHuEUtfNe46THhWVj1cgam/wiTV9po9e5
	Mgv6K43qATGpWKQEXs/A=
X-Google-Smtp-Source: AGHT+IG+uTH2mFy8MPlKHWxCcLd2xL3H9qSutUTXT/habpIlOeQQg0fLL94X9rKsK/xpDtOCZ5yThg==
X-Received: by 2002:a05:690c:3341:b0:6ef:94db:b208 with SMTP id 00721157ae682-70c7f221d1amr55077777b3.24.1747240010102;
        Wed, 14 May 2025 09:26:50 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70a3d9cb5ccsm29779187b3.90.2025.05.14.09.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 09:26:49 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e78f528aa8eso6069068276.3;
        Wed, 14 May 2025 09:26:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQL6ZUqYR60/mjV7HZhQEUUW3dKH/vXljeyx4HVQPs53n/4gdMFXJA60weEhzFTn9PbJPN0f/vY2QqEHr3@vger.kernel.org, AJvYcCUkiGgBr2jDg+RYBsWsC6RF+sbXYhchzxbvXkmUid1KIu74NSQ52V5i1zj7LZBhXSQfJuuLC9kFnYIj@vger.kernel.org, AJvYcCUrtu+y4sofV1DOlWAtNJKGYdJdeQ3kPSMCaDUI7en2vDddYaeBCRz6BMixfN+3/ZPvzdwY0o3SchsGZq0=@vger.kernel.org, AJvYcCVcOXqOIpGd59hPHSY2ywtDrnJ3+QTcI6Kis0KdjT/oMPW7lFkqx5un/W9UnT9spgVJRek7n+8cQRbW@vger.kernel.org
X-Received: by 2002:a05:6902:1202:b0:e6d:f160:bbdf with SMTP id
 3f1490d57ef6-e7b3d59ae2fmr4832866276.36.1747240009056; Wed, 14 May 2025
 09:26:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-1-d4dbcfafc141@tomeuvizoso.net> <20250225160248.GA2563229-robh@kernel.org>
In-Reply-To: <20250225160248.GA2563229-robh@kernel.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 14 May 2025 18:26:38 +0200
X-Gmail-Original-Message-ID: <CAAObsKD01rdYf0E6Vev6oFRZEf1f006oi+ghgVUn+h=aRx-hmQ@mail.gmail.com>
X-Gm-Features: AX0GCFvDEBwxCoW2ZGLJEEIKb_2H5q_lCEI2NWi7ZFVAMNUkSoshPa20AanOMV0
Message-ID: <CAAObsKD01rdYf0E6Vev6oFRZEf1f006oi+ghgVUn+h=aRx-hmQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: npu: rockchip,rknn: Add bindings
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Tue, Feb 25, 2025 at 5:02=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Feb 25, 2025 at 08:55:47AM +0100, Tomeu Vizoso wrote:
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> >   IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../bindings/npu/rockchip,rknn-core.yaml           | 152 +++++++++++++=
++++++++
> >  1 file changed, 152 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core.y=
aml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e8d0afe4a7d1c4f166cf13a=
9f4aa7c1901362a3f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > @@ -0,0 +1,152 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Neural Processing Unit IP from Rockchip
> > +
> > +maintainers:
> > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > +
> > +description:
> > +  Rockchip IP for accelerating inference of neural networks, based on =
NVIDIA's
> > +  open source NVDLA IP.
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^npu-core@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - rockchip,rk3588-rknn-core-top
> > +          - const: rockchip,rknn-core-top
>
> Drop the fallbacks unless you have some evidence that the IP is the
> same across a lot of SoCs. If you don't, then
> rockchip,rk3588-rknn-core-top can be the fallback whenever there are
> more compatible SoCs.
>
> Or if there's version/feature registers that otherwise make it
> discoverable, then a common compatible is fine.
>
> > +      - items:
> > +          - enum:
> > +              - rockchip,rk3588-rknn-core
> > +          - const: rockchip,rknn-core
>
> I don't understand the difference between core and core-top. That needs
> to be explained in the top-level description.
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 2
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: hclk
> > +      - const: npu
> > +      - const: pclk
> > +    minItems: 2
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  npu-supply: true
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 2
> > +
> > +  reset-names:
> > +    items:
> > +      - const: srst_a
> > +      - const: srst_h
> > +
> > +  sram-supply: true
>
> Group supply properties together
>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - iommus
> > +  - npu-supply
> > +  - power-domains
> > +  - resets
> > +  - reset-names
> > +  - sram-supply
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - rockchip,rknn-core-top
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 4
> > +
> > +        clock-names:
> > +          minItems: 4
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - rockchip,rknn-core
> > +    then:
> > +      properties:
> > +        clocks:
> > +          maxItems: 2
> > +        clock-names:
> > +          maxItems: 2
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/rk3588-power.h>
> > +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> > +
> > +    bus {
> > +      #address-cells =3D <2>;
> > +      #size-cells =3D <2>;
> > +
> > +      rknn_core_top: npu-core@fdab0000 {
>
> npu@...

Can you extend on why you would prefer to have npu@? As each node
corresponds to a core inside the NPU, I went with npu-core@.

Thanks,

Tomeu

> > +        compatible =3D "rockchip,rk3588-rknn-core-top", "rockchip,rknn=
-core-top";
> > +        reg =3D <0x0 0xfdab0000 0x0 0x9000>;
> > +        assigned-clocks =3D <&scmi_clk SCMI_CLK_NPU>;
> > +        assigned-clock-rates =3D <200000000>;
> > +        clocks =3D <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
> > +                 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
> > +        clock-names =3D "aclk", "hclk", "npu", "pclk";
> > +        interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        iommus =3D <&rknn_mmu_top>;
> > +        npu-supply =3D <&vdd_npu_s0>;
> > +        power-domains =3D <&power RK3588_PD_NPUTOP>;
> > +        resets =3D <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
> > +        reset-names =3D "srst_a", "srst_h";
> > +        sram-supply =3D <&vdd_npu_mem_s0>;
> > +      };
> > +
> > +      rknn_core_1: npu-core@fdac0000 {
> > +        compatible =3D "rockchip,rk3588-rknn-core", "rockchip,rknn-cor=
e";
> > +        reg =3D <0x0 0xfdac0000 0x0 0x9000>;
> > +        clocks =3D <&cru ACLK_NPU1>, <&cru HCLK_NPU1>;
> > +        clock-names =3D "aclk", "hclk";
> > +        interrupts =3D <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        iommus =3D <&rknn_mmu_1>;
> > +        npu-supply =3D <&vdd_npu_s0>;
> > +        power-domains =3D <&power RK3588_PD_NPU1>;
> > +        resets =3D <&cru SRST_A_RKNN1>, <&cru SRST_H_RKNN1>;
> > +        reset-names =3D "srst_a", "srst_h";
> > +        sram-supply =3D <&vdd_npu_mem_s0>;
> > +      };
> > +    };
> > +...
> >
> > --
> > 2.48.1
> >

