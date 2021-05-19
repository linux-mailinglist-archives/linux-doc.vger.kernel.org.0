Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5623388E57
	for <lists+linux-doc@lfdr.de>; Wed, 19 May 2021 14:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243756AbhESMsL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 May 2021 08:48:11 -0400
Received: from mail-sn1anam02on2040.outbound.protection.outlook.com ([40.107.96.40]:5583
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233234AbhESMsL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 19 May 2021 08:48:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyKwzhcvtW/lhgGP82q140p+GmNdzILOHitzMRBWMwr1l0t6AQMM/PIG5WsPtQJrVE4t0e4XtKMgegXpTAUz1Tcoz/WPtc2bSBSi7uO+RjAyMexopsvJ/rDws2cDNoe9nSqaTHZEyirvmiPV+k10LKe2brXOOOcTTLhoqKSBDDqUtb/mAeQ3sll6oiZfrDtR4zplj9Ag2hb7+vUdK+3PmglwoK3glGYy022j8z2rqBpB3+HuEMDzIO32HfiV0Z/CeKLL0H541zVIDeNHOO8n/ll0ANni54+26J7gk2aI3bEWd4QS5wEvBr9tqApNSVPfBhKnqCBhzXVSsG4on3bVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oosbLLmOYjnmDW3tRYGgPE5W5l+qu0QAxSKrkPk5Puc=;
 b=erJ9pKjC+1gKQBX+qWrpvWbRiuvS0ppAXTcr+i/l+Q8HGqomTos250hZ394sThNf3c0eLXLyhUyEzVrZ/vwKIR9pDYZApy7AjSDj0j/FQAA0Sq1HqO9cuY/0YTZ+OnH486U7da/67gIAgFSLhTIMKOd2drMFPbz2GR94qM6vGlow0q5nD8ZNJVbo1W5g6gFp32SjVIdTf/XM5maNvp3asRKUT8bTQ0Xp09CuqWl2L4yde2bUnuPr4Y3ixLLuKwdIejCokCg23l5aCuN/VQtF/V8WJoe9pid19pz/5GO+0ktkxtwbbMb6PnVh/0DBZe58DoZnjqZeT9sKlyQLnR83dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oosbLLmOYjnmDW3tRYGgPE5W5l+qu0QAxSKrkPk5Puc=;
 b=f5pHp0x3E+bdS6lBz3Cupa8UKuaVa8nZYuuC4c8ltrVBnzzgc3uiVxjZQ3ey8NHE4P02Re3TXKE/KO6tzeqvQpMpOHTsB1DObh5pYrjgArsu6p1ipvTllQhlDRoiMXAgt+N4tmHCyY0Yhk8MLEiPq7HZpsIkxTfkL76Gw86GVigK1Brx8hF9Ts4joSLC7OloEKxN1kCHBPS/igdt/I9JyRmPDAGcJrvWR5A8714XMLHTAlyPJo0K6PIrnHN2F3yFoAKT5d6Ei5sVzDrrmifaXnh9Az8rzsME3djFBPLcqWc1Oyb/p5MBvUGugAvCFn2FXFiY6YrGq2Cj63BoY4OfXg==
Received: from DM3PR03CA0002.namprd03.prod.outlook.com (2603:10b6:0:50::12) by
 MN2PR12MB3582.namprd12.prod.outlook.com (2603:10b6:208:cd::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25; Wed, 19 May 2021 12:46:49 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:50:cafe::d9) by DM3PR03CA0002.outlook.office365.com
 (2603:10b6:0:50::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Wed, 19 May 2021 12:46:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 12:46:49 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 May
 2021 12:46:45 +0000
From:   Alistair Popple <apopple@nvidia.com>
To:     Peter Xu <peterx@redhat.com>
CC:     <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
        <bskeggs@redhat.com>, <akpm@linux-foundation.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <jhubbard@nvidia.com>,
        <rcampbell@nvidia.com>, <jglisse@redhat.com>, <jgg@nvidia.com>,
        <hch@infradead.org>, <daniel@ffwll.ch>, <willy@infradead.org>,
        <bsingharora@gmail.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Date:   Wed, 19 May 2021 22:46:43 +1000
Message-ID: <5737557.YXifvZZQQ8@nvdebian>
In-Reply-To: <YKUCtA4FrfmkNrn7@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com> <2217153.lfGrokb94b@nvdebian> <YKUCtA4FrfmkNrn7@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f4ab20d-e196-4841-2c75-08d91ac42b5c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3582:
X-Microsoft-Antispam-PRVS: <MN2PR12MB35824C08CCF1B626F65F2E8DDF2B9@MN2PR12MB3582.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mtz9r1gp+6oIBQ5wmu3a19rzGJ7KQ8u27vWB+S3SYTf/19BPkbkJk0tRPuFACNdGVvOULeJGrPGGGtheCYc+xewJ/0DTM7LvVAj7G9qDR9igSP+1Uzmhp1+H74AZzSIq/v5jOENjrZ1lzEFMTkalyrdi3/1BfYhpUbn0d22aDguM3dCdOVhgbO8aBs+qZWf7IWa54KLVII3vY9LtzR0iMW5FophMd3eFQAA61gB5mnHL179pv53ruov98cbm9Hj+dfh3k/n1WLx//s+/HIA7tXdHqkidhA0ga9iNqH2OPAdoWbZd6beevp47QliuV7L7PhrSGAtBx6aXHWSgX66GNiWvKl56nZU5xVBz5a+BxyCFHpSHitMHBNTs/YqfnIAYrX4ztqQHS2Wl0fo4N0SxNR4pD6tRVW5TlU0jJOjeX8cI/vQEmGC11E5U1g4nY6eX/Cm39ZMaFgy8413+d+LGR0MXTZE26f2kK1EolguQU7qC9cohl42XB9N9vTJp/dVeRDS15d6DVUVrw41Urk8EmJ01Mlph3rjZcQyxtNEuGH3JIvjYUb1WZYQB9xhxU4zSyGRBPxPe+r+KEVa1g3Z+A5fLJALIHTuyUCxEkaODdDrMHuDAu+us6X1Chqtfbuv+UbSxapORYAQpQHCjFEMAPaCbSb5rKFdNvO+fzq4MI4K/KRPoxvRxDp127V7Fcyeu
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(36840700001)(46966006)(9686003)(316002)(426003)(36906005)(8936002)(8676002)(54906003)(33716001)(26005)(356005)(478600001)(4744005)(16526019)(336012)(5660300002)(82740400003)(9576002)(7416002)(70206006)(83380400001)(36860700001)(86362001)(47076005)(82310400003)(6916009)(7636003)(4326008)(2906002)(70586007)(186003)(39026012);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 12:46:49.1889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4ab20d-e196-4841-2c75-08d91ac42b5c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3582
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wednesday, 19 May 2021 10:21:08 PM AEST Peter Xu wrote:
> External email: Use caution opening links or attachments
> 
> On Wed, May 19, 2021 at 09:35:10PM +1000, Alistair Popple wrote:
> > I think the approach you are describing is similar to what
> > migrate_vma_collect()/migrate_vma_unamp() does now and I think it could be
> > made to work. I ended up going with the GUP+unmap approach in part because
> > Christoph suggested it but primarily because it required less code
> > especially given we needed to call something to fault the page in/break
> > COW anyway (or extend what was there to call handle_mm_fault(), etc.).
> 
> I see, thank. Would you mind add a short paragraph in the commit message
> talking about these two solutions and why we choose the GUP way?

Sure.

 - Alistair

> --
> Peter Xu




