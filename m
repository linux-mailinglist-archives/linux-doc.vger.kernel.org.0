Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0959571C43
	for <lists+linux-doc@lfdr.de>; Tue, 12 Jul 2022 16:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232738AbiGLOVl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 Jul 2022 10:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230449AbiGLOVk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Jul 2022 10:21:40 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FC0B7E;
        Tue, 12 Jul 2022 07:21:39 -0700 (PDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26CEI4MV007679;
        Tue, 12 Jul 2022 14:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=utPHKvjQ3PMkdY+xJ5VlHs3OGEkWV/pOVBYs/I5OYf8=;
 b=AhgqMWulLOKvlIQkEKXl7pMnBJHofvd4DEemz/BvCRpMrx1ntRpdjJO1UTMK+omvKEVh
 eOAditBe2swViF72Aam4Gq8IU92968F5xAU/533yr2yAry4Zb09ErvpxVQui0hiZ2DNo
 OpL3sILGLnjdnrU0QKrzr10QMCAdoUxZtGWGw0JIQslyZnKd0PLGiOOql1TDDprrLGv5
 OMc0tYmmux6KXw+uABlk/i+gj8ShtgEk6SwhZBd2U37SJi2y9FFj1eLIpCjH3+4/P2pK
 fG0R/N0WJwuQzfQfMsYjPm5SLVkUNNgJOICXa236z9V2zgjTz9Q6qy505Tv3ZiOam2wU aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h98jvkq33-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Jul 2022 14:21:19 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26CE7RHc022055;
        Tue, 12 Jul 2022 14:21:18 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h98jvkq2m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Jul 2022 14:21:18 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26CEKps9011415;
        Tue, 12 Jul 2022 14:21:17 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
        by ppma04dal.us.ibm.com with ESMTP id 3h71a9uq1v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Jul 2022 14:21:17 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
        by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26CELGSR9437848
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Jul 2022 14:21:16 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AC4C828058;
        Tue, 12 Jul 2022 14:21:16 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DF6822805A;
        Tue, 12 Jul 2022 14:21:14 +0000 (GMT)
Received: from [9.65.200.23] (unknown [9.65.200.23])
        by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 12 Jul 2022 14:21:14 +0000 (GMT)
Message-ID: <99c92c99-cd60-4034-8729-a90ac9a80a7b@linux.ibm.com>
Date:   Tue, 12 Jul 2022 10:21:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 01/10] vfio: Make vfio_unpin_pages() return void
Content-Language: en-US
To:     Nicolin Chen <nicolinc@nvidia.com>, kwankhede@nvidia.com,
        corbet@lwn.net, hca@linux.ibm.com, gor@linux.ibm.com,
        agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, zhenyuw@linux.intel.com, zhi.a.wang@intel.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
        airlied@linux.ie, daniel@ffwll.ch, farman@linux.ibm.com,
        mjrosato@linux.ibm.com, pasic@linux.ibm.com, vneethv@linux.ibm.com,
        oberpar@linux.ibm.com, freude@linux.ibm.com, jjherne@linux.ibm.com,
        alex.williamson@redhat.com, cohuck@redhat.com, jgg@nvidia.com,
        kevin.tian@intel.com, hch@infradead.org
Cc:     jchrist@linux.ibm.com, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        terrence.xu@intel.com
References: <20220708224427.1245-1-nicolinc@nvidia.com>
 <20220708224427.1245-2-nicolinc@nvidia.com>
From:   Anthony Krowiak <akrowiak@linux.ibm.com>
In-Reply-To: <20220708224427.1245-2-nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B60HSp5t_czb8X5a87Nm-XoxYiKFzc2z
X-Proofpoint-ORIG-GUID: 4i9LQZnl2_bO8pVrbgtssKDQs1SsXODb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_08,2022-07-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1011 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120055
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 7/8/22 6:44 PM, Nicolin Chen wrote:
> There's only one caller that checks its return value with a WARN_ON_ONCE,
> while all other callers don't check the return value at all. Above that,
> an undo function should not fail. So, simplify the API to return void by
> embedding similar WARN_ONs.
>
> Also for users to pinpoint which condition fails, separate WARN_ON lines,
> yet remove the "driver->ops->unpin_pages" check, since it's unreasonable
> for callers to unpin on something totally random that wasn't even pinned.
> And remove NULL pointer checks for they would trigger oops vs. warnings.
> Note that npage is already validated in the vfio core, thus drop the same
> check in the type1 code.
>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
> Tested-by: Terrence Xu <terrence.xu@intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>   .../driver-api/vfio-mediated-device.rst       |  2 +-
>   drivers/gpu/drm/i915/gvt/kvmgt.c              |  5 +----
>   drivers/vfio/vfio.c                           | 21 +++++++------------
>   drivers/vfio/vfio.h                           |  2 +-
>   drivers/vfio/vfio_iommu_type1.c               | 15 ++++++-------
>   include/linux/vfio.h                          |  4 ++--
>   6 files changed, 18 insertions(+), 31 deletions(-)
>
> diff --git a/Documentation/driver-api/vfio-mediated-device.rst b/Documentation/driver-api/vfio-mediated-device.rst
> index d7a512676853..4307421dcaa0 100644
> --- a/Documentation/driver-api/vfio-mediated-device.rst
> +++ b/Documentation/driver-api/vfio-mediated-device.rst
> @@ -263,7 +263,7 @@ driver::
>   	int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
>   				  int npage, int prot, unsigned long *phys_pfn);
>   
> -	int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> +	void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
>   				    int npage);
>   
>   These functions call back into the back-end IOMMU module by using the pin_pages
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index e2f6c56ab342..8c67c9aba82d 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -231,18 +231,15 @@ static void intel_gvt_cleanup_vgpu_type_groups(struct intel_gvt *gvt)
>   static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
>   		unsigned long size)
>   {
> -	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
>   	int total_pages;
>   	int npage;
> -	int ret;
>   
>   	total_pages = roundup(size, PAGE_SIZE) / PAGE_SIZE;
>   
>   	for (npage = 0; npage < total_pages; npage++) {
>   		unsigned long cur_gfn = gfn + npage;
>   
> -		ret = vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
> -		drm_WARN_ON(&i915->drm, ret != 1);
> +		vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
>   	}
>   }
>   
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index 100a3d84380c..ad90adbfddc8 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -1964,31 +1964,24 @@ EXPORT_SYMBOL(vfio_pin_pages);
>    *		   PFNs should not be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
>    * @npage [in]   : count of elements in user_pfn array.  This count should not
>    *                 be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
> - * Return error or number of pages unpinned.
>    */
> -int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> -		     int npage)
> +void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> +		      int npage)
>   {
>   	struct vfio_container *container;
>   	struct vfio_iommu_driver *driver;
> -	int ret;
>   
> -	if (!user_pfn || !npage || !vfio_assert_device_open(device))
> -		return -EINVAL;


You left out the check for !user_pfn?


> +	if (WARN_ON(npage <= 0 || npage > VFIO_PIN_PAGES_MAX_ENTRIES))
> +		return;
>   
> -	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
> -		return -E2BIG;
> +	if (WARN_ON(!vfio_assert_device_open(device)))
> +		return;
>   
>   	/* group->container cannot change while a vfio device is open */
>   	container = device->group->container;
>   	driver = container->iommu_driver;
> -	if (likely(driver && driver->ops->unpin_pages))
> -		ret = driver->ops->unpin_pages(container->iommu_data, user_pfn,
> -					       npage);
> -	else
> -		ret = -ENOTTY;
>   
> -	return ret;
> +	driver->ops->unpin_pages(container->iommu_data, user_pfn, npage);
>   }
>   EXPORT_SYMBOL(vfio_unpin_pages);
>   
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index a67130221151..bef4edf58138 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -53,7 +53,7 @@ struct vfio_iommu_driver_ops {
>   				     unsigned long *user_pfn,
>   				     int npage, int prot,
>   				     unsigned long *phys_pfn);
> -	int		(*unpin_pages)(void *iommu_data,
> +	void		(*unpin_pages)(void *iommu_data,
>   				       unsigned long *user_pfn, int npage);
>   	int		(*register_notifier)(void *iommu_data,
>   					     unsigned long *events,
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index db24062fb343..cfeea4efd625 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -948,20 +948,16 @@ static int vfio_iommu_type1_pin_pages(void *iommu_data,
>   	return ret;
>   }
>   
> -static int vfio_iommu_type1_unpin_pages(void *iommu_data,
> -					unsigned long *user_pfn,
> -					int npage)
> +static void vfio_iommu_type1_unpin_pages(void *iommu_data,
> +					 unsigned long *user_pfn, int npage)
>   {
>   	struct vfio_iommu *iommu = iommu_data;
>   	bool do_accounting;
>   	int i;
>   
> -	if (!iommu || !user_pfn || npage <= 0)
> -		return -EINVAL;


Is there a reason the checks above were not checked for WARN_ON?


> -
>   	/* Supported for v2 version only */
> -	if (!iommu->v2)
> -		return -EACCES;
> +	if (WARN_ON(!iommu->v2))
> +		return;
>   
>   	mutex_lock(&iommu->lock);
>   
> @@ -979,7 +975,8 @@ static int vfio_iommu_type1_unpin_pages(void *iommu_data,
>   	}
>   
>   	mutex_unlock(&iommu->lock);
> -	return i > 0 ? i : -EINVAL;
> +
> +	WARN_ON(i != npage);
>   }
>   
>   static long vfio_sync_unpin(struct vfio_dma *dma, struct vfio_domain *domain,
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 4d26e149db81..5348ef353029 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -159,8 +159,8 @@ bool vfio_file_has_dev(struct file *file, struct vfio_device *device);
>   
>   int vfio_pin_pages(struct vfio_device *device, unsigned long *user_pfn,
>   		   int npage, int prot, unsigned long *phys_pfn);
> -int vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> -		     int npage);
> +void vfio_unpin_pages(struct vfio_device *device, unsigned long *user_pfn,
> +		      int npage);
>   int vfio_dma_rw(struct vfio_device *device, dma_addr_t user_iova,
>   		void *data, size_t len, bool write);
>   
