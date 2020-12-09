Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A38872D3E91
	for <lists+linux-doc@lfdr.de>; Wed,  9 Dec 2020 10:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729087AbgLIJXO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Dec 2020 04:23:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727339AbgLIJXJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 04:23:09 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62657C061793
        for <linux-doc@vger.kernel.org>; Wed,  9 Dec 2020 01:22:29 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id x22so779928wmc.5
        for <linux-doc@vger.kernel.org>; Wed, 09 Dec 2020 01:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Mx+SSux44r2ybzN5uouGLt8Nyz1sei2BYkCtNp5/Q1U=;
        b=BrjxDVk7vGKmI9PkGvFwQ3GU2hA8fRK99GdYe9yoQ15TohZrTt4oqHD6OJjC7O2Y29
         Chb5nVLxZZJ763fumMNZyor5i0DCuYNiOyFihpca10BMIb1ohsXsz09u0P1vg/3Y4wru
         /HosQ+j/nJKg+Kb+VfMQ6iRzO9Ksrxt4boRjpyTNIDUxJxpoaP7HSd/o8wqF6tKHpXWD
         E9/XDzI1UQLDSZoCAoiupyT5JBoQJV5od2iZrHzUHJs78vFF3R+ebTCCmlvtW6+qeIJY
         pc8bEy4zn9Rx1qyn/Mz6/xDVOGssQXFa05U5P1JqV/VRBQNo6n94KA9rzgGhjXo1uV4o
         a5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Mx+SSux44r2ybzN5uouGLt8Nyz1sei2BYkCtNp5/Q1U=;
        b=NNsxvG1ZvcRUnYaxTtSVcP5ljDpC8ZqrtbuhcpMbCkFtF0eAodlFTItuJj1jZPAiZD
         IiIwDbcXIdJjyp8/XLPZPSHmN4eYh+Pu36WAuXTqY5Amf2qwsh2PSV18sEvImsXiPOQ2
         yaqeIsSLbQLvD18OTAq83PvuzdS0t88PocanWPVek9Rvi2uJSAd4S0l9zKrQ5vq422ha
         HwBRct/P75tMdFn0NWvMZBvSkK4MbQGed1BksyPYdRw6QNoJMusNU30Ay/1i4QuXSbCU
         wIqhwEWnupfdOSDwy4+489HhPtD0VVc/L46CamNDIblfIl9O9TTn1oSIIYyzYV9DmD8a
         10cQ==
X-Gm-Message-State: AOAM5311DU9fqRK6NHSL2Fyt3GOHMwr02dLxn27eaG6fy247KFtTS55a
        NWAnslDgFhjIDpqfjBQzOoh7VQ==
X-Google-Smtp-Source: ABdhPJxTlBVIxgjkiki4YjzApRPAYuKQcRCroZoMD5M27K7cz8VwDwS82eqt/XFzqMY5viPlsgQuUQ==
X-Received: by 2002:a1c:40c:: with SMTP id 12mr1687015wme.40.1607505748074;
        Wed, 09 Dec 2020 01:22:28 -0800 (PST)
Received: from dell ([91.110.221.209])
        by smtp.gmail.com with ESMTPSA id z8sm2247120wmg.17.2020.12.09.01.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 01:22:27 -0800 (PST)
Date:   Wed, 9 Dec 2020 09:22:24 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>,
        Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        David Miller <davem@davemloft.net>,
        Ion Badulescu <ionut@badula.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>,
        Christian Lamparter <chunkeey@googlemail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Adam Radford <aradford@gmail.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        James Smart <james.smart@broadcom.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        Nilesh Javali <njavali@marvell.com>,
        GR-QLogic-Storage-Upstream@marvell.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ide@vger.kernel.org, dmaengine@vger.kernel.org,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        linux-parisc@vger.kernel.org,
        linux-wireless <linux-wireless@vger.kernel.org>,
        SCSI development list <linux-scsi@vger.kernel.org>,
        linux-serial@vger.kernel.org,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] PCI: Remove pci_try_set_mwi
Message-ID: <20201209092224.GU4801@dell>
References: <4d535d35-6c8c-2bd8-812b-2b53194ce0ec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d535d35-6c8c-2bd8-812b-2b53194ce0ec@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 09 Dec 2020, Heiner Kallweit wrote:

> pci_set_mwi() and pci_try_set_mwi() do exactly the same, just that the
> former one is declared as __must_check. However also some callers of
> pci_set_mwi() have a comment that it's an optional feature. I don't
> think there's much sense in this separation and the use of
> __must_check. Therefore remove pci_try_set_mwi() and remove the
> __must_check attribute from pci_set_mwi().
> I don't expect either function to be used in new code anyway.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> patch applies on top of pci/misc for v5.11
> ---
>  Documentation/PCI/pci.rst                     |  5 +----
>  drivers/ata/pata_cs5530.c                     |  2 +-
>  drivers/ata/sata_mv.c                         |  2 +-
>  drivers/dma/dw/pci.c                          |  2 +-
>  drivers/dma/hsu/pci.c                         |  2 +-
>  drivers/ide/cs5530.c                          |  2 +-

>  drivers/mfd/intel-lpss-pci.c                  |  2 +-

Acked-by: Lee Jones <lee.jones@linaro.org>

>  drivers/net/ethernet/adaptec/starfire.c       |  2 +-
>  drivers/net/ethernet/alacritech/slicoss.c     |  2 +-
>  drivers/net/ethernet/dec/tulip/tulip_core.c   |  5 +----
>  drivers/net/ethernet/sun/cassini.c            |  4 ++--
>  drivers/net/wireless/intersil/p54/p54pci.c    |  2 +-
>  .../intersil/prism54/islpci_hotplug.c         |  3 +--
>  .../wireless/realtek/rtl818x/rtl8180/dev.c    |  2 +-
>  drivers/pci/pci.c                             | 19 -------------------
>  drivers/scsi/3w-9xxx.c                        |  4 ++--
>  drivers/scsi/3w-sas.c                         |  4 ++--
>  drivers/scsi/csiostor/csio_init.c             |  2 +-
>  drivers/scsi/lpfc/lpfc_init.c                 |  2 +-
>  drivers/scsi/qla2xxx/qla_init.c               |  8 ++++----
>  drivers/scsi/qla2xxx/qla_mr.c                 |  2 +-
>  drivers/tty/serial/8250/8250_lpss.c           |  2 +-
>  drivers/usb/chipidea/ci_hdrc_pci.c            |  2 +-
>  drivers/usb/gadget/udc/amd5536udc_pci.c       |  2 +-
>  drivers/usb/gadget/udc/net2280.c              |  2 +-
>  drivers/usb/gadget/udc/pch_udc.c              |  2 +-
>  include/linux/pci.h                           |  5 ++---
>  27 files changed, 33 insertions(+), 60 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
