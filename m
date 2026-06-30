Return-Path: <linux-doc+bounces-94174-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Aj+SHErOQ2r1igoAu9opvQ
	(envelope-from <linux-doc+bounces-94174-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 16:10:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D366E53FD
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 16:10:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="aH/4/O97";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94174-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94174-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C26D030EBBFE
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 14:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0CA3ED5C5;
	Tue, 30 Jun 2026 14:02:10 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DBA3D902E;
	Tue, 30 Jun 2026 14:02:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828130; cv=none; b=jvhVylfijv/mZVXswaJ40aStwubyGmP4Mt8NgM9oM2/mnQOn1eppXiqXIRMViRjdU12QSBNS1diSYFPCS+Micp5YsMZKb0eKaooYNiT1SHpPiqZqb8gRNuv2Ot8UlR9n+1BNWmolJo3rPCUpOJE1W5E8Qu9p+FRL2MeLfUFEI9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828130; c=relaxed/simple;
	bh=9Zd0xLMn0lFqaEDohKACDpMcNvx7eG86dYNQ6Z2YD0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTWaEQO5a13T09vivpD6HW0r/oOS73jYKAGuhTJaIpkSAF2U6R1qhLjXo1sNnO+67DZ66KincBc+whjUgNF+l7TNOiFK60prDu3LerzfUaAY3VHVKz95FU9qYx67JMn5Oe6WpArjZ5ZMoKAdmnyT+vgNQVWvuyDuo+dJi351YSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aH/4/O97; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C7A1F00A3D;
	Tue, 30 Jun 2026 14:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782828128;
	bh=AhyO9uo6KidZv/UUPZL+eUnqxxv3KaSfybSbxX2r0Is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aH/4/O97ef+PBMmQZEnRmZE2eEcvV23RPiuJkui9GX6CcgNQLLlTWWaMKUotIsBoc
	 JOoJBnXRRUZ0k4SNX/niZOnQt0ah62ecM9RHqYmDqddmwApS4S9fA2pQEXoOCAujyC
	 JatJr0/IgXcFMq473CTyA8sD6pCJOQrSSVrqNuoxibXPKYsb7wN1ebUeAsLCZrX/Ks
	 FDOZCn8p4EtYbjU742DQ4exl4qvWJw8jwmlh1NEDEApn+7mCyXe0N0TJt98Eo4vSCS
	 as/r81Vr3CCpY4KEyKq5oESaNcxC9qSE8+DkLo43SsI4xdustuLwI/O8chKHD0AF4C
	 vG2eiiS7I4PVA==
Date: Tue, 30 Jun 2026 09:02:07 -0500
From: Rob Herring <robh@kernel.org>
To: Rodrigo Alencar <rodrigo.alencar@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v6 08/16] dt-bindings: iio: frequency: add ad9910
Message-ID: <20260630140207.GA2986379-robh@kernel.org>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
 <20260618-ad9910-iio-driver-v6-8-79125ffbe430@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-ad9910-iio-driver-v6-8-79125ffbe430@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94174-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rodrigo.alencar@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:andy@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,analog.com:url,analog.com:email,devicetree.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0D366E53FD

On Thu, Jun 18, 2026 at 02:27:24PM +0100, Rodrigo Alencar wrote:
> DT-bindings for AD9910, a 1 GSPS DDS with 14-bit DAC. It includes
> configurations for clocks, DAC current, reset and basic GPIO control.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> ---
>  .../bindings/iio/frequency/adi,ad9910.yaml         | 189 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 196 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml b/Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml
> new file mode 100644
> index 000000000000..a78fe33ba21f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml
> @@ -0,0 +1,189 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/frequency/adi,ad9910.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices AD9910 Direct Digital Synthesizer
> +
> +maintainers:
> +  - Rodrigo Alencar <rodrigo.alencar@analog.com>
> +
> +description:

You need '>' to preserve paragraphs.

> +  The AD9910 is a 1 GSPS direct digital synthesizer (DDS) with an integrated
> +  14-bit DAC. It features single tone mode with 8 configurable profiles,
> +  a digital ramp generator, RAM control, OSK, and a parallel data port for
> +  high-speed streaming.
> +
> +  https://www.analog.com/en/products/ad9910.html
> +
> +properties:
> +  compatible:
> +    const: adi,ad9910
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    maximum: 70000000
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: Reference clock (REF_CLK).
> +      - description: Optional synchronization clock (SYNC_IN).
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: ref_clk
> +      - const: sync_in
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clock-output-names:
> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      enum: [ sync_clk, pdclk, sync_out ]
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      Requires interrupt-names property with the same number of items. The
> +      supported interrupts are 'drover' (digital ramp generator limit) and
> +      'ram_swp_ovr' (end of RAM sweep).
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum: [ drover, ram_swp_ovr ]
> +
> +  dvdd-io33-supply:
> +    description: 3.3V Digital I/O supply.
> +
> +  avdd33-supply:
> +    description: 3.3V Analog DAC supply.
> +
> +  dvdd18-supply:
> +    description: 1.8V Digital Core supply.
> +
> +  avdd18-supply:
> +    description: 1.8V Analog Core supply.
> +
> +  reset-gpios:
> +    description:
> +      GPIOs controlling the Main Device reset.
> +
> +  io-reset-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO controlling the I/O_RESET pin.
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO controlling the EXT_PWR_DWN pin.
> +
> +  update-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO controlling the I/O_UPDATE pin.
> +
> +  profile-gpios:
> +    minItems: 3
> +    maxItems: 3
> +    description:
> +      GPIOs controlling the PROFILE[2:0] pins for profile selection.
> +
> +  sync-err-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO used to read SYNC_SMP_ERR pin status.
> +
> +  lock-detect-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO used to read PLL_LOCK pin status.
> +
> +  adi,pll-enable:
> +    type: boolean
> +    description:
> +      Indicates that a loop filter is connected and the internal PLL is enabled.
> +      Often used when the reference clock is provided by a crystal or by a
> +      single-ended on-board oscillator.
> +
> +  adi,charge-pump-current-microamp:
> +    minimum: 212
> +    maximum: 387
> +    default: 212
> +    description:
> +      PLL charge pump current in microamps. Only applicable when the internal
> +      PLL is enabled. The value is rounded to the nearest supported step. This
> +      value depends mostly on the loop filter design.
> +
> +  adi,refclk-out-drive-strength:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [ disabled, low, medium, high ]
> +    default: disabled
> +    description:
> +      Reference clock output (DRV0) drive strength. Only applicable when
> +      the internal PLL is enabled.
> +
> +dependencies:
> +  adi,charge-pump-current-microamp: [ 'adi,pll-enable' ]
> +  adi,refclk-out-drive-strength: [ 'adi,pll-enable' ]
> +  lock-detect-gpios: [ 'adi,pll-enable' ]
> +  interrupts: [ interrupt-names ]
> +  clocks: [ clock-names ]

As clocks is required below, then 'clock-names' is also always required.

> +  '#clock-cells': [ clock-output-names ]

The h/w sometimes has clock outputs and sometimes doesn't? #clock-cells 
should always be required IMO.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - dvdd-io33-supply
> +  - avdd33-supply
> +  - dvdd18-supply
> +  - avdd18-supply
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        dds@0 {
> +            compatible = "adi,ad9910";
> +            reg = <0>;
> +            spi-max-frequency = <1000000>;
> +            clocks = <&ad9910_refclk>;
> +            clock-names = "ref_clk";
> +
> +            dvdd-io33-supply = <&vdd_io33>;
> +            avdd33-supply = <&vdd_a33>;
> +            dvdd18-supply = <&vdd_d18>;
> +            avdd18-supply = <&vdd_a18>;
> +
> +            reset-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
> +            io-reset-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
> +            powerdown-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
> +            update-gpios = <&gpio 3 GPIO_ACTIVE_HIGH>;
> +            profile-gpios = <&gpio 4 GPIO_ACTIVE_HIGH>,
> +                            <&gpio 5 GPIO_ACTIVE_HIGH>,
> +                            <&gpio 6 GPIO_ACTIVE_HIGH>;
> +
> +            adi,pll-enable;
> +            adi,charge-pump-current-microamp = <387>;
> +            adi,refclk-out-drive-strength = "disabled";
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b051eccafa60..998b06fd97fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1645,6 +1645,13 @@ W:	https://ez.analog.com/linux-software-drivers
>  F:	Documentation/devicetree/bindings/iio/dac/adi,ad9739a.yaml
>  F:	drivers/iio/dac/ad9739a.c
>  
> +ANALOG DEVICES INC AD9910 DRIVER
> +M:	Rodrigo Alencar <rodrigo.alencar@analog.com>
> +L:	linux-iio@vger.kernel.org
> +S:	Supported
> +W:	https://ez.analog.com/linux-software-drivers
> +F:	Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml
> +
>  ANALOG DEVICES INC MAX22007 DRIVER
>  M:	Janani Sunil <janani.sunil@analog.com>
>  L:	linux-iio@vger.kernel.org
> 
> -- 
> 2.43.0
> 

