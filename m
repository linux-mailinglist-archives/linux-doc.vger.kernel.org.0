Return-Path: <linux-doc+bounces-933-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2C97D4D5A
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 12:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBF21B20F63
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 10:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5120250EE;
	Tue, 24 Oct 2023 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rP7YXIXf"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9716250FD
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 10:09:28 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98823F9;
	Tue, 24 Oct 2023 03:09:27 -0700 (PDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39OA8eJ7015697;
	Tue, 24 Oct 2023 10:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=tInWoxgQhmJ5dGYBt/Qk7p2mFkwgQPeC2WGqn2WI31M=;
 b=rP7YXIXfW6f8MYYM5DUfOlkVSrFbqNXv8hHLDC3G4VkocSmP6i0zEZj211z19i91fd6S
 uQ8wY0gYbM8AJ4LzW7Qkeckqv3ZFvgtVnw7WLlCyYWeI/VmufkGmRYmEnqXu8e6KMZsW
 vE479g/FAF+HSGTtKhAHVfxMOGdsmGYQztie7c59mty8lqiHIsYSCOOwxnyeazV8jPGo
 1Ww5g4L/2dSjcnJgpwMhR8RRYVpADT79HUklTgn49ctUWHYjv2HCHXFyZaShjqCxcbza
 o6xNWBnbhpJ7aKuLxLdZs5Vt01lEq3/zo2o2zMZBHX2ZnSVNFam1m/cE7GridM9m0u8R fw== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3txbsgg4u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 10:08:55 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39O81Pip026853;
	Tue, 24 Oct 2023 10:04:37 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tvsynpmex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 10:04:37 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39OA4Z0c47579396
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Oct 2023 10:04:35 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2166B20072;
	Tue, 24 Oct 2023 10:04:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA4AD2004B;
	Tue, 24 Oct 2023 10:04:33 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.171.8.162])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 24 Oct 2023 10:04:33 +0000 (GMT)
Date: Tue, 24 Oct 2023 13:04:31 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>, Ira Weiny <ira.weiny@intel.com>,
        Jonathan Corbet <corbet@lwn.net>, Wu XiangCheng <bobwxc@email.cn>
Subject: Re: [PATCH] mm: hugetlb_vmemmap: fix reference to nonexistent file
Message-ID: <ZTeWrwN4cDbcNwLq@linux.ibm.com>
References: <20231022185619.919397-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231022185619.919397-1-vegard.nossum@oracle.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vYX6x3hGtpR8vq_WHm5I_KMX3XVcMOBE
X-Proofpoint-ORIG-GUID: vYX6x3hGtpR8vq_WHm5I_KMX3XVcMOBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_09,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 clxscore=1011 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310170001 definitions=main-2310240085

On Sun, Oct 22, 2023 at 08:56:19PM +0200, Vegard Nossum wrote:
> The directory this file is in was renamed but the reference didn't
> get updated. Fix it.
> 
> Fixes: ee65728e103b ("docs: rename Documentation/vm to Documentation/mm")
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Wu XiangCheng <bobwxc@email.cn>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  mm/hugetlb_vmemmap.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
> index 25bd0e002431..b8fc23c8763f 100644
> --- a/mm/hugetlb_vmemmap.h
> +++ b/mm/hugetlb_vmemmap.h
> @@ -16,7 +16,7 @@ void hugetlb_vmemmap_optimize(const struct hstate *h, struct page *head);
>  
>  /*
>   * Reserve one vmemmap page, all vmemmap addresses are mapped to it. See
> - * Documentation/vm/vmemmap_dedup.rst.
> + * Documentation/mm/vmemmap_dedup.rst.
>   */
>  #define HUGETLB_VMEMMAP_RESERVE_SIZE	PAGE_SIZE
>  
> -- 
> 2.34.1
> 

-- 
Sincerely yours,
Mike.

