Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEB9F2555F4
	for <lists+linux-doc@lfdr.de>; Fri, 28 Aug 2020 10:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbgH1IHm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 28 Aug 2020 04:07:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:48386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727911AbgH1IHl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 28 Aug 2020 04:07:41 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9EEDB2098B;
        Fri, 28 Aug 2020 08:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598602061;
        bh=hJ3AmAbkoTRR2X2K0WF/fJVh0gW/NmDC1EM5IsUmwvM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fucSEtUU0BPadE/no2QmLXf4VpvgdhPBX1PxamRGNE+awawDlQssMzBN5Y4p46jAz
         vZrocfTJTZm98d5+hyv8kAowiUOwJRtCl2Vs3mOOTJcpuOw4Nr09W//k7wHmebvi9g
         I0SH/JvbhL3c8wl4BiOLof8jfO2AKramN5btko0A=
Date:   Fri, 28 Aug 2020 10:07:53 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Security Officers <security@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: Add the security document to SECURITY
 CONTACT
Message-ID: <20200828080753.GA1007318@kroah.com>
References: <20200827182029.3458-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200827182029.3458-1-krzk@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 27, 2020 at 08:20:29PM +0200, Krzysztof Kozlowski wrote:
> When changing the document related to kernel security workflow, notify
> the security mailing list as its concerned by this.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: <security@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Changed order - F: go to end of entry,
> 2. Remove embargoed-hardware-issues
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8107b3d5d6df..19064a4ae9b0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15621,6 +15621,7 @@ F:	include/uapi/linux/sed*
>  SECURITY CONTACT
>  M:	Security Officers <security@kernel.org>
>  S:	Supported
> +F:	Documentation/admin-guide/security-bugs.rst
>  
>  SECURITY SUBSYSTEM
>  M:	James Morris <jmorris@namei.org>
> -- 
> 2.17.1
> 

Thanks, I'll queue this up in my tree...

greg k-h
