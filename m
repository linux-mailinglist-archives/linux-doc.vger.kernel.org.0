Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2D256C30B
	for <lists+linux-doc@lfdr.de>; Sat,  9 Jul 2022 01:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240078AbiGHU0H (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 8 Jul 2022 16:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240026AbiGHU0F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Jul 2022 16:26:05 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1A86EE82;
        Fri,  8 Jul 2022 13:26:04 -0700 (PDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268K4xcc028280;
        Fri, 8 Jul 2022 20:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=RcgxVCSbUrk83RjXjIxOsghVCjW0NPeeCgUFAVzSDhw=;
 b=NiWSNBVsrcJfvNvQBkyCyO6JZlpp42g5hhGlVqCgQJUczdebIREl6jY5zh5IipbIf42S
 ogwJt6FkGONMTOjJ29NkB4pTJj75C5OAagrIWaOibYC9cXrgBT74Fh69QGdhfXjWgRNe
 RNDgJuTyq9bP2gbAzmTA0DuNKR7gaXO7lcdz96F20K994bjDI0pCrtJIy1b8YUvAZa+T
 DhcIt9Ww+t55X+RB6nHGzFymUd/DUtI3eXYUTtKHaaB7IE6lHIdQMhZRe1cVf3xjOmP1
 MxAgO4l1kUXwWGNEgcCrVMA9wm/z8EFovC7bLitWuBm9RhdayqcSpvp980d07NQSE8w+ mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h6rw5uvvv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Jul 2022 20:25:56 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 268KPtL3000652;
        Fri, 8 Jul 2022 20:25:55 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h6rw5uvva-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Jul 2022 20:25:55 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 268KKi8b030828;
        Fri, 8 Jul 2022 20:25:54 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
        by ppma04dal.us.ibm.com with ESMTP id 3h4uqyje5a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Jul 2022 20:25:54 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 268KPqKY36438292
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 8 Jul 2022 20:25:52 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9CDAA136055;
        Fri,  8 Jul 2022 20:25:52 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 88EE6136051;
        Fri,  8 Jul 2022 20:25:49 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.38.121])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
        Fri,  8 Jul 2022 20:25:49 +0000 (GMT)
Message-ID: <13515c3941b0f5d023c68bda83ac9ad6c0ef09e0.camel@linux.ibm.com>
Subject: Re: [RFT][PATCH v2 3/9] vfio/ccw: Only pass in contiguous pages
From:   Eric Farman <farman@linux.ibm.com>
To:     Jason Gunthorpe <jgg@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>
Cc:     kwankhede@nvidia.com, corbet@lwn.net, hca@linux.ibm.com,
        gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, svens@linux.ibm.com,
        zhenyuw@linux.intel.com, zhi.a.wang@intel.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
        airlied@linux.ie, daniel@ffwll.ch, mjrosato@linux.ibm.com,
        pasic@linux.ibm.com, vneethv@linux.ibm.com, oberpar@linux.ibm.com,
        freude@linux.ibm.com, akrowiak@linux.ibm.com,
        jjherne@linux.ibm.com, alex.williamson@redhat.com,
        cohuck@redhat.com, kevin.tian@intel.com, hch@infradead.org,
        jchrist@linux.ibm.com, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date:   Fri, 08 Jul 2022 16:25:48 -0400
In-Reply-To: <20220706170553.GK693670@nvidia.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
         <20220706062759.24946-4-nicolinc@nvidia.com>
         <20220706170553.GK693670@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _Ld-oYw7eqpzW98LcdemVDtFG70Yxbmb
X-Proofpoint-ORIG-GUID: vAVDCm28AydzKfxSvDGXhjMr3QAuDmA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_17,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207080079
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2022-07-06 at 14:05 -0300, Jason Gunthorpe wrote:
> On Tue, Jul 05, 2022 at 11:27:53PM -0700, Nicolin Chen wrote:
> > This driver is the only caller of vfio_pin/unpin_pages that might
> > pass
> > in a non-contiguous PFN list, but in many cases it has a contiguous
> > PFN
> > list to process. So letting VFIO API handle a non-contiguous PFN
> > list
> > is actually counterproductive.
> > 
> > Add a pair of simple loops to pass in contiguous PFNs only, to have
> > an
> > efficient implementation in VFIO.
> > 
> > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > ---
> >  drivers/s390/cio/vfio_ccw_cp.c | 70 +++++++++++++++++++++++++++---
> > ----
> >  1 file changed, 56 insertions(+), 14 deletions(-)
> 
> I think this is fine as-is for this series, but someone who knows and
> can test ccw should go in and fix things so that pfn_array_alloc()
> doesn't exist. Allocating memory and filling it with consecutive
> integers is kind of silly given we can just call vfio_pin_pages()
> with
> pa_nr directly.
> 
> 	pa->pa_iova_pfn[0] = pa->pa_iova >> PAGE_SHIFT;
> 	pa->pa_pfn[0] = -1ULL;
> 	for (i = 1; i < pa->pa_nr; i++) {
> 		pa->pa_iova_pfn[i] = pa->pa_iova_pfn[i - 1] + 1;
> 
> It looks like only the 'ccw_is_idal' flow can actually create
> non-continuities.

This code is certainly not my favorite, but you're right that it's the
IDAL flow that generates the non-contiguous requests and the code you
reference is simply an initialization for the !IDAL case. As I have a
todo in this code anyway, I'll register your suggestion to see if they
can be untangled.

>  Also the loop in copy_from_iova() should ideally be
> using the much faster 'rw' interface, and not a pin/unpin cycle just
> to memcpy.

I guess I missed when that was added. This looks like low hanging fruit
for some ollllld code regardless of the above. Will get to this once
I'm back. Thank you!

Eric

> 
> If I guess right these changes would significantly speed this driver
> up.
> 
> Anyhow,
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Jason

