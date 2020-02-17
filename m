Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D23516165A
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2020 16:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbgBQPkZ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 Feb 2020 10:40:25 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43450 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728789AbgBQPkY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Feb 2020 10:40:24 -0500
Received: by mail-wr1-f66.google.com with SMTP id r11so20234063wrq.10
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2020 07:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uBL44HTwPsTzK1hTlXHwrWPFvRz4I8cxeuhUA7nfr3s=;
        b=QUNDlRjh2O+ooQ41KWBChztMd4j9tV2M8HiE6TDGhh6KZcCXQYdQmMqHkRy/oPre/d
         E+T64sT8TUAqvGZCkZWcpAPXMK/psI/SMbqtUXH8WD/97O+XqMwt7rE0VgfYpg4SGCTu
         72DvsxmGQ2FHB1KOF86wT5RUdwe9l5E14uXBkwlKILpzWF5nOlDot/mlGYQpzffkiZng
         dV1PcmwTrlY7TdA4Y7kgPv5XUqhxhLqt6oG02ccYRx64/bgjYrAaemMkV8MHRgYP/RlA
         RNsfj1wDY4F+M6s4FATLU+2N+UfYeGwZGxIXM15btV8V9U0AnPqJn9J60Be6mPZjxKkb
         OLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uBL44HTwPsTzK1hTlXHwrWPFvRz4I8cxeuhUA7nfr3s=;
        b=eHYqQA8m8v0iMxTthLXiZz4yH02Q/3xmYvhfS8WRo+rAQ/CZvTqW1DxkIIuUgBfeLp
         aYAMb5N0SJ2WT8xdWk3TwztU8kTUwuyIEWcvUNJWKsq7Yn0QwW5FuO4oWe++54W0jCxc
         yowlyOZiMx3+7UhxWULFrumlWNnxRdpngURb2xmf0OKtVeKrE7YyoVkHcUeaOAZuWYov
         6ztZ1cjR1nxw+nPdHYBmn3496BhRyeqpnJBktVNXSh8QvSqcyFF8w6k1HHiXGVcHmutJ
         ynjsIluujCB/hQVhPcBvHq3jjREJAs3WhjUMPKowBM3Xv3A7JH0V1m3q/h5A5VA+2Y9u
         YKdg==
X-Gm-Message-State: APjAAAXJ3JE9pMmCAvkVhEdAJxX7mSW7dRFEjemR6a7/+OjOTsFDCKCL
        tCP38gNTLHfygMyT3B+E1s7nQw==
X-Google-Smtp-Source: APXvYqyK3wvWFPYLO6Oneazyxhd5g+tje1jkIBunochJVdUjHRcEMjjKDjk9tOFHPoHKB9Cr5dnXww==
X-Received: by 2002:adf:f109:: with SMTP id r9mr22236398wro.406.1581954021861;
        Mon, 17 Feb 2020 07:40:21 -0800 (PST)
Received: from myrica ([2001:171b:2276:930:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id v131sm1106010wme.23.2020.02.17.07.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 07:40:21 -0800 (PST)
Date:   Mon, 17 Feb 2020 16:40:12 +0100
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     will@kernel.org, robh+dt@kernel.org, lorenzo.pieralisi@arm.com,
        joro@8bytes.org, baolu.lu@linux.intel.com,
        linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
        corbet@lwn.net, mark.rutland@arm.com, liviu.dudau@arm.com,
        sudeep.holla@arm.com, guohanjun@huawei.com, rjw@rjwysocki.net,
        lenb@kernel.org, robin.murphy@arm.com, dwmw2@infradead.org,
        amurray@thegoodpenguin.co.uk, frowand.list@gmail.com
Subject: Re: [PATCH 02/11] PCI: Add ats_supported host bridge flag
Message-ID: <20200217154012.GD1650092@myrica>
References: <20200213165049.508908-3-jean-philippe@linaro.org>
 <20200215211047.GA124796@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200215211047.GA124796@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 15, 2020 at 03:10:47PM -0600, Bjorn Helgaas wrote:
> On Thu, Feb 13, 2020 at 05:50:40PM +0100, Jean-Philippe Brucker wrote:
> > Each vendor has their own way of describing whether a host bridge
> > supports ATS.  The Intel and AMD ACPI tables selectively enable or
> > disable ATS per device or sub-tree, while Arm has a single bit for each
> > host bridge.  For those that need it, add an ats_supported bit to the
> > host bridge structure.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  drivers/pci/probe.c | 7 +++++++
> >  include/linux/pci.h | 1 +
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index 512cb4312ddd..75c0a25af44e 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -598,6 +598,13 @@ static void pci_init_host_bridge(struct pci_host_bridge *bridge)
> >  	bridge->native_shpc_hotplug = 1;
> >  	bridge->native_pme = 1;
> >  	bridge->native_ltr = 1;
> > +
> > +	/*
> > +	 * Some systems may disable ATS at the host bridge (ACPI IORT,
> > +	 * device-tree), other filter it with a smaller granularity (ACPI DMAR
> > +	 * and IVRS).
> > +	 */
> > +	bridge->ats_supported = 1;
> 
> The cover letter says it's important to enable ATS only if the host
> bridge supports it.  From the other patches, it looks like we learn if
> the host bridge supports ATS from either a DT "ats-supported" property
> or an ACPI IORT table.  If that's the case, shouldn't the default here
> be "ATS is *not* supported"?

The ACPI IVRS table (AMD) doesn't have a property for the host bridge, it
can only deselect ATS for a sub-range of devices. Similarly the DMAR table
(Intel) declares that ATS is supported either by the whole PCIe domain or
for sub-ranges of devices. I selected ats_supported at the bridge by
default since IVRS needs it and DMAR has its own fine-grained ATS support
configuration.

I'm still not sure this is the right approach, given that the
ats_supported bridge property doesn't exactly correspond to a firmware
property on all platforms. Maybe the device-tree implementation should
follow the IORT one where each device carries a fwspec property stating
"root-complex supports ATS". But it isn't nice either so I tried a cleaner
implementation (as discussed with Robin back on the ATS-with-SMMUv3 series
[1]).

Thanks,
Jean

[1] https://lore.kernel.org/linux-iommu/c10c7adb-c7f6-f8c6-05cc-f4f143427a2d@arm.com/
