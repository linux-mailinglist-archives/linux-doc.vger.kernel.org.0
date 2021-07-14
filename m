Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2B73C8BB6
	for <lists+linux-doc@lfdr.de>; Wed, 14 Jul 2021 21:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhGNTfm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 14 Jul 2021 15:35:42 -0400
Received: from mail-il1-f169.google.com ([209.85.166.169]:35746 "EHLO
        mail-il1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbhGNTfm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jul 2021 15:35:42 -0400
Received: by mail-il1-f169.google.com with SMTP id a11so2736405ilf.2;
        Wed, 14 Jul 2021 12:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P1VAUlEyjs73Bx47V1Jfiky3UvvDoViqJHQRhTR3K1Y=;
        b=MYajywoqu0VgFENOec/EEM2+kK7yrViJIa74y+hiOPvUhLxDByzjtNQDU31nreQLd/
         u8xS/cZ/Y8bH8nS/kXoz2pAohDLR+bb6m+3hBIwKYVHfvN0hkHQejCKdkp/KAJSjxQrL
         7xcK73XABRRluEOW7YwKCAXTZkUZPxHCFSTGZS5G1gpr9kPKdNBeVvbeU8EMV/9awEzK
         lHwB6DkySQEVLSkyf19diAyFL+Vm9nAub09Kp3T640UPG8tdMrhcJTZDsnuP6x/xothu
         48WKgmN2wMT2wT5LoZZ1KEJ/sakaDfD95KPlcZ2DvRsfWwTf3u+sV5FS0/exDrgFXAW6
         zXjQ==
X-Gm-Message-State: AOAM531rsYkEYDjdwEhYw279GFRQxfwD4vVgYQjeVQTjfG99jxAmRcvC
        C/rsIk/sE/Mo+Mggb+uaUNZ9TcIGhg==
X-Google-Smtp-Source: ABdhPJwHzjzD0JWdrl/v0E+7zAdqUT9uQ+9746AJrdOx7rukqDaUTh2BferopKTZdNflJ33syc3Q/A==
X-Received: by 2002:a92:3302:: with SMTP id a2mr7790789ilf.62.1626291169718;
        Wed, 14 Jul 2021 12:32:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p19sm1726825iob.7.2021.07.14.12.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 12:32:48 -0700 (PDT)
Received: (nullmailer pid 3134962 invoked by uid 1000);
        Wed, 14 Jul 2021 19:32:46 -0000
Date:   Wed, 14 Jul 2021 13:32:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Emil Renner Berthing <esmil@mailme.dk>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        Emil Renner Berthing <kernel@esmil.dk>,
        Samin Guo <samin.guo@starfivetech.com>,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: add starfive,jh7100-temp
 bindings
Message-ID: <20210714193246.GA3134908@robh.at.kernel.org>
References: <20210624162108.832518-1-esmil@mailme.dk>
 <20210624162108.832518-2-esmil@mailme.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624162108.832518-2-esmil@mailme.dk>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 24 Jun 2021 18:21:07 +0200, Emil Renner Berthing wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add bindings for the temperature sensor on the StarFive JH7100 SoC.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  .../bindings/hwmon/starfive,jh7100-temp.yaml  | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jh7100-temp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
