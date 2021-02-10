Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E558316758
	for <lists+linux-doc@lfdr.de>; Wed, 10 Feb 2021 14:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbhBJNAB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 10 Feb 2021 08:00:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231703AbhBJM6O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Feb 2021 07:58:14 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127F7C061224
        for <linux-doc@vger.kernel.org>; Wed, 10 Feb 2021 04:56:37 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id u20so1448481qku.7
        for <linux-doc@vger.kernel.org>; Wed, 10 Feb 2021 04:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+MVRo4/XnQIx3fd6415VPGbeWHNWjyo8mTnVMpej2lA=;
        b=O53d2BI1j53KMGAaF6bzA0O5LOM9nvSszG+MG7vHXtJizZwpWW8S02aJyhNyL5wBFV
         mnrjSjqLO68+sywN8hY/2H8Q4H0Bqlujxc5cNSQ3c93vkFkfN8336ieQq2/Xd43DQ1aL
         YOcAyEETi1AONr9aaDF5ImQHc/MpJ6pnXwy8pTGJ8eFuLBgOfJUq8VwBgtsKOqasXKm6
         QOHLwog1rbX7Xi6mNrkS5/AssX+IYssu6x3VuOj/+f9dYS/3wjog1YIcNRNZuUv+X/wz
         b7Y8peA5t7BBpa1BNm/UzOpgs5ZkK1km/gtTeRC+QLirflyIAA6lwp2R/L7+gQnGKoH5
         pG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+MVRo4/XnQIx3fd6415VPGbeWHNWjyo8mTnVMpej2lA=;
        b=TstT/yWbwN/s6y+HvIxl/j+xcd+C2EqxdobbDBBrML/8yAAyVYtbmvTDOU6Yw6DlVp
         R7vo8F/RzkfNvczclBjzl0kh9oE+Qjqe30CQRItkY2PP6/EcSUyUtARJ9GVQu+B4KZiZ
         CE+FCWF/bv1lXxa6xYU3CeeXI3Ti10nsiVpchKe0pc9gq5FZ2Lo0zd2AcLc8xSn8oAxP
         CFkLHQsvd403THa9BzACVF4iuLwnQE7YyFyajsO8s6m0pDzCSS6iUpF45AtC3mQABceN
         g7BkHbdoPlXnEOkqNFz9jHIjXMqBqdI1dJfQ+bjtPWesUJvL9I68yqZTCwlor+g7q9+o
         fP+g==
X-Gm-Message-State: AOAM533xz1DBaZd7iOxmkqjeUps6728S/kEe/+KCCyPJp5m7CHi851xT
        K6R3a214kA1HXSXaAKPrqHU/iw==
X-Google-Smtp-Source: ABdhPJxjqcsRFWifv9FC85VtsN1NtJhfvFQm3LwV9wq/GU8W4tcO6YLlagLlTq+fjHi5rG8zRu4Ivw==
X-Received: by 2002:a37:a8d6:: with SMTP id r205mr3094578qke.489.1612961796341;
        Wed, 10 Feb 2021 04:56:36 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id y190sm1331727qkb.133.2021.02.10.04.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 04:56:35 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1l9p2o-005qZi-KG; Wed, 10 Feb 2021 08:56:34 -0400
Date:   Wed, 10 Feb 2021 08:56:34 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     linux-mm@kvack.org, nouveau@lists.freedesktop.org,
        bskeggs@redhat.com, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kvm-ppc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jhubbard@nvidia.com, rcampbell@nvidia.com, jglisse@redhat.com
Subject: Re: [PATCH 1/9] mm/migrate.c: Always allow device private pages to
 migrate
Message-ID: <20210210125634.GL4718@ziepe.ca>
References: <20210209010722.13839-1-apopple@nvidia.com>
 <20210209010722.13839-2-apopple@nvidia.com>
 <20210209133932.GD4718@ziepe.ca>
 <1780857.6Ip0F2Sa4d@nvdebian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1780857.6Ip0F2Sa4d@nvdebian>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 10, 2021 at 02:40:10PM +1100, Alistair Popple wrote:
> On Wednesday, 10 February 2021 12:39:32 AM AEDT Jason Gunthorpe wrote:
> > On Tue, Feb 09, 2021 at 12:07:14PM +1100, Alistair Popple wrote:
> > > Device private pages are used to represent device memory that is not
> > > directly accessible from the CPU. Extra references to a device private
> > > page are only used to ensure the struct page itself remains valid whilst
> > > waiting for migration entries. Therefore extra references should not
> > > prevent device private page migration as this can lead to failures to
> > > migrate pages back to the CPU which are fatal to the user process.
> > 
> > This should identify the extra references in expected_count, just
> > disabling this protection seems unsafe, ZONE_DEVICE is not so special
> > that the refcount means nothing
> 
> This is similar to what migarte_vma_check_page() does now. The issue is that a 
> migration wait takes a reference on the device private page so you can end up 
> with one thread stuck waiting for migration whilst the other can't migrate due 
> to the extra refcount.
> 
> Given device private pages can't undergo GUP and that it's not possible to 
> differentiate the migration wait refcount from any other refcount we assume 
> any possible extra reference must be from migration wait.

GUP is not the only thing that elevates the refcount, I think this is
an unsafe assumption

Why is migration holding an extra refcount anyhow?

Jason
