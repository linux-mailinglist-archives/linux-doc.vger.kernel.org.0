Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB1B856928E
	for <lists+linux-doc@lfdr.de>; Wed,  6 Jul 2022 21:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbiGFTWI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 Jul 2022 15:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233917AbiGFTWH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 15:22:07 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF93525E98;
        Wed,  6 Jul 2022 12:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ma0BQwdFkrw6VVHAzlZEryQrJMg0hKNOyuZNadKd7Xr9mByX5YMGxQxPSRHQyPI5Np0BGSz23ee9qcp1XymYi0uCwNnmnWSUi/+8Bk6Ne5SAFwpsQtjvLA5ur07oLgc4ZdRKrvGoiRgRQTwo/WznPjzALL1kfo3/mDcPYgXG6R+0/7gPjI4/09KiG1NFs8DeDPD+qvKUJqAaPzqDOOPNDmQ4jn56S/AWSnE7atDq9DBZe3QWlchVa+11gD6gaYthqOY/N1BZzfsp9RmDovwv66q6oNNBnr4UG+Py9msnex1zvrrhnk7nmImXBgBRCrqZTsjDLJGwmKPonOOhb7fjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeZwEm/1KRVzduBRmFgNgutF607+1j9ieydRtDVGNns=;
 b=UPPaQPlOh4REZluaNEt0fk/UpXAT2uNI42qqcJu05dACZqEj2zYPMlEtzdF0omV5VbUF+hg2/iDlXWxl/b4iR/i2DpbhQ85W0kdUzKdC0KtuuX6tilbBSGsMA72gtSEsPLKZOqVK0Cc4ab44f+OotaATsmrqUxbYhUCTdVWbqwjPqEPTq21melSslMSoT3phDheE8dbcQq7+QRrs+DBFuBlZeCIglntpUYWBudG7WmowUz/FP94sUfftrjYbirP1latiARpnDitXYopx9iEmDslZpgZblXbGdDkT6TaTRgnSyyFt5dfk45dfDE4punUhb/AWUAzx3bmil9fLujsIDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeZwEm/1KRVzduBRmFgNgutF607+1j9ieydRtDVGNns=;
 b=Jcoxtu8AINzcYTP4YZRB/JOfIbtfpKp3fwxGQkewz21PkpFLY2/bEdL4NnRaS17N1vTIF+F/c7Zkg2VghxGBP39V6/yqx/o/x45pez/hqCChEzRqgRSNGL7z6rVJaZ3LLgg0KYIUnmBR2ee7VLbBxMIna0gaCW+ib39xNJULVLOIIQIte6tskiEY633G/rBvOL7avX9vaz61bXIE2NsPmxNBeoHno4IbsCLJoI1oxoHx3VLJalgQLUODxIYh42RtTMzXJ64ONvA3YOHJD6EiVb5HYLyfPpNKVwd08RUrO75koFoOiKD27bL7IDwg+gYBGEumGVbchbHPYPGiH144xg==
Received: from MW4PR03CA0229.namprd03.prod.outlook.com (2603:10b6:303:b9::24)
 by BY5PR12MB4934.namprd12.prod.outlook.com (2603:10b6:a03:1db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 19:22:04 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9::4) by MW4PR03CA0229.outlook.office365.com
 (2603:10b6:303:b9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Wed, 6 Jul 2022 19:22:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 19:22:03 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Wed, 6 Jul
 2022 19:22:03 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 6 Jul 2022
 12:22:02 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Wed, 6 Jul 2022 12:22:00 -0700
Date:   Wed, 6 Jul 2022 12:21:59 -0700
From:   Nicolin Chen <nicolinc@nvidia.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
CC:     <kwankhede@nvidia.com>, <corbet@lwn.net>, <hca@linux.ibm.com>,
        <gor@linux.ibm.com>, <agordeev@linux.ibm.com>,
        <borntraeger@linux.ibm.com>, <svens@linux.ibm.com>,
        <zhenyuw@linux.intel.com>, <zhi.a.wang@intel.com>,
        <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
        <rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
        <airlied@linux.ie>, <daniel@ffwll.ch>, <farman@linux.ibm.com>,
        <mjrosato@linux.ibm.com>, <pasic@linux.ibm.com>,
        <vneethv@linux.ibm.com>, <oberpar@linux.ibm.com>,
        <freude@linux.ibm.com>, <akrowiak@linux.ibm.com>,
        <jjherne@linux.ibm.com>, <alex.williamson@redhat.com>,
        <cohuck@redhat.com>, <kevin.tian@intel.com>, <hch@infradead.org>,
        <jchrist@linux.ibm.com>, <kvm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-s390@vger.kernel.org>,
        <intel-gvt-dev@lists.freedesktop.org>,
        <intel-gfx@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>
Subject: Re: [RFT][PATCH v2 4/9] vfio: Pass in starting IOVA to
 vfio_pin/unpin_pages API
Message-ID: <YsXg10vCMBMaOM9V@Asurada-Nvidia>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <20220706062759.24946-5-nicolinc@nvidia.com>
 <20220706174923.GL693670@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220706174923.GL693670@nvidia.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb61a67b-efd5-4113-fb72-08da5f84cf0f
X-MS-TrafficTypeDiagnostic: BY5PR12MB4934:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/pqWNJ20i8pZ3TizkQWtvkb8gVJcKQFxD7L758uvczAszrwUMFWUZ/iWzUaMW8aq5KlP0MmrTr0WRdb2QmkrmpwaZXbazQFqI+n5Fi+p8PAXOvbwR2zQDJ3AhXRQZpjhPOADXkCWCJVlyb2cnxHpHV5r/+S5Q96+q/OZjfGnCcD4+d6kOIpYFfY8tzv9bKf0Vpwecc4hcL7sVo7cf93KTnxtJWiENMFn3Zj6rxqKeZdomPT84aAGnMIsSH9Vyi0JeTJFr0n+WbtCFsMxLB6q/tObgY6Lb3qhCM+L9akGL/ovp1tom7kxKSL1v1nE0fpML0Yxf+tDepvN0IKnYPfowhrSXEwPO9ywrKXMQwy2yJd49/jOWywOk1kMGgjHCJoSm7x2t4guRhbyRROZoEnoeLrn3A81pvEqk5FJIOCw9dmLaDCmnqjw1tQUvBh1ewBCuTjzYYhNoJFwuhoCwIWRovp1tTFn6fCJnVnK3rz69agDn2C6Khkl5mvcpOiLFTX+gci3/YrhkM/gu47KWJxedRkhMRznSmKNnFpkQeWwbtgA9JHbne5QDu1hL37dBwhPEIaajueF8czj9dH1RQ60MGpXK7GahUTWIVeNRE0TEK6pU0h3HPI2Inb3l+rIe2yovOmjfOzkv+clKbkmtsbctoQQQVhuBOgP7hcJFGuWqaRI/Cm3T9b+M6kDW4kiiTbxfD6wQdRe6SReQR5saCSzWxcS6khZoBmm3xblXnmDofniXk2SV0YE/LzoMTCgDfZ8uLEWSOon+Giml96jBl37rglT4BNn+je/2us+eUrWxqnwRika5iRZw1OFxv8naukBmgeWNki1fNZLngX4E2XyvMfo1SbI68of0/oaV6JOlI=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(396003)(346002)(36840700001)(40470700004)(46966006)(36860700001)(82310400005)(5660300002)(40460700003)(33716001)(478600001)(356005)(82740400003)(6862004)(86362001)(7406005)(41300700001)(7416002)(2906002)(81166007)(8936002)(316002)(4744005)(336012)(4326008)(6636002)(70586007)(70206006)(8676002)(47076005)(40480700001)(55016003)(54906003)(186003)(26005)(9686003)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 19:22:03.9505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb61a67b-efd5-4113-fb72-08da5f84cf0f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4934
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 06, 2022 at 02:49:23PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 05, 2022 at 11:27:54PM -0700, Nicolin Chen wrote:
> 
> >  These functions call back into the back-end IOMMU module by using the pin_pages
> > diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
> > index 8c67c9aba82d..ea6041fa48ac 100644
> > --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> > +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c

> > +	vfio_unpin_pages(&vgpu->vfio_device, gfn << PAGE_SHIFT,
> > +			 roundup(size, PAGE_SIZE) / PAGE_SIZE);
> 
> These maths are DIV_ROUND_UP()

Actually I see two places in this file doing the same roundup.
So I am going to add a prep patch in v3 to fix them separately.
