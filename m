Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9623289A6
	for <lists+linux-doc@lfdr.de>; Mon,  1 Mar 2021 19:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238922AbhCASCX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 1 Mar 2021 13:02:23 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:7825 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237394AbhCAR4Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Mar 2021 12:56:25 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B603d2a9c0000>; Mon, 01 Mar 2021 09:55:40 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 1 Mar
 2021 17:55:39 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Mon, 1 Mar 2021 17:55:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gq5/Aa31g5kt2YrPszx4fYmjT3z1EaqecW0lWf5oKFCAH6BdSz/GckPjhnlVCvOOxGe0g4K0oAEpl+HCOCLEtajndB6mj6lqnwtkclIjrbToUoK39U/O+JaVqAgQJHrivVa/63I9tQFCvbn2J8sskPkPM3gYsDK1nhBP1VfVXW49tyWB6cOQ2+UFLoKIzkSRM9fvAXWNV3EKN4XZrFjEvZ5FCwHzHOntccrlXyalCuqEih7gLU8ZRZiwI7LuOcUiXK0e5b6dMyvzXYZ1iRx6uNyOv5LMj+DOvvFrnVetUQkC0gH9cX6ic9sXK3dVhcuHpg93cxKHYwqLn5EZmnGz6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnWRX+OYDEO7XRGehbhkx6JxEmsVgiIlf9ZRUjrMprI=;
 b=gLFQj/mGUDRQK3R1J4Ie4pZmbpMBB2QQGihq9ZssHDiFFTiBqugRHYoccG/vLf1rouMZ2C/y9DVNjDQZW83Yw1Mmnr6NMAFN75ujJXXCwsf/wtDwge3Tr13Hu8e8RG9gnV9aByOKY1UZrYDq+HqMV+CSniTLAk5F9QzR3D+CGTMZW8qRIvTg/pjse8YKSLo08wg3LkUaXx7JfpUc6oBechTFfcnvUxD03SPduR3bl3D+QD8LcSkfKbhl9B1QbKqQ09FJPp7yGacPFYJmhxDCfghLBK+SAFHp6TQz30lCKDw3nDtJf8+Poudh6cQfaiqZfd04JF1nXsF5EQ1b/BerWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB2938.namprd12.prod.outlook.com (2603:10b6:5:18a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 17:55:37 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3890.026; Mon, 1 Mar 2021
 17:55:37 +0000
Date:   Mon, 1 Mar 2021 13:55:36 -0400
From:   Jason Gunthorpe <jgg@nvidia.com>
To:     Alistair Popple <apopple@nvidia.com>
CC:     <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
        <bskeggs@redhat.com>, <akpm@linux-foundation.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <jhubbard@nvidia.com>,
        <rcampbell@nvidia.com>, <jglisse@redhat.com>, <hch@infradead.org>,
        <daniel@ffwll.ch>
Subject: Re: [PATCH v3 6/8] mm: Selftests for exclusive device memory
Message-ID: <20210301175536.GS4247@nvidia.com>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226071832.31547-7-apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210226071832.31547-7-apopple@nvidia.com>
X-ClientProxiedBy: BL0PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:207:3c::41) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by BL0PR02CA0028.namprd02.prod.outlook.com (2603:10b6:207:3c::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23 via Frontend Transport; Mon, 1 Mar 2021 17:55:37 +0000
Received: from jgg by mlx with local (Exim 4.94)        (envelope-from <jgg@nvidia.com>)        id 1lGmlc-0033xa-5o; Mon, 01 Mar 2021 13:55:36 -0400
X-Header: ProcessedBy-CMR-outbound
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1614621340; bh=HnWRX+OYDEO7XRGehbhkx6JxEmsVgiIlf9ZRUjrMprI=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
         From:To:CC:Subject:Message-ID:References:Content-Type:
         Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
         X-MS-Exchange-MessageSentRepresentingType:X-Header;
        b=glH/tfCjqdWSvS1nUuJwx0KoWQYmEHO3KS6fliYdzhHK9SZsmiq7yAfW1J56x6btI
         yLZS+iwAjodkBTVhvM4gshWySxl0Ur6MIFxLYXNPs6LzQUzCNhHDPw0Qf6gWaefXGy
         8DiYNahB3AyTmfq41hNyRjrZa/ul/KUcgE0U6FGEzNtDVoqR5fv+Ls/KhkwnkAeELr
         Q8+iWub7LLgFiQHDJvGavvRE4S3dJclWWOWgLnfZx5PqeKQE01e9j9nD1VL2MktFQe
         DV1oqUpPOw6AwyQwit7ISiWa7M/HPhSthxDPTUTtN7lJrlHq/qEnlvVUbKQgqiFeGE
         4w79P2+3Begng==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 26, 2021 at 06:18:30PM +1100, Alistair Popple wrote:
> Adds some selftests for exclusive device memory.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  lib/test_hmm.c                         | 124 ++++++++++++++
>  lib/test_hmm_uapi.h                    |   2 +
>  tools/testing/selftests/vm/hmm-tests.c | 219 +++++++++++++++++++++++++
>  3 files changed, 345 insertions(+)

Please get Ralph to review this, otherwise:

Acked-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
