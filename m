Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7CF73F7DB3
	for <lists+linux-doc@lfdr.de>; Wed, 25 Aug 2021 23:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhHYV0S (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 25 Aug 2021 17:26:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43335 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232820AbhHYV0P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Aug 2021 17:26:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629926728;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=a8WjHoFBXc0jwAZ/Pzv1m1K7J4OWtNmWsJJuNT1URQ8=;
        b=U3LUOgGwsbOFZQ1PNqBh0/0Nza3r9tFgbqKLgmzl7e6xnUoR+jmIZSOKyT6YXdxdTZqR6p
        IzsgROSabeyytiVUrL8XTH/Qj8NeU0zHiUJ+QCnhi953PdhViHrlghuUGeofeK6clZgbJx
        fDV+bDD3KE/11hgi0zi9KoTshxR1bcY=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-CBCQGeocNyaxEMxg_KF2ZQ-1; Wed, 25 Aug 2021 17:25:27 -0400
X-MC-Unique: CBCQGeocNyaxEMxg_KF2ZQ-1
Received: by mail-oo1-f70.google.com with SMTP id s20-20020a4aead40000b029028b41986b27so307804ooh.14
        for <linux-doc@vger.kernel.org>; Wed, 25 Aug 2021 14:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=a8WjHoFBXc0jwAZ/Pzv1m1K7J4OWtNmWsJJuNT1URQ8=;
        b=VeckQnC7na3krGN/R+jDuILFnROREZoOleeompZiH2ayT0G01J0UAreCyngXaZ5ukC
         CocSNqUH4id5AtWJqWWbKysK3kQCwg/1MfOjcGQ/mBg+H8wmkklOpqePerutW4QWHaTz
         YETAkjspLA1nDR8VRsXcv5LfmcaNkpC1j+F5rrsT+EeYTsdDdeBnxypsfnPPKFldLEhG
         2WQInPQgecJCx5ITPCLioN5lZH/8lpHsMHZv1Ne+G23gjy6hDT7Cp5gaus5XcRowwOoR
         SJ18PLxBh/hLtcXhu/8XoDId4ulDkXCpatzcR75tItFnt018CrUFirQW/Z58XxMNrTAk
         ZddQ==
X-Gm-Message-State: AOAM531x75VNhQMMyCNbBV/HWpmoFomSLdtBhNDBUpHYKbWjsZbA7jl4
        txRMT9yWEkudg+ysdNP7uksW+S1oNzDVEFGue3L5D7/5rVveKA6/z6IT1B9U2qnJo4BIXYdxEi0
        Z6wV9XZ+4dPyGEMOiRKLX
X-Received: by 2002:aca:59c6:: with SMTP id n189mr8927956oib.44.1629926726454;
        Wed, 25 Aug 2021 14:25:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2TQ0tVP/G/91e1rsMJxtfNj9JdiJU9bbsFApswvKRzxaqgLUrbQuFPpCCzIEKetVt2wAhqA==
X-Received: by 2002:aca:59c6:: with SMTP id n189mr8927948oib.44.1629926726248;
        Wed, 25 Aug 2021 14:25:26 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
        by smtp.gmail.com with ESMTPSA id y7sm178910oov.36.2021.08.25.14.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 14:25:25 -0700 (PDT)
Date:   Wed, 25 Aug 2021 15:25:24 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Yishai Hadas <yishaih@nvidia.com>, bhelgaas@google.com,
        corbet@lwn.net, diana.craciun@oss.nxp.com, kwankhede@nvidia.com,
        eric.auger@redhat.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, linux-pci@vger.kernel.org,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-kbuild@vger.kernel.org,
        mgurtovoy@nvidia.com, jgg@nvidia.com, maorg@nvidia.com,
        leonro@nvidia.com
Subject: Re: [PATCH V4 09/13] PCI: Add 'override_only' field to struct
 pci_device_id
Message-ID: <20210825152524.45437035.alex.williamson@redhat.com>
In-Reply-To: <20210825155446.GA3575423@bjorn-Precision-5520>
References: <20210825135139.79034-10-yishaih@nvidia.com>
        <20210825155446.GA3575423@bjorn-Precision-5520>
Organization: Red Hat
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 25 Aug 2021 10:54:46 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> On Wed, Aug 25, 2021 at 04:51:35PM +0300, Yishai Hadas wrote:
> > From: Max Gurtovoy <mgurtovoy@nvidia.com>
> > 
> > Add 'override_only' field to struct pci_device_id to be used as part of
> > pci_match_device().
> > 
> > When set, it means that matching is true only when dev->driver_override
> > is this driver.  
> 
> Maybe:
> 
>   When set, a driver only matches the entry when dev->driver_override
>   is set to that driver.

I've made this change locally, thanks Bjorn.

Alex

> 
> > In addition, add a helper macro named 'PCI_DEVICE_DRIVER_OVERRIDE' to
> > enable setting some data on it.
> > 
> > Next patch from this series will use the above functionality.
> > 
> > Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Yishai Hadas <yishaih@nvidia.com>  
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>

