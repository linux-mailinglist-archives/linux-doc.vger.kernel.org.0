Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A288C326581
	for <lists+linux-doc@lfdr.de>; Fri, 26 Feb 2021 17:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbhBZQY4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Feb 2021 11:24:56 -0500
Received: from mga01.intel.com ([192.55.52.88]:12400 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230022AbhBZQYz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 26 Feb 2021 11:24:55 -0500
IronPort-SDR: RESG+ueW1J3GLWWFDgPPpalNgLFwFtjG3LZiKMeO2nxkrQ6ZFmytkEwKf9NxJw3y72SmiNdY2f
 uU0xqyVlEB5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="205457859"
X-IronPort-AV: E=Sophos;i="5.81,208,1610438400"; 
   d="scan'208";a="205457859"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2021 08:23:07 -0800
IronPort-SDR: ntFgGzsWwrCyDkuti811a99kOYPGX0R4MIVYZc60jEYPKH3BATJSEO3mAZeKKvYyyGkyVEU+aw
 3689bu+XTFkA==
X-IronPort-AV: E=Sophos;i="5.81,208,1610438400"; 
   d="scan'208";a="382060060"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2021 08:23:05 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lFftO-008OTZ-3y; Fri, 26 Feb 2021 18:23:02 +0200
Date:   Fri, 26 Feb 2021 18:23:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     corbet@lwn.net, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, rric@kernel.org,
        bhelgaas@google.com, wsa@kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] PCI: Introduce pcim_alloc_irq_vectors()
Message-ID: <YDkgZoscLyOnc5l6@smile.fi.intel.com>
References: <20210226155056.1068534-1-zhengdejin5@gmail.com>
 <20210226155056.1068534-2-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226155056.1068534-2-zhengdejin5@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 26, 2021 at 11:50:53PM +0800, Dejin Zheng wrote:
> Introduce pcim_alloc_irq_vectors(), a device-managed version of
> pci_alloc_irq_vectors(). Introducing this function can simplify
> the error handling path in many drivers.
> 
> And use pci_free_irq_vectors() to replace some code in pcim_release(),
> they are equivalent, and no functional change. It is more explicit
> that pcim_alloc_irq_vectors() is a device-managed function.

Thanks!

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
> v4 -> v5:
> 	- Remove the check of enable device in pcim_alloc_irq_vectors()
> 	  and make it as a static line function.
> v3 -> v4:
> 	- No change
> v2 -> v3:
> 	- Add some commit comments for replace some codes in
> 	  pcim_release() by pci_free_irq_vectors().
> v1 -> v2:
> 	- Use pci_free_irq_vectors() to replace some code in
> 	  pcim_release().
> 	- Modify some commit messages.
> 
>  drivers/pci/pci.c   |  5 +----
>  include/linux/pci.h | 24 ++++++++++++++++++++++++
>  2 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 16a17215f633..fecfdc0add2f 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -1969,10 +1969,7 @@ static void pcim_release(struct device *gendev, void *res)
>  	struct pci_devres *this = res;
>  	int i;
>  
> -	if (dev->msi_enabled)
> -		pci_disable_msi(dev);
> -	if (dev->msix_enabled)
> -		pci_disable_msix(dev);
> +	pci_free_irq_vectors(dev);
>  
>  	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++)
>  		if (this->region_mask & (1 << i))
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 86c799c97b77..5cafd7d65fd7 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1818,6 +1818,30 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
>  					      NULL);
>  }
>  
> +/**
> + * pcim_alloc_irq_vectors - a device-managed pci_alloc_irq_vectors()
> + * @dev:		PCI device to operate on
> + * @min_vecs:		minimum number of vectors required (must be >= 1)
> + * @max_vecs:		maximum (desired) number of vectors
> + * @flags:		flags or quirks for the allocation
> + *
> + * Return the number of vectors allocated, (which might be smaller than
> + * @max_vecs) if successful, or a negative error code on error. If less
> + * than @min_vecs interrupt vectors are available for @dev the function
> + * will fail with -ENOSPC.
> + *
> + * It depends on calling pcim_enable_device() to make IRQ resources
> + * manageable.
> + */
> +static inline int
> +pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
> +			unsigned int max_vecs, unsigned int flags)
> +{
> +	if (!pci_is_managed(dev))
> +		return -EINVAL;
> +	return pci_alloc_irq_vectors(dev, min_vecs, max_vecs, flags);
> +}
> +
>  /* Include architecture-dependent settings and functions */
>  
>  #include <asm/pci.h>
> -- 
> 2.25.0
> 

-- 
With Best Regards,
Andy Shevchenko


