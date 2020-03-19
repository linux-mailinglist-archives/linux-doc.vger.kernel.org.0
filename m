Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF3C18AACF
	for <lists+linux-doc@lfdr.de>; Thu, 19 Mar 2020 03:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbgCSCor (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Mar 2020 22:44:47 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:40704 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgCSCor (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Mar 2020 22:44:47 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02J2duCG113507;
        Thu, 19 Mar 2020 02:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=tlqfao3WTOxafP9NKrqfKjCr04ddDS0BAqDBioqzffk=;
 b=I5fGQ+bEY2D3HVUudZ4/cDB4EEwcd2o9NKNR1UF4QIwVKWdBAZgPj+wnjERJSsRy81be
 tTTOj7iGi5qRqBMNMQxiS4tudZ+1HaR0tZpM5YE8oqJScneRTxGCzlZ2xA7kPdLxKIWq
 XbBG+LwRIsF/R7LNoYId30itp4AUw52DKO0s4jXM2xmmwkVe856Akxflb6cdtyBv+RAA
 085koBJCgMMiAI27kGTCaf7D5TiF+RLsCuqb2ZAlXG0TV60GMmTGgYSNMxU3o3dPh/Hs
 sWSoMqSgz4xk3/1mVzxxdyfnaE6HRMYoWp3PBoEy9SxxuaCjnTY/ahE3XevjnACVfiMj Qw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2yub275qgu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 Mar 2020 02:43:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02J2hAZH071118;
        Thu, 19 Mar 2020 02:43:12 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2ys8tv4qbk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 Mar 2020 02:43:12 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02J2gwkB031582;
        Thu, 19 Mar 2020 02:42:59 GMT
Received: from [192.168.1.206] (/71.63.128.209)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 18 Mar 2020 19:42:58 -0700
Subject: Re: [PATCH 4/4] hugetlbfs: clean up command line processing
To:     Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Albert Ou <aou@eecs.berkeley.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Longpeng <longpeng2@huawei.com>, Will Deacon <will@kernel.org>,
        "David S.Miller" <davem@davemloft.net>
References: <20200318220634.32100-1-mike.kravetz@oracle.com>
 <20200318220634.32100-5-mike.kravetz@oracle.com>
 <1820045d-0bf2-9a86-226d-e9c4d5928749@infradead.org>
From:   Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <7196b6b5-53df-9898-471a-ae481395e97c@oracle.com>
Date:   Wed, 18 Mar 2020 19:42:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1820045d-0bf2-9a86-226d-e9c4d5928749@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9564 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003190011
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9564 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003190010
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/18/20 5:20 PM, Randy Dunlap wrote:
> Hi Mike,
> 
> On 3/18/20 3:06 PM, Mike Kravetz wrote:
>> With all hugetlb page processing done in a single file clean up code.
>> - Make code match desired semantics
>>   - Update documentation with semantics
>> - Make all warnings and errors messages start with 'HugeTLB:'.
>> - Consistently name command line parsing routines.
>> - Add comments to code
>>   - Describe some of the subtle interactions
>>   - Describe semantics of command line arguments
>>
>> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
>> ---
>>  Documentation/admin-guide/mm/hugetlbpage.rst | 26 +++++++
>>  mm/hugetlb.c                                 | 78 +++++++++++++++-----
>>  2 files changed, 87 insertions(+), 17 deletions(-)
> 
> 
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index cc85b4f156ca..2b9bf01db2b6 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
> 
>> @@ -3214,8 +3238,15 @@ static int __init hugetlb_nrpages_setup(char *s)
>>  
>>  	return 1;
>>  }
>> -__setup("hugepages=", hugetlb_nrpages_setup);
>> +__setup("hugepages=", hugepages_setup);
>>  
>> +/*
>> + * hugepagesz command line processing
>> + * A specific huge page size can only be specified once with hugepagesz.
>> + * hugepagesz is followed by hugepages on the commnad line.  The global
> 
> typo:                                            command

Thanks

> 
>> + * variable 'parsed_valid_hugepagesz' is used to determine if prior
>> + * hugepagesz argument was valid.
>> + */
>>  static int __init hugepagesz_setup(char *s)
>>  {
>>  	unsigned long long size;
> 
> 
> Does any of this need to be updated?  (from Documentation/admin-guide/kernel-parameters.txt)
> 
> 	hugepagesz=	[HW,IA-64,PPC,X86-64] The size of the HugeTLB pages.
> 			On x86-64 and powerpc, this option can be specified
> 			multiple times interleaved with hugepages= to reserve
> 			huge pages of different sizes. Valid pages sizes on
> 			x86-64 are 2M (when the CPU supports "pse") and 1G
> 			(when the CPU supports the "pdpe1gb" cpuinfo flag).
> 

No functional changes should be expected/seen as a result of these patches.
So the documentation here is basically OK.  However, it is out of date as
more architectures are supported.  In addition, the statement "this option
can be specified multiple times interleaved with hugepages= to reserve
huge pages of different sizes." may need a little clarification.  As mentioned
elsewhere,  hugepagesz= can only be specified once per huge page size.

I'll make some updates in v2.
-- 
Mike Kravetz
