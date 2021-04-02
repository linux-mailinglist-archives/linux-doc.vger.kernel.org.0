Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3D61352854
	for <lists+linux-doc@lfdr.de>; Fri,  2 Apr 2021 11:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234029AbhDBJPC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 2 Apr 2021 05:15:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:54588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233718AbhDBJPB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 2 Apr 2021 05:15:01 -0400
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8CA5160FF3;
        Fri,  2 Apr 2021 09:14:58 +0000 (UTC)
Date:   Fri, 2 Apr 2021 10:15:09 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/32] MAINTAINERS: update voltage-divider.yaml
 reference
Message-ID: <20210402101509.4cb48d9e@jic23-huawei>
In-Reply-To: <5006767228ea6392a33e280612599ab5749db021.1617279355.git.mchehab+huawei@kernel.org>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
        <5006767228ea6392a33e280612599ab5749db021.1617279355.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  1 Apr 2021 14:17:30 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Changeset 6f633bc91ac1 ("dt-bindings:iio:afe:voltage-divider: txt to yaml conversion")
> renamed: Documentation/devicetree/bindings/iio/afe/voltage-divider.txt
> to: Documentation/devicetree/bindings/iio/afe/voltage-divider.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: 6f633bc91ac1 ("dt-bindings:iio:afe:voltage-divider: txt to yaml conversion")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Applied.

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 71950316c736..5110f47ebf85 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8797,7 +8797,7 @@ L:	linux-iio@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/afe/current-sense-amplifier.yaml
>  F:	Documentation/devicetree/bindings/iio/afe/current-sense-shunt.yaml
> -F:	Documentation/devicetree/bindings/iio/afe/voltage-divider.txt
> +F:	Documentation/devicetree/bindings/iio/afe/voltage-divider.yaml
>  F:	drivers/iio/afe/iio-rescale.c
>  
>  IKANOS/ADI EAGLE ADSL USB DRIVER

