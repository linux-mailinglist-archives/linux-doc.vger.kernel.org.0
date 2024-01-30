Return-Path: <linux-doc+bounces-7839-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DCF8426F2
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jan 2024 15:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A17A61F23561
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jan 2024 14:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805393F9FC;
	Tue, 30 Jan 2024 14:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6LLjrBm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC7B6EB62
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 14:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706625069; cv=none; b=Y9W+IXS383TPMsrDtAgjtyGD4WM23R7xF2iYsE8cZ59JQr5XuXuTRyOZG2FVOYf+x4wPY+COLxq+a8KhIQ7Ay/Fgz57s/mc2nNQ+aj8QTVCtWbTRejn3tKj3m53qiX5xgpwnYzB14KRH3NcA8vkh6vsKSTHY7gSz8XsL/9NVveI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706625069; c=relaxed/simple;
	bh=5VSkp4VquTGIbHfXMGSFy33z1EscXVApG/ONqtpsUfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=i6ZdJbuuXAfbM6EOkrkVouKUCP5UANAw44p9l3BCZdSDMrHNW05cB6VYUfufiHEXnQXpiKeB6eyj/necJ2fSkhRjKEfUm4o/BiOdrWbiNTUXTz6kOPxOv6oVstCA5yPfT4JVMISnbInfnnuoGI30iP7A6z5HUkcqby7ll6haqos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s6LLjrBm; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a354408e6bfso507886266b.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 06:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706625062; x=1707229862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C8FFhJPQtQHK90KRh4aDgUjQ/+FzbXtl3WGSDLkoiB4=;
        b=s6LLjrBmPa1A1brhek7YXcGDKs8CefdqI05OfLIC2FfUoBFYgtKH8DFnpiFdYVLUNv
         P/YzM6+j7LovslyV09yrolUUDHEGbW+JKkN1n1P3pse+nRuhTxoZm6KhWCE8lIEIgHv8
         zy8WtdvwPMxoZJflWjsNsVZO3mGGbOrHMkmfjd/LvQ+5wkN8nU8eKv6+dhB3tvxcQyqv
         P0cTGRvxG+s2IECMRer2JytU8FrSl5LUqiC7XSps+V884qssM9dByaF24Cp0xrpA63tx
         3ASmTE7j7fVh/5oDK6AtbBG8CekhteHUO+dwXNQwY0zRqVA18GlQLsLB2Hl0rPTwPGbt
         K7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706625062; x=1707229862;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8FFhJPQtQHK90KRh4aDgUjQ/+FzbXtl3WGSDLkoiB4=;
        b=p51zAwHMINJJj+14gWzyqa8atz6AAvCsgivpnLGPAczBVGTLuDR7tXvVPB6nIm3xsh
         wWjRviuJBSB0FPkVTYgtAnnDDO4L3IDv4XUsM5UeQQ0yzAHLuyDFaU6xC/LuH2nUNRz1
         /gmQ33zsPonfqzXKi/j+5faMjTgxf1ddgp8LX/1GOUmMPWY8VyMRk/FW9c245yZAxcHF
         yNfWdQPoTxs+YYxoFxzQTXQJq+9HQVjRbHbbJNsaPqN1s0vMfpkyjjQ40meNuLixZbq6
         s2OlJtQ33R+bLqOGxTbFJp2YP33HgyRy0GxJ0EV8EeXYZv8/o4NV+X58SC2cn5imukRS
         PCHw==
X-Gm-Message-State: AOJu0YzSA5Po2ohNOBEQkN82Nhq1FcdEydray13ZSOEU103ZHgRwbc0Z
	wgpe3aovnfjWoLuR3sH6FaOsINAzzirojyYc47wg95NOVxBc1aIltjfJFTN1q1k=
X-Google-Smtp-Source: AGHT+IEYLyhraoMA9QILcT4fpjbpYIT9jeOlcxNkJifqkTZMeZli66Q25vuwuy/uQzPugqBn/UAuLA==
X-Received: by 2002:a17:907:9876:b0:a31:4c93:93b1 with SMTP id ko22-20020a170907987600b00a314c9393b1mr1649938ejc.15.1706625061829;
        Tue, 30 Jan 2024 06:31:01 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUsevdWTQ6da2O2WpYpW9SJO4yuy04FL+ATQT/S2+W8/jfneFXQ2DTwzrsLf6g7zTl1cfcmH5hoaNgFUqYtlknbmFMF6eFVTdK9N/4eYTttt8k2Gha59QxvCDwo8g2cZ92yGEAdcgb3OC95jU21dej/VzfNIPx/+XMtq/N65rQPEApcY3m0HZeUG8yl8mANDXZNW1xHJyhokGQrcqsKfWuXatFPTR4sm74kmDIxy2mr/brXLijsdmHrHLMi86S2573dZnkLyps2RP8iIlei8Xrw1YSYWPxWalq8mh12NJPVaeMZ1wAhvt43vBHOoq23RvTgRcvj7s/tkNadgm9cylkZa+7mAJWKywV3kGA2ZNZyjBxVrSrZYLSZuntzCfBThQpidiHLxddRy6fhrS7IUU1P3Xc8jQ87wumGHKmIMt+QjknTkhoroA==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id th7-20020a1709078e0700b00a30ed424e18sm5145750ejc.41.2024.01.30.06.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 06:31:01 -0800 (PST)
Message-ID: <8b01a23d-c5f1-474b-b69d-ef629d6d5f24@linaro.org>
Date: Tue, 30 Jan 2024 15:30:59 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: misc: xlnx,sd-fec: convert bindings to
 yaml
Content-Language: en-US
To: Dragan Cvetic <dragan.cvetic@amd.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Michal Simek <michal.simek@amd.com>,
 "Erim, Salih" <salih.erim@amd.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <20240130125309.4019261-1-dragan.cvetic@amd.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240130125309.4019261-1-dragan.cvetic@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/01/2024 13:53, Dragan Cvetic wrote:
> Convert AMD (Xilinx) sd-fec bindings to yaml format, so it can validate
> dt-entries as well as any future additions to yaml.
> Change in clocks is due to IP is itself configurable and
> only the first two clocks are in all combinations. The last
> 6 clocks can be present in some of them. It means order is
> not really fixed and any combination is possible.
> Interrupt may or may not be present.
> The documentation for sd-fec bindings is now YAML, so update the
> MAINTAINERS file.
> Update the link to the new yaml file in xilinx_sdfec.rst.
> 
> Signed-off-by: Dragan Cvetic <dragan.cvetic@amd.com>
> ---
> Changes in v2:
> ---
> Drop clocks description.
> Use "contains:" with enum for optional clock-names and update
> comment explaining diference from the original DT binding file.
> Remove trailing full stops.
> Add more details in sdfec-code description.
> Set sdfec-code to "string" not "string-array"
> ---
> Changes in v3:
> Fix a mistake in example, set interrupt type to 0.

Why? That's not a correct interrupt type in most of the cases.

Was this patch tested?

...

> diff --git a/Documentation/devicetree/bindings/misc/xlnx,sd-fec.yaml b/Documentation/devicetree/bindings/misc/xlnx,sd-fec.yaml
> new file mode 100644
> index 000000000000..ed87c48a9ee9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/xlnx,sd-fec.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/xlnx,sd-fec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Xilinx SDFEC(16nm) IP
> +
> +maintainers:
> +  - Cvetic, Dragan <dragan.cvetic@amd.com>
> +  - Erim, Salih <salih.erim@amd.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The Soft Decision Forward Error Correction (SDFEC) Engine is a Hard IP block
> +  which provides high-throughput LDPC and Turbo Code implementations.
> +  The LDPC decode & encode functionality is capable of covering a range of
> +  customer specified Quasi-cyclic (QC) codes. The Turbo decode functionality
> +  principally covers codes used by LTE. The FEC Engine offers significant
> +  power and area savings versus implementations done in the FPGA fabric.
> +


> +  xlnx,sdfec-dout-words:
> +    description: |
> +      A value 0 indicates that the DOUT_WORDS interface is
> +      driven with a fixed value and is not present on the device, a value of 1
> +      configures the DOUT_WORDS to be block based, while a value of 2 configures the
> +      DOUT_WORDS input to be supplied for each AXI transaction.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1, 2 ]
> +
> +

Just one blank line.

Best regards,
Krzysztof


