Return-Path: <linux-doc+bounces-37-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFC77C4879
	for <lists+linux-doc@lfdr.de>; Wed, 11 Oct 2023 05:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F27F1C20CAF
	for <lists+linux-doc@lfdr.de>; Wed, 11 Oct 2023 03:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16620C2F9;
	Wed, 11 Oct 2023 03:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9982C2DF
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 03:34:29 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EAB592;
	Tue, 10 Oct 2023 20:34:28 -0700 (PDT)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4S4yvn6RM6zLpxZ;
	Wed, 11 Oct 2023 11:30:29 +0800 (CST)
Received: from [10.174.176.117] (10.174.176.117) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 11 Oct 2023 11:34:25 +0800
Subject: Re: [PATCH] doc: blk-ioprio: Standardize a few names
To: <yizhou.tang@shopee.com>, <jack@suse.cz>, <bvanassche@acm.org>,
	<kch@nvidia.com>
CC: <axboe@kernel.dk>, <tj@kernel.org>, <corbet@lwn.net>,
	<linux-block@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <yingfu.zhou@shopee.com>,
	<chunguang.xu@shopee.com>
References: <20231009100349.52884-1-yizhou.tang@shopee.com>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <42882d2b-e076-74df-e0bc-2b6c79986d3a@huawei.com>
Date: Wed, 11 Oct 2023 11:34:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231009100349.52884-1-yizhou.tang@shopee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.176.117]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 10/9/2023 6:03 PM, yizhou.tang@shopee.com wrote:
> From: Tang Yizhou <yizhou.tang@shopee.com>
>
> Our system administrator have noted that the names 'rt-to-be' and
> 'all-to-idle' in the I/O priority policies table appeared without
> explanations, leading to confusion. Let's standardize these names in
> line with the naming in the 'attribute' section.
>
> Additionally,
> 1. Correct the interface name to 'io.prio.class'.
> 2. Add a table entry of 'promote-to-rt' for consistency.
> 3. Fix a typo of 'priority'.
>
> Suggested-by: Yingfu Zhou <yingfu.zhou@shopee.com>
> Signed-off-by: Tang Yizhou <yizhou.tang@shopee.com>

Reviewed-by: Hou Tao <houtao1@huawei.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 4ef890191196..10461c73c9a3 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -2023,7 +2023,7 @@ IO Priority
>  ~~~~~~~~~~~
>  
>  A single attribute controls the behavior of the I/O priority cgroup policy,
> -namely the blkio.prio.class attribute. The following values are accepted for
> +namely the io.prio.class attribute. The following values are accepted for
>  that attribute:
>  
>    no-change
> @@ -2052,9 +2052,11 @@ The following numerical values are associated with the I/O priority policies:
>  +----------------+---+
>  | no-change      | 0 |
>  +----------------+---+
> -| rt-to-be       | 2 |
> +| promote-to-rt  | 1 |
>  +----------------+---+
> -| all-to-idle    | 3 |
> +| restrict-to-be | 2 |
> ++----------------+---+
> +| idle           | 3 |
>  +----------------+---+
>  
>  The numerical value that corresponds to each I/O priority class is as follows:
> @@ -2074,7 +2076,7 @@ The algorithm to set the I/O priority class for a request is as follows:
>  - If I/O priority class policy is promote-to-rt, change the request I/O
>    priority class to IOPRIO_CLASS_RT and change the request I/O priority
>    level to 4.
> -- If I/O priorityt class is not promote-to-rt, translate the I/O priority
> +- If I/O priority class policy is not promote-to-rt, translate the I/O priority
>    class policy into a number, then change the request I/O priority class
>    into the maximum of the I/O priority class policy number and the numerical
>    I/O priority class.


