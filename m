Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7D113B713
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jan 2020 02:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728909AbgAOBka (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 14 Jan 2020 20:40:30 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39323 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728882AbgAOBka (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Jan 2020 20:40:30 -0500
Received: by mail-oi1-f194.google.com with SMTP id a67so13899612oib.6
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2020 17:40:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3bD/LT4C3MC6J/wcM/SaP9VxFISKGm7IY0gKpOMd0Pg=;
        b=kYkQ99L8Wb5fHqndwIgi09/Ncx4eQaX55aNmN8mxXjiCk0DMmcncum/ci/hcIHoqPJ
         VMAkInnHPt3ch8EUKwXL68r6xggfDelYzIvgEY0a9xDYYQFb8kcHFD/rbzq5jm1yRIl4
         ZTiv0yA6gs8K2++buQKAXdk/eGYhYU1y5f3tnzkjmJR2wxiF28OYCt6epCXJTZQLW466
         pszCOKrquvLGPG2KRL2ANAOtxP0OmYj+dUA5c9hEcmv5frsJTwWYcfbLgSbNPFYo/i24
         ek/GeK+bcsfm+e+R5Qv51voH1tHNgUBkG0SdZPGY6o2HZt3Ob6oSoNRbFHWQ/9ptOORv
         aghg==
X-Gm-Message-State: APjAAAXljspztj0Dvh/YE86uPOPv5pJiDWSwATfRBCzLqqsNvUmyRc4B
        5wRfs+VHAL+vEL6rWhlQ8Qx0Zw8=
X-Google-Smtp-Source: APXvYqwGuJuom0Sj58dn7QQzgUwybmaKhh2av8E5twNTByz/9vQE5RJ/O0FRHpVnU9HkVJ5JcN6xNw==
X-Received: by 2002:aca:cf83:: with SMTP id f125mr18436681oig.15.1579052429117;
        Tue, 14 Jan 2020 17:40:29 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h7sm5975068otk.56.2020.01.14.17.40.27
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 17:40:27 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2209ae
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 19:40:26 -0600
Date:   Tue, 14 Jan 2020 19:40:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Andrew Murray <andrew.murray@arm.com>,
        Tom Joseph <tjoseph@cadence.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] dt-bindings: PCI: cadence: Add binding to specify
 max virtual functions
Message-ID: <20200115014026.GA10726@bogus>
References: <20191231113534.30405-1-kishon@ti.com>
 <20191231113534.30405-3-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191231113534.30405-3-kishon@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 31, 2019 at 05:05:29PM +0530, Kishon Vijay Abraham I wrote:
> Add binding to specify maximum number of virtual functions that can be
> associated with each physical function.
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  .../devicetree/bindings/pci/cdns,cdns-pcie-ep.txt         | 2 ++
>  .../devicetree/bindings/pci/ti,j721e-pci-ep.yaml          | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.txt b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.txt
> index 4a0475e2ba7e..432578202733 100644
> --- a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.txt
> +++ b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.txt
> @@ -9,6 +9,8 @@ Required properties:
>  
>  Optional properties:
>  - max-functions: Maximum number of functions that can be configured (default 1).
> +- max-virtual-functions: Maximum number of virtual functions that can be
> +    associated with each physical function.
>  - phys: From PHY bindings: List of Generic PHY phandles. One per lane if more
>    than one in the list.  If only one PHY listed it must manage all lanes. 
>  - phy-names:  List of names to identify the PHY.
> diff --git a/Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml b/Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml
> index 4621c62016c7..1d4964ba494f 100644
> --- a/Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/ti,j721e-pci-ep.yaml
> @@ -61,6 +61,12 @@ properties:
>      minimum: 1
>      maximum: 6
>  
> +  max-virtual-functions:
> +    minItems: 1
> +    maxItems: 6

Is there a PCIe spec limit to number of virtual functions per phy 
function? Or 2^32 virtual functions is okay.

> +    description: As defined in
> +                 Documentation/devicetree/bindings/pci/cdns,cdns-pcie-ep.txt

I suspect this this be a common property.

> +
>    dma-coherent:
>      description: Indicates that the PCIe IP block can ensure the coherency
>  
> @@ -85,6 +91,7 @@ required:
>    - cdns,max-outbound-regions
>    - dma-coherent
>    - max-functions
> +  - max-virtual-functions
>    - phys
>    - phy-names
>  
> @@ -107,6 +114,7 @@ examples:
>              clock-names = "fck";
>              cdns,max-outbound-regions = <16>;
>              max-functions = /bits/ 8 <6>;
> +            max-virtual-functions = /bits/ 16 <4 4 4 4 0 0>;
>              dma-coherent;
>              phys = <&serdes0_pcie_link>;
>              phy-names = "pcie_phy";
> -- 
> 2.17.1
> 
