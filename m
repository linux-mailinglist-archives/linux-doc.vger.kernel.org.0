Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2731634BD
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jul 2019 13:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbfGILG4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 9 Jul 2019 07:06:56 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44187 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfGILG4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Jul 2019 07:06:56 -0400
Received: by mail-pl1-f193.google.com with SMTP id t14so6824673plr.11;
        Tue, 09 Jul 2019 04:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vcLUjHeh6h5uRgV4arFKMehsSH4BFabQLIxDxss6ZJ4=;
        b=JXnOkwxRPW4lN1TVBlKXh44workAk1kDfFsZVyOw4Ludga29DE6wVIqyrLIv0TPH3X
         1nzgKZH9iKxy3yb6Uv/aPNBKKKFJfZeAGaUnJXZzeoh/sF42TUOsG/9Bpx8Y4NpmzPkQ
         j20JPYWc6AdJaxkZrJeLlhaHkUydzAqftb2mZc2gWKd77vUIYAmR41cWXQ6NTbQ5oHp/
         aUJRaO7n9n0Ohj7XZ+JjPqn4y2vXCeIsbgRv7Yuk3haWTL0yO+ovPrZXw6Gy5LCYTm2a
         oBElS/O2IeRzyKAQRseN/ZXxCdU3H+HW8RBXNgAMnxjJ7eNJ8UySdaZLUmdAGp/0ux7U
         UDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vcLUjHeh6h5uRgV4arFKMehsSH4BFabQLIxDxss6ZJ4=;
        b=ebdO9A76Mcff343cIqzNatK5EF4BWjuPx/6aAZt3Y2vOWkYiES3itLpbp5wqbBMu6d
         ag/GpbqxxPhy9bXL5o/XQqgjifyPlJcLjMc7ECJGFKiBxaZuj1yUy4MDRdUk4DhWJaiV
         LpOJy33XuiaUE0VUpw+ZkCjxzobA6u4875pal2rx2MLRnolgx3H7qhSb+pFbPMJolnSf
         OkkNAwA2LyWu+uD0b6q0KEkOlJvP5fzpb5sI0h5bqH7PZp1gAbNeT03e+2kzxng5jK3d
         kMiTUJkOLUQtfKMzF6KeqIAQXAA9fMDhv6ezSLgOYDzDHBgMhEeSQ0UDpW7o/WEqhfG6
         rnmA==
X-Gm-Message-State: APjAAAUKgPn/81c9HlKSpLyyl2UKBoHGUMufiLNAnZXLMSCYYI4UqjaP
        kACqkzjSdTo58wLvc3QCPlQ=
X-Google-Smtp-Source: APXvYqy2N4F/E6s4YB0OPMYZJTxr/jPSl8pt2vXg8mDcllsDoKMSeWYdu5jq4uQU8BdRrUrAF+ev1g==
X-Received: by 2002:a17:902:8b82:: with SMTP id ay2mr29213267plb.164.1562670415368;
        Tue, 09 Jul 2019 04:06:55 -0700 (PDT)
Received: from icarus ([2001:268:c145:6825:1c79:bf4:8232:d614])
        by smtp.gmail.com with ESMTPSA id h1sm29334483pfo.152.2019.07.09.04.06.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2019 04:06:54 -0700 (PDT)
Date:   Tue, 9 Jul 2019 20:06:33 +0900
From:   William Breathitt Gray <vilhelm.gray@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Marcus Folkesson <marcus.folkesson@gmail.com>
Cc:     linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: driver-api: generic-counter: fix file path to
 ABI doc
Message-ID: <20190709110613.GA4476@icarus>
References: <20190709075436.7294-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190709075436.7294-1-marcus.folkesson@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 09, 2019 at 09:54:36AM +0200, Marcus Folkesson wrote:
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> v2: Correct the other place as well..
> 
>  Documentation/driver-api/generic-counter.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/generic-counter.rst b/Documentation/driver-api/generic-counter.rst
> index 0c161b1a3be6..8382f01a53e3 100644
> --- a/Documentation/driver-api/generic-counter.rst
> +++ b/Documentation/driver-api/generic-counter.rst
> @@ -233,7 +233,7 @@ Userspace Interface
>  Several sysfs attributes are generated by the Generic Counter interface,
>  and reside under the /sys/bus/counter/devices/counterX directory, where
>  counterX refers to the respective counter device. Please see
> -Documentation/ABI/testing/sys-bus-counter-generic-sysfs for detailed
> +Documentation/ABI/testing/sysfs-bus-counter for detailed
>  information on each Generic Counter interface sysfs attribute.
>  
>  Through these sysfs attributes, programs and scripts may interact with
> @@ -325,7 +325,7 @@ sysfs attributes, where Y is the unique ID of the respective Count:
>  
>  For a more detailed breakdown of the available Generic Counter interface
>  sysfs attributes, please refer to the
> -Documentation/ABI/testing/sys-bus-counter file.
> +Documentation/ABI/testing/sysfs-bus-counter file.
>  
>  The Signals and Counts associated with the Counter device are registered
>  to the system as well by the counter_register function. The
> -- 
> 2.22.0

Fixes: 09e7d4ed8991 ("docs: Add Generic Counter interface documentation")
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Jonathan, would you be able to pick this up in your tree?

Thanks,

William Breathitt Gray
