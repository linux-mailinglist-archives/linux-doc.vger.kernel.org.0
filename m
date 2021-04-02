Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4AE352836
	for <lists+linux-doc@lfdr.de>; Fri,  2 Apr 2021 11:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234744AbhDBJJw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 2 Apr 2021 05:09:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:52932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229553AbhDBJJu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 2 Apr 2021 05:09:50 -0400
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 788CE61104;
        Fri,  2 Apr 2021 09:09:47 +0000 (UTC)
Date:   Fri, 2 Apr 2021 10:09:58 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/32] MAINTAINERS: update envelope-detector.yaml
 reference
Message-ID: <20210402100958.08293b93@jic23-huawei>
In-Reply-To: <d4ccc625ccb89730c03204b7aae98fd94ea97fc2.1617279355.git.mchehab+huawei@kernel.org>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
        <d4ccc625ccb89730c03204b7aae98fd94ea97fc2.1617279355.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  1 Apr 2021 14:17:27 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Changeset 66a6dcc20e63 ("dt-bindings:iio:adc:envelope-detector: txt to yaml conversion.")
> renamed: Documentation/devicetree/bindings/iio/adc/envelope-detector.txt
> to: Documentation/devicetree/bindings/iio/adc/envelope-detector.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: 66a6dcc20e63 ("dt-bindings:iio:adc:envelope-detector: txt to yaml conversion.")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Applied.

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 52ce258fab37..82220a72eba2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8761,7 +8761,7 @@ M:	Peter Rosin <peda@axentia.se>
>  L:	linux-iio@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/ABI/testing/sysfs-bus-iio-adc-envelope-detector
> -F:	Documentation/devicetree/bindings/iio/adc/envelope-detector.txt
> +F:	Documentation/devicetree/bindings/iio/adc/envelope-detector.yaml
>  F:	drivers/iio/adc/envelope-detector.c
>  
>  IIO MULTIPLEXER

